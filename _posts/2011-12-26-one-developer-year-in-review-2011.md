---
layout: post
title: "My Year in Review: 2011"
categories:
- blog
tags:
- reflections
---

This post is mainly for my own benefit -- I am repeatedly surprised by the phenomenon
of gradual improvement and taking an hour to summarize my year always makes it clear how 
much I have learned and grown as a developer.

#Professional
My first full calendar year working at [SEP][sep] was quite eventful. I spent the first 9 months
continuing work on a long-running web application for an aerospace client. About half of the
time I was working on new features in the ASP.NET MVC part of the app and the other half was
spent fixing "short term high visibility" bugs. This meant digging around in legacy Perl code
and spending more time going back and forth with the client to gather requirements.

[sep]: http://www.sep.com

I was getting anxious to leave the land of Perl and as the team dissipated until more work
packages were approved, I spent a short period on internal projects.

For a week I was doing discovery work and researching SMS technologies for a project that
would help a [non-profit in South Africa][lsa] collect medical data for impoverished children. 
I ended up recommending that the organization partner with a local group that already had a solution
for logging data with text messages.

[lsa]: http://www.lovingsa.org/

I spent another week trying to port an internal web app from Rails 1.X all the way to Rails 3. It
proved to be very difficult, as the combination of my lack of legacy Rails knowledge and a weird
deployment environment (MS SQL Server + Windows box) were too much to overcome in a week. 
I tried to lay the groundwork (adding a Gemfile, getting the database adapter working) so someone
else could try to pick up the effort in the future.

I was pulled back onto billable work in September and joined a team of four on an Android project
in the medical space. Having never done Android development, it was both exciting and frustrating to
dive headfirst into a greenfield project. Within the app, I've focused on integrating a Javascript
charting library, as well as generating static reports that the user can email to themselves or 
their healthcare provider. Three months into the project, I think I've gained a solid understanding
of the 'Android Way' of doing things - especially tasks like background processing and service 
binding.

I was fortunate enough to spend a day doing [Story Mapping][sm] training with [Jeff Patton][jp] and 
got to apply my newly learned abilities when doing a project estimate for a local bio-chem startup.

[sm]: http://www.agileproductdesign.com/presentations/user_story_mapping/index.html
[jp]: https://twitter.com/#!/jeffpatton

A coworker and I took a week to build an iPad-friendly interface (with jQuery Mobile) for a 
section of an existing application that was well received by the client and is going to bring in 
one (if not two) projects for the iPad next year. I was involved with the client meetings to 
discuss the goals and requirements of those projects, giving me more insight into the work pipeline 
before it hits the Kanban board.

I helped organize SEP's first [internal Startup Weekend][sw] that was held this past 
summer. Around 15 developers came in and built prototypes for three products in a single weekend. 
While none of the projects really took off this year, some were put into the internal project queue 
and have had more exploratory work done on them. Another Startup Weekend is scheduled for February 
2012 and I've made it a personal goal to get at least one of the projects launched to the public
this time.

[sw]: /blog/2011/07/18/start-up-weekend-lessons-learned.html

I participated (sometimes too much in my opinion...) in two book clubs at work: one for Rework and 
one for The Passionate Programmer. 

I got over my irrational fear that I needed to be an expert to present information on a topic and 
gave five brownbags talks over lunch.

With the help of some friends at work, I started a weekly [Blog Battle][bb] with the goal of 
getting more engineers at SEP to start writing in a technical capacity. A group would decide on a 
title and then the participants would write a post about that title, with the contents up to each 
person's own interpretation. This friendly competition ran for five weeks and had over 20 posts 
submitted.

[bb]: /blog/2011/10/13/sep-blog-off.html

I didn't achieve my (albeit ambitious) goal of "leveling up" to Software Engineer 2 by the end of 
the year, but I made good progress and, assuming I get some opportunities to demonstrate competency 
in a few key areas, I should be able to do it in 2012.

---

#Personal

##Community
I became a regular attendee and contributer to the Indy ALT.NET group. I gave four mini-talks
(15-30 minutes): writing with Markdown, Dive into Node.js, Javascript visualization libraries, and 
design shortcuts for weekend projects. The group is rebranding to [Indy Software Artisans][isa] and
I am slated to give a talk early in 2012.

[isa]: http://indysa.org/

##Personal Projects

###[Bibliotechnical][bt] - Status: <span style="color: red;">abandoned</span>  
My first stab at building something for public use. The idea was to build a technical book
aggregator that ranked books by metrics other than number of copies sold and star ratings. I
would rank books on things like shelf life, practical vs theoretical, target developer skill
level and use recommendations from Stack Overflow, Hacker News and Reddit. I would monetize using
affiliate links. The main issue was that I had no idea how to rank the books that I hadn't read so
I just deferred that until the last moment -- but once I reached the point when I needed to solve 
the problem, I still didn't have a clue how to tackle it and lost interest.

