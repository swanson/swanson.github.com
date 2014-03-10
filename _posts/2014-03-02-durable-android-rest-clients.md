---
layout: post
title: "Durable Android REST Clients"
categories:
- blog
published: false
---

For something as common as interfacing with a REST API, one would think that
there would be tons of great information about best practices for Android.

Maybe I'm not looking under the right rocks, because I certainly haven't found
much. If you stick to the official Android docs, you will be immersed in a world
of components with names like `AsyncTask`, `ContentProvider`,
`BroadcastReceivers`, and `Loaders`. Are these components still widely-used outside
of Google? Should I trudge through the unfriendly APIs of Android or look elsewhere?

If you dig a bit deeper, you may find a mystical link to a four-year old Google
I/O talk that represents the "gold-standard". Is this approach still relevant? It looks
like a lot of code, are their any sample apps or do I just piece together
everything from the PowerPoint slides?

Head on over to the third-party blogs and tutorials and get ready to try to make
sense of things like "non-UI retained Fragments" and "service binding". Maybe
I have just not spent enough time immersed in the Android SDK, but I find it
incredibly difficult to understand some of these concepts.

This post represents my current best-known approach to building an Android
application that not only communicates with a REST API, but does so with clear,
understandable, and testable code that will not explode if the user *gasp*
rotates their phone.

My approach is not perfect and I will highlight areas for
improvement at the end of the post. My views have been heavily influenced by
this [enlightening post][recipe] by Yigit Boyar (from Path) and piecing together
various chunks of wisdom from Jake Wharton (from Square).

Let's get to it!

---

For me, the two biggest hurdles in Android development have been: understanding
and working with Activity/Fragment lifecycles and making a mental shift from an
imperative style of web development to the event-driven style of mobile apps.

Rule number one: you should *never* be making network requests directly from
an Activity (I will just say Activity from here on out, but everything applies to
Fragments as well). Even using an `AsyncTask` is asking for trouble; when the
task finally completes, you have to guard against the fact that your host
activity could be gone (rotated, destroyed in the back stack, back pressed).
Are you leaking memory while holding Activity references? Are you sure?

So many example apps just shovel everything into Activities. It is not uncommon
for an Activity in a tutorial (or even official SDK samples) to have 500-800
lines of code. This is analogous to having a 500-800 line controller in your web
application! This is not good!

So where should I be making network requests then? My recommendation is in a
plain old Java object (POJO) that is tied to your *Application*, not your
Activities. If you make network calls (or any other long running operations)
outside of the activity lifecycle, you don't need to worry about if your activity
has been removed out from under you.

If we can come up with an approach that allows a POJO to a) easily make network
calls and handle the responses and b) communicate with our activities without
keeping direct references, then we are in business.

Retrofit (combined with Gson) is a joy to use when it comes to making network
calls. For communication with Activities, we can use a library that implements
the data bus pattern (Otto or EventBus are the popular options).

At a high-level, our architecture will look something like this:

* Our `Application` will create POJOs to manage API interaction; I call these
POJOs "Services" (in the Service Oriented Architecture sense). Regrettably,
this name is overloaded and is already a concept in Android, so use a
different name if you find this too confusing.
* Activities and Services will register on the bus and use this to communicate
* When we wish to load data from the API, we will post an event to the bus which
will cause the Service to start the network request
* When a network request finishes, the Service will post the result back on the
bus for any listening Activity to handle

The devil is in the details, so let's look at some code.

```java
public class StoryActivity extends Activity {

  private Bus mBus;
  private StoryService mService;

  private StoryListAdapter mAdapter;
  private ListView mListView;

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    setContentView(R.layout.story_activity);

    mListView = findViewById(R.id.story_list);

    mAdapter = new StoryListAdapter(this);
    mListView.setAdapter(mAdapter);

    if (!getService().isLoading()) {
      getService().loadStories();
    }
  }

  @Override
  public void onResume() {
    super.onResume();

    getBus().register(this);
  }

  @Subscribe
  public void onStoriesLoaded(StoriesLoadedEvent event) {
    mAdapter.setStories(event.getStories());
  }

  @Override
  public void onPause() {
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

  private StoryService getService() {
    if (mService == null) {
      mService = StoryService.getInstance();
    }
    return mService;
  }

  public void setService(StoryService service) {
    mService = service;
  }
}
```

Everything is pretty standard in `onCreate`. We setup the view elements and
wire up our list adapter. We set a boolean flag `shouldLoad`; we use this flag
to prevent us from re-querying the API if we are resuming the activity from
the back stack (e.g. view details of a story then hit the Back button) or if
we are restoring from a configuration change (e.g. rotation).

We register/unregister from the `Bus` in `onResume`/`onPause` &mdash; basically
if our activity is in the foreground, we want to be listening for events. This
can be moved to a base class (along with the getter/setters for `mBus`).

We kick off the process in `onResume` by posting a `LoadStoriesEvent` on the bus.
Our `StoryService` will be subscribed to this event and kick off the API calls.

Our activity then subscribes (with Otto's `@Subscribe` annotation) for a
corresponding `StoriesLoadedEvent` &mdash; which will be posted after the API
call is returned and contain a list of `Story` objects to display.

Notice how event-driven our activity is (and how simple the methods are). Testing
becomes straight-forward. Inject a mock bus and assert that we post the correct
event to the bus when resuming. Call `onStoriesLoaded` directly with test data
and assert we display the correct items.

Is this activity durable?

Rotating the phone will trigger the API to be re-queried
(unless a request is currently in flight). Not ideal in terms of saving battery
but you can use `onSaveInstanceState` to avoid this if you'd like.

If we return to this activity from the back stack, we hit `onResume` and keep
displaying the existing data. If the activity was killed to free up memory,
it will be re-created and trigger the whole API interaction again. A fair
compromise, since this case is fairly rare.



[recipe]: http://birbit.com/a-recipe-for-writing-responsive-rest-clients-on-android/
