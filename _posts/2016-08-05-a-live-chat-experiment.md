---
layout: post
title: "A Live Chat Experiment"
categories:
- blog
tags:
- product_dev
---

Something I've been experimenting with for the past few weeks on [MoraleApp][morale] (a tool for tracking team morale) is a Live Chat widget.

You've probably seen these widgets before on the internet. They usually sit in the bottom corner of the page and let you ask a question to a real person instead of emailing a support inbox or searching a knowledge base.

We recently made some changes to our pricing and I wanted to find out if people visiting the site had questions or concerns that were stopping them from starting a trial.

---

## What I did

I looked at a couple options to try out a live chat widget. The go-to for SaaS products seems to be [Intercom][int]. Intercom lets you do live chat, announce new features, and manage support requests coming in with email, Twitter, etc. It's very polished but it seemed too powerful for my needs at the moment. I'm the only one manning the queue and I don't have complex needs for tagging, auto-replies, or assignment rules and workflows yet.

The product I ended up testing out is [Drift][dr]. It's more minimal but it gets the job done. There was a free plan that was perfect for my experiment and it was easy to setup. All of these live chat widgets are installed by pasting a JavaScript blob into your app.

![Chat widget]({{site.url}}/static/morale-live-chat.png)

The first hurdle I ran into was: how do I know when someone wants to chat? Should I have the chat inbox window open all day? That didn't seem reasonable.

I used [Zapier][zap] and Drifts custom integration so every time a customer started a live chat session, I would get pinged in Slack with a link to reply to the conversation. There are other options that allow you to chat directly from Slack, but this one worked best for my setup.

![I put a chat message in your chat window]({{site.url}}/static/morale-slack-chat.png)

The other concern I had was my availability: am I going to have a bunch of people trying to chat at 3am while I'm sleeping? What if I'm in a meeting or on a call?

It turns out that customizable "Hours of Availability" are a standard feature for all the live chat services. I can allow live chats during normal work hours, but outside of that the widget displays an offline message (but still can collect async messages that I can reply to later via email).

![Closed for business]({{site.url}}/static/morale-chat-offline.png)

## How it went

Over the course of three weeks, I had around 25 chat conversations with users. There was one question around pricing ("Is there a free plan?", "No, but all plans have a free trial!") but the rest were either support questions from existing users or conversations that never actually started ("Hi", "Hi, how can I help?", radio silence).

The volume seemed to trail off after I first pushed the widget onto the live site. My guess is that people noticed a new thing, tried it out, and then have largely been ignoring it. The widget also has a message that is displayed the first time a user sees it that explains how it work, but after that, it simply gets out of the way unless interacted with.

Eventually, I decided to only show the widget on the marketing/pricing pages. My original goal was to try to answer questions from potential on-the-fence visitors, not to switch to chat as the primary means of customer support. Hopefully, this helps keep the volume in check.

## Lessons learned

There is a big difference in expectation between email support and live chat support. I can offer pretty great email support (usually reply within an hour). Even with Slack notifications and being at my computer most of the day, it was taking a few minutes for me to notice and reply to a live chat message.

Live chat users expect an answer to happen almost instantly. As soon as they send a message, they want to see the "Someone is typing..." message within 30 seconds. No one wants to sit around staring at a chat bubble for 5 minutes, they'll just close the page.

Ultimately, I can't provide a great live chat support experience because I can't sit in the app all day waiting for messages to come in. The volume is low and sporadic and the support team is currently just myself.

The insights gained for being able to chat with a visitor looking at the product for the first time are still valuable, so I'll be trying a few tweaks to see if I can still support live chat at an acceptable level.

[morale]: https://moraleapp.com/?utm_source=mdswanson
[int]: https://www.intercom.io/
[dr]: https://www.drift.com/
[zap]: https://zapier.com/