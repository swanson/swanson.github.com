---
layout: post
title: My take on interviewing and the hiring process
categories:
- blog
tags:
- practices
---

There seem to be few topics that illicit a stronger reaction from developers than
how to interview and hire programmers. Everyone seems to have their own idea of the best way to
hire - [algorithm puzzles][algo], [fizzbuzz][fb], [Github repos][gh], [pair programming][pp], [four week
trial runs][trial], [marathon on-site interviews][goog], the list goes on and on.

[algo]: http://projecteuler.net/
[fb]: http://www.codinghorror.com/blog/2007/02/why-cant-programmers-program.html
[gh]: http://code.dblock.org/github-is-your-new-resume
[pp]: http://www.markhneedham.com/blog/2010/02/25/pair-programming-in-interviews/
[goog]: http://www.crsr.net/Notes/Google.html
[trial]: http://www.microsoft.com/business/en-us/resources/management/recruiting-staffing/5-tips-for-hiring-your-first-employee.aspx

Whatever methodology you subscribe to, one of the major questions that needs to be answered
is: 

Can the candidate program?
---
People outside the industry will probably think this is a dumb question. Why would
someone apply for a job as a programmer if they can't program? 

But it is a [well-established fact][reg] that this simply isn't the case. 

[reg]: http://weblog.raganwald.com/2007/01/dont-overthink-fizzbuzz.html

It is irresponsible for a company to hire someone without knowing if they can
code.

So how do you answer this question? Here are three options that I like:

--------

* Look at any available public code (Github/BitBucket/Google Code, side projects, open source)

This would be my preferred method because it is asynchronous. The candidate doesn't have to do
anything special for you and the interviewer can browse through the code when it is
convenient for them.

Having [side projects][side] or working on open source is a good indicator that someone is
passionate about their craft and has basic coding skills (and probably has the means to 
improve them). 

[side]: http://www.meetup.com/Indianapolis-Developers-with-Side-Projects/

Please note that I said it is a __good indicator__, NOT the only indicator. Lots
of excellent programmers aren't on Github and don't have open source code - there is no
one "right way" to being a developer, each person has their [own path][path].

[path]: http://ofps.oreilly.com/titles/9780596518387/walking_the_long_road.html

Contrarian Carl says:
>In my past job I worked on a proprietary, closed source project and I signed a NDA! I can't show
>you any of it.

or...

>I'm not a single 20-something that programs in my free time. I have a family and other hobbies,
>and I want to decompress and relax in the evening, not write more code.

No problem, those are completely valid reasons. Move on to the next option.

-------

* Have them program something during an interview. 

This part is deceptively tricky. You don't want to use one of those 
[Easy-Once-You-Know-The-Trick][trick] 
algorithm puzzles and you don't want to make the candidate feel like they are being treated
as free labor.

[trick]: http://www.techinterviews.com/programming-puzzles-riddles-and-interview-problems

Everyone has their favorite, special algorithm for 
[generating prime numbers using bitwise operators][sieve]. 
And it would be neat to see if a candidate could jump right in and fix a low priority bug or 
two in your SaaS app. But I know, personally, that both of those extremes are very 
off-putting to me as potential employee.

[sieve]: http://www.haskell.org/haskellwiki/Prime_numbers#Bitwise_prime_sieve_with_Template_Haskell

I recommend coming up with your own simple, interview-only application. The problem domain
should be small enough that a candidate can wrap your head around it in a few minutes with a minimal
number of questions. You should also have someone at your company actually code the app
and preferably have that person assisting with the interview. 

Let the candidate use any
resources they want and give them a choice of environment and tools if possible. Keep the test
under one hour.

Here is a sample: garage sale finder. You need a database populated
with sale locations, times, and descriptions (scrap [CraigsList][cl] to seed). Stand up a 
web service/API with a couple methods (get all sales, get closest N sales to a location, 
get sale details). You can write a web, mobile, or even desktop front end. You could whip
up a basic version in a few hours over a weekend without much difficulty.

[cl]: http://sfbay.craigslist.org/gms/

The beauty of this approach is that you can swap in and out whichever component you want the
candidate to write. 

Hiring a web developer? Keep your markup files and data models and
have them write a controller. Hiring a mobile developer? Keep the backend and have them write
a simple client that runs on the simulator.

But remember, these tasks need to be kept small and pretty basic. Have the potential web
dev build out the CRUD actions; if they breeze through that, have them implement a custom
action or add some validation logic. The mobile client should be something like a displaying
list of sales from the API in a list view, with the follow-up being a one-level
drill down to get the details or adding in a Google map.

The goal is to find out if the candidate can code the basics that might be required for
the job. If the candidate is struggling with this task and can't demonstrate competency
in another way, it should be a huge red flag.

Contrarian Carl says:
>I'm no good under pressure. I like to think through code before I write it; it takes me
>a few hours/days to get productive in a new code base.

or...

>That sounds like it's going to take half a day. You expect me to take paid time off from
>my current job to drive/fly to your office just for an interview?

Again, those are reasonable points - though I personally have a bit of the issue with
the second one. Next option.

------

* Give them a 'homework' project and a fair deadline.

You can reuse your in-house project for this too. Except instead of having the candidate
tackle an hour chunk, you probably want to have them do the equivalent of 2-3 chunks. The
reason is two-fold: the candidate has more time to work and you don't have visibility over
the work being done.

With the smaller, in-person task, you can clearly tell if a candidate is struggling to get by
or blazing through with ease. With a homework project, all you get is the final output. 

You
want to avoid the case were someone spends the whole week toiling over a simple task and
feigns proficiency (or, more nefariously, has someone else do the project). Adding a bit
more difficulty to the task should help cut down on this - but keep in mind that if you set
unrealistic expectations, you will turn off many candidates.

Contrarian Carl says:
>You expect me to spend two evenings working on some stupid toy project?

or...

>That's so many hoops to jump through. I've got to do this whole project that I don't even
>care about with the chance I won't even get the job. And then figure out a way for you
>to run in on your machine. And you'll probably tell me that it's not exactly what you 
>wanted.

If you get to this stage, you have given a candidate three options to demonstrate the core
ability required for the job they are seeking. 

If they are still pushing back at this point,
it's a "No Hire". Sorry, but be reasonable - a company is making an investment by hiring you and you
will have to make some effort to get a job. If you really want the position, this should be
a non-issue.

Any of the three options should be sufficient to prove that a given programmer can, in fact,
write a program. 

Of course, this should not be your entire hiring process. Company/team fit,
salary expectations, actual expertise and desire for improvement and continual learning all
need to be taken into consideration.

This isn't a silver bullet for screening candidates. But I think it sure beats solving a puzzle
that involves tail recursion or standing at a whiteboard trying to remember if the syntax is
`char[] c` or `char c[]` for my string-reversing method.
