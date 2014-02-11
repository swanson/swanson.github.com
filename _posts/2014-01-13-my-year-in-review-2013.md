---
layout: post
title: "My Year in Review: 2013"
categories:
- blog
date: 2014-02-10
---

I've done a yearly writeup for the past two years. I always struggle to
reflect and look back on what I've done, so writing this post is almost
therapeutic. It's the middle of February, but hey, better late than never.

# Work Projects

I started 2013 working on an embedded wireless lock system 
for a security company. I am hopelessly out of my comfort zone when it comes
to embedded C or hardware, so luckily I was mainly working on a Ruby web app
that ran on Linux on a microcontroller. You know those Linksys configuration
pages where you go to forward ports and stuff? Basically, I built that but for
technicians to setup wireless security systems.

It was a difficult project with a tight deadline, but it was neat to work on
a physical product that you can actually go buy in a store. The team was large
(around 15 developers at the peak) so there were struggles with planning and
coordinating, but overall, the team has pleasant to work with and came together
to get the product shipped.

I continued working with [Mike][m] on [MoraleApp][morale], building new features and doing
support for our [slowly] expanding base of users. One of the biggest
issues we have is answering the question of "what do I do with this data?" so
I spent some time writing some general "tips" and making them show up when a
team isn't doing great.

[m]: https://twitter.com/mumau
[morale]: https://www.moraleapp.com/

Mike and I both struggled with momentum on MoraleApp; we both have other duties so
it makes it tough to try to build a product at the same time. And when we did
manage to get a bit of bandwidth, we struggled with figuring out what to do next.
MoraleApp has been our own little crash course in product development.

I sound down on MoraleApp, but it is still chugging along with
minimal support needed. We've signed up over 100 companies and have logged over
70,000 daily moods &mdash; still pretty amazing to me since I built Version 1 in
one weekend.

I filled the rest of my year was odds and ends: helping upgrade a legacy
Rails app (on a weird stack of jRuby and IIS...), doing a few estimates for
mobile work, and a full fledged story mapping and discovery session for a web
app.

The summer months brought an influx of new employees &mdash; both new hires
fresh out of school and this year's crop of interns. It's great to see some
new faces, but sometimes hard to find projects for everyone to work on. I
noticed a couple new engineers had been left to fend for themselves doing
maintenance on an internal tool. Several years ago, the company built an app
called "Corporate Resume" that tracks all the projects SEP has done, what
technologies were used, who worked on them, etc; it comes in handy for
marketing and business development.

I ended up joining two newbies and we gutted the aging project; bringing in
some newer technologies and making sure that the new app would not easily fall
into disrepair. The old project had lots of baggage so we re-branded the project
as "Chops" &mdash; a tool for tracking the development chops of the company.

I think the jury is still out on adoption of the tool among the engineers, but 
the project was fun and a great way for me to introduce SEP engineering culture
to a pair of bright, new developers.

As fall rolled around, I finally found some billable work &mdash; building an
Android app for a local credit union. It had been almost 2 years since I last
did Android, but I was excited to dive back in &mdash; especially after seeing the
improvements to the developer ecosystem (mainly testing, yah!).

This is (the project is still ongoing) my first project as a Tech Lead 
&mdash; meaning that I was in charge of picking tools for the team, doing 
system architecture type stuff, and generally trying to help the team build 
awesome software. It's been a challenge to try to clear paths and build
scaffolding so that the other team members can be more productive, but it's been
fun to be able to have a large say in how our code base grows.

I'm really pleased with our current testing setup. We've got a full suite of
unit tests and then a nifty setup where we can run automated tests on seven
different devices on every commit. Compared to my last Android project (with
two full time testers running hundred page test plans), our approach is miles
ahead and has made working with Android much more enjoyable.

# Side Projects

### Stringer, an anti-social RSS reader
In March, I wrote my own RSS reader with Ruby and Sinatra because Google Reader
was shutting down. I didn't like any of the other solutions and wanted something
I could just spin up on Heroku; apparently so did a bunch of other people. With
over two thousand stars on Github, contributions from over 60 people, and being
translated to 15 languages, Stringer has been my most successful open source
project to date.

