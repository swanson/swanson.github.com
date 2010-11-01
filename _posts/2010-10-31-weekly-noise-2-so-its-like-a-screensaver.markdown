---
layout: post
title: Weekly Noise 2 - "So it's like a screensaver..."
categories:
- blog
---

I will be moving offices in January and as part of the new design, the office 
will have several inset areas in the walls to mount flat-panel displays.  I 
am sure that you have seen these "announcement boards" in office buildings before
-- they are basically replacing the building directories or traditional bulletin
boards.  You could use it for displaying a welcome message, special events, 
upcoming meetings, etc.

I think most of these displays are usually just hacked together by looping over 
a few PowerPoint slides.  Not very elegant or high tech, especially for a software
company!

So when I noticed that the new office would have several of these monitors, I 
thought about some cool things that they could display.  I started thinking 
about all kind of *visualizations*, *infographics* and other fancy sounding 
ideas -- then I talked to a co-worker about the idea and he seemed uninterested
in why I wanted to make a screensaver. Doh.  Well I guess that's basically what 
it is...a glorified screensaver.

But I still wanted to build it!  It gives me a chance to make something with a 
few new technologies I'd been playing around with.  The first is 
[Raphaël.js](http://raphaeljs.com/) -- a Javascript library for creating SVG drawings and 
animations.  It is pretty simple to use and I am trying to brush up on Javascript, 
so it's a win-win.  I also wanted the display to be able to get updates in real-time
so I figured I could use [WebSockets](http://www.websockets.org/) to provide a means to 
do this.

The computer powering the display will launch a browser (in full-screen mode), 
point it to a webpage and then render the Javascript "screen-saver".  A server 
will send updates to the page through WebSockets -- I can hack together a simple admin 
page to edit announcements.  I even have a grand vision of hooking the page
up to our source code repositories and triggering some kind of special effect on the 
display when a check-in is made -- but I'll shelve that until I get some basic 
functionality.

Goals for the week:  
 - Get a static page up that receives WebSocket updates  
 - Make a simple Admin page to CRUD announcement items  
 - Get basic animation going for the background

Time budget: 5 hours
