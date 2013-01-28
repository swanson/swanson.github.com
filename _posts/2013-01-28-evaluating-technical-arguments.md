---
layout: post
title: "Evaluating Technical Arguments"
categories:
- blog
---

Every day Hacker News, Reddit, and Twitter ebb and flow with dozens of new articles about
technical topics. Frequently, a few posts turn into a full on debate.

One influential blogger says, unconditionally, to do something. We agree! This must be the one 
true way!

But then another author comes in with a takedown. Never do that, they say, EVER! We agree! That 
other way must be wrong!

Repeat ad nauseam.

In this sea of opinions, our views can be swayed back and forth as we try to latch onto one
of the competing arguments. Judging these technical arguments is challenging, especially 
during the *formative years* (years 0 to 3) of being a professional developer.

Whether in person, or online, different parties &mdash; all of which seem smarter and more 
experienced than us &mdash; are shouting conflicting ideas about topics that we are still
trying to understand and master ourselves.

How can we effectively evaluate these technical arguments?

---

##Do I even have this problem?
How do you best design an API? Should you build a [hypermedia API][yes]? Or [not][no]? 
Is [REST or HATEOAS][rorh] the way to go? Should it speak [XML][xml]? [JSON][json]? 
[Siren][siren]? [HAL][hal]? [Protocol buffers][pb]?

You know, what? I've never built an API for mass consumption and I don't see myself building one 
in the immediate future. It doesn't matter what I pick.

But the heavy hitters are all blogging about it! There's mystery, excitement, drama!!

There is something to be said about being informed and knowing your options, but it is really
difficult to honestly evaluate options when you haven't experienced the problems firsthand.

Instead, prefer **lazy evaluation**. Figure out what flavor of OAuth is best for your project when
you actually have a project that needs it. You will never know less about the problems you will 
run into than right now, so delay any decisions as long as possible.

[yes]: http://blog.stateless.co/post/38378679843/hypermedia-apis-on-rails-why-dhh-should-give-a-fk
[no]: http://37signals.com/svn/posts/3373-getting-hyper-about-hypermedia-apis
[rorh]: http://timelessrepo.com/haters-gonna-hateoas
[xml]: http://scripting.com/2006/12/20.html#godBlessTheReinventers
[json]: http://timelessrepo.com/json-isnt-a-javascript-subset
[siren]: https://github.com/kevinswiber/siren
[hal]: http://stateless.co/hal_specification.html
[pb]: https://developers.google.com/protocol-buffers/docs/overview

##Where's the code?
Writing, especially persuasive writing, is a messy thing. We are unable to separate emotion 
from logic in the heat of an argument. 

When we debate something on an abstract level, any idea can seem good, but what happens when the 
code hits the editor?

Does the author provide real-world examples? Benchmarks that show the purported improvements?
Retrospective thoughts after using a technique several times?

Take the [recent][1] [Rails][2] [OOP][3] [debates][4], for example. It is one thing to write
paragraph after paragraph about how DCI makes more sense than MVC. But where is the code? Most 
of the posts barely scrape the surface of showing what working in a large production system using 
DCI is like.

And it goes both ways. Arguments that DCI is overkill or just a fad are weakened without code
showing a better way to achieve the same results or sharing cases where a team tried DCI and
ultimately switched back to MVC.

A new pattern can make sense in the abstract, but not be fully fleshed out when it comes to a
concrete implementation. Do a **side-by-side comparison** of what actual code looks like using 
competing techniques. You should be able to instinctive tell which option you prefer.

A technical argument without code almost seems like an economist postulating about why the GDP
went down without using any supporting data. It seems absurd in other fields, why not ours?

[1]: http://blog.codeclimate.com/blog/2012/12/19/dci-concerns-and-readable-code/
[2]: http://37signals.com/svn/posts/3372-put-chubby-models-on-a-diet-with-concerns
[3]: http://saturnflyer.com/blog/jim/2012/12/18/chubby-models-are-still-fat-with-concerns-dci-focuses-on-how-things-work-together/
[4]: http://andrzejonsoftware.blogspot.com/2012/01/dci-and-rails-lessons-learnt.html

##Where is the author coming from?
Does the author work at a 5 person startup or a 50 person consulting shop or a 500 person 
corporation? Where do you work?

Do you work with a small team of expert developers? A mix of new hires, journeymen, and
craftsman? Or are you a solo consultant? What kind of team does the author work on?

Are your project constraints driven by business concerns (profit trumps all)? Engineering
concerns (it has to scale)? External requirements (we must pass FDA audits)?

Is your project greenfield or brownfield? Can you rewrite v2 or do you have to build on the 
existing platform? Do you have high developer turn-over? What is the ratio of bug fixing 
to feature development?

Every project is different and each team has their own preferences. There is unlikely to be a 
solution that simultaneously fits the needs of a two person startup building a photo sharing app,
a consulting team writing code for an insulin pump, and a grizzled senior developer leading a 
team of new hires inside Microsoft.

This does not mean you should disregard any opinions from people in different situations than your
own. But you should be aware of how the author's perspective **aligns with your own**. 

Determining the perspective of the author is very difficult &mdash; especially if you aren't 
already familiar with the major players in a certain scene. People don't exactly come out and put
a disclaimer at the top of the post explaining their background and views.

---


It is okay to come to the conclusion that an argument is not right or wrong in the absolute sense,
but right or wrong for you and the context of your work.

Thinking through both sides of a heated argument and placing yourself into the perspective of the
author will help expand your understanding of the issue. This enables you to be better equipped 
to pick the best option for *you*.

Being able to reach this conclusion and knowing when it is okay to go against the conventional 
wisdom is a sign that you are growing as a developer.