---
layout: post
title: "A Dangerous Obsession with Primitives"
categories:
- blog
date: 2012-05-31
tags:
- growth
---

I recently came across a code smell called **Primitive Obsession** in James Shore's 
excellent [Let's Play TDD screencasts][lptdd].

[lptdd]: http://jamesshore.com/Blog/Lets-Play

As programmers, using primitives (i.e. built-in types like int, float, string) are
a security blanket. 

Primitives are familiar to us. When we are unsure about a complex domain, we try to distill 
the objects down to dumb "bags of properties". This allow us to continue working and feel like 
we are making progress --- despite not fully grasping the domain. 

We also lull ourselves into thinking we are reducing complexity. How many times have you said 
_"Oh, the BazBar? It's just a boolean flag"_ and shrugged off the domain implications?

As soon as I heard this term, I immediately thought back to a recent project I was on. 
This smell was all over the codebase, staring me right in the face. But I couldn't articulate
the problem until now.

Part of the application involved entering data about the food you ate. The user would input 
calories, carbs, fat --- just like on a nutritional label.

The problem was that we were representing all of the different food metrics with simple integers.
Calories were an `int`. Carbs were an `int`. Integers [all the way down][all].

[all]: http://en.wikipedia.org/wiki/Turtles_all_the_way_down

At first, this was okay. 

But when it came time to address internationalization, we needed 
to introduce the concept of units. For example, in the US we typically measure carbs in grams. 
But in Germany, they use something called Bread Units (BU).

Alarms should have been going off that I needed to change Carbs from an `int` to a 
[value object][vo]. Alas, I started trying to figure out how to bolt on unit conversions to 
the existing primitive version.

[vo]: http://c2.com/cgi/wiki?ValueObject

So, naturally, I created a `CarbsUnitConverter` with a `convert()` method that took an integer and
a conversion factor. More warning flags should have popped up when I had to return a decimal value 
from `convert` to handle all the supported units. Not only did I have a Primitive Obsession, but I 
was changing the primitive based on context!

I went along blissfully injecting my `CarbsUnitConverter` into every place where we displayed 
carbs in the app. This lead to messy code and exposed the unit conversions to areas of the system
that should not have known or cared about it.

The moral of the story was that having a primitive obsession actually increased the complexity in 
the application by allowing business logic to spill into unrelated classes.

This code smell is fairly easy to identify; the difficulty is having the discipline to prevent it
from creeping into your codebase in the first place.