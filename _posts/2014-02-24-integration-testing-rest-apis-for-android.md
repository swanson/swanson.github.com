---
layout: post
title: "Integration Testing against REST APIs in Android"
categories:
- blog
tags:
- android
---

In my last post on Android testing, I talked about how to [reliably test API
calls][rt] with Mockito's `ArgumentCaptor`. But that approach was best suited
for unit tests &mdash; what about integration tests?

*(This post assumes you use [Retrofit][rf] to handle API calls)*

The most straightforward way to do integration testing in Android is to use the
built-in `InstrumentationTestCase` classes. At a high-level, you create a second
APK that will "drive" your app under test by programmatically sending commands
(key presses, button clicks, etc). If you come from a web development
background, this is similar to how tools like Selenium work.

One of the common complaints with this kind of blackbox, end-to-end integration
testing is that the tests are flaky. They will fail for no reason and talking to
external APIs only adds more ways to intermittently fail. Tests that fail
randomly are tests that you cannot trust; tests that you cannot trust are a
liability.

After some [discussions][d] with [Jake Wharton][jw] and [Michael Bailey][mb], I
wanted to summarize approaches that will improve the reliability of your Android
integration tests.

## Setup a test server

The first approach that you might think of is to stand up a fake server
somewhere that your tests can run against. In your test suite, simply point the
app to your test URL. This is probably not a good long-term solution; I did this
on a project once, but it was just an echo server.

Pros:

* Very little code changes to your app 
* Can share the test server across platforms (iOS, web, etc)

Cons:

* Another moving piece that can intermittently fail 
* Requires some expertise outside of the Android domain to deploy the server and keep it updated
* Difficult to trigger error/edge cases 
* Slow test execution (still making HTTP calls)

**Conclusion:** It's not a great option, but certainly better than running tests
against a production API (don't do that!!). Probably the least amount of
up-front work of any of these, but has the most chance to increase flakiness.

## Mock the Retrofit Interface

This approach creates a boundary before the HTTP level; you take the stance that
you trust the test suites of Gson, Retrofit, etc to work and then just mock out
the data. You can see an [example of this][mi] in the sample application that
comes with Retrofit. A `MockGitHub` returns canned data, bypassing any network
operations or serialization.

Pros:

* Very robust; will not fail because of a flaky network, timeout, etc 
* Easy to trigger test error/edge cases 
* Can control the server state if you need to dynamically update (e.g. I delete an 
item and don't want it to show up if I ask for the list of items again) 
* Write dummy data in pure Java; could be re-used for unit tests via factories

Cons:

* Still mocking out some parts of the app, so not a *true* integration test
* Doesn't exercise Gson serialization (could use unit tests for this)


**Conclusion:** A solid approach with no external moving parts. Doesn't allow
for blackbox integration testing, but gets you pretty close for not much
effort. I'd say this fits the [80/20 rule][par].

## Use WireMock

[WireMock][wm] allows you to mock web requests and return data either
programmatically or from a file on disk. You can also set headers, status codes,
and anything else you'd need. WireMock can also record requests from a live
server and save them for future runs.

Pros:

* Robust; again no failures from network down/timeouts 
* Easy to test error/edge cases 
* Exercises the serialization/HTTP layers of the app 
* Could re-use JSON files across platforms (iOS, web, etc)

Cons:

* Another moving piece that could fail 
* Powerful features, but more complex and requires some changes to your test code

**Conclusion:** Definitely the most flexible and feature-rich approach. A small investment in
learning the tool will probably pay off in time savings down the road. WireMock
reminds me alot of Ruby's [`VCR`][vcr] gem and I will probably use it for the
next Android project I start.

## Custom Retrofit Client

The approach I settled on for my current work project was to write a small
[Retrofit `Client`][ljc] that converts the HTTP verb and URL into a filename and
then reads the appropriate static JSON files from the `res/raw` folder of the
instrumentation application.

Pros:

* No flaky network/timeout failures 
* Easy to trigger test error/edge cases 
* No extra moving pieces 
* Exercises the serialization/HTTP layers of the app

Cons:

* Works best for static responses (hard to keep server state)

**Conclusion:** I think this approach can work if you have mainly static JSON responses or don't
want to introduce another dependency into your project. It doesn't cover every
edge case &mdash; but for us it was an adequate solution.

I think this approach can work if you have mainly static JSON responses and
don't want to introduce another dependency into your project. It doesn't cover
every edge case &mdash; but for us it was an adequate solution.

For this particular project, we were interacting with a legacy API that had some
quirks that required a fair amount of Gson customizations (multiple date
formats, lots of `@SerializedName`, strange null vs empty behavior) so we felt
much better running the tests through the serialization layer.

---

You can't go wrong with any of the latter three approaches (I would recommend
not going down the test server path if possible).

If you don't care about having a true blackbox test, go with the Retrofit
interface mock. If you want something close to a real server, but still want
fine control, give WireMock a shot. If you just need something basic, I think
it's hard to beat my 100-line Retrofit client and a folder of `.json` files.

The approach you choose isn't important, pick the one that works best for your
project and team. Instrumentation tests can provide a lot of value and reduce
the burden for manual testing, so investing time to create a reliable test suite
will pay off in the end.

[d]: https://twitter.com/_swanson/status/437703758139506688
[jw]: https://twitter.com/JakeWharton
[mb]: https://twitter.com/yogurtearl
[rf]: https://github.com/square/retrofit
[mi]: https://github.com/square/retrofit/blob/master/retrofit-samples/mock-github-client/src/main/java/com/example/retrofit/GitHubClient.java
[par]: http://en.wikipedia.org/wiki/Pareto_principle
[wm]: http://wiremock.org/
[ljc]: https://gist.github.com/swanson/7dee3f3474e30fe8f15c
[rt]: http://mdswanson.com/blog/2013/12/16/reliable-android-http-testing-with-retrofit-and-mockito.html
[vcr]: https://github.com/vcr/vcr
