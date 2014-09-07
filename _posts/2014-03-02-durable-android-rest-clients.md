---
layout: post
title: "Durable Android REST Clients"
categories:
- blog
published: true
date: 2014-04-07
tags:
- android
favorite: true
---

For something as common as interfacing with a REST API, one would think that
there would be tons of great information about best practices for Android.

Maybe I'm not looking under the right rocks, because I certainly haven't found
much. If you stick to the official Android docs, you will be immersed in a world
of components with names like `AsyncTask`, `ContentProvider`,
`BroadcastReceivers`, and `Loaders`. Are these components still widely-used
outside of Google? Should I trudge through the unfriendly APIs of Android or
look elsewhere?

If you dig a bit deeper, you may find a mystical link to a
[four-year old Google I/O talk][io] that represents the "gold-standard". Is this
approach still relevant? It looks like a lot of code, are their any sample apps
or do I just piece together everything from the PowerPoint slides? Surely the
APIs have changed since 2009, right?

Head on over to the third-party blogs and tutorials and get ready to try to make
sense of things like "non-UI retained Fragments" and "service binding". Maybe I
have just not spent enough time immersed in the Android SDK, but I find it
incredibly difficult to understand some of these concepts.

This post will discuss the first steps of adding durability to your Android REST
clients: moving network requests outside of the Activity lifecycle. As an added
bonus, I find this approach to generate clear, understandable, and testable code
that will not explode if the user *gasp* rotates their phone.

My approach is not perfect and I will highlight areas for improvement at the end
of the post. My views have been heavily influenced by this [enlightening
post][recipe] by [Yigit Boyar][yigit] (Path) and piecing together various chunks
of wisdom from [Jake Wharton][jake] (Square).

Let's get to it!

---

Rule number one: you should *never* be making network requests directly from an
Activity (I will just say Activity from here on out, but everything applies to
Fragments as well). Even using an `AsyncTask` is asking for trouble; when the
task finally completes, you have to guard against the fact that your host
activity could be gone (rotated, destroyed in the back stack, back pressed). Are
you leaking memory by holding Activity references? Are you sure?

So many example apps just shovel everything into Activities. It is not uncommon
for an Activity in a tutorial (or even official SDK samples) to have 500-800
lines of code. This is analogous to having a 500-800 line controller in your web
application! This is not good!

So where should I be making network requests then? My recommendation is in a
plain-old Java object (POJO) that is tied to your *Application* lifecycle, not
your Activities.

If we can come up with an approach that allows a POJO to a) easily make network
calls and handle the responses and b) communicate with our activities without
keeping direct references, then we are in business.

[Retrofit][rf] (combined with [Gson][gs]) is a joy to use when it comes to
making network calls. For communication with Activities, we can use a library
that implements the data bus pattern ([Otto][ot] or [EventBus][eb] are the
popular options).

[rf]: http://square.github.io/retrofit/
[gs]: https://code.google.com/p/google-gson/
[ot]: http://square.github.io/otto/
[eb]: https://github.com/greenrobot/EventBus

At a high-level, our architecture will look something like this:

* Our `Application` will create POJOs to manage API interaction; I call these
POJOs "Services" (in the [Service Oriented Architecture][soa] sense). Regrettably,
this name is overloaded and is already a concept in Android, so use a
different name if you find this too confusing (maybe "Repository" from
[Domain-driven design][ddd] would be better)
* Activities and Services will register on the bus and use this to communicate
* When we wish to load data from the API, we will post an event to the bus which
will cause the Service to start the network request
* When a network request finishes, the Service will post the result back on the
bus for any listening Activity to handle

[soa]: http://c2.com/cgi/wiki?WhatIsSoa
[ddd]: http://c2.com/cgi/wiki?DomainDrivenDesign

The devil is in the details, so let's look at some code for a simple news-reader
app.

```java
public class StoryActivity extends Activity {

  private Bus mBus;

  private StoryListAdapter mAdapter;
  private ListView mListView;

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    setContentView(R.layout.story_activity);

    mListView = findViewById(this, R.id.story_list);

    mAdapter = new StoryListAdapter(this);
    mListView.setAdapter(mAdapter);
  }

  @Override
  public void onResume() {
    super.onResume();

    getBus().register(this);
    getBus().post(new LoadStoriesEvent());
  }

  @Subscribe
  public void onStoriesLoaded(StoriesLoadedEvent event) {
    mAdapter.setStories(event.getStories());
  }

  @Override
  public void onPause() {
    super.onPause();

    getBus().unregister(this);
  }

  // Use some kind of injection, so that we can swap in a mock for tests.
  // Here we just use simple getter/setter injection for simplicity.
  private Bus getBus() {
    if (mBus == null) {
      mBus = BusProvider.getInstance();
    }
    return mBus;
  }

  public void setBus(Bus bus) {
    mBus = bus;
  }
}
```