[bt]: https://github.com/swanson/bibliotechnical
---

###[LandingPad.rb][lp] - Status: <span style="color: green;">shipped</span>  
I extracted the landing page that I built for Bibliotechnical into a separate project. I didn't
understand why developers were paying money to other startups to create a 'viral landing page' when
it is pretty simple to make your own. I open sourced my simple version that collects email addresses
or Twitter handles which can be deployed to Heroku in just a few minutes.

[lp]: https://github.com/swanson/LandingPad.rb
---

###[Netflix-it-now][nin] - Status: <span style="color: green;">Works on my Machine!</span>  
Weekend project that I threw together with a friend. We were lamenting over IM one night
that it was dumb that Netflix had an "Add to Instant Queue" button, but only for movies that were
available to stream. If there was a movie that was only available on DVD, we wanted an option to
notify us when it became available for streaming. We threw together a basic Sinatra app and browser
extension to solve the problem. It worked well enough for our own use, but we didn't want to deal
with support or making sure user data was absolutely secure so we never released it to the general
public.

[nin]: https://github.com/swanson/netflix-it-now
---

###[Lanyon][lan] - Status: <span style="color: goldenrod;">shelved</span>  
I wanted a way to write posts for my Github Pages-powered Jekyll blog when I wasn't on my main
machine. The idea was to add a single page to my blog to write a post and then, using Javascript to 
make calls to the Github API, generate a new commit and push it to my repository. I got it working
but I hasn't happy with the authentication options: Github supports OAuth, but not a client-side
flow. So this project is shelved until that gets sorted out.

[lan]: https://github.com/swanson/lanyon
---

###[Abe][abe] - Status: <span style="color: green;">shipped</span>  
"Abraham Lincoln? Isn't he the President who..." -- A stupid one-page app based on a long-running 
inside joke. Pointless, but fun to make.

[abe]: http://abe.heroku.com/
---

###[CloutBout][cb] - Status: <span style="color: green;">demoed</span>  
A fantasy football for Twitter app I built with some friends at the SocialDevCamp Chicago hackathon.
The idea is to apply fantasy sports-style scoring to Twitter: so you get points for tweeting, hash
tagging, posting links, etc. I think it's a neat idea and we won a prize, but no one on the team
had the time or desire to take it anywhere past the hackathon.

[cb]: https://github.com/swanson/cloutbout
---

###[Dasher][dash] - Status: <span style="color: goldenrod;">ongoing</span>  
I've been working on and off with two coworkers to build a company dashboard with information
that engineers might care about -- data like upcoming developer events, build server status, and
a diagram of what projects everyone is working on.

[dash]: http://www.sep.com
---

###[Morale][morale] - Status: <span style="color: green;">shipped</span>
By far, my most successful side project of the year. I built a Rails app to track developer
moods over the course of a project with a simple daily email. I wrote about it in more detail
[here][he]. It's been used at work for around two months across three projects and feedback has been
positive. I am presenting the app to the whole company at a status meeting in January. I'd love
for it to be used company-wide and I think it will be a big help in gauging employee satisfaction.

[he]: /blog/2011/10/13/intrapreneurship-applying-the-lean-startup-to-internal-tools.html
[morale]: http://www.sep.com
---

##Blog

I made a bigger effort to add content to my blog this year. I wrote 21 blog posts and posted 
reviews for eight books.

I've been floored with the [success][hn-points] of some of my posts on Hacker News -- it is 
really exciting to see your blog make the front page and to read all the comments from other 
developers. The coolest event for me was when someone else submitted a post I had written and it 
hit the #1 spot for a few hours; it was an awesome feeling to have someone else like my post enough 
to want to share it with others.

[hn-points]: http://www.hnsearch.com/search#request/all&q=swanson.github.com

Between the seven posts that got over 15 points on HN and a bunch of long-tail searches for
`github API` and `startup weekend tips`, my blog traffic blew past any expectations I 
had.

![](/static/analytics-2011.png)

Not bad for a random developer in Indiana!

---

#Closing Thoughts on 2011
It's hard to see your own improvement -- your day-to-day performance doesn't seem to be any 
different. On the internet, it seems like everyone is doing cool stuff all the time and you are 
falling behind. You aren't alone, I get this feeling all the time; we are always our own toughest
critic and usually the last ones to praise ourselves.

Just remember that it only takes 365 people (out of the millions of developers) with a single neat 
project to fill the pages of Reddit and HN for a year. Keep that in mind the next time you feel bad 
about "never producing anything".

Take an hour this week to look back at your own year's accomplishments and I think you'll find that 
you've done and learned more than you thought.

Have a safe and happy New Year.