---
layout: post
title: Building a Javascript web app, or sipping the node.js koolaid
categories:
- blog
---

I've been toying around with the idea of building a 
[small web application](http://swanson.github.com/blog/2010/10/31/weekly-noise-2-so-its-like-a-screensaver.html) 
with a completely Javascript stack, from top-to-bottom.  After perusing GitHub for a bit, 
I found that it is actually doable.  

For the purpose of this post, I'll consider a basic stack to consist of: a
server, a web framework, a backend server and a templating engine.  And I'll also
use Javascript on the front-end.

Here's the rundown of what I'll be using for my current side-project and how to 
get it installed.

#Server: node.js
[`node.js`](http://nodejs.org) is an evented I/O server that uses Google's V8 
Javascript engine.  All the cool kids are doing it.  

To install `node.js` in Linux:   
[Download](http://nodejs.org/#download) the tarball and extract it   
Then in your favorite terminal:  

    cd node
    ./configure
You may get some warnings about missing SSL components, if so do:  

    apt-get install openssl libssl-dev pkg-config   
and then try again.  You can install `node.js` without SSL but you will run 
into problems with `socket.io` later.  After you get the green-light from configure,
run these:

    make
    make install
    make test

Check that it worked with `node --version`.

#npm
[`npm`](http://npm.mape.me/) is a package manager for `node` libraries.  
Think of it like PyPi or Rubygems.

To install `npm`:   
In your favorite terminal:

    curl http://npmjs.org/install.sh | sh

See the [README](https://github.com/isaacs/npm/blob/master/README.md) if 
you get permission errors, or just bust out `sudo` if you like living 
dangerously.

Now we can install all the other libraries with `npm` instead of grabbing 
tarballs or cloning repos.

#Framework: express.js
[`express.js`](http://expressjs.com/) is Sinatra-inspired web framework 
for `node`.  It's billed as "insanely fast, insanely sexy" so what's 
not to like!

Install it with `npm`: 

    npm install express

You can run `express` in a directory to setup a skeleton project structure.

#Templates: jade
[`jade`](http://jade-lang.com/) is a templating engine for `node` that is 
similar to `Haml`. I am still looking for something closer to `jinja2` but 
`jade` will do for now.

Install it with `npm`:   

    npm install jade   
    npm install less

#Backend: mongoose + MongoDB
[`mongoose`](https://github.com/LearnBoost/mongoose) is a MongoDB ORM 
specifically design for the asynchronous callback model used in `node`. 
MongoDB can also speak Javascript on its own plus everything is JSON-like.

Follow the instructions [here](http://www.mongodb.org/display/DOCS/Quickstart+Unix) 
if you don't have MongoDB installed.  Or maybe you can use `apt-get install mongodb` 
if you are lazy like me.

Then install `mongoose` with `npm`:  

    npm install mongoose   


#Front-end goodies:
##jquery
Hopefully, no explanation necessary; drop this into your HTML and be on your way:  
`<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>`

##Socket.IO
[`Socket.IO`](http://socket.io) provides an interface for pushing real-time 
updates using WebSockets + browser fallbacks (for those poor non-Chrome users).
It plays nicely with `express`.

Install it with `npm`:   

    npm install socket.io

Check out the [docs](http://socket.io/) for instructions on how to setup the 
client-side stuff.


##Raphaël.js
[`Raphaël.js`](http://raphaeljs.com/) is a small SVG drawing and animation library
that makes it simple to make pretty things happen in the browser.

You can play around with it here: [http://raphaeljs.com/playground.html](http://raphaeljs.com/playground.html)

---

I was able to get everything working together (albeit every piece is doing very 
basic stuff) so my 'proof-of-concept' is complete and I can start working on the 
actual app now. 

I've dubbed this new stack **MUNJE** (pronounced like `munge`) for 
Mongo-Unix-Node-Jade-Express...and because no one will be able to decipher my 
ugly Javascript code ;-)
