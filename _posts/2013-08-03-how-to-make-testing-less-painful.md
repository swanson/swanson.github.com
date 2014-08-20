---
layout: post
title: "How to make writing tests less painful"
categories:
- blog
tags:
- practices
---

I've been hacking on a few new projects recently, both at work and on my own 
time. 

But I've been kind of sloppy with testing.

The biggest hurdle I am running into is pain. Slow tests are painful. Doing a
bunch of manual setup to test something is painful. Gluing together 13 different
gems to get things how I like them is painful. Mustering the initiative to write
the first test is painful.

Turning a test suite from a hostile environment into a cozy place that makes you
feel all warm inside takes a lot of upfront effort. Sometimes I don't think about
the benefits of investing time at the start of a project to up my motivation to
write good tests later on.

There are a few concrete things that encourage me to keep up a well-groomed 
test suite. I've found that I am very likely to break good testing habits on 
projects that are missing the following:

* **Single command to run all tests** I recently spent a few weeks on a legacy
project and I was happy to see a full test suite. I was not so happy to learn that
you couldn't run the full suite at once. It wasn't that the project was just 
missing a script to run all the tests, but that you would hit a cryptic `JRuby`
out-of-memory error if you ran them all at once. I can not imagine wanting to
pay the upkeep for that test suite &mdash; I had to run the tests in 5-10 test
"chunks" to see if anything was broken. Yuck.

* **Seeds have been planted** I feel guilty slacking off on tests if I arrive
on a project that has decent tests already. Even if that person is just a past
version of me! Harness your initial momentum to do the grunt work and set 
yourself up for future success and good habits later. Pretend someone you really
admire has left the project in your care and trusted you to keep the quality
consistent.

* **Factories** I have a love/hate relationship with `FactoryGirl` and the 
factory pattern in general. I love when I can replace 50 lines of setup code with
`Factory.create :project_with_contributions` in a test; it is super expressive 
and lets me focus on the important behavior I am trying to explore. But I hate,
hate, hate setting up factories. It is some of the most boring stuff I can think
of.

Most of this stuff is not fun. I don't know many people that like doing the
grunt work that turns a test suite into a well-oiled machine. But if you can deal
with the pain early, you will be thankful (and more likely to still be writing
good tests) a month or two down the line. 

Most projects are marathons, not sprints. Unless you are doing scrum.