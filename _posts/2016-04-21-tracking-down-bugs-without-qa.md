---
layout: post
title: "Tracking down bugs without QA"
categories:
- blog
tags:
- product_dev
---

I'm doing product development right now for [Morale][morale] -- a no-hassle team mood tracker -- and we've got a bug.

Bugs are no big deal. I've fixed (and caused) hundreds in my life.

One thing you take for granted when doing client work with a team is that you have folks to help with testing. You might have a dedicated QA team or simply other developers to find strange things -- they can usually show you what happened and give you some basic steps to reproduce.

Alas, working solo on a product does not always afford us clear steps to reproduce, including browser, operating system, or computer specs.

So I mentioned we have a bug.

For whatever reason (I blame [solar flares][sf]), sometimes the timezone value doesn't get set when someone creates a team in our app. This is bad because we use this value to know when to send out the daily emails to log moods. No timezone equals no emails sent equals unhappy customers.

This bug happens about 1% of the time when a team is created. But we don't have monitoring in place to detect this yet, so the app just silently doesn't work for these people. Not good.

I tried creating teams with every possible combination I could think of in my local environment. I used IE. I turned off JavaScript. I picked weird timezones. But nothing would cause it to happen. Without any details, I was getting stumped.

I tried to reach out to the last customer this happened to. But, predictably, they didn't answer an unsolicited email about an app that didn't work at all for them!

So I had to get creative. We don't have great analytics in place, but we do have the standard Google Analytics snippet running. Here's what I did:

* Find the unique URL that the user would be on when they created the team (something like `/organization/:unique_id/create_team`)
* Look for hits on that page in Google Analytics, with the time range constrained to the day the team was created (thanks ActiveRecord `timestamp`s!)
* Use the terribly confusing "Secondary Dimension" dropdown to display browser name + version

![Getting browser info from Google Analytics]({{site.url}}/static/browser-ga.png)  

Aha! Firefox. I've got a new lead to follow. :)

[morale]: /morale/
[sf]: http://www.scientificamerican.com/article/mysteriously-powerful-particles-from-solar-explosions-unveiled-in-new-study/
