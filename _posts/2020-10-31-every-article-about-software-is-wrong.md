---
layout: post
title: "Every article about software is wrong"
categories:
  - blog
---

## Advice without context

Every article about software is wrong. The reason is **context** -- or rather the lack of context.

Blog posts, articles, YouTube videos, Twitter threads, and conference talks rarely address the context in which the author is operating. Nuance is difficult to communicate and makes for less punchy writing (while also alienating audiences who realize "oh, that actually doesn't apply to me...").

Take the perennial topic:

> Which JavaScript framework should I use?

Well, it depends.

Are you learning to code? Are you trying to get a job? Are you trying to get a job at a FAANG company? Are you working at a consultancy? A startup? Are you building a video game? Or a line of business application? Or one microservice in an enterprise CRM platform?

Are you a tech lead trying to balance the needs of the business with your ability to hire and train the three new grads that are starting on your project (which is already 2 months behind)?

Do you work for a Fortune 500 company doing an a digital transformation across 50 scrums teams made up of a rotating cycle of outsourced developer resources?

Are you picking a JavaScript framework to write a sample app for the Gumroad course you're working on so that you can quit your job fixing legacy Wordpress sites?

Context matters more than any technical benchmark or design decision. But tweet-sized aphorisms are what sells.

Predict which article gets more eyeballs: "We're abandoning React Native" vs "The many trade-offs we had to consider and ultimately what worked and what didn't work for my team of six .NET developers building two native mobile apps for non-technical customers"

---

## Best practices

Best practices become "best practices" because they achieve a good result across a wide range of contexts.

They should really be called [Pareto Practices](https://en.wikipedia.org/wiki/Pareto_principle) (80/20 rule), but then we would have to acknowledge there are situations where continuous deployment, TDD, code reviews, agile, etc are not a silver bullet (and maybe even harmful) and that's no fun.

The great part about best practices is that they give you shared language to talk about concepts quickly, but the worst part is that it's easy to substitute an understanding of the first principles or assumed preconditions with the pre-packaged idea.

And how do things become accepted as best practices anyways?

- **It solves a problem**: Common problems exist in software and knowing when to use a tool is an important skill. But do _you_ have _that_ problem? You sure?

- **Community mindshare**: It feels good to have other people share your excitment and to be part of a thriving ecosystem. Just remember that large companies have teams of "developer advocates" who are paid solely to promote, speak, and tweet about things the company has a vested interest in.

- **That's the old way**: Some old code, libraries, practices, and tools are really terrible. I wouldn't want to be writing COBOL. But not everything old is bad and not everything new (see also: "modern", "lightweight", "simple") is good. Use [time as a filter](https://en.wikipedia.org/wiki/Lindy_effect); the good stuff will stand the test of time (and [get better](https://en.wikipedia.org/wiki/Antifragility)).

---

## Survivorship bias

You only see the extremes on the internet. And even then, it skews towards content that claims to, finally, have found the grand unified theory of building software.

It's not a unique problem to programming. Instagram is a heavily edited, lopsided view of someone's life. There is an ongoing [replication crisis](https://www.sciencemag.org/news/2019/05/solution-psychology-s-reproducibility-problem-just-failed-its-first-test) in science because "we did an experiment and found nothing" isn't a compelling preprint. For every business podcast about "how I made it", 99 other entrepreneurs crashed and burned.

Once you've been around the block in this industry, you can remember the hype cycles that you lived through.

Remember NoSQL? It wasn't all a meme. Redis is something good that emerged. People still use MongoDB sometimes. But what about Riak (ring-based clusters)? Neo4J (graph databases)? It wasn't clear during the mania what was good and what was bad. Be careful when people take credit for being early adopters when there is also a unseen trail of abandoned codebases in the wake.

When was the last time you read an article from someone that explains how they really fucked up and got fired for making a bad decision? Super rare. And even if you do see someone repenting, you read till the end to find out that it's all [kayfabe](https://en.wikipedia.org/wiki/Kayfabe) to show how they saw the error of their ways, reformed, and _now_ finally found The Right Tool For The Job.

---

Every article about software is wrong. I'll check the comments to see why this one is too.
