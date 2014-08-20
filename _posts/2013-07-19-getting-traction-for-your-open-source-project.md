---
layout: post
title: "Getting Traction for your Open Source Project"
categories:
- blog
tags:
- practices
---

I released an open source RSS reader &mdash; [Stringer][s] &mdash; a few 
months ago and it has enjoyed a fair amount of popularity. It is a bit
tough to measure usage (GitHub doesn't track number of clones, self-
hosted with no mechanism to "phone home") but it is approaching 2000
stars on GitHub and has at least [1300 installs][marco].


[marco]: http://www.marco.org/2013/07/10/post-google-reader-subscriber-stats

This is my first project on GitHub to really blow up; I had mild
success (~50 star range) for a landing page app I built a while ago,
but Stringer has far exceeded that.

This post recounts my observations about getting traction for Stringer
&mdash; results may vary but I think this is pretty sound and very 
actionable advice.

There is definitely luck involved but I want to talk about a great
concept from Jason Roberts: [luck surface area][lsa]. The amount of
luck you have is proportional with the number of people you have
communicated your something to.

[lsa]: http://www.codusoperandi.com/posts/increasing-your-luck-surface-area

Here are some deliberate steps I took to increase my luck surface area
for Stringer:

# Timing

The Google Reader shutdown had been announced. Like most people I was
a little bummed out, but it was far enough in the future that I didn't 
give finding an alternative much thought.

By March, I was starting to get bothered by the "Google Reader is 
shutting down" popups and decided to look for other options.

When I released Stringer it was near the beginning of the "hey I wrote
an RSS reader" wave that was picking up steam. There was a bit of first
mover advantage here, if I could build something compelling to a user
they wouldn't have to write their own or go with one of the other
options.

The timing was also important for "freshness" &mdash; Stringer was not
the only self-hosted RSS reader out there. [Fever][f] and [Tiny-Tiny RSS][ttr] were
both popular, but they both looked dated and unmaintained. In 
comparison, Stringer was new and in active development.

[f]: http://www.feedafever.com/
[ttr]: http://tt-rss.org/redmine/projects/tt-rss/wiki

# Screenshots, screenshots, screenshots...

I'm not going to lie: design is huge for this kind of project. Design
is huge for every open source project, it just takes different forms.

[Requests][req] doesn't need pretty screenshots, but it needs to convey the
well-designed API with clear examples at the top of the README.

[req]: https://github.com/kennethreitz/requests

An app **must** have screenshots &mdash; or some kind of demo mode.

Go look at a bunch of "Show HN" posts and you will almost always see a 
comment along the lines of "I'm not going to register just to see what
your app looks like, please add a screenshot".

And they are right! Are you really going to clone my git repo, install
a bunch of gems and setup a database to find out what the thing looks
like? Of course not. I wouldn't and I can't imagine who would.

Stringer has three big screenshots, all specifically picked to show a
different part of the app. An instruction page that shows you use the
thing, an Inception-like shot of someone reading a post about Stringer
while using Stringer, and a final shot showing the feed management 
page.

<img src="https://www.github.com/swanson/stringer/raw/master/screenshots/instructions.png" alt="Stringer Screenshot" style="max-width:600px;">

Compare the [README][rm] of Stringer to some competitors: [CommaFeed][cf] 
[selfoss][ss] [NewsBlur][nb]. You can tell if Stringer is going to be the right choice for you right away.

[rm]: https://github.com/swanson/stringer/blob/master/README.md
[cf]: https://github.com/Athou/commafeed/blob/master/README.md
[nb]: https://github.com/samuelclay/NewsBlur
[ss]: https://github.com/SSilence/selfoss

# Marketing - it's all about the Snowball

I don't have a large Twitter following. At the time of this writing I
have 375 followers. When I first tweeted about Stringer I had closer
to 275.

I had local connections from the Indy.RB meetup group so I got a few
retweets from that, but by and large I didn't make a huge ripple.

I sent a tweet with the `#replacereader` hashtag, something that I came
across when looking for alternatives. Again, nothing big here.

And lastly, I sent a [tweet][tcl] to `@TheChangelog` &mdash; the 
only blog about open source that I really knew of.

[tcl]: https://twitter.com/_swanson/status/330344830364434432

I posted a [ShowHN][shn] (19 pts - got autoflagged because I direct 
linked to it on Twitter, don't do that) and posted it to /r/programming
and /r/ruby (+188 and +76 respectively).

[shn]: https://news.ycombinator.com/item?id=5650606

And then it was time for the Snowball Effect to kick in.

`@TheChangelog` (6k followers) [tweeted it][cl] and put it on their blog 
(I was so pumped!). The reddit and HN Twitter bots started sending it 
out, there are a few accounts with a couple thousand followers that
just tweet the top stories.

[cl]: http://thechangelog.com/stringer-a-self-hosted-anti-social-rss-reader/

`@ruby_news` (14k) picked it up from /r/ruby and it was later in Peter
Cooper's Ruby Weekly newsletter (10k+ readers, %55 open rate).

From there other blogs and people on Twitter start picking it up
and pretty soon you are at 1000 stars. Now you are a trending repo on
GitHub and are showing up at the top of GitHub searches for "rss
reader"!

I made sure to respond to any questions on Twitter and to post a link
to Stringer in a few comment threads on HN about RSS readers (but not
every one, don't come off as spammy).

Stringer got picked up by [OneThingWell][otw] and started getting some 
attention from the designer space. I started getting tweets from
users that had it up and running and were telling their friends.

[otw]: http://onethingwell.org/post/49859167693/swanson

Luck plays a huge part, but just telling people about what 
you made really improves your luck.

# Personality/Vision

Early on, I gave the project a distinct product vision. Stringer is an
anti-social RSS reader. I took an opinionated stance on the direction
I wanted to take and made it very clear from the get-go. Maybe you will
lose some potential users that feel alienated, but for a smaller group
your project will really resonate and they will help you promote it.

It is the same line of thinking that has become popular in product
development. Build something that a small group loves instead of a
bland one-size-fits-all app with 37 features.

Having a strong tagline also gives people good tweet-fodder ;-)

I felt really awful having to reject pull requests that didn't fit the
vision of the project, but at the end of the day Stringer is better for
it.

---

Was it lucky that [Stringer][s] got so popular? Absolutely.

But I increased my luck surface area substantially with good timing,
plenty of screenshots, telling people, and giving it some
personality.

[s]: https://github.com/swanson/stringer