---
layout: post
title: "Email as the Interface"
categories:
- blog
---

I think using Email as the Interface is a really interesting concept for building new
products. I know it sounds old-school, but hear me out.

Think about some of the advantages for building an email-first application:

* **Widespread corporate adoption**: every company has email (at least every company that
would buy a software product) and receiving email doesn't require any special software
to be install.

* **Asynchronous**: as [Ryan Hoover points out][rh], email is asynchronous. This facilitates a
concierge model that lets you [do things that don't scale][pg]. Imagine a monthly email
recommending books I should read written by an actual bibliophile and not some automated
recommendation system; it might take someone an hour per user, but you've got all month
to finish them.

[rh]: http://ryanhoover.me/post/43986871442/email-first-startups
[pg]: http://paulgraham.com/ds.html

* **Push system**: in a standard web app, you are often relying on users to come to your site,
login and do some task. With email, you can create a "push system" and keep a user engaged
in your application. [Life-cycle emails][lc] are all the rage, why not adapt them into your actual
product workflows?

[lc]: https://training.kalzumeus.com/lifecycle-emails

* **One less application**: lots of business folks spend most of their days in Gmail or Outlook
already, so an email interface has less cognitive overhead. You can get email on your phone,
tablet, or laptop; no need to build native apps right off the bat.

* **Less features**: you might not think is a benefit but email forces you to be very deliberate
about design user interactions and simplifying processes. You can't embed a drag-and-drop AJAX
calendar in an email, but you could email someone three date options as links and let them
pick one.

![Morale daily email]({{ site.url }}/static/morale-email.png)

* **The future is interesting**: Gmail recently came out with something called [Schemas][sc], a
special markup you can add to emails to create buttons and other actions (add to calendar,
write a review, etc) directly in the user's inbox.

![Gmail Add to Queue button]({{ site.url }}/static/gmail-add-to-queue.png)

[sc]: https://developers.google.com/gmail/schemas/reference/one-click-action

* **Easier to delight**: for whatever reason, getting a weekly email with movie recommendations
seems more fun than logging into Netflix; when I saw [Minimalytics][ma] I got super excited about
getting a weekly metrics email, even though the same information is available in the apps
directly.

[ma]: http://www.minimalytics.com/

* **Less competition**: there are tons of CRM apps, but email based applications like [Streak][st] have
a built-in differentiator.

[st]: http://www.streak.com/

* **Scaling is crazy cheap**: sending emails is ridiculously cheap right now. [Mandrill][md] is sending
thousands of emails for [MoraleApp][morale] a month and we are still under the 12k/month free plan
and Mandrill is doing all the hard work of maintaining a positive reputation to avoid landing in spam.

* **Interesting technical challenges**: go tell a computer scientist you need an NLP
system to parse expenses out of a free-form inbound email and watch their face light up. Or how 
about a headless Javascript engine to generate [beautiful summary emails][ps] on the fly?

[ps]: http://blog.parsely.com/post/34241210620/whatever-it-takes

---

Email may seem old and crusty, but that's fine with me &mdash; Email as the Interface is a great
fit for prototyping and building out a laser-focused product that can easily integrate into
people's everyday usage. 

So while a committee argues about the OAuth3 spec, I'll be building something cool that's coming 
to your inbox soon.

[morale]: https://www.moraleapp.com/
[md]: http://mandrill.com/pricing/
[sc]: https://developers.google.com/gmail/schemas/


