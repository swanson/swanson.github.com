!SLIDE center
#Dive Into
![node-js-logo](/node-js-logo.png)    

##Matt Swanson
##August 23, 2011

!SLIDE bullets
#Node is...
* Build scalable network programs
* Asynchronous, event-driven
* Server-side JavaScript environment

!SLIDE bullets
#Scalabe network programs
* HTTP, UDP, TCP, DNS, SSL
* Mainly used for HTTP
* Similar to Python's Twisted

!SLIDE center
##Quick Refresher
![comparison](comparison.png)
###[http://krondo.com/wp-content/uploads/2009/08/twisted-intro.html](http://krondo.com/wp-content/uploads/2009/08/twisted-intro.html)

!SLIDE center
#So where's the speedup?
![blocking](block.png)
##Frequent waiting in web apps

!SLIDE bullets
#Server-side JavaScript
* Callbacks and events are familiar
* Lingua franca for web programming
* V8 is a really freaking fast VM

!SLIDE small
    @@@ javascript
    //hello-world.js
    var http = require('http');

    var server = http.createServer(function (req, res) {
      res.writeHead(200, {"Content-Type": "text/plain"});
      res.end("Hello Node\n");
    });

    server.listen(8000);

    >> node hello-world.js

!SLIDE 
#Getting your bearings
<table class="bearing">
<tr><td style="width: 400px">So you want to...</td></tr>
<tr><td>Install node</td><td><a href="http://nodejs.org">http://nodejs.org</a></td></tr>
<tr><td>- Windows</td><td>Pre-built binary for v0.5.4 (unstable)</td></tr>
<tr><td>- OS X</td><td>>> brew install node</td></tr>
<tr><td>Package manager</td><td><a href="http://npmjs.org">http://npmjs.org</a></td></tr>
<tr><td>- Install packages</td><td>>> npm install mongoose</td></tr>
<tr><td>REPL</td><td>>> node</td></tr>
<tr><td>Run a script</td><td>>> node foo.js</td></tr>
<tr><td>Debug GDB-style</td><td>>> node debug foo.js <br/>Add debugger statements in code</td></tr>
<tr><td>Debug GUI</td><td>Install <a href="https://github.com/dannycoates/node-inspector">node-inspector</a></td></tr>
<tr><td>Cloud deployment</td><td>heroku, no.de, nodester</td></tr>
</table>

!SLIDE
#Demo
##Streaming RSS with WebSockets

!SLIDE bullets
#Good Use Cases
* JSON/REST APIs
* Single page AJAX
* Shell out to command line tools
* Soft realtime apps

###[http://nodeguide.com/convincing\_the\_boss.html](http://nodeguide.com/convincing_the_boss.html)

!SLIDE bullets
#Not-so-good Use Cases
* CPU bound apps
* CRUD and render
* NoSQL + Node => Buzzword BS

###[http://nodeguide.com/convincing\_the\_boss.html](http://nodeguide.com/convincing_the_boss.html)

!SLIDE bullets
#Tips
* Make it non-blocking (or non-slow)
* Node ecosystem moves fast 
* Use `package.json` to freeze dependencies
* Side-by-side architecture
* Callbacks all the way down

!SLIDE full-screen
![](bg.png)
