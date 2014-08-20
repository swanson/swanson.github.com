---
layout: post
title: Update on Lanyon + Cross-domain AJAX POSTs with CORS
categories:
- blog
tags:
- worklog
---

An update is long past due on [Lanyon][lanyon-repo] (my Jeykll WYSIWYG editor project) so here
is a recap since the last post.

As of my [last update][last-update], I had figured out how to make a commit with the Github API. Everything
was working with `curl`, but when I hooked up the code to call the API from the browser I ran
into issues regarding [same-origin policy][same-origin] when doing cross-domain AJAX requests.

For GET requests, there were no issues since I can use [JSONP][jsonp]. By including a callback function in 
my JavaScript code, the server will respond with my function with inlined arguments populated 
by the requested data. This function is then injected into the DOM and wrapped in a `<script>` tag. 

To trigger this behavior, I just needed to set the `dataType` option of the jQuery `$.ajax()` 
call to be `jsonp` and set the `jsonpCallback` option to my callback function.

For POST requests, it's a whole different game. If you try to just do the POST normally,
you will find yourself with a "same origin policy" error. Searching the web will reveal a ton
of information about different work-arounds - the most popular being to use an `<iframe>`, use
some other plugin like [`easyXDM`][easyxdm], or write your own server proxy.

The `<iframe>` approach relies on setting the frame's domain to be the same as your target
and then submitting an injected form to the desired URL. I started going down this path but I
found that you couldn't get the response from the POST, which was critical in my case.

The `easyXDM` route involves communicating between your main window and an `<iframe>` using
the `postMessage` API supported in some browsers. I didn't really grok how it was supposed to
work, but I believe it would require changes to both my domain and my target domain. And since 
I can't control Github's domain, I don't think it would fit my needs.

The last route, a server proxy, seemed to be most feasible. I could throw together a little Sinatra
app that proxied my requests over to api.github.com and since I would control the server, I could perform
all of the requests at once and have control over the cross-domain policies. 

The problem with this approach was that it would need maintenance and extra resources. The whole point of 
the project was to make the requests on the client side so that anyone could drop the script into their 
blog. Now I would have to keep the server up and running and now people have to trust that I'm not storing 
their credentials on my server (I wouldn't trust someone else with them).

After doing more research, I found that, at one point, the Github API supported [CORS][cors], which is a 
spec that allows for exemptions to the same-origin policy. I sent a message to [Rick at Github][technoweenie]
and, to my surprise, he worked with me to re-enable CORS support! One restriction is that your origin needs to be 
registered as an OAuth app, but that was a non-issue.

I had some trouble with jQuery when making the request, but I finally got the right combination of settings
and it started working.  Here is some sample code for making the POST:

    $.ajax({
        type: 'POST',
        url: 'API URL goes here',
        data: JSON.stringify(data),
        dataType: 'json',
        contentType: 'application/x-www-form-urlencoded',
        success: callback,
        beforeSend : function(xhr) {
		    xhr.setRequestHeader("Authorization", 
                "Basic " + that.base64encode(user + ':' + pw));
	    }
    });

For whatever reason, using the `username` and `password` options weren't working and my authorization
headers weren't being sent so I had to manually set the header and base64 encode my credentials.

I still need to do a bit more work related to setting the [YAML front matter][yaml] for the Jekyll posts
and to make some of my calls more generic (everything is hard coded to do the `git` operations in a 
test repo of mine). But I was able to write a post and get it committed and pushed to a repository
from the browser.

And then onward to editing posts and making the UI look pretty!

[yaml]: https://github.com/mojombo/jekyll/wiki/yaml-front-matter
[technoweenie]: https://github.com/technoweenie
[cors]: http://en.wikipedia.org/wiki/Cross-Origin_Resource_Sharing
[easyxdm]: http://easyxdm.net/
[jsonp]: http://en.wikipedia.org/wiki/JSONP
[same-origin]: http://en.wikipedia.org/wiki/Same_origin_policy
[last-update]: /blog/2011/07/23/digging-around-the-github-api-take-2.html
[lanyon-repo]: https://github.com/swanson/lanyon
