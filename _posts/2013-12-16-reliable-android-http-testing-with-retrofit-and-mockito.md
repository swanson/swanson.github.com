---
layout: post
title: "Reliable API testing for Android with Retrofit and Mockito"
categories:
- blog
tags:
- android
favorite: true
---

Testing HTTP calls that interact with an API have always been a tricky beast.
Hitting a real web server comes with a host of issues: brittle tests (test
fail because your internet or the API is down), slow tests (HTTP calls can
take several seconds each), and incomplete tests ("How do I trigger a rate
limit exceeded case? Guess I'll just hope it works...").

The issue is complicated further in a platform like Android, where HTTP calls
should be asynchronous. Now you add timing into the mix and you are probably
ready to throw in the towel on testing your API calls.

A great way to solve these issues and reliably exercise these HTTP calls is
to use a nifty utility in [Mockito][m] (a test double library for Java): 
[`ArgumentCaptor`][ac].

The `ArgumentCaptor` is kind of a hybrid test double; it is a little like a stub,
a little like a spy, but not quite either one. You use an argument captor to &mdash;
unsurprisingly &mdash; capture and store the arguments passed to a mock/stub.
The real win here is the ability to call methods on the captured argument, which
works great for something like [Retrofit's callbacks][rf].

With Retrofit, we make an API call and provide a callback. The library will
run the callback, passing in the response data when the server responds.

Let's say we have some code to query the [GitHub API][gha] for a user's repositories.

```java
getApi().repositories("swanson", new Callback<List<Repository>>() {

    @Override
    public void success(List<Repository> repositories, Response response) {
        if (repositories.isEmpty()) {
          displaySadMessage();
        }
            
        mAdapter.setRepositories(repositories);
    }

    @Override
    public void failure(RetrofitError retrofitError) {
        displayErrorMessage();
    }
});
```

There are three cases we want to test: the happy path (we got some repos and
pass them to our adapter), the error path (there was some server error, toast
a message to the user), and a special case (the user has no repos, toast a 
message to the user).

The second and third cases will be tricky to test if you are relying on hitting
a real API server. I know GitHub has had some DDOS issues lately, but you certainly
can't rely on that to test your error cases!

But with an `ArgumentCaptor`, we can grab the callback argument and then we have
full control of what data we send in.

Let's look at testing the happy path (I am using [Robolectric][r] and you should
be too!).

```java
Mockito.verify(mockApi).repositories(Mockito.anyString(), cb.capture());
        
List<Repository> testRepos = new ArrayList<Repository>();
testRepos.add(new Repository("rails", "ruby", new Owner("dhh")));
testRepos.add(new Repository("android", "java", new Owner("google")));

cb.getValue().success(testRepos, null);

assertThat(activity.getListAdapter()).hasCount(2);
```

Our captor (`cb`) captures the callback and then, after calling `getValue()`, we
can call the `success` method and pass it some dummy objects.

You might have an "Aha!" moment now, but if not, that's okay. Let's look at
testing the error path.

```java
Mockito.verify(mockApi).repositories(Mockito.anyString(), cb.capture());
            
cb.getValue().failure(null);

assertThat(ShadowToast.getTextOfLatestToast()).contains("Failed");
```

Same as before &mdash; we capture the callback. But this time we call the 
`failure` method, which simulates an API error. If we need more discrete error
handling (e.g. if the response is HTTP 401, redirect to login; if HTTP 500, 
toast a general system error message), we can easily create the appropriate
`RetrofitError` objects and pass them in.

The power of `ArgumentCaptor` really shines through here. We have complete
control of the object we've captured. We can feed it any data or trigger any 
error conditions we want.

For prosperity, let's test the special case.

```java
Mockito.verify(mockApi).repositories(Mockito.anyString(), cb.capture());
            
List<Repository> noRepos = new ArrayList<Repository>();

cb.getValue().success(noRepos, null);

assertThat(ShadowToast.getTextOfLatestToast()).contains("No repos :(");
assertThat(activity.getListAdapter()).isEmpty();
```

(You can find the full source of these examples and a full sample app on 
[GitHub][gh]).

One special detail to note, if you use the Mockito annotation when declaring
the captor,

```java
@Captor
private ArgumentCaptor<Callback<List<Repository>>> cb;
```

Make sure that somewhere in your setup, you do:

```java
MockitoAnnotations.initMocks(this);
```

---

This approach to testing hits all the marks in my book: fast, robust, and easy
to work with. It has allowed us to easily test rare edge cases (session timeout,
server down for maintenance, extraordinary values) in my current project and
achieve a high level of confidence that our app is working.

While this example is specific to a certain stack (Android, Robolectric,
Retrofit, Mockito), a similar approach can be applied to nearly any application.

Happy testing!

[m]: https://code.google.com/p/mockito/
[gha]: http://developer.github.com/v3/repos/#list-user-repositories
[ac]: http://docs.mockito.googlecode.com/hg/org/mockito/ArgumentCaptor.html
[rf]: http://square.github.io/retrofit/
[r]: http://robolectric.org/
[gh]: https://github.com/swanson/retrofit-demo/blob/master/Octodroid/test/com/swanson/octodroid/test/MainActivityTest.java


