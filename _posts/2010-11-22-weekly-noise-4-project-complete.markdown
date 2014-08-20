---
layout: post
title: Weekly Noise 4 Recap - Glorified Screensaver - Post Mortem
categories:
- blog
tags:
- worklog
---

I was just about to give up on my 
[screensaver project](http://mdswanson.com/blog/2010/10/31/weekly-noise-2-so-its-like-a-screensaver.html).
My progress had stalled 
due to performance issues with `raphael.js` as I started adding more than a 
handful of shapes.  I was ready to just slap a static background image on it 
and call it "done"; then I came across 
[`three.js`](https://github.com/mrdoob/three.js/) -- a lightweight 3D Javascript 
engine and everything just fell into place.  

I saw a [blog post](http://nooshu.com/three-js-and-the-audio-data-api-visualisation/) 
about generating audio visualizations with `three.js` and I was amazed at how smooth 
the animations were and that it was only 200 lines of code.  The `three.js` library itself is 
unassuming, but once I saw a few of the examples on Github, I knew that this could be the 
solution to my problems and is a very well-written piece of code.

One of the [demos](http://test.sjeiti.com/jsflowfield4d/) was really cool and almost 
exactly like what I was *unsuccessfully* trying to make.  So about an hour later and 
after a few passes through [JSLint](http://www.jslint.com/), I had modified the demo 
to work with jQuery and tweaked the parameters around to make the effect more suited 
to the screensaver.

The `three.js` library actually has both `SVG` and `<canvas>` outputs, though I didn't 
see much difference in performance in either Firefox or Chrome.  I ultimately went 
with `<canvas>` because, frankly, I am a little sick of `SVG` at this point :-)

And with that, I am declaring this project finished; the source code is on Github: 
[https://github.com/swanson/glorified-screensaver](https://github.com/swanson/glorified-screensaver)

I only recommend running the client in Chrome (and maybe Safari).  Firefox 3.x doesn't have support
for websockets so it uses a Flash fallback and the Chrome JS engine also performs better.  You can
run the page in fullscreen mode (`F11`) for the best effect.

And so you don't have to install `node.js` yourself (though you should since it's 
pretty cool!), here's a video:

<object width="400" height="300"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=17104224&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=0&amp;show_portrait=0&amp;color=00ADEF&amp;fullscreen=1&amp;autoplay=0&amp;loop=0" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=17104224&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=0&amp;show_portrait=0&amp;color=00ADEF&amp;fullscreen=1&amp;autoplay=0&amp;loop=0" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="300"></embed></object>

Recap:

 - I built a real-time announcement board web app ("screensaver") using [`node.js`](http://nodejs.org/)
 - Updates are sent to all open instances of the page in real-time using [`socket.io`](http://socket.io/)
 - The background animation is rendered client-side using [`three.js`](https://github.com/mrdoob/three.js/) and is 
 based heavily on this [demo](http://test.sjeiti.com/jsflowfield4d/)
 - I worked on this project for three weeks (Weekly Noise [2](http://mdswanson.com/blog/2010/10/31/weekly-noise-2-so-its-like-a-screensaver.html), [3](http://mdswanson.com/blog/2010/11/08/weekly-noise-3-so-its-like-a-screensaver-part2.html), and [4](http://mdswanson.com/blog/2010/11/14/weekly-noise-3-recap.html))
 - I planned to spend 12 hours of free time on the project; I ended up spending around 20 hours in total on it

What I learned:
  
 - `node.js` and some libraries for it ([`express.js`](http://expressjs.com/), [`mongoose`](http://labs.learnboost.com/mongoose/))
 - Haml-style templates using [`Jade`](http://jade-lang.com/) (still not a fan...)
 - Some jQuery tricks, namely `live()` event binding
 - A few neat things with CSS3/HTML5 -- alpha channel, `box-shadows`, `border-radius` 
 - I am still not that good at writing efficient Javascript
 - I am even worse at 3D graphics...


----
Next week: I am taking a week off for Thanksgiving and to decide what to do work 
on next.  Ideas or collaborators are welcome as always :-)
