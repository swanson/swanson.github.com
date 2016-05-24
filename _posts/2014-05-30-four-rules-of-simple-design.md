---
layout: writeup
title: "Understanding the Four Rules of Simple Design"
full_title: "Understanding the Four Rules of Simple Design: and other lessons from watching thousands of pairs work on Conway's Game of Life"
author: Corey Haines
image: 4rules.png
book_link: https://leanpub.com/4rulesofsimpledesign
categories:
- writeup
---

**What's the point?**  
A few years ago, I spent a Saturday in a room of developers doing a ["Code Retreat"][cr]. The idea
is to work on solving [Conway's Game of Life][gol] as an exercise in small-scale software design.
You work in a pair for 45 minutes, sometimes with special constraints like "no if-statements"
or "no mutation", and then you promptly delete all the code, switch partners, and start again.

Corey Haines is the main facilitator of this event and this book catalogues some of the
core lessons he learned from running these retreats over the past five years. He codifies
these lessons into "the four rules of simple design" &mdash; a set of guidelines coined by Kent
Beck in the 1990s.

**How was it?**  
A very quick and enjoyable read. By limiting the scope of the book to Conway's Game of
Life, the author is able to go deep into discussions without having to construct new 
examples for every concept.

The four rules &mdash; tests pass, expresses intent, no duplication, and simple &mdash;
seem to be a bit more approachable than the more formal rules (SOLID, Law of Demeter, etc).
I appreciated that the rules have a bit of room for interpretation and discussion.

After a brief explanation of each rule, the author dives into concrete examples and explains
some of the more nuanced points, such as "topology duplication" and testing behavior to show
intent.

I had a real Aha moment when I came across an example of "tests that depend on previous
tests". In this specific case, an assumption was made about the default constructor of an object.
Because there was a lack of explicitness, unrelated changes caused a whole bunch of tests 
to fail. The solution &mdash; which I've had trouble articulating in the past &mdash; is to use 
builder methods and not allow external callers to use a default constructor. This had the
added benefit of being more clear, since the name of the build method was more revealing than
an empty `new()`.

**Who should read it?**  
Anyone struggling with uncertainity about how to design object relationships would benefit from
this book. As a past Code Retreat attendee, I enjoyed being able to look back and see how a master
of the domain implemented solutions; it felt kind of like I was reading the secret solution's
manual :-)

[cr]: http://www.mdswanson.com/blog/2011/12/05/global-day-of-code-retreat-recap.html
[gol]: http://en.wikipedia.org/wiki/Conway's_Game_of_Life

