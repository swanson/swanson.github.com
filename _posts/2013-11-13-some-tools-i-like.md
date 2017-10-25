---
layout: post
title: "Some tools I like"
categories:
- blog
---

## What date is next Thursday?

If you have ever clicked on the time in the system tray or Googled for "calendar", then I
am about to blow your mind.

Just use the [`cal`][cal] UNIX command!

![cal UNIX command]({{site.url}}/static/cal.png)

## Why is my blog loading so slow?

Have you optimized your images? No? Yeah, I didn't think so.

Try running [ImageOptim][io] (Mac-only) or [OptiPNG][op] (Windows) and be amazed when
your image sizes are reduced by 25-75%.

(Warning: your MacBook might sound like a jet engine while this runs...)

![ImageOptim screenshot]({{site.url}}/static/imageoptim.png)

## I need to make a quick web page. Should I install WordPress?

No, please, no! Why not try out [Jekyll](http://jekyllrb.com/) &mdash; an awesome static site generator?

I've used it to make:

* This [blog][blog]
* Websites for meetup groups: [IndySA][isa], [Indy Startup Lab][isl], [Indy Tech Table Tennis League][itttl]
* Stupid single page sites: [Most Precise Weather][mpw]

And with Jekyll 1.3's new [`_data` files feature][df], you can easily turn Jekyll into
a mini CMS powered by YAML files. Sky's the limit now, folks!

[cal]: http://en.wikipedia.org/wiki/Cal_(Unix)
[io]: http://imageoptim.com/
[op]: http://optipng.sourceforge.net/
[blog]: http://mdswanson.com
[isa]: http://indysa.org/
[isl]: https://indystartuplab.github.io/
[itttl]: http://itttl.org/
[mpw]: http://mostpreciseweather.com/
[df]: http://jekyllrb.com/docs/datafiles/

