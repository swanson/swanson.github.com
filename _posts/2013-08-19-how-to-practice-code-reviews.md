---
layout: post
title: "How to Practice Code Reviews"
categories:
- blog
---

I've become addicted to a simple new app by [Katrina Owen][k].

[k]: https://twitter.com/kytrinyx

It is called [Exercism][e] and I have found it to be a really great way to
practice both giving and receiving code reviews.

[e]: http://exercism.io/

It works like this: you are given a small programming problem with
a suite of unit tests. You make the tests pass and submit your 
solution for critiquing. You have a few cycles of feedback &mdash;
people that have completed the exercise make ['nitpicks'][n], you make
some changes, repeat until enough people mark your answer as completed.

[n]: http://exercism.io/nitpick

Unlike the more mathematical [Project Euler][pe] or the fun-but-impractical
[code golf][cg] challenges, the aim of Exercism is to help you write the
most "simple, expressive, readable code". So, you know, actually useful in
the real world.

[pe]: http://projecteuler.net/
[cg]: http://codegolf.com/

## So how is this good code review practice?

As I've [mentioned before][cr], I think it is really tough to get good at
code reviews. Coming out of school, the only code review you have
probably received was from an automated grading script (and maybe a 5pt
deduction from the TA if your source code was a mess). And I have yet
to find a good resource to help guide an experienced developer on
how to give constructive feedback to a newbie.

[cr]: http://mdswanson.com/blog/2012/11/04/code-reviews-good-idea-bad-idea.html

This is an area where Exercism really shines.

To be able to nitpick a submission, you first need to complete
the exercise yourself. This ensures that users see at least one example
of how to conduct a review. You are also encouraged to nitpick your
own submission and the app shows you guidelines for what is appropriate:

* What do you like about the code?
* How does the code make use of Ruby?
* Does the code make appropriate use Object-Oriented or Functional principles?
* How readable is the code? How well does it tell its story?
* What software design patterns or principles (could) inform the code?

Once you finish an exercise, you can spend your time reviewing other
submissions, giving you a great opportunity to practice doing small-scale
code reviews. Since you have already solved the problem, even if you are
a relative newbie, you can still provide feedback (even if you are just
parroting back the feedback someone else gave you).

As a veteran developer, Exercism is a great way to practice giving
polite and thoughtful feedback to a captive newbie. As a new developer,
Exercism allows you to gain experience receiving criticism, asking for
clarification, and determining when to take (or ignore) suggestions in a 
code review.

---

The app is still in the experimental phase but I would highly, highly
recommend you try it out. I've gotten more practice at code reviews in
15 minutes a day on Exercism than I could have in several weeks at work.

You can do the exercises in Ruby (&#9829;), Python, JavaScript, Clojure, or
Elixir and login with GitHub &mdash; so you really have no excuse not to try
it out.