Everything is pretty standard in `onCreate`. We setup the view elements and
wire up our list adapter.

We register/unregister from the `Bus` in `onResume`/`onPause` &mdash; basically
if our activity is in the foreground, we want to be listening for events. This
can (and should) be moved to a base class (along with the getter/setters for
`mBus`).

We kick off the process in `onResume` by posting a `LoadStoriesEvent` on the
bus. Our `StoryService` will be subscribed to this event and kick off the API
calls.

Our activity then subscribes (with Otto's `@Subscribe` annotation) to a
corresponding `StoriesLoadedEvent` &mdash; which will be posted after the API
call is returned and contain a list of `Story` objects to display.

Notice how event-driven our activity is and how simple the methods are.
Testing becomes straight-forward: inject a mock bus and assert that we post the
correct event to the bus when resuming. Call `onStoriesLoaded()` directly with
test data and assert we display the correct items.

Here is what the `StoryService` looks like:

```java
public class StoryService {
  private StoryApi mApi;
  private Bus mBus;

  public StoryService(StoryApi api, Bus bus) {
    mApi = api;
    mBus = bus;
  }

  @Subscribe
  public void onLoadStories(LoadStoriesEvent event) {
    mApi.loadStories(new Callback<StoryResponse> {
      @Override
      public void success(StoryResponse response, Response rawResponse) {
        mBus.post(new StoriesLoadedEvent(response.stories));
      }

      @Override
      public void failure(RetrofitError error) {
        mBus.post(new ApiErrorEvent(error));
      }
    });
  }
}
```

Both dependencies (`StoryApi` and `Bus`) are injected via the constructor, so we
can easily pass in mocks for testing. We can make use of Mockito's
ArgumentCaptor (see [this post][mock] for more details) to test the asynchronous
callbacks. In fact, this whole class can be tested with regular old jUnit, so
the tests run super fast.

[mock]: http://www.mdswanson.com/blog/2013/12/16/reliable-android-http-testing-with-retrofit-and-mockito.html

Our service accepts events from the bus and posts back new events after making
the appropriate API calls. If an activity initiated an API call and then gets
destroyed or backgrounded, we will still post the resulting response event, but
no one will be there to listen.

For completeness, here is how we connect everything up using a custom
Application class:

```java
class ReaderApplication extends Application {

  private StoryService mStoryService;
  private Bus mBus = BusProvider.getInstance();

  @Override
  public void onCreate() {
    super.onCreate();

    mStoryService = new StoryService(buildApi(), mBus);
    bus.register(mStoryService);

    bus.register(this); //listen for "global" events
  }

  private StoryApi buildApi() {
    return new RestAdapter.Builder()
                  .setServer(API_URL)
                  .build()
                  .create(StoryApi.class);
  }

  @Subscribe
  public void onApiError(ApiErrorEvent event) {
    toast("Something went wrong, please try again.");
    Log.e("ReaderApp", event.getErrorMessage());
  }
}
```

So back to our original goal, is this approach more durable?

Configuration changes (rotation, phone call, etc) will not crash the app. We
don't have a bunch of defensive programming or null checks sprinkled every
where. We can even swap out the data source without making changes to our
activity. If we want to retrieve data from a database instead, we just need to
make sure to post the `StoriesLoadedEvent` event once we retrieve the data. We
even have a more testable and less coupled design in the process!

Bear in mind that this approach is not the complete solution. We are always
re-querying data whenever our activity is resumed &mdash; this is not ideal for
battery life or necessary for data "freshness". We could address this with
proper use of `onSaveInstanceState()` or some state-keeping to determine if a
request is already in-flight.

We don't have much resilience against network errors or loss of connection. The
next step for addressing these issues would probably be to introduce a queue/job
manager to handle retries and perserving user input.

We still aren't fully satisfying the "gold standard" from the Google I/O talk.
We will probably want to introduce local storage using SQLite and use this for
querying the data (while updating the underlying database in the background).
This provides a better user experience because we can update the UI immediately.

There is a lot of work required to create a truly robust REST client on Android
(or any mobile platform for that matter). Moving your network operations out
of the activity lifecycle using the approach outlined above is a good first step
down this path.

---

I'd love to hear your thoughts, criticisms, or suggestions; get in touch with me
on [Twitter][tw].


[yigit]: https://twitter.com/yigitboyar
[jake]: https://twitter.com/jakewharton
[recipe]: http://birbit.com/a-recipe-for-writing-responsive-rest-clients-on-android/
[tw]: https://twitter.com/_swanson
[io]: https://www.youtube.com/watch?v=xHXn3Kg2IQE
