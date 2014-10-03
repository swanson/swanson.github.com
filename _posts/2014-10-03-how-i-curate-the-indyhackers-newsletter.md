---
layout: post
title: "How I Curate the IndyHackers' Newsletter"
categories:
- blog
skip_related: true
---

For almost two years now I've written a [monthly newsletter for IndyHackers][subscribe]. With the help of [Miles Sterret][msz], we find a bunch of cool projects, events, and blog posts that happened in Indianapolis (or surrounding areas) over the past month. People seem to like it and we get to promote awesome local developers doing awesome stuff.

There are four basic sections in the [newsletter][archive]:

* Hacks (projects/apps built by local developers or small companies)
* Happenings (special events/new meetups/conferences within driving distance)
* Blogs (posts written by local developers - mostly new, sometimes old)
* Jobs (listings from the IndyHackers site)

I aim for two to four items per section per issue.

In the beginning, the process for finding the content of the monthly emails
was rather tedious. As Miles and I would come across interesting stuff, we
would add links to a shared [Gist][gist]. But typically that would only surface a few items and then I'd have to go digging. 

The first few months, I would spend several hours scrolling back through Twitter (I try to follow a wide range of local developers on my personal account), poking around GitHub, checking the blogs of any development shop I could think of, and generally just flailing around trying to find good stuff.

# Time for automation

It was taking too long for me to find the good content and Miles and I would often struck by a wave of panic when we realized we have nothing ready and the newsletter needed to be sent out the next day.

Over time, I started building small ways to help automate the curation process and I wanted to share what the current process is today. I've been able to get the time per issue down from 5-15 hours to 1-2 hours.

## Hacks

This section has the most variability. Some months, I see 4-5 cool things in passing and I'm all set. Other times, I have to trawl through GitHub and "spy" on what people are doing. Believe it or not, I used to search for "indiana" on GitHub, look at the results and then open like 50 tabs for each user and see if they had any new and interesting repositories.

Eventually, I built a [crude script that uses the GitHub API][lp] to do this for me. I search for all users with "Indiana" or "Indianapolis" in the Location on their profile and then look for non-forked repos created in the past 3 months. I shove that into a SQLite database and render a webpage with links and a description. Then, I can go through any promising leads and find the good stuff.

## Happenings

This is still a largely manual process. Fortunately, most people that are promoting local developer events find out about [IndyHackers][ih] and email us directly. This is incredibly helpful and pretty much a guarantee that we'll include your event in the newsletter. We always ask for a coupon or discount code for our readers so they feel special!

If we are low on special events, I use Meetup and search for tech meetings within 25 miles and look for any special guests or new meetups that are starting. If I'm still light on content, I'll look for any upcoming Startup Weekends or out-of-state (but still Midwest) conferences or hackathons.

## Blogs

This one is most difficult for me currently. Alex Conner was kind enough to build a ["planet" blog aggregator for Indy developers][pl] and that is my first stop. Unfortunately, it's not a complete listing and, frankly, there aren't that many people blogging at the moment.

I try really hard to feature a variety of bloggers &mdash; from different companies and different tech scenes &mdash; but I'd like to do better going forward. You might notice that the same group of bloggers appear quite frequently and that is partly due to me not knowing about any other blogs.

I'd love to find new voices for this section and get them added to the aggregator, so let me know who I'm missing.

## Jobs

This one is easy. I simply look at the [IndyHackers job board][ihj] and copy over the listings. No automation really necessary &mdash; but we could do a better job at getting companies to post there. It's free and highly targeted!

# Looking Ahead

Our list has grown 35% this year and we continue to have high engagement (70% open rate, 30% click-through). I'd love to be more intentional about finding new readers in 2015 and promoting the newsletter at meetups.

If you run an Indianapolis meetup and want to encourage members to subscribe, that would be awesome. We are always looking for cool projects, news, or events so don't be shy &mdash; even if it's self-promotion, we love sharing all the neat stuff people are working on.

[subscribe]: http://indyhackers.us6.list-manage.com/subscribe?u=244b5370d41b5cf4146ec517c&id=b51f983563
[msz]: https://twitter.com/mileszs
[gist]: https://gist.github.com/
[lp]: https://github.com/swanson/local-pulse
[pl]: https://github.com/codatory/indyhackers.org-planet
[ih]: http://indyhackers.org/
[ihj]: http://indyhackers.org/jobs
[archive]: http://indyhackers.org/newsletter/archive
