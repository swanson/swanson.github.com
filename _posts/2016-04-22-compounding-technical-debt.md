---
layout: post
title: "Compounding technical debt"
categories:
- blog
tags:
- product_dev
- practices
---

I like concept of technical debt; not the watered down version that people use when the code base is in a messy state, but the idea that we are making considered decisions that benefit the short-term, at the risk of long-term consequences.

Today, the long-term consequences surfaced. The following is a play-by-play of a day in my life coming back to a project that has started to 'default' on its debt:

I've fixed a small bug and I wanted to deploy it to production.

* Push to Heroku

The Heroku instance is still running the cedar-10 stack -- an outdated version of the platform that was deprecated in 2014. At the time, apps could still run on the platform for another year without issue so upgrading was deferred. Now cedar-10 has reached end-of-life and new pushes cannot be deployed.

* Upgrade stack, try to deploy

Upgrading to cedar-14 was not an issue, but as part of the upgrade, the version of `bundler` was changed and the Gemfile we try to push is being flagged as "corrupted". Yikes. The most reliable solution seems to be to rebuild the bundle.

* Update bundler and rebuild

The Gemfile was using the "tilde arrow" semantic version specifier (sidenote: I probably should have changed this in hindsight) so we got slightly different versions of gems.

Turns out there is an issue with two of the gems -- both legacy versions -- that requires me to wade through 2-3 year old GitHub issues and StackOverflow posts. Eventually, that gets sorted out.

* Gems sorted out, try to deploy again

Deploy goes through, but there are scary warnings about using EOL Ruby version. I've been using a newer version in development, so I try to upgrade to something that is supported and receiving security patches.

* Upgrade ruby version on staging

Everything explodes. An hour later, the issue is tracked down to a gem that tracks application errors. Yes, a library for tracking errors caused errors to happen. Bumping the version makes everything happy again.

* Deploy new ruby version to production

No more fires for today.

---

My path was not optimal and some of the work probably should have been tackled independently. But this example illustrates how technical debt can compound over time. One small decision (defer upgrading the Heroku stack) saw the 'interest' grow and grow over time as it was neglected. As a result, to deploy a one-line bug fix required a day of high-pressure infrastructure changes and debugging.

I've still not paid down all the debt, but I tackled a big enough chunk to let me address the immediate need. The difficult part will be striking a balance between slowly paying off the rest, adding new features, and fixing bugs.





