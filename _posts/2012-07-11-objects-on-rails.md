---
layout: writeup
title: "Objects on Rails"
full_title: "Objects on Rails: Notes on flexible web application design"
author: Avdi Grimm
image: objects-on-rails.jpg
book_link: http://objectsonrails.com/
categories:
- writeup
---

**What's the point?**  
This book takes the form of an "engineer's notebook" and examines a handful of 
alternative OO-patterns to make your Rails applications more flexible and maintainable.

**How was it?**  
Though at times I felt in over my head, I really enjoyed the book. It was at the perfect
intermediate level that I have been seeking lately. While I didn't fully grok everything,
I can always return to the text when I do encounter some of the more subtle problems.

The patterns discussed - particularly the `Exhibit` pattern - were new to me and the 
author did a good job of showing the "before and after" versions to illustrate *why* you
might want to use them.

The sections on isolated, fast unit testing were helpful, though I'm still a bit 
uncertain about when to use a `stub` vs `OpenStruct` vs `Object.new`. This is kind of a 
trap topic for me, as I find I am sending too much time trying to figure out the 
optimal way of doing TDD in Rails - instead of just getting my hands dirty first and 
optimizing later.

It was nice to see how topics I was familiar with from other contexts (dependency 
injection, aggregate root) fit into a Rails app.

**Who should read it?**  
Anyone with interest in the on-going "how to do OO in Rails" debate; 
basic-to-intermediate Rails knowledge required to get the most out of this book

