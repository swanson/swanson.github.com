---
layout: post
title: SDC Chicago Talk Takeaways
categories:
- blog
---

This past weekend I headed up north for [SocialDevCamp Chicago 2011][sdc].

[sdc]: http://2011.socialdevcampchicago.com/ 

Though I spent most of the time coding a [project][cloutbout] for the hackathon (and won a prize 
for the second straight year!), I was able to make it to a few of the talks at the 
actual conference.

[cloutbout]: https://github.com/swanson/cloutbout

I was unimpressed with the talks at last year's SDC Chicago, but I was pleasantly
surprised with the speakers this time around. So here are my notes:

##Design for Hackers - David Kadavy

I had previously run across [David Kadavy][dk] through a series of blog posts he did that
were popular on HackerNews. The topic of this talk was "Whitespace" and some of the key
points were:

* Whitespace shapes design even though it is often thought of as "nothingness"
* [Gestalt Theory][gestalt] explains how our brains perceive and group visual elements
* Similar objects have a sense of "togetherness"
* The principle of Proximity explains how objects that are close together seem connected
* Closure is how our brains "auto-connect the dots"
* Use consistent and purposeful line-heights and leading to improve the flow of a page
* [Tufte's][tufte] 1+1=3 concept - two lines with whitespace between is really three items

I was familiar with most of the material in this talk, but I felt like it was a good
introduction to design. I am still on the fence about whether or not I want to pick
up David's [upcoming book][d4h].

[dk]: http://www.kadavy.net/
[gestalt]: http://graphicdesign.spokanefalls.edu/tutorials/process/gestaltprinciples/gestaltprinc.htm
[tufte]: http://www.edwardtufte.com/tufte/
[d4h]: http://www.designforhackers.com/

##API Driven Development - Craig Ulliott
[Craig][cu] talked about building [WhereIveBeen's][wib] data/API abstraction layer, the mistakes he
made, and how to design a better, more scalable solution. I liked this talk because Craig
was opinionated and spoke about his thoughts - I feel like this allowed him to talk about
specific ways to improve your API design instead of trying to please everyone with
general advice.

* Craig suggested that start-ups build an API with Rails because of its RESTful nature
and code readability
* You can always do a rewrite if you need to, you will probably have much more resources if you
reach a point where you can't scale Rails
* Keeping a standard data model allows new services to be quickly integrated
* For mobile use, allow a "fields" option to minimize response size (aim for one network packet!)
* It is faster to cache a query that shows too much data and filter down fields in a different 
layer of the stack than hit the database again

[cu]: http://craigulliott.com/
[wib]: http://www.whereivebeen.com/
  
##Heedful Programming - Dave Hoover
I was really looking forward to this talk after reading [_Apprenticeship Patterns_][ap], which
[Dave][dh] co-authored, and it was really, really good.

* Dave talked about his background in psychology and studies by [Karl Weick][kw] about the
crews on aircraft carriers
* _Heedful interrelating_ is the idea of making knowledge connections between team members
to better handle complex problems
* Siloing really breaks down when a project needs multiple experts to collaborate on a
solution
* Is your team habitual or heedful? Which code fits your process: `next_week = clone(last_week)` 
or `next_week = retrospect(last_week)`?
* Bring in new blood that will question the process, "elders" should welcome new ideas
* If something in your process is painful, do it **more** - it will force you to get better at it, 
improve the process, or show you it is not needed
* Have a safe environment for developers to practice speaking or sharing ideas, encourage
involvement with the dev community
* Use process as a tool to build trust, then use that trust to remove barriers in the process

So many points resonated with me that I am going to "fork" Dave's talk and present
it at a brownbag at SEP. It really made me think about how to improve my team's own process
and made me want to bring more aspects of Obtiva's apprentice system to SEP.

[ap]: /writeup/2010/10/26/apprenticeship-patterns.html
[dh]: http://redsquirrel.com/dave/
[kw]: http://www.jstor.org/pss/2393372
