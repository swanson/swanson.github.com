---
layout: post
title: "MoraleApp Retrospective"
permalink: "/morale/"
---

MoraleApp was a no-hassle team mood tracker designed to help agile teams monitor and detect morale issues. Every day, team members were polled about how they were feeling and pick either "good", "meh", or "bad". In addition to collecting mood data, MoraleApp found trends and patterns and provided tips on improving low morale.

We started with a paper prototype posted on the wall near one team in our office. The idea spread to other teams within the company and I soon built software to automate and anonymize the daily survey. After seeing success internally, I opened up access to the public and launched the product as a free service.

Over the next four years I added features and slowly grew the product in my spare time between projects.

![]({{site.url}}/static/morale-team-view.png)

![]({{site.url}}/static/morale-trend-graph.png)

Product stats

* Over 1600 companies signed up to use the service
* Those companies created 2300 teams
* Sent over 2.5 million daily email surveys and collected over 1 million mood responses
* At the peak, over 7000 daily participants logging their mood

---

As part of a four-month rotation as a product manager, I worked on monetizing MoraleApp with the hope of it becoming self-sustaining. In the end, we did not see enough traction to continue investing time and money in the product at the end of the experiment. MoraleApp was shut down on Dec 31, 2016.

MoraleApp was built with Ruby on Rails, Bootstrap, and Highcharts and deployed to Heroku. Email delivery was handled by Mandrill, payments handled by Stripe.