---
layout: post
title: "The Leprechauns of Software Engineering"
categories:
- writeup
favorite: true
---

![]({{site.url}}/static/leprechauns.png)  
[The Leprechauns of Software Engineering: How folklore turns into fact and what to do about it][link]   
Laurent Bossavit  
    
---

**What's the point?**  
Citing research studies can be a powerful argument. But it can also be a fallacy if we blindly place trust in research without evaluating both the methods of experimentation, as well as the actual findings.

This book aims to show readers how to evaluate academic research (specifically in the context of software engineering) by going beyond the abstract, comparing the experimental setup to their own context, and vetting cited sources.

**How was it?**  
The authors provides examples of how some "common wisdom" that is often cited as iron-clad and definitive is much more shaky than it is presented.

Take one example: the [cost of change curve][coc]. Traditional, this is presented as a graph that plots the "cost of change" over the stages of a project (requirements, design, coding, production, etc). The graph depicts a smoothly-sloping, exponential relationship &mdash; intended to highlight that the further along the development process, the more costly a change will be to make.

![]({{site.url}}/static/cost-of-change-graph.gif)

This graph looks very scientific and official. It is cited in early and well-known Agile software literature. But once you dig deeper, there are numerous problems with taking this graph at face value. 

Over time and across authors, the Y-axis morphs from measuring the cost to fix software (a bug) to the cost to change (a bug or new features?). The X-axis implies an equal time transition through the project phases (not realistic). The origin paper (Boehm 1976) is not clear on how data was collected or if measurement was consistent across all subjects.

Other topics that are also critically examined: the 10x productivity developer, the cone of uncertainty, and the "terrible" software process of Waterfall.

It is prudent to point out that the book is not saying that these ideas are incorrect, but rather that the "research" and "data" that is so often attached to these concepts is rather flimsy. The author calls on the software community to improve the bar for software research, not just throw it all away.

**Who should read it?**  
This book had been on my radar for a while, but I was compelled to read it after a series of process-related discussions had ended with "there are many research studies that prove this is right".

I think this book is a great resource for people interested in software team process &mdash; if for nothing else other than to remind people that nearly every project and team exists in it's own context and must be considered as such.

As an aside, I was glad to have read this book recently when I came across some less-than-satisfactory (to me) research which empirically claimed that ["refactoring does not improve code quality"][bogus]. A more detailed critic of this paper is left as an exercise to future readers.

[link]: https://leanpub.com/leprechauns
[coc]: http://www.agilemodeling.com/essays/costOfChange.htm
[bogus]: http://www.itworld.com/article/2891140/study-finds-that-refactoring-doesn-t-improve-code-quality.html
