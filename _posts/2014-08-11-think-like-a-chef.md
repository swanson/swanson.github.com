---
layout: writeup
title: "Think Like a Chef"
image: think-like-a-chef.jpg
author: Tom Colicchio
isbn: 0307406954
categories:
- writeup
tags:
- tangential
---

**What's the point?**  
It's no secret that I'm interested in the idea of cooking and extracting lessons from chefs. Despite not cooking all that much myself, I find similarities between cooking and software; both require some amount of creativity, both can be treated as a craft.

I was drawn to this book because it aims to explore how a chef thinks,
rather than just list recipes. And I've been watching way too much *Top Chef* lately.

**How was it?**  
The book is organized into four major sections:

- Techniques: roasting, braising, stock-making, etc
- Studies: using one ingredient as a building-block for a dish
- Trilogies: recipes around 3 ingredients that are known to work well together
- Component Cooking: using seasonal vegetables as interchangeable components

The idea goes that once you are proficient with the technical skill of cooking,
you can start building dishes around a single ingredient. Over time, you start to notice patterns and pairings that work well together. And once you have some basic staples in your repertoire, you can mix in seasonal ingredients for variety and freshness.

I found it illuminating to find software analogues. Techniques for software are the more mechanical bits of development: writing code, writing tests, making applications. The concept of a Study might map to picking your preferred language: you might pick up Ruby and then use it for simple scripting, web applications, command line utilities.

Trilogies reminded me of best practices at a very high level. A relational database works well with a server-side web application; a JSON API works well with a mobile app. I also thought of a (somewhat forced) analogy of flavor pairings &mdash; in food, they say that food that grows together tastes good together. You can see this to an extent with software tools, where natural pairings seem to crop up in the form of "stacks". Rails applications gravitate toward Postgres/Redis, PHP towards MySQL, .NET towards SQL Server. It's not to say that you *can't* mix and match, but generally you will get the best "taste" if you stay within a stack.

Component Cooking seemed natural for software. Whether you think about more formalized Service Oriented Architecture or just dropping in similar components like logging or background workers, it is seen as benefit to design systems out of pluggable components.

**Who should read it?**  
I actually just skimmed over the actual recipes in the book (working through them all would likely take months), but I appreciated reading this book. If nothing else, it got me thinking about alternative metaphors for talking about software.
