---
layout: post
title: "Juking the Stats"
categories:
- blog
- practices
date: 2015-09-30
---

> Roland 'Prezbo' Pryzbylewski: I don't get it. All this so we score higher on the state tests? If we're teaching the kids the test questions, what is it assessing in them? 
> 
> Grace Sampson: Nothing. It assesses us. The test scores go up, they can say the schools are improving. The scores stay down, they can't. 
> 
> Roland 'Prezbo' Pryzbylewski: Juking the stats. 
> 
> <cite>The Wire S04E09: Know Your Place</cite>

Our team had a meeting the other day to talk about "bug injection rate". This is a metric designed to capture how many bugs a person/team/group is creating. You may see this expressed as a ratio of how many bugs you create vs bugs you fix or how many bugs you create vs how many features you deliver.

Putting implementation aside, the aim of this metric is to measure bugs as a function of software quality. A low bug injection rate could point to high quality software; changes that cause this rate to go down could indicate the team is moving in the right direction.

There is a nuanced point when it comes to trying to fit quantitative metrics around complex systems (like software projects). You have to be very diligent about capturing data passively and not setting a target objective than can be optimized for.

In the case of bug injection, passively measuring how many bugs are created could produce some interesting trends. But the data cannot stand on its own; it needs some kind of analysis to put it in context. 

The system is too complex to distill down to a single number.

Does a team have a high bug injection rate because they are working in an untested, legacy system? Does shipping quickly to validate with users allow for an increase in bugs? Have new team members joined the project recently? Has their been a renewed vigor in internal testing? How large is the codebase?

Maybe there is a simpler, core problem. Maybe people are working sloppily or not taking care to test their changes thoroughly.

But without context and framing, it is near impossible to draw conclusions from a single metric in isolation.

A more troublesome situation arises when a metric is used as a way to compare across individuals or teams. Knowing that there is an objective measurement that we are being benchmarked against will change behaviors, intentionally or not.

If we take a pessimistic view that our team is being judged solely by bug injection rate, then some bad behaviors will follow if we act in self-preserving manner. 

We will start having discussions about if certain behavior "is a bug" or should instead be classified as a "new story" or a "change request". Developers will point to "incomplete requirements" and have to battle with product owners (who might also be trying to optimize their own metrics around re-work and "missed requirements") over who is getting dinged. Trivial bugs will get fixed outside of the "official" channels so as to remain undetected in a monthly report.

The idea of collective code ownership goes out the window if we need to track down who "injected" a bug. We have to justify why this bug was "inherited" by our team and thus should not count against us. This feeds into a culture of blame and defensiveness.

Our team has a practice of doing a "bug hunt" &mdash; a designated time for everyone to try to break the software and find tricky bugs. If "bug rate" is a critical measurement of our team's performance, we should stop this practice if we are optimizing in our own self-interest (even if we believe a bug hunt will lead to a better product for our customer).

---

This type of negative behavior can be countered if the team has strong shared values and external support. But as a team gains or loses members, it can be difficult to keep the culture of "doing what's right" vs "doing what's good for the numbers". Giving someone full context is much more difficult than pointing to a number in a spreadsheet.

You can do this same thought experiment for code quality metrics (are we making the code better or making this tool yell at us less?), pointing (are we accurately forecasting or trying to get a high-score?), or code coverage (optimizing for test quality or quantity?).

I recognize that simply saying "this stuff is unmeasurable" is not practical, but we must be very careful about how we choose to measure complex systems and to consider the [observer effect][oe] when capturing any metrics. Aim to use data to support your own experiences and try to avoid allowing situations where parties are motivated to juke the stats.

[oe]: https://en.wikipedia.org/wiki/Hawthorne_effect
