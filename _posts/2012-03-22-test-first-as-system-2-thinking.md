---
layout: post
title: "Test First as System 2 Thinking"
categories:
- blog
tags:
- tangential
---

I've been reading Daniel Kahneman's excellent [*Thinking, Fast and Slow*][tfs] lately; the book introduces two types of thinking: System 1 and System 2.

[tfs]: http://www.amazon.com/Thinking-Fast-Slow-Daniel-Kahneman/dp/0374275637

System 1 is fast, intuitive and emotional. System 2 is slower, effortful and rational.

Is a quiet, organized boy who loves to read more likely to become a librarian or a farmer? 

System 1 leads you to pick librarian but, rationally, there are much fewer male librarians than farmers (there are 20 male farmers for every male 
librarian). System 2 would have made that distinction, but it is lazy and was happy to accept System 1's (incorrect) answer.

I am realizing that the same factors are at play when you decide to start coding a new feature.

The natural inclination is to dive right in and start implementing a solution. You are jumping between files,
creating new functions and classes as you go, and generally feeling like you are making progress. This is a System 1
way of doing things. 

Everything might go fine until you hit a snag. Small issues that you didn't see at first suddenly become huge roadblocks. 

It seems like your solution is correct, but maybe a hidden corner case goes undetected.

And once you work through all the problems, you start writing tests that are exercising your implementation, not the intended behavior. The code
*obviously* works so the tests are just a formality that you are required to slog through.

In contrast, [Test First Programming][tfp]<sup>1</sup> allows System 2 thinking to happen. By shifting your focus and attention to determining how to test the behavior of your
program, you force yourself to be more methodical when making important system design decisions.

[tfp]: http://www.extremeprogramming.org/rules/testfirst.html

The beauty of this approach is once you expend the cognitive load of writing your tests, you can defer back to System 1 for the implementation. Using
the tests as your guide, the code suddenly becomes more intuitive and effortless. You gain confidence that you are on the correct path.

To me, becoming aware of the System 1/2 concepts has helped me realize how beneficial a test first approach to writing software can be. I can
recall multiple instances of diving headfirst into the code, without taking some time to plan out what I was going to implement and consider
all of the edge cases. 

Kahneman's insights offer an explanation for why this happens, but it is up to me (and you!) to be mindful and apply this insight to our daily work.

<div class="aside">
[1]: Whether you prescribe to the school of TDD(esign), TDD(evelopment), ATDD, BDD, etc etc is an implementation detail.
</div>



