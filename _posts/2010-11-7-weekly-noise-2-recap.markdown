---
layout: post
title: Weekly Noise 2 Recap - alert("It's working!");
categories:
- blog
---
The past week I have been working on a 
[web-based "announcement board"](http://swanson.github.com/blog/2010/10/31/weekly-noise-2-so-its-like-a-screensaver.html) 
using a [slew of Javascript libraries](http://swanson.github.com/blog/2010/11/03/sipping-the-nodejs-koolaid.html).

So how did I do? Well I hit all my goals for the week, which were:  

 - Get a static page up that receives WebSocket updates ✓  
 - Make a simple Admin page to CRUD announcement items ✓  
 - Get basic animation going for the background ✓

The static page was simple enough to setup, especially since I have used `socket.io` 
before.  I added some basic styling to play around with some CSS3 stuff (`border-radius` 
and `box-shadow` are pretty slick).  I send a payload and an action type over `socket.io` 
to the page and then perform the appropriate action -- adding an announcement, editing 
the message or removing it all together -- with `jQuery`.

[![](/static/week2-index-thumb.png)](/static/week2-index.png) 

Next, I setup an "Edit" page where you can CRUD announcements.  I used jQuery 
Ajax POSTs to trigger the actions in the database.

Since I am serving the pages with `node.js`, I had to adjust to an asynchronous programming 
model.  I haven't been able to wrap my head around this concept in the past -- my previous 
attempts at using `monocle` and `twisted` always ended with me frustrated and discouraged.  

I spent some time trying to debug why I was not able to pull some documents out of `MongoDB`
and pass them to the template.  It took me a while to realize that I need to put the 
rendering function in the callback for the database query.  Otherwise, my application was 
happy to go on ahead and render the page with an empty array.


Putting the `res.render()` in the callback ensures that the query has finished and the 
page will receive the proper data.  I imagine this code could still be improved with some 
kind of asynchronous `map` function instead of a for-loop, but it works well enough at the moment.

<script src="https://gist.github.com/667308.js?file=gistfile1.js"></script>

I also ran into a problem with binding jQuery `onClick` callbacks.  Since all of the CRUD functionality 
uses Ajax POSTs, I was constructing the new announcement divs on-the-fly.  If you use the 
normal `$('#foo').click( ... )` jQuery code, only the DOM elements that are present when that 
function is executed actually get bound.  

As a result, any new elements that I add (like when I 
created a new announcement) would not respond to events.  Fortunately, this is easily fixed by using 
[`.live()`](http://api.jquery.com/live/), which binds the event handlers to all selector matches, 
even those created dynamically.

![/static/week2-edit.png](/static/week2-edit.png) 

The last goal was to get a simple animation going in the background using `raphael.js`.  
I want to be able to generate a bunch of polygons and then have them animate along a path.
Once the polygon goes offscreen, my plan is to loop it around back to where it started to 
give the illusion of an endless stream.  

I used `inkscape` to make an SVG path (which is really just a string of coordinates and 
commands) and then had a spinning square follow the path.  Since the SVG element lives in 
the DOM along with the other page elements, I needed to set the `zIndex` so that the 
animation would appear underneath the other text and images on the screen.

All together, it was a productive week.  Despite hitting a few obstacles, I learned a 
few new tricks and made good progress; the source code for the app is on 
[Github](https://github.com/swanson/glorified-screensaver) so feel free to take a look.
