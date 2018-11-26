---
layout: post
title: "Creative Selection: How Apple builds products with demos, taste, and leverage"
categories:
- blog
tags:
- writeup
---

[Creative Selection ("Inside Apple's Design Process During the Golden Age of Steve Jobs")][book] is a first-hand account of Ken Kocienda's project history at Apple. Kocienda -- a software engineer -- describes his experiences building Safari, WebKit, and the first touch keyboard for the original iPhone and finds the commonalities in process that lead to success.

Don't be mislead by the mention of "design process" in the book's subtitle. This is not about [inspirational German appliances][braun] or the ['courage'][courage] to remove a headphone jack. The book is about the *product development cycle* at Apple, told from a technical perspective.

# Key Takeaways

## Demo driven development
It is clear that, even across teams and products, demos trumped everything when it came to product decisions at Apple. There was a hierarchy of decision makers and you had to satisfy each one to move up the ladder. First, you demo to other engineers on your team, get feedback, and iterate. Next, you demo to a product manager, get feedback, and iterate. Only then would you get an opportunity to demo to the final authority: Steve Jobs.

There was a heavy emphasis on dogfooding the product and prototyping in code. Kocienda describes an entire day of 'derby competitions' to quickly prototype tons of competing options.

## Taste over data-driven
To be successful at Apple, you needed taste. Kocienda defines having taste as "developing a refined sense of judgment and finding the balance that produces a pleasing and integrated whole".

Taste can also be thought of as having the self-confidence to form opinions with your gut than you can justify with your head. You can build that confidence by studying great work. You have to [carry the water][water] to earn the right to have an opinion.

Contrast this approach with Google, who would A/B test twenty shades of blue to find the best converting hue. They have optimized for finding the local maximum -- but that doesn't lead to a "pleasing and integrated whole".

As Kocienda puts it, "When it comes to choosing a color, we picked one. We used our good taste -- and our knowledge of how to make software accessible... -- and we moved on." Commit, but be open to change.

## Lessons from Darwin
The common principles across high-performing teams at Apple are an evolutionary ode to Charles Darwin.

* Start small, with some inspiration
* Make demos
* Mix in feedback
* Seek guidance from smart colleagues
* Blend in variations
* Hone the vision
* Follow the first demo with more and more demos
* Improve in incremental steps
* Converge on better and better versions

## The 10x Engineer
This concept has been turned into a mix of a [trope][ten1] and a [meme][ten2] by the software community, but Kocienda shares an ancedote about an engineer who made more progress on a tricky problem in his first two days than the rest of the team had made in six weeks. It wasn't that this mythical engineer was ten times more productive, but rather that he was extremely good at evaluating many options quickly and picking the one that seemed most likely to bear fruit. This judgement, combined with ruthlessly cutting scope and taking shortcuts, allowed him to produce a demo that was convincing enough to explore an idea and move the product forward.

It still took many more months for the full implementation to get finished. And it was a slog. But the approach of getting something demoable and working crushed have nothing to show until the final reveal. The first demo created huge **leverage**: with a small amount of work, the results got executives on board, budgets allocated, and gave the team a baseline to iterate on.

# Implications at a software consultancy
As with all books, one should map the lessons and experiences of the author into their own context.

I work at a software consultancy. There is a tension in consulting to produce value quickly. We want the "time to value" to be faster than our billing cycle. If the client is paying invoices but not seeing any value, that's bad.

A consulting timeline can be volatile. We don't often have the luxury of spending months and months to go extremely deep for one feature. A project (or our involvement with a project) can end suddenly, so it is wise to be able to wrap up a piece of work quickly.

None of this is meant to discount the process at Apple. Rather, it is to highlight that trying to copy the process wholesale will not produce identical results. We need to be more aware of the timelines and scale.

Could we take the whole team and prototype new interface components for weeks, culminating with multiple rounds of iterations and a bracket to let the best option win? Probably not. But could we spend a couple of hours trying out two or three options? Probably.

We need to treat projects like the 10x engineer: hitting the ground running, getting some small piece of software working, and then iterating.

Recently, my team used a third-party service to add full-text search to a client project. It took two days of work to get a result that was pretty good. Previous projects have allocated weeks or months for similar functionality. We should strive for that leverage -- firms that deliver value in days (not months) eat the lunch of their competitors.

The most direct and actionable takeaway was that we should demo in-progress work more often. At Apple, engineers test their own software and demo to their co-workers constantly. I've seen client projects where demos happened infrequently (a handful of times a year) and only once work was completed. Even the 'standard' two-week cadence is starting to feel too slow.

I'm now trying as hard as I can to demo work at every daily standup meeting, even if I have to demo code from my local development environment. If I can't demo, I show a screenshot or animated GIF.

Show, don't tell. I could talk about what I'm working on...or I could show where I'm at. Ruthlessly demoing allows for tighter feedback loops and makes knowledge work more concrete. The customer can visually see what we're working on and the progress we're making.

Demos, unlike status reports or charts, don't lie. An engineer can give the same vague update every day for a week and slide by, but not having anything to show for three days in a row sticks out like a sore thumb.

The biggest difference between the process at product companies and the realities of consulting is the mindset: innovation vs solid construction.

At Apple, Kocienda was truly innovating. There had never been a capable touchscreen keyboard before. There was no open source library to drop in or blog tutorial to follow. There were no competitors to draw inspiration from. Very little of the work at consulting firms is true innovation (despite what all the proposals and service offering pages say).

Our work is more akin to solid construction. Our clients are businesses who value consistency, reliability, and no bad surprises. Nearly all of their technical problems have well-known solutions. We can delight them and find places for novel ideas, but at the end of the day, it's all about delivery.

Frequent demos, developing taste, and using technical leverage are great tools for delivering working software in a predictable way.

[book]: https://www.amazon.com/dp/B079DVT6VP
[braun]: https://www.cultofmac.com/188753/the-braun-products-that-inspired-apples-iconic-designs-gallery/
[courage]: https://www.theverge.com/2016/9/7/12838024/apple-iphone-7-plus-headphone-jack-removal-courage
[water]: https://soundcloud.com/seekingwisdom/sw-classics-carry-the-water
[ten1]: https://thenewstack.io/10x-programmer-just-jerk/
[ten2]: https://twitter.com/search?q=10x%20engineer&src=typd
