---
layout: post
title: "The trouble with timestamps"
categories:
- blog
tags:
- delightful_products
---

*This tweet was sent about 2 hours ago.*

*Your order shipped about a week ago.*

*This file was last modified about 4 years ago.*

The pretty "time ago" format has become popular on the web.

And it's good...until it isn't.

There are certain types of data where the pretty format is fine. It originally came from social networks, where the content was time-sensitive. When people talk about something posted on Facebook, they usually say something like "Did you see that picture Bill put on Facebook the other day?". You would get funny looks if you said "Did you see that picture Bill posted on 2018-10-21T01:46:06+00:00?" 

The timestamps matched the real-world format.

But what about `git` commits? What if I needed to see exactly when a change was introduced into my code? The bug report was entered on September 04, have we fixed it already? We deployed a build on September 01 at 2:30pm, what other changes also went out?

!["GitHub time ago"](http://i.imgur.com/Iz7yIMC.png)

A month ago doesn't really tell me a whole lot in this case.

!["GitHub full timestamp on hover"](http://i.imgur.com/HqkrfWq.png)

(ProTip&trade;: you can hover over dates on GitHub to see the full timestamp)

---

Think about the context &mdash; most people don't refer to status updates based on specific times or dates. But you'll want to know the exact date and time when your bank sent a bill payment if you are on the phone with a collection agency.

What are the common use-cases for timestamped data in your app? Do users want a rough estimate or an exact value? Is the data short-lived or an important reference point?

The "time ago" style is prettier, but it isn't always the most functional.