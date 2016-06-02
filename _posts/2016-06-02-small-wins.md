---
layout: post
title: "Small wins: printers and rubies and sales calls"
categories:
- blog
tags:
- product_dev
---

A quick update on some small wins and things I've learned while building [MoraleApp][morale] -- a no-hassle, team mood tracker.

# Printer friendly styles
Around 10 different customers [that took my survey][survey] mentioned wanting to print out reports from the app to put up on the wall or bring to a team meeting. Totally reasonable and the app looked terrible when printed (due to a configuration issue that caused the main CSS file to not load when printing).

Styling an app to be printer-friendly is straight-forward, you just need `media=print` in the link (or use `@media printer` media queries). The hardest thing is just remembering to do it! A few notes/findings:

* CSS `box-shadow`s don't work well, so I turned those off when printing
* Make sure to remove any unnecessary color to save people ink (i.e. switch gray text to black)
* Remove navbar/footers/extra application chrome that isn't needed
* The page that people wanted to print had several charts and I didn't want the printer to do a page break in the middle of them. The `page-break-inside` CSS rule helps the browser know where to put page-breaks, but it's not an exact science
* Some browsers default to a setting that disables background images/colors (to save ink). This was a problem since each mood result for a team uses a background image (green, yellow, or red face). I might need to switch those icons to be actual `img` tags, but in the short term, there is a `-webkit-print-color-adjust` rule that can be set to `exact` to include images by default
* Make sure to test printing in both portrait and landscape -- the original responsive design!
* Chrome allows you to fake out the media queries so you can iterate on the design of your print styles quickly; be sure to check the print preview in all the common browsers
* Actually print out the reports to check font sizes/margins. It's a bit tedious but the only way to know for sure!

# Getting the app to a clean slate
As I [mentioned before][td], I was dealing with a pile of tech debt from out-dated libraries. I was uncomfortable building many large features before upgrading. And I was worried about upgrading because the app had no tests! A bit of a catch-22 :(

So I leaned into the pain and did the following:

* Setup a test suite (following must of the recommendations in the [thoughtbot testing guide][tb])
* Wrote high-level, happy path tests with RSpec/Capybara -- these are a bit slow, but I wanted full-stack tests that hit the database, router, and rendered real views. Isolated unit tests are great, but they wouldn't help me figure out breaking issues as I upgraded library versions
* Pared down the Gemfile -- I tried to remove gems that I didn't really need; less gems => less surface-area for breakage when I bump the Rails version. I removed `csv_builder` (was generating one CSV file...), `bloggy` (moved the blog to GitHub Pages and out of the main Rails codebase), `xray-rails` (a cool thing that I used for about 10 minutes several years ago), `watu_table_build` (why was I using a weird fork of a weird gem to build tables? who knows!) and a couple other miscellaneous dependencies
* Upgraded Rails from 3.2 to 4.0 -- luckily, Rails has nice [migration guides][mg] so I wasn't completely lost. I fixed the broken stuff until the tests were passing
* Upgraded Ruby from 2.1 to 2.3 -- this one should have been painless, but something got screwed up when I installed via `ruby-build` and `rbenv` and I ended up with a corrupted `CSV` module. I have no idea what happened or how, but re-installing ruby was the cure (after several hours of head-scratching)
* Upgraded Rails from 4.0 to 4.1 -- the best way to eat an elephant is one bite at a time...actually, just don't eat elephants...
* Upgraded Rails from 4.1 to 4.2 -- more fixes per the migration guides and suddenly everything was green!

It took the better part of a week, but the terrible upgrade that I dreaded was over...and it wasn't so bad.

# Enterprise Sales Engineer
I reached out to a large user and asked about getting them onto an Enterprise plan. I haven't built out the payment code yet, so I figured large customers that probably want an invoice might be good customers to start with.

A few emails later, I was on the phone with a procurement person and feeling like an impostor. But I kept my cool and, to my delight, the cost was peanuts to this large company and everything went great. Still waiting to finalize all the details, but I made a sale! For a huge plan!

I was dreading doing a sales call so I reframed the call as one afternoon of potential annoyance that would get me one month of runway ($$). Obviously not every call will end with a large sale, but this mentally appealed to me as I work toward a goal of generating enough revenue for this product so that it can "pay" one more person to work on it (instead of client work).

---

I was a bit down in my check-in meeting because I felt like I wasn't getting much done the past month. But looking back, there were many small wins and sharing them helped me realize that. 

I still struggle a bit with direction: there is so much I could be doing, but nothing urgent that is pulling me. Hopefully, getting the app cleaned up will make it easier to tackle larger efforts that have a clearer focus. Next on the list: building out paid plans and payment infrastructure.

[survey]: http://mdswanson.com/blog/2016/04/19/getting-reacquainted-with-customers.html
[td]: http://mdswanson.com/blog/2016/04/22/compounding-technical-debt.html
[tb]: https://robots.thoughtbot.com/how-we-test-rails-applications
[mg]: http://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html
[morale]: https://moraleapp.com
