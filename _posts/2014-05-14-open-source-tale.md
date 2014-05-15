---
layout: post
title: "Two Lines of Code: An Open Source Tale"
categories:
- blog
---


### January 7, 2014 - 09:35:45 AM

It all started with a JavaScript error...

```
Uncaught SyntaxError: Unexpected token ILLEGAL
```

I was trying to catch up on my RSS items, but nothing was rendering on the page.

I dumped some debugging info and opened an [issue on GitHub][s295]. I found a
workaround, but it involved marking all my stories as read. No time to look into
this issue now.

---

### February 24, 2014 - 02:17:58 PM

Several other users have reported experiencing the same bug. A potential fix
that involved removing unprintable characters (`.gsub(/[^[:print:]]/, '')`) was 
proposed but didn't seem to completely address the issue.


### March 27, 2014 - 10:00:15 PM

A comment on the [still unresolved] bug triggered an email notification from
GitHub earlier this morning. I had some time to look into it after work.

I went back to my original bug report and tried to create a minimal test
case that would reproduce the bug. I opened up the Chrome Dev console and started
pasting in chunks of the large string I was trying to parse.

Using a primitive form of [`git bisect`][bi], I tried the first half of the 
string to see if the error happened again. Nope. I halved the remaining part of 
the string. I repeated until I had it narrowed down to a few characters.

The string in question was "QNk8n". Nothing jumps out as being extraordinary
about that string.

I pasted it into an `irb` session and found the likely culprit:

```
irb(main):001:0> "QNk8n\U+FFE2\U+FFA8"
```

Some weird unicode characters were being tacked onto the end!

Googling for "unicode 2028 javascript" led me to a really excellent
blog post explaining that [JSON is not a true subset of JavaScript][timeless].

The long and short of it: `u+2028` and `u+2029` are valid JSON but not valid
JavaScript. My app was trying to parse the JSON representation of the RSS
articles into JavaScript (via backbone.js) to be rendered.

I wrote a [failing test][fail] and then [fixed the bug][sfix] (confession: my
first bug fix passed the test but [created another][whoops], whoops).

Pushed. Deployed. Did a little dance.

### March 30, 2014 - 06:56:19 PM

I wanted to get this fix upstream. In addition to wanting to give back, I didn't
want to have to implement this "hack" in my own app.

Next up the chain was `feedjira` &mdash; the gem I was using to parse RSS feeds.
Ultimately, this code probably belonged in `loofah` &mdash; an HTML sanitization 
gem used by `feedjira`, but that library seemed to be dormant.

After a brief discussion with maintainer [Jon Allured][jon], we both agreed to 
try to get the fixes into `loofah`. If we couldn't, we would patch it in `feedjira`.

### April 6, 2014 - 06:00:01 PM

Finally got around to [opening an issue][l65] with `loofah`. I proposed that we add
code to deal with the **Evil JSON Characters** as part of `loofah`'s sanitization
process.

Project maintainer [Mike Dalessio][miked] said this fix would be well received 
and pointed me toward the relevant sections of the codebase.

### April 12, 2014 - 06:04:22 PM

Deep dive into the `loofah` codebase to add a new "scrubber"! 

The `loofah` architecture was interesting; the scrubbers are basically parsers 
that operate on `nokogiri` nodes. You can make a top-down or a bottom-up parser 
and you can control when you break out of the tree as you walk the nodes.

With Mike's initial direction guiding me, I got a working implementation and 
opened a [pull request][l66].

### April 21, 2014 - 06:20:36 PM

A friendly ping to Mike and my [PR gets merged][lm].

### May 9, 2014 - 06:49:54 PM

`loofah` version 2.0.0 is [released][lr] (which includes my fix) and pushed to
RubyGems.

Now that the fix has been applied upstream, we now have to update gem versions
downstream.

### May 13, 2014 - 04:19:17 PM

I open a new [PR][f223] in `feedjira` to update the `loofah` version.

The PR is [merged][fm] and `feedjira` version 1.3.0 is [released][fr].

### May 14, 2014 - 11:44:35 AM

I can bump the versions of `feedjira` and `loofah` used in Stringer and I
can finally [replace][victory] the patch with `scrub!(:unprintable)`.

Victory!

---

So five months later, my two line of code bug fix has made it all the way
upstream and then back again! It may not seem like much, but this is the magic 
of open source.

This bug originally affected a few users of Stringer, but by sending the 
patch upstream, thousands of people have benefited (`loofah` and `feedjira` 
have over 500k combined downloads).


[s295]: https://github.com/swanson/stringer/issues/295
[timeless]: http://timelessrepo.com/json-isnt-a-javascript-subset
[fail]: https://github.com/swanson/stringer/commit/71199cc432fe03ce483e3f7b55cea683c09d6cfc#diff-3ac47732f4ef157a8877f2753398056cR90
[sfix]: https://github.com/swanson/stringer/commit/2ae53ed8d47f9d9bf25dd9c41c18f9935a390de1
[whoops]: https://github.com/swanson/stringer/pull/314
[jon]: https://github.com/jonallured
[l65]: https://github.com/flavorjones/loofah/issues/65
[miked]: https://github.com/flavorjones
[l66]: https://github.com/flavorjones/loofah/pull/66
[lm]: https://github.com/flavorjones/loofah/commit/273e30297d85d81ad170843f2523305816d9f25d
[lr]: https://rubygems.org/gems/loofah/versions
[f223]: https://github.com/feedjira/feedjira/pull/223
[fm]: https://github.com/feedjira/feedjira/commit/d382f8ac1ffed29e9215996d03981506da6602dd
[fr]: https://rubygems.org/gems/feedjira/versions/1.3.0
[victory]: https://github.com/swanson/stringer/commit/5102bb6b3a595a764de010c721c59736a6be3295
[bi]: http://git-scm.com/docs/git-bisect
