---
layout: post
title: Weekly Noise 3 - "So it's like a screensaver..." (Part II)
categories:
- blog
tags:
- worklog
---
I got a lot done [last week](http://mdswanson.com/blog/2010/11/07/weekly-noise-2-recap.html) 
and I am really liking the **Weekly Noise** format.  I've even got a new idea 
ready for after I finish this project -- and even though I want to jump ship and 
start on that, I will be patient and follow my new system.

Currently, I've got almost all of the functionality done.  There are a few minor 
things left, like sorting based on the timestamp and doing some refactoring in 
the `node` app, but for the most part all that remains is styling the pages and 
then getting the background animation going.  I will probably move the sorting 
onto the client so that I can avoid looping in `node` and use some kind of 
asynchronous map to build up the results set as I mentioned in my recap.

I need to find a way to draw polygons in `raphael.js` -- I know there are a 
[few](https://github.com/wout/raphael-shapes) [add-on](http://code.google.com/p/jsvectoreditor/) 
libraries out there that I can probably use, but there is still some legwork 
involved with that.  

The other challenge that remains is getting pseudo-random paths for the shapes 
to animated along.  I saw "pseudo-random" because there is a general path that 
they should follow so that the background "flows", but I need some randomness 
to make it look more natural.

And then, fingers crossed, it will be done.  Hopefully, adding 50-100 more 
shapes to the SVG canvas won't bring the browser to it's knees; if it does 
then I might have to figure out a better way to draw the background.  I don't 
know how SVG compares to `<canvas>` from a performance stand-point so that 
might be worth investigating.

Goals for the week:

 - Fix announcement sorting
 - Draw a polygon
 - Get the full background going  
 - Style the page  

Time budget: 4 hours
