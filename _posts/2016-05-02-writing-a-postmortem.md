---
layout: post
title: "Writing a Postmortem"
categories:
- blog
tags:
- product_dev
date: 2016-05-03
---

Despite our best efforts, sometimes things just go wrong. After the fires have been put out, it is a common practice to reflect and figure out what happened.

In the medical world, this is done in a [Mortality and Morbidity panel][comp] -- a group that convenes not to assign blame, but to assess the decision making process to improve future outcomes. For software products, we use a written postmortem.

I've never written one of these postmortems. Unfortunately, there was an issue with [MoraleApp][morale] -- a team morale tracker that I am managing -- that warranted stepping back and evaluating what went wrong.

I wanted to start with a template and I found one that I liked from [Travis CI][travis]. The template has three sections:

* Regret: empathize with your customers (it's about them, not you); actually apologize
* Reason: describe the incident in detail, but without blame or judgment
* Remedy: lay out the corrective action you've taken or plan to take

I waited a few days before writing this, mainly because I was really angry about the situation (and very upset with a certain monkey-themed email company).

Without further ado, here is what I came up with:

---

## moraleapp.com: Daily team emails not sent out
On April 21, approximately 500 daily team emails were not sent out to customers scheduled to receive them at 3PM EST. We recognize that the failure to deliver these emails caused confusion and might have made our customers day worse -- which is not acceptable for an application that tracks employee morale. Teams use the data collected from these daily emails to observe trends over time and losing data points makes it harder to do this.

We messed up and we are sorry for causing this disruption.

## What went wrong?
MoraleApp uses an external vendor to send transactional emails. A recent change to the billing plan from our email vendor necessitated a change to our account before April 27.

After reading through the provided instructions on making the account change, I began the process at around 2:30PM EST on April 21. The change involved creating an account in a new system, ensuring that our email sending domain had both DKIM and SPF records correctly configured, ensuring that our domain was verified, and then linking the old account to the new system.

At 2:40PM EST, I logged into the admin panel and checked the DKIM/SPF records and that our sending domain was verified. I created the new account and successfully linked the old account.

At 3:00PM EST, a batch of emails was scheduled to be sent and I observed that the emails were being immediately marked as Rejected from our email vendor and, thus, not being sent out to our customers.

The Rejected status code indicated that the emails were "unsigned". This behavior happens when you try to send from domains that are not verified or are missing the DKIM/SPF records.

Upon revisiting the admin panel, the "moraleapp.com" sending domain was now flagged as "not verified". The DKIM/SPF records were still in place. 

I triggered a verification request email and immediately verified the domain upon receiving the email. Subsequent emails were delivered successfully. 

After monitoring our outgoing mail for the next several days, I've concluded that the issue is resolved.

## Going forward?
I mistakenly interpreted the changes I was making to our account as simply a billing change and did not treat it as a major configuration change. As a result, I made this change during peak activity time for the app.

In the future, infrastructure changes will be performed outside of peak usage windows to avoid service interruption. I will plan how to verify that the changes made are working. In this case, I should have generated a test email and been notified immediately that the message was rejected and avoided losing customer emails.

Additionally, I will be investigating if the webhooks or API offered by our email provider can help us to handle sending failures in a more resilient way (by resending or alerting me to the failures more quickly).

## Summary
A configuration change we made to our email provider caused a number of teams to not receive emails on April 21. We did not plan for this change in the appropriate manner. Future changes will be done in a more intentional and careful way.

Reliably sending emails is a core piece of our application. When we don't send out emails, we aren't recording data that our customers use to help them understand their team morale and they lose trust us. Causing someone to contact support to ask about why their emails were not delivered is a bad experience and something we aim to avoid.

We will use this incident as an opportunity to improve. Thank you for your continued support, please contact me directly if you have any additional questions.

[morale]: https://moraleapp.com/?utm_source=mdswanson
[comp]: http://mdswanson.com/writeup/2012/10/29/complications.html
[travis]: https://blog.travis-ci.com/2014-06-26-three-ingredients-to-a-great-postmortem/