![](https://github.com/swanson/stringer/raw/master/screenshots/instructions.png)

[Stringer][str] is mostly in maintenance mode now. It does what I want it to and
works for most people's needs. I brought on a contributer to help maintain the
project and I still get a few issues/pull requests a month.

[str]: https://github.com/swanson/stringer

### Capuchin, Jekyll for Mailchimp newsletters
I wrote a ton of newsletters this year (more on that later) and as much as I
love Mailchimp, I really hate their WYSIWYG editor. I write in Markdown, dammit!
None of this rich text crap!

I wrote a [simple gem][cap] that mimics Jekyll (my blogging tool of choice) and allows
me to write content in Markdown and then creates the newsletter via the Mailchimp
API. It is especially helpful for text-heavy posts.

[cap]: https://github.com/swanson/capuchin

This was my first gem that I published on Rubygems.org and it was a good learning 
experience. I hadn't built many command line tools before so it was interesting 
to dive into the source code of other tools and see how they do things.

### Gem License Checker, insert Gemfile => output list of license
[Gem License Checker][gem] was kind of a dud. I built it during one of the SEP Startup 
Weekend events because we had a very small need for it on a work project. Ultimately, it
wasn't super useful and didn't get much use. Oh well.

![](http://i.imgur.com/EqHftgT.png)

[gem]: https://github.com/swanson/gem-license-checker

### Triplico, share YouTube videos with small groups
[Triplico][tri] was *definitely* a dud. I got a case of the weekend hack madness
and decided to solve the very important problem of how to share YouTube videos
with my siblings. I had been pasting lots of videos into IM conversations
and text messages and thought "THEY HAS TO BE A BETTER WAY!". And then I started
thinking about how arbitrary limitations affect product design (140 characters
on Twitter, 6 seconds on Vine, etc) so I built an app that lets you share videos,
but only with two other people.

![](https://raw.github.com/swanson/triplico/master/app/public/img/demo.png)

[tri]: https://github.com/swanson/triplico

This was a big flop, I didn't even use it once after it was built!

### Lagom, a blog theme with just the right amount of style
I extracted [the theme][lag] from my Jekyll blog (the one you are reading right now),
gave it a cool Swedish name, and put it on [jekyllthemes.org][jt] for others to use.

![](http://i.imgur.com/CT2Xvug.png)

[lag]: https://github.com/swanson/lagom
[jt]: http://jekyllthemes.org/

It's gotten around 50 stars and 70 forks and I've seen a few blogs in the wild
that are using it, so that's cool. I'm happy to give back after ripping off of
Tom Preston-Werner's theme for so long. I really wish Jekyll had a better standard
for themes, I'd probably release a few more if it was a bit easier.

### Greyhouse Online Store
I helped build an [online store][gh] for a coffee shop at my alma mater with a [friend][ks]. It
originally started as a Rails rescue project, but we ended up just using Shopify
with a bunch of custom Liquid templates.

[ks]: https://twitter.com/kyleashipley
[gh]: http://greyhousecoffee.com/

### Freedom Registry
Another small freelance project I helped out with; this one involved building out
some user profile features in a Rails app that helps 
[anti-human trafficking organizations share resources][fr]. It was interesting working in a 
remote, asynchronous style (I worked in the evenings, the rest of the team during the day).

[fr]: http://freedomcollaborative.org/

# Writing

Things kept chugging along on this blog. I wrote 37 posts in 2013, more than 2011
and 2012 combined. I wrote almost weekly from May to September. Page views were up
33% over last year.

![2013 Blog Stats]({{site.url}}/static/2013-blog-stats.png)

The top three posts in terms of views:

* [Worst. Bug. Ever.](http://mdswanson.com/blog/2013/01/20/worst-bug-ever.html) (44,624)
* [Do things, write about it](http://mdswanson.com/blog/2013/08/11/write-things-tell-people.html) (35,822)
* [How not to validate email addresses](http://mdswanson.com/blog/2013/10/14/how-not-to-validate-email-addresses.html) (13,779)

My three favorite posts I wrote:

* [Do things, write about it](http://mdswanson.com/blog/2013/08/11/write-things-tell-people.html)
* [The 30 Second Standup](http://mdswanson.com/blog/2013/05/29/the-30-second-standup.html)
* [Expanding and Contracting](http://mdswanson.com/blog/2013/05/02/expanding-contracting.html)

I started writing two newsletters in 2013: a monthly newsletter under the [Indy Hackers][ih]
branding and a (now-defunct) weekly newsletter about building awesome software.

[ih]: http://indyhackers.org/

[Hacks && Happenings][hh] is a monthly newsletter that features projects, meetups, and blog
posts related to developers in Indiana. I co-run this with my good buddy [Miles][miles]; he
helps me collect links and I do the monthly writeup. That list is up to 130 readers,
with a 65% open-rate and is going strong.

[miles]:https://twitter.com/mileszs

[hh]: http://us6.campaign-archive2.com/home/?u=244b5370d41b5cf4146ec517c&id=b51f983563

[Building Awesome Software][bas] was a weekly newsletter that I started in Septemeber. I wrote
9 issues on software topics that were interesting to me; a bit of UX, a bit of testing,
a bit of ranting. I was heavily inspired by [Nick Diasboto's weekly newsletter][nd], but 
ultimately I ran out of steam (and topics) and haven't posted to the list since November.
It was an interesting experience in trying to build an audience from zero (I got it up
to 150 pretty quickly).

[nd]: http://nickd.org/
[bas]: http://us5.campaign-archive1.com/home/?u=42197992359c6140b24ce0046&id=ee7084f978

I really like writing, but my desire to write comes in spurts (part of the reason why this
yearly writeup is 2 months late...) so it's been a bit of a personal quest to figure out
how to best harness my enthusiasm.

# Random Highlights

I started a [table tennis league][ttl] for local tech companies. So far, we've played two other
companies in a home-and-home series and are 1-1 overall. Table tennis has become my go-to
"I need a quick break" activity and it's been funny to see people at work start getting
serious and buying their own gear.

[ttl]: http://itttl.org/

I attended [SCNA][sc] for the second year in a row; it was a great event again. This time I got
to go on the company dime and do a bit of business development (which for developers just
means talking to other developers). We ended up taking a small group up so there was plenty of 
interesting discussions and a built-in social group to hang out with. I high-fived 
[Gary Bernhardt][grb] and [Katrina Owen][ko], so my life is only going to go downhill from here.

[sc]: http://scna.softwarecraftsmanship.org/
[grb]: https://twitter.com/garybernhardt
[ko]: https://twitter.com/kytrinyx

I deleted my [dormant] Facebook account and started sending a quarterly email update to the
handful of people I still wanted to keep in touch with. I really like writing emails apparently.

I got promoted over the summer; I was very fortunate to have a wide variety of projects in my 
time at SEP thus far and to learn from some great people. My career has followed a simple 
loop: seek out opportunities, demonstrate competence, reflect, improve, and be rewarded with 
more opportunities.

# New year, new ideas

The most interesting new ideas I came across in the past year &mdash; and ones I hope
to incorporate more into my life:

* [Punished by Rewards][pbr]: Rewards harm intrinsic motivation, our workplace culture
is full of shallow "reward schemes" that ultimately fail when external rewards are removed. Finding 
out why people are not intrinsically motivated is way harder, but much better in the long run.

[pbr]: http://www.alfiekohn.org/books/pbr.htm

* [So Good They Can't Ignore You][sg]: Stop feeling bad because you haven't "found your passion". Focus
on getting better and great work will follow. Satisfaction with work comes from autonomy and skill,
not free lunches and beanbag chairs.

[sg]: http://calnewport.com/books/so-good/

* [System thinking over goals][sys]: Setting goals is for suckers. They make you feel bad until you
hit the goal (or fail and feel worse) and then you lose purpose. After accidentally using systems
thinking in 2011 and getting away from it in 2012, I am fully back on board for systems in 2013.

[sys]: http://www.dilbert.com/blog/entry/goals_vs_systems/

* [Jobs-to-be-Done][jtbd]: The "milkshake phenomenon" is incredibly interesting to me. Probably because it's
a classic "Turns out..." reveal, but I think this concept has legs. Not sure how, but I'd like to
try out some of the approaches in JTBD this year.

[jtbd]: http://jobstobedone.org/

* Inspiration from outside software: two non-technical disciplines really captured my
attention. The first was a [great mini-series][bl] about the process of designing buildings and how 
they grow and change through usage. The second was a talk about [hand tool woodworking][ww] (okay, 
this was from 2014 so I'm cheating...). There was something so visceral and tangible about physical
buildings and furniture that interests me. Not sure where that interest might go, but excited to see.

[ww]: http://www.youtube.com/watch?v=ShEez0JkOFw
[bl]: http://mdswanson.com/blog/2013/11/11/how-buildings-learn-and-why-software-is-no-different.html

# Closing Thoughts

Do things that [increase your luck surface area][lsa]. But don't take yourself [too seriously][corgi].

[lsa]: http://www.codusoperandi.com/posts/increasing-your-luck-surface-area
[corgi]: http://i.imgur.com/7OxwL.gif
