---
layout: post
title: "Internal tools should be sold or killed"
categories:
- blog
tags:
- practices
published: false
---

I work for a software development shop. Like all consultancies, we run on billable hours. Bcause of the unavoidable inefficiencies of a consulting pipeline, we find ourselves with small chunks of time between projects.

We use many tools and applications to help us do our jobs better. Because our staff has the ability to build software tools, we can solve our own problems in just the way we like.

The lightbulb goes off. We can use our unbilled time to build tools that provide value to our company, minimizing the "lost value" of idle engineers!

I propose a somewhat radical line of thinking for evaluating whether we should do an internal project: if we are to build it, we will sell it as an external product -- or we kill it.

---

Consider where the idea for an internal project comes from: there is a *need*. You might research existing tools to see if you can satisfy your need. You can do some back of the envelope calculations on the relative costs of building a bespoke tool ("buy vs build").

Let's take an actual internal project that we built and run it through this line of thinking. 

The project in question is called Chops -- it's a tool that tracks project and technology experience across the company. We use it to help staff projects (who knows Angular? iOS?), create marketing materials (look at how much work we did in the medical industry!), and help with business development (you're building a .NET API -- here are three other projects that have used the same tools). It's kind of like an internal LinkedIn (without the hordes of spammy recruiters!).

Imagine that we haven't built this project, but rather have a team of 3 engineers that are available for 6-8 weeks until a scheduled client project will start.

## Does our company need Chops?

If No: **Kill it** (why are we building something we don't need?) 

If Yes: Some of the time, this is where we stop. We need it, it has value, we have people "on the bench", therefore let's build it! But if we keep following "sell or kill", we should be asking:

## Do other companies (that are similar to us) need Chops?

If No: It's time to take a deep look at our perceived need. There are certainly exceptions but the majority of the time we are not special snowflakes. Why don't other companies have this need? What do they do instead? Why isn't this a nagging problem for them like it allegedly is for us?

The solution might be that we need to look at the problem a different way. In this example, what if we structured the company into specialized teams so it was obvious who has iOS experience (the people on the iOS team, duh)? What if we moved away from metric-based marketing around how many hours we've worked in various industries? What if engineers "paired" with the marketing team so we could answer technical questions directly?

Could those work? Maybe, maybe not. But I think it is worth thinking about.

If we *really* have this need and others don't seem to, proceed to the next question. If not, **Kill it** and take a different approach or re-evaluate the process.

If Yes: If multiple companies have a need, there is very likely existing products or tools out there that attempt to address the need. Proceed to the next question, please!

## Do existing tools/apps solve the need that our company has?

If Yes: Awesome, we should buy one of those then. Remember that the one week of time from an engineer to build this internally has a (theoretical) cost of several thousand dollars. Six weeks to build a tool at $100/hr is comparable a $2000/month plan for a SaaS product (and that's before we factor in ongoing maintenance for our internal tool). Spending $299/month for an app is crazy expensive for an individual but a drop in the bucket for most companies.

**Kill** the internal project and buy.

If No: We need to critically analyze the existing options and determine why they don't meet our needs. It is very tempting to dismiss these options because we can write our own software. We can make the interface just the way we want. We can integrate with our other systems and have control over all aspects of the tool.

But it is possible that nothing on the market is right for us. Proceed onwards!

## Will our internal tool have a "killer feature"?

If Yes: Awesome, skip ahead.

If No: **Kill it** If we cannot describe why the existing tools aren't right for us and we have no alternative approach, the best we can hope to do is rebuild essentially the same product that we could have bought. Maybe it has a better UI, but it is now our responsibility to keep it running, updated, secure, and supported -- most likely with a revolving door of new people with small chunks of time to contribute. Without a killer feature, usage will likely decline and the project will become neglicted and the maintenance cost will rise.

## Our company needs this, other companies need this, we identified a killer feature...so let's invest in this product and sell it to others. Right?

If No (or "Well...but..."): **Kill it** We are sure that this tool is valuable to us, valuable to others, and we've identified the unique value proposition that would cause customers to give us their money. And yet, we don't want to invest and build this as an external product?

This is the ultimate "put our money where our mouth is". Either we've identified a potentially viable product (and should fund/staff it like a "real" billable project) or we've lied to ourselves on the previous questions.

There are some rationalizations. We don't have anyone to do support; but someone has to help when the internal tool breaks, right? We don't know how to handle processing credit cards; shouldn't we figure that out so we can help our customers that want to do this? We might disappoint billable clients if we are distracted by building a product; we disappoint our staff if we make them work on unmaintained internal tools with no focus.

If Yes: **Sell it** Treat it like a paying client project. Lock in a team for six months and don't cave two weeks later. Aim to build a product that can actively pull in people during downtime when it advances the product, not that we have to push people onto to kill time.

Reframe unbillable time as an investment. Follow Nassim Taleb's "barbell strategy": 90% of staff in 'safe investments' (billable work) and 10% of staff in 'highly speculated bets' (product development).

## We built it! But it didn't sell :( What now?

We've still got the same options: sell it or kill it.

Is it selling, but not enough for it to be worth our time? We could literally sell it -- find someone else that wants to run the app if we still need to use it. Maybe an engineer wants to run it as a side-gig? Sell them the rights for a dollar and a lifetime plan for the company. Maybe one of the existing customers is really depending on this tool and wants to take it over? Maybe you put it on Flippa?

If it's not selling, just kill it. We tried something, we learned a bunch, but in the end, it didn't work -- celebrate the failure. Free up time, bandwidth, and energy for engineers to work on something new or do spend that time on other valuable activities. Bring the empathy we've gained to our client projects and help them build better products for their customers.

## And if we don't have a killer product to build (or we don't want to build products), what should we do with downtime then? Twiddle our thumbs?

Learn new technologies (by building Breakable Toys, not creating burdensome legacy projects), learn new skills (training, deliberate practice), share what we've learned (blogging, speaking, networking), think of ways we can delight our existing customers (prototyping, proactive proposals, trying new tools on our own time), improve each other (mentoring, pairing, coaching), give back (open source, volunteer)







