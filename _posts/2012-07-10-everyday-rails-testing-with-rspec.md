---
layout: writeup
title: "Everyday Rails Testing with RSpec"
full_title: "Everyday Rails Testing with RSpec: A practical approach to test-driven development"
author: Aaron Sumner
image: everyday-rails.png
book_link: http://leanpub.com/everydayrailsrspec
categories:
- writeup
---

**What's the point?**  
Everyday Rails Testing with RSpec focuses on getting started with RSpec testing in Rails.
Instead of assuming the reader has started by TDDing an app, the book takes the approach
of adding tests to an existing project so you are setup to do TDD going forward.

**How was it?**  
I found the book to be a refreshing take on testing in Rails. My current Rails project
is in the state described by the book: functional, but without tests. The author takes
a very pragmatic approach to testing, opting to forgo using some popular options, such
as Cucumber, in favor of a simpler workflow.

The book covers model and controller specs, factories, integration testing, and then a
few other odds and ends.

Unfortunately, the sample app does not stray far from basic CRUD scaffolding - which
was disappointing. I had also hoped that this book would be more of an intermediate level
book, but found it to spend a bit too much on the basics of RSpec and DRY'ing up the 
tests.

Overall, the book was useful and helped me get back on track with testing my Rails 
project - but I would have liked to see some of the concepts applied to a more advanced 
app. Given the title is "Everyday Rails", I don't think the samples were representative 
of a real Rails app.

**Who should read it?**  
Developers looking to get started with testing Rails applications using RSpec. You will
probably want some background knowledge on using Rails before picking up this book.
