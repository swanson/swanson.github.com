---
layout: post
title: "Getting reacquainted with our customers"
categories:
- blog
tags:
- product_dev
---

## Wait, people are using this thing?

I'm doing product development over the next few months for [Morale][morale], a team mood tracking application I built [several years ago][intra].

Morale was opened to the public in late 2012 and since then we've had a steady trickle of signups while the app has been in maintenance mode. Four years later, I realized that I didn't have a great sense of our users so I wanted to re-engage and collect very general feedback.

Our infrastructure is bare-bones at the moment so the first task was to actually collect a list of email addresses. The app works primarily through email (daily emails to log mood, weekly email summaries) but outside of those transactional emails, we've had no contact with users.

So here's what I did:

* Pulled down a fresh copy of the production database to my local environment -- always recommended when exploring your data :)
* Came up with a quick heuristic for active accounts (we've sent their team emails in the last 2 weeks)
* Dump email addresses for active accounts into CSV file

Next I made a quick survey in SurveyMonkey. Since I was starting from zero, most of my questions were general: are you a software company? if so, are you doing scrum/agile/kanban? how are you using the data? what is the app missing? what is painful?

I also added a more targeted question: are you using real-time chat software (options: Slack, HipChat, None, Other)? People have mentioned internally that we should make a Slack integration so I wanted to see if our existing customers would benefit.

Lastly, I added an opt-in for future follow ups. I didn't feel super great about cold-emailing all of these folks, but I had to start somewhere. By adding an opt-in, I can make a list of folks that are receptive to giving feedback.

## Hey there, I'm Matt!

There was a recent discussion on the highly recommended [Giant Robots podcast][gr] where Ben Orenstein shared the email copy he wrote for a customer feedback survey. Thanks to the [magic of the internet][tw], I found the episode in the archives and transcribed the template:

```text
Hey there, I'm Ben, one of the developers working on FormKeep: the form backend for designers and developers.

Over the next few months, we're going to be investing heavily in the product and I want to make sure we're building the features that *you* want. To ensure that happens, would you please take this 5-minute survey? <link to TypeForm>

I'm only sending this to a handful of our active users, so every response counts. I know it won't be the highlight of your week but it'll mean that future FormKeep changes will make it even better for you.

Side bonus: the entire survey is keyboard-navigable. No mouse required!

Thank you to the hundredth power :)
```

Things I like about this template (and why I think it converts well):

* It reminds people of what the product is and who you are
* Clear time expectation ("5-minute") and empathy that most surveys suck ("won't be the highlight of your week")
* Element of exclusivity and personal stake (we picked you to help us shape the future!)
* Feels like it was written by a real person, not some auto-generated junk
* It's memorable and has a bit of humor ("hundredth power"!)

I modified the template to fit with my context slightly and then loaded up my CSV of emails into SurveyMonkey to create an email template. 

I wanted to send the surveys through SurveyMonkey because it would track the email addresses for me. This let me omit two boring (but essential) questions: who are you (name/email) and what company do you work for. I can get both of these (or close enough) from the email address.

Clicking the "Send" button was slightly terrifying.

![Whelp...]({{site.url}}/static/whelp.png)  

But everything worked out and responses started rolling in almost immediately! After 24 hours, here are the stats.

![Customer Feedback Stats]({{site.url}}/static/morale-survey-stats.png)  

I emailed 806 users, 265 opened the email (33%) and 106 responded to the survey (40% of people that opened). I think those numbers are great given that the email came out of the blue to folks that we haven't communicated with.

*Update*: The final numbers after a week were 297 opens (37%) and 127 responses (43% of people that opened).

From the results, I confirmed that most of our users are using the product to track team happiness for software projects (75%) and that a decent amount are also using Slack (30%).

I also collected free-form snippets that I can use to re-work marketing copy to mirror the words and phrases that my customers are using.

Multiple customers reported pain around printing reports; since they are using an older JavaScript charting library, I'm not surprised. Given that folks are using the morale data during retrospectives or putting it up on walls and kanban boards, printable reports should be improved.

[morale]: https://www.moraleapp.com
[intra]: http://mdswanson.com/blog/2011/10/13/intrapreneurship-applying-the-lean-startup-to-internal-tools.html
[gr]: http://giantrobots.fm/
[tw]: https://twitter.com/_swanson/status/722120705870065665




