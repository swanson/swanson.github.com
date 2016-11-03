---
layout: post
title: "Closing Down a Product, Gracefully"
categories:
- blog
tags:
- product_dev
---

Almost weekly it seems that a service or app shuts down and someone submits the announcement email to discussion sites for it to be skewered by internet commenters for following the same anti-patterns.

I recently made the decision to shutdown a [SaaS product][morale] that I've been running. After looking through examples (both good and bad) of these kind of announcements, I wanted to share the handful of guiding principles that I found useful.

## Empathy for users

It sucks when something you use shuts down. Even if you fully support the company's decision, it still sucks. While it sucks for me, personally, that I'm shutting down this product, it sucks more for the hundreds of users for whom I've added a low-value, high-urgency task to their plate.

Avoid focusing inward and using flowery language to describe your ["incredible journey"][ij]. It's not incredible for your users that you are shutting down, it's a pain.

## Give plenty of notice

It takes time for everyone to read your email or see your announcement. It takes time for users to discussion their alternative options internally. It takes time to transition to a new product. And you'll need time to gracefully ramp down your infrastructure.

Be courteous and give as much notice as reasonably possible. In my case, I gave users 3 months notice that I would be discontinuing the product -- and waived the cost of all paid plans during that period.

## Provide migration options

Founders have a great sense of the competitive landscape for their product. They know what other options customers have. Share that information generously.

In the shutdown notice for my product, I included multiple options for free and paid alternatives -- including a short summary of the product and how it was different (or the same) as mine.

## It's their data, let them have it

Users trusted you to store their data. It is *their* data. Make it painless for them to get an export of their data in an easy to consume format (CSV, not SQL dumps...). It's not enough to point to your API and tell people they can scrape it themselves.

If you make it easy to export, competitors may help make it easy to import -- making the transition less painful for your users. My app is pretty small and [it still happened for us][mig].

## Don't open source it

Multiple customers inquired about releasing the app as an open source project. This is almost always a bad idea. "Just throw the repo on GitHub" vastly underestimates the time and energy needed to support an open source project if you want it to be valuable for people.

Especially if there are alternate tools or competitors, releasing your code as open source without dedicated effort to support it will lead to a bad experience for everyone. It's no fun to be the owner of a "dead" project on GitHub and it's no fun to be a customer who inherits a big ball of legacy code that was never meant to run on-premise.

I know this is not what people want to hear, but it's reality.

---

For transparency, included below is the email I sent to the 2,060 people registered for MoraleApp. After sending the email, I also added a site-wide banner to app that linked to [a published version][sd] of the same message.

It's not perfect but I've tried my best to follow the guidelines above:

<div class="email-snippet">
<h3>MoraleApp is shutting down</h3>
<br/>
<p>I'm here to deliver some bad news: <b>MoraleApp will be shutting down at the end of the year</b>. Thank you so much for your support over the past four years that we've been offering the service.</p>

<p>I know it's a pain to deal with services shutting down. This was not a decision that we made lightly. After investing more time and resources into the product over the past six months, we've made the decision to discontinue the service at the end of the year.</p>

<p>Daily emails will still be sent thru December 31, 2016. After that date, no more emails will go out and access to the site will no longer be available. Paid customers have been refunded for their most recent month and will not be charged going forward thru the end of the year.</p>

<p>If you would like to download an export of your data, log in with your admin account and then visit Reports > Monthly Report and click "Export to CSV". This will download a CSV file containing all mood data for each of your teams.</p>

<p>For those of you still interested in tracking team morale, here are some alternative services that we recommend:</p>

<ul>
  <li><a href="https://www.teammood.com/en/">TeamMood</a>: the most similar alternative, email based and daily</li>
  <li><a href="https://www.tinypulse.com/">TinyPulse</a>: weekly cadence, but more customizable</li>
  <li><a href="http://www.nikoniko.co/">NikoNiko</a>: mobile app based mood tracker</li>
  <li><a href="http://oskar.hanno.co/">Oskar</a>: Slackbot that tracks team happiness</li>
</ul>

<p>If you have additional questions or concerns, email me at XXX and I'll do my best to help.
</p>

<p>
-- Matt Swanson<br/>
MoraleApp Founder
</p>
</div>
[sk]: http://mdswanson.com/blog/2016/01/25/sell-or-kill.html
[morale]: https://moraleapp.com
[sd]: https://moraleapp.com/shutdown
[ij]: https://ourincrediblejourney.tumblr.com/
[mig]: https://blog.teammood.com/en/2016/10/05/moraleapp-is-shutting-down.html

