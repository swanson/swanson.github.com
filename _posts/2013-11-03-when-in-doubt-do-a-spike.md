---
layout: post
title: "When in doubt, do a Spike"
categories:
- blog
from_newsletter: true
tags:
- practices
---

I've been kicking off a new project at work in the past week. We are in the
so-called ["Iteration 0"][iz] phase. Getting dev environments and build servers
setup and all that.

Something about having an empty codebase makes me anxious. Since there are 
almost infinite ways to start, there  is actually no way to start. 
[Paradox of choice][pc] and whatnot.

This particular project is an Android app &mdash; something that I have some
experience developing for, but nothing recent. One of my big goals for the
first week was to get reacquainted with the framework and figure out how to
structure the app at a high level.

A technique I lean on in these situations is the [Spike][sp].

# Driving a nail through a log...err application

A spike is a quick prototype that covers the major functionality and hits all 
the layers. Think "end-to-end for a single slice of the app".

In my case, our app interacts heavily with a JSON web API. My goal with this
spike is to make sure I can make API calls, parse the responses into Java 
objects, and render that data as a custom view onto the screen.

The app will probably have close to 30 of these API-backed screens. I don't need
to build out every one in this spike, but I should make sure I can at least do
one screen.

Code written for a spike is **intentionally disposable**. The purpose is to try 
to uncover early problems (and resolve them) and gain knowledge of new APIs or 
framework components. It is not production code so be very wary of straight 
copy-pasting the spike into your project.

Given the disposable nature, I don't usually test drive the code in a spike.
I don't usually even write tests at all &mdash; unless I am doing a spike with the
intention of getting familiar with a new testing library. I don't worry about 
optimization or good naming practices or fret about putting class in the right 
packages.

# Clearing the fog

I get a big sense of accomplishment (and relief!) when I finish a spike. In my
case, I figured out a bunch of unknowns in the past few days. Stuff like:

* creating reusable "master layout" with an [ActionBar][ab] and [NavigationDrawer][nd]
* using the [Retrofit library][rf] to interact with the API
* finding out how to handle [cookie-based][cb] sessions for authentication
* learning how to remove a bunch of boilerplate with [RoboGuice][rg]
* rendering a custom view in a ListView

But with this success also comes temptation. I just hacked out this
code, resolving problems as I came across them. While the code works fine
and isn't awful, it is not up to the production standards that I want. 

I think
it is especially important to be diligent with code quality at the start of a 
project. The first Activity (or Controller or unit test or whatever) has to be
a shining example because it is what everyone will look to for reference.

Even though I wrote 800 lines of code over the past few days, I will
likely keep only one 30-line class and throw the rest away (metaphorically 
speaking; I always keep the spike around for later reference). The
rest of the code will be redone as needed, with proper test coverage and design.

Isn't that a waste of time though? Absolutely not. 

On Monday, I didn't have a clear direction for how to start building this
piece of software. 

Now I have vision and a plan. Next week &mdash; it'll be time to [do work][dw].

[iz]: http://msdn.microsoft.com/en-us/library/hh273039(v=vs.88).aspx
[pc]: https://twitter.com/BarrySch
[sp]: http://c2.com/cgi/wiki?SpikeDescribed
[ab]: http://developer.android.com/design/patterns/actionbar.html
[nd]: http://developer.android.com/design/patterns/navigation-drawer.html
[rf]: https://github.com/square/retrofit
[cb]: http://download.java.net/jdk8/docs/api/java/net/CookieManager.html
[rg]: https://github.com/roboguice/roboguice
[dw]: http://www.youtube.com/watch?v=t8wuTWgBcMQ#t=25


