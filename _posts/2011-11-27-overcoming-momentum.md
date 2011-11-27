---
layout: post
title: Overcoming Momentum
categories:
- blog
---

4:47 pm on a Friday. You've spent all week fighting with your code. But, finally, you 
are able to get it whipped into shape.

You want nothing more than to `git push` and head home.

So you do.

As you pull onto the freeway, you have a nagging feeling that you left something
unfinished. You didn't go back and delete that dead code you commented out. Or you
skipped writing a test for a corner-case because it is painful and takes too long.

Your team leaves a comment in the issue tracker indicating the build number that contains your 
fixes to make it easier for the testing team. You realize you forgot to do that while sitting at 
a stoplight.

By the time Monday rolls around, you've forgotten these defects and moved onto something else.

It happens to all of us.

The problem is that the *Don't break the chain* feeling that momentum reinforces works 
both ways. If your momentum is trending negatively, you will find that it becomes increasing 
harder to get back into good habits.

If you skimped on writing tests last week, it becomes easier to repeat the behavior
again. Skipping a step in your process and not correcting it will eventually lead to
that step disappearing all together.

This effect is not limited to individuals. As Andy Hunt and Dave Thomas put it, it only
takes [one broken window][broken-windows] to trigger software rot in a project:

> One broken window, left unrepaired for any substantial length of time, instills in the 
> inhabitants of the building a sense of abandonment - a sense that the powers that be don't care 
> about the building. So another window gets broken. People start littering. Graffiti appears. 
> Serious structural damage begins. In a relatively short space of time, the building becomes 
> damaged beyond the owner's desire to fix it, and the sense of abandonment becomes reality.

[broken-windows]: http://pragprog.com/the-pragmatic-programmer/extracts/software-entropy

The [Bystander Effect][bystander] then goes into full force: everyone on the team assumes that 
if there is a problem that needs to be addressed, someone else will bring it up. When a negative
behavior is not acknowledged by the team, individuals are less likely to see it as a problem or 
take responsibility for fixing it.

[bystander]: http://en.wikipedia.org/wiki/Bystander_effect

I can offer a few hacks to help stop this behavior:

* Don't check-in after 4pm if you are leaving at 5pm. Come back to the code in the morning
 when you are fresh and tie up the loose ends
* Stop using 'we' at standup meetings. Don't say "We need to stop skipping tests". Directly
 address the people that need to change; if this seems too confrontational for your meetings, do
 it in private
* Printing off a checklist of your process and hanging it up behind your monitor

These help treat the symptoms but not the root cause. To really curb negative momentum, each
member of the team has to be mindful and take pride in their work. If apathy is the cause, then 
no amount of Tips and Tricks is going to help.

But what you, the individual, can do is to lead by example. The great part about the Bystander
Effect (and more specifically [social proof][social-proof]) is that while inaction breeds more
inaction, positive behaviors are also adopted. 

[social-proof]: http://en.wikipedia.org/wiki/Social_proof

When I see a teammate putting in extra time to do something The Right Way, I am more likely to 
follow suit. When someone sees me refactoring bad code, they will take extra care to make their
own code better.

Before you start trying to fix other people, make sure you are following the behaviors and
practices that you want everyone else to.

