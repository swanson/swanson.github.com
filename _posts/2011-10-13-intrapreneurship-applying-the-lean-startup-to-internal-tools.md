---
layout: post
title: "Intrapreneurship: Applying the Lean Startup to building internal tools"
categories:
- blog
---

I recently finished reading Eric Ries' ["The Lean Startup"][ls] and one section really
stuck out. Early on in the book, Ries tells a story about a manager at a large
corporation running a division with the same entrepreneurial principles as a small startup.

[ls]: http://theleanstartup.com/book

The section is short - just a few pages - but it really resonated with me. Maybe it's because
I wanted to apply what I just read to my everyday work. Or because I'm a 
<strike>huge wuss</strike> risk-adverse person and this approach is 'safer' than quitting my
job and moving to San Francisco. Probably a combination of both.

The four word summary of the Lean Startup concept is: [Build-Measure-Learn][bml] (repeat).

[bml]: http://lean.st/principles/build-measure-learn

Build out a minimum viable product and get it in front of users. Collect some non-vanity metrics
and get user feedback. Take that feedback, analyze and dissect it and then iterate on your first
version.

Still with me?

On a previous project, our PM introduced a concept that I call the Mood Grid. The idea was to
have each developer rate their mood daily by coloring in a square in a grid with a Green,
Yellow, or Red sharpie. It was simple, anonymous, and a good way to gauge the overall mood of a 
team.

Well, it ended up being a flop. After the first few days, people stopped using it - either due
to apathy or forgetfulness. I personally only remembered to do it if I was having a bad day. We
tried to start it up again a few times and it never really stuck for more than a week.

My hypothesis was that if there was a low-friction, "push" version of this system, it would be more 
effective and people would stick with it. Instead of relying on people to remember to go over to 
the paper grid, find a sharpie and mark off their square (programmers are lazy, that's a lot of 
work!), the app would send an email at a set time every day and you would rate your mood by
clicking a link. 

There would be no accounts (who really wants to remember yet another password?) and the data would
be anonymous; the idea reminded me of the [37signals Smiley app](http://smiley.37signals.com/) and I
felt like a good fit for trying out the Build-Measure-Learn feedback loop.

I spent a few hours over a weekend coding and had my MVP up and running. You could add members 
to a team and they would get an email every day with three links - for indicating if your mood was 
'Good', 'Meh', or 'Bad'. Each day has a row on the page with a colored square representing the 
submitted moods.

It was an exercise in restraint. I left out the fancy cross-team dashboard, the infinite scrolling
history, the rolling window statistics. Hell, you couldn't even create a new team, I had to do it
in the database manually. I dropped in [Bootstrap][boot] while watching football on Sunday, 
pushed it to [Heroku][heroku], and by Monday I had 7 people across two different teams testing 
it out.

[boot]: http://twitter.github.com/bootstrap/
[heroku]: http://www.heroku.com/

<a href="/static/morale-app.png"><image src="/static/morale-app-thumb.png" /></a>

Every week I'd walk over and solicit feedback from my 'customers' about the app. I'd record any 
feature requests or bugs as Issues on Github. When I was bored in the evenings, I could grab a 
task, work on it, and push it out to be used the next day.

I have a habit of not finishing projects, but having people use something I made is doing wonders
for my motivation. And the quick development cycles let me pick up where I left off whenever I 
feel like working on it.

There was no big effort to gather requirements and if no one liked the app, I could either change
it (pivot!) or just throw it out all together. So far, it's going great!

The plan is to continue growing the user base, adding features only when needed (last week I added 
two week rolling averages - I waited because I didn't know if anyone was even going to use this
thing for two weeks) and gathering feedback along the way. 

According to Ries, it's time to experiment with my engine of growth so I'll be spending some time 
figuring out how to spread the word and increase adoption within the other teams at SEP.