---
layout: post
title: "Testing Behavior vs Implementation"
categories:
- blog
tags:
- growth
---

One of the platitudes you run across in software is "Test behavior, not implementation". Like most software guidelines, it's great to say and we can all nod along in agreement. But sometimes it's trickier to identify in practice. 

Words like "behavior" and "implementation" are fuzzy and can be open to interpretation. This concept is best taught by example and I came across some code in a project (presented below with modification) that I wanted to share.

---

In this example, we are making a `Backbone.View` to render a user submission.

```javascript
var SubmissionView = Backbone.View.extend({
    events: {
        "click .upvote": "upvoteSubmission"
    },

    initialize: function() {
        this.listenTo(this.model, "change", this.render);
    },

    render: function () {
        ...
    },

    upvoteSubmission: function () {
        var points = this.model.get("points");
        this.model.set("point", points + 1);
    }
});
```

When I looked at the tests for this class, I found a test of the implementation (not the behavior).

```javascript
it('should setup correct events', function () {
    assertEquals(view.events, {
        "click .upvote": "upvoteSubmission"
    });
});
```

The code is testing that the view properly sets up the `event` hash by directly comparing it to what we expect it to be. The test passes and this is the idiomatic way of binding events in Backbone. But this test is very concerned with the *implementation* of `SubmissionView`, not the *behavior*.

The behavior we would like to capture is that "clicking the upvote button will increase the point count by one". We can test this by doing something like this:

```javascript
it('should add one point when the upvote button is clicked', function () {
    model.set("points", 2);

    view.$(".upvote").click();

    assertEquals(model.get("points"), 3);
});
```

---

The benefit of writing tests in this style is the ability to change implementation (i.e. refactor) without changing the tests. If you want to use a different view library, you can swap in the new implementation with confidence that it will behave identically.

Testing behavior can be an exercise in patience when you already know the code you want to write. Making assertions about the implementation can be a shortcut to "TDDing" your code into the design you already have in your mind. But in the long run, the trade-off is a brittle test suite that will resist refactoring and changes to the internals of your code.
