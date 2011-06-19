---
layout: post
title: Startup Weekend Tip &amp; Tricks
categories:
- blog
---

We are less than a month away from our inaugural internal [Startup Weekend](startupweekend.org/) event
at [SEP](http://sep.com) so I'll be writing up a few posts in an effort
to share some knowledge that I have from attending similar hackathon-style
events and reading about startups voraciously for the past year.

##Pick any platform you want (as long as it's web or mobile...)
I highly recommend staying away from product ideas that are desktop or hardware 
based. I will go into some of the business reasons in a future post, but from
a technical standpoint it will be pretty hard to make significant progress in a
weekend and it can be difficult to demo.

##The end of the weekend product isn't the final product
If you start worrying about prematurely optimizing database calls or scaling to
thousands of concurrent connections, you will probably not get much done.
You might have a solid architecture on the whiteboard (complete with load
balancers, message queues, multi-tiered caching, ... ), but nothing to show
at the all-important demo. It's okay if not everything works, focus on getting
the core functionality done first and then polishing if there is time left.

If you want to build a mobile app, maybe it would
be better to use [jQuery Mobile](http://jquerymobile.com/) or 
[Appcelerator Titanium](http://www.appcelerator.com/) to crank out the
first version; you can always build native iOS and Android versions
if the project gets traction.

##Make use of existing services
Unless you have someone on your team who wants to spend their weekend setting up 
servers and dealing with hosting, deploy your app to PaaS providers like 
[Heroku](http://www.heroku.com/) (Ruby) or [AppHarbor](http://appharbor.com/) 
(.NET). If you need more flexibility, you can spin up an 
[Amazon EC2 instance](http://aws.amazon.com/amis) pretty easily. Remember that 
you can always move your architecture to your own hosted servers after the weekend.

Here are some other services to consider, all with free plans for development:

* [MongoHQ](http://www.mongohq.com/)/[MongoLab](https://mongolab.com) - cloud-based MongoDB instances
* [SendGrid](http://sendgrid.com/) - API for sending emails
* [Twilio](http://www.twilio.com/) - Voice and SMS web service

For some design shortcuts, use a website theme from 
[ThemeForest](http://themeforest.net/) and get icons from 
[IconFinder](http://www.iconfinder.com/) (make sure to check the licenses).

##Research external APIs ahead of time
If your product idea is going to rely on an external API, put in a few hours
ahead of time and make sure you can answer these questions when pitching
your idea on Friday.

* Do you need an API key? (if so, get one beforehand - it may take a few days)
* Do the terms of service prevent commercial use?
* Is there a license fee?
* Are there libraries in popular languages already?
* Are there any request limits that might become a roadblock?

Play around with the API on your own. Make a few calls to it with `curl` (or
[hurl](http://hurl.it/) if your Unix-fu is weak). Find a library that is 
well maintained (check when the last commit was) and is easy to work with and 
try it out.

The [ProgrammableWeb API directory](http://www.programmableweb.com/apis) is a 
good place to look if you need to find an API to provide the data you need.
[Freebase](http://www.freebase.com/) is another option if you need a specific
kind of data.

##Have a plan of attack for your idea
Assuming the idea you pitch to the group on Friday gets support, it is
important that you, as the de-facto project manager, have some idea of how to
execute on your idea.  Try to slice up the product into independent verticals
so people can start working right away and won't be clashing with each other.
There is nothing more frustrating then
having 3 engineers sitting around waiting for one person to figure out what to work
on next. Make sure you are constantly checking in on everyone's progress and
figuring out the next steps.

For a simple Rails web app example, you could divide the work up like this:

* Someone can start [spiking](http://jamesshore.com/Agile-Book/spike_solutions.html) out controller actions
* Someone can start on the database schema
* Someone can do UI mockups on paper and then the HTML/CSS with [Serve](https://github.com/jlong/serve)
* Someone can start [finding gems](http://ruby-toolbox.com/) or integrating 3rd party APIs
* Someone can build a marketing/sales site (this guide is awesome: [CodeFastDieYoung](http://codefastdieyoung.com/2011/03/want-to-move-fast-just-do-this-part-1-design/))

Now at least five people with defined tasks and you can hit the ground running
on Saturday morning.

---

Planning ahead and thinking through your product idea will save you a ton of 
headaches and make the weekend go much smoother. One of the worst things that
can happen during a startup weekend is when progress stops completely because
of an issue that could have been sorted out ahead of time.

I find that doing this kind of research also helps me get more excited about
implementing an idea. Once all of the pieces start coming together on paper,
I am anxious to get started coding. Hopefully, over the next month, those 
planning to attend will start feeling the same excitement.

If anyone else has tips and tricks or suggestions for what to cover in future
posts, feel free to let me know.
