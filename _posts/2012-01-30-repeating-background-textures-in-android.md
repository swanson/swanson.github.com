---
layout: post
title: "Repeating Background Textures in Android"
categories:
- blog
---

* Pick something from [Subtle Patterns][sp], e.g. `irongrip.png` and
drop it in your `drawable-hdpi` folder
* Make a [BitmapDrawable][bd], e.g. `irongrip_repeating.xml`

<script src="https://gist.github.com/1708048.js?file=irongrip_repeating.xml">
</script>

* Apply it to a View

<script src="https://gist.github.com/1708048.js?file=main.xml">
</script>

The result:

![](/static/android-texture.png)

A pretty simple way to spruce up an app, just don't go overboard. Happy 
hacking!

[sp]: http://subtlepatterns.com/
[bd]: http://developer.android.com/reference/android/graphics/drawable/BitmapDrawable.html