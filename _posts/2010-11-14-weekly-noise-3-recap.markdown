---
layout: post
title: Weekly Noise 3 Recap/Weekly Noise 4 - Hitting a roadblock
categories:
- blog
---

I ran into some issues this week.  The first task that I tried to tackle was
rendering a more complex background with 30+ shapes using `raphael.js`.

I was able to throw together a simple method for generating random curved 
paths for the shapes, but once I added more than three shapes, the performance 
dropped greatly.  Even on my quad-core machine, one core pegged at 100% CPU 
usage and the animation started stuttering in Chrome.  In Firefox, it simply 
crashed the browser.

After hitting this roadblock, I didn't really work on the other tasks for the 
week, since this is a show-stopper.  If I can't get the performance to improve, 
then there isn't really much point continuing.

I am not sure if I am just doing the animations in a really inefficient way or 
if the library is not meant to handle this many objects being animated at once 
(or a combination of both).

This week I will spend my time trying to see if I can modify my code to make it 
usable, if not I will probably just have to scrap the project.  I looked at some 
other options like `processing.js` and `<canvas>` but those don't seem to have 
much better performance.

Goals for the week:

 - Improve performance or bust...

Time budget: 3 hours
