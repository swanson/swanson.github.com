---
layout: post
title: "The 30 Second Standup"
categories:
- blog
---

The Three Pillars of Standup Meetings:

1. What did you do yesterday?
2. What are you doing today?
3. What is blocking your progress?

Everyone stands in a circle and takes their turn answering the questions. The whole meeting should 
last only a few minutes and gets everyone of the same page.

But when you consider all the extra crap that gets talked about at a standup &mdash; the
*"Oh, did you remember to do X when you did Y?"*, the *"I told you were should have done A, but the client
made us do B"*, the *"By the way, can we add a new item type in Jira for tracking requirement changes?"*,
the *"Let me tell you about every line of awesome code I wrote yesterday"* &mdash; you are now approaching 
the 15 minute mark and the cost is breaching four-figures.

So why do we follow this format? Is it the best way to communicate this information?

To the best of my knowledge, we follow the Three Pillars because it was written down somewhere
and that's how we learned it. It is a concise and prescriptive way to describe a best practice
and a near certain improvement over existing alternatives.

But just because the official rules (gotta love all those rigid rules, eh? So agile!) state that 
you must go around the circle and answer all three questions doesn't mean you should.

Here's a blueprint for a format I find more effective: **The 30 Second Standup**.

---

The 30 Second Standup reduces the Three Pillars to:

*"Okay, anyone blocked?"* (crickets...) *"Alright, good standup!"*

> But how will I know what everyone did yesterday?

Try looking at the `git log` or Jira. This encourages good commit messages and allows you to filter
out parts of the system that you are less focused on.

> Okay, how will I know what people will be working on next?

Check the [Kanban board][kb] or the [Story Map][map]. Once the team learns to "read the board", it will 
be clear what to work on next and you can check back anytime you want.

[kb]: http://www.sep.com/lk2009/chris-shinkle-embracing-kanban-how-kanban-has-impacted-sep/
[map]: http://www.agileproductdesign.com/blog/the_new_backlog.html

---

Pillar 3 &mdash; *"what is blocking you?"* &mdash; is only one that I've found to have justifiable 
value. You might think that a `BLOCKER!` sticky note on the Kanban board will suffice, but most teams
need a designated "safe haven" for asking for help and getting an immediate follow-up action.

This safe haven is especially important when you have a team of varying skill levels or that is
unfamiliar with each other. It is easy for a new developer to quietly struggle because they don't
want to interrupt someone else or look stupid by asking for help. 

And sometimes, you don't even know who to go to with your problem, so pitching it to the group is 
the fastest way to find out the next step.

---

So should every team switch to the 30 Second Standup? Absolutely not.

Every team should continuously **challenge dogmatic practices and reflect on their value**. 

Don't be afraid to tweak processes that aren't working for your team. Don't blindly follow the rules if
you can't justify them to an outsider.