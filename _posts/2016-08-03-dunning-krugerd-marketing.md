---
layout: post
title: "How I Dunning-Kruger'd Marketing"
categories:
- blog
tags:
- product_dev
---

I find it easy to rattle off a few marketing ideas for software products. I've read enough HackerNews and pop-business books to know the gist of it. 

Got a product for agile development teams? Why not just run some LinkedIn ads that target scrum masters at software companies? Boom. You are welcome for this brilliant insight.

I think about this stuff periodically but I usually had no time or explicit permission to actually implement it when I was working on client projects. But the implementation is straightforward, right? Just run the campaign, users sign up, repeat.

Except this kind of backseat marketing is only surface-level deep.

But now, I'm running a product -- [MoraleApp, the no-hassle team morale tracker][morale] -- and I have the opportunity to go do these "quick win" marketing tactics. And I immediately started realizing the amount of oversimplification I had been doing and how much hubris I had.

---

Here's a play-by-play:

> Just run some LinkedIn ads that target scrum masters at software companies...

## 1. The Ad

Okay, what's the ad supposed to say exactly? Shit, never thought about that.

After skimming a few blogs, I had something passable. I made an image that would stand out. I kept the CTA clear and simple. I made sure to stick a `utm_source` parameter on the URL.

![My beautiful ad]({{site.url}}/static/morale-linkedin-ad.png)

Good, next step. Targeting.

## 2. Audience Targeting

![Targeting is easy!]({{site.url}}/static/morale-linkedin-targets.png)

United States. Job title "Scrum Master". Software and IT companies. Easy enough!

![Seems low...]({{site.url}}/static/morale-linkedin-audience.png)

Oh wait, why are there only 2000 people in that segment? That doesn't seem right. I guess I should probably target "Agile Coaches", too. And "Lean Project Managers", and "Agile Consultants". How broad should I get? 

Actually, I have no frame of reference at all, is 2000 people that small?

Well, gotta start somewhere...so let's go with this.

## 3. Budget and Bids

Okay -- "budget and bid pricing". CPM vs CPC.

![Who's got the company card?]({{site.url}}/static/morale-linkedin-budget.png)

Well, let's try CPM first just because that's cheaper. No idea what to bid (aside from what the tool is telling me). What happens if I bid lower? Higher?

## 4. Time for the magic!

I run the ad for a week. I get 13,936 impressions. There is one click. They bounce from my landing page after 4 seconds. 

![So many impressions!]({{site.url}}/static/morale-linkedin-impressions.png)

![So few clicks!]({{site.url}}/static/morale-linkedin-stats.png)

Effective cost per click: $30.91, click through rate: 0.007%, conversions to trial: 0%.

Even I know that's terrible.

But what is wrong? My landing page? My ad copy? The ad image? The targeting?

I mention to someone who did marketing in the past that I wasn't sure if I wanted to test a CPC campaign and pay $9 per click. Seemed really expensive! They laughed and told me they used to spend *several times* that for a previous SaaS product and would be running multiple different versions of every ad.

---

This seemed so quick and easy, but now it's looking almost impossible! Unlike writing software where -- for the most part -- your code either works or crashes with a stack trace pointing at the problem, so much of this marketing and acquisition work depends on trial and error and many, many experiments to find what works.

I've gained a new appreciation for aspects of building products that I thought I could brute force with an engineering mindset. It's common to view this work as "easy" and the people that do it as "ineffective", but my experiences so far are telling me that couldn't be further from the truth.

The [Dunning-Kruger effect][dk] rears its ugly head once again.

If you need me, I'll be in the breakroom eating Humble Pie while my new ad campaign sits in the "Pending Approval" queue.

[morale]: https://moraleapp.com/?utm_source=mdswanson
[dk]: https://en.wikipedia.org/wiki/Dunning%E2%80%93Kruger_effect