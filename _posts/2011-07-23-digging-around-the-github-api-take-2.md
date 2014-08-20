---
layout: post
title: Making a commit with the Github API
categories:
- blog
tags:
- worklog
---

The [last time I was playing around with the Github API][1] I was able to pull
out all of the files and their contents for a given repository.

The next task I want to be able to do was make a commit. The [process][2] looks
fairly involved from the outside; you have to make the blob, find and update
the trees and make the commit all manually. As mentioned on [HN][3], the guys at
Github [acknowledged this was a pain point][4] and may introduce some helper methods
like those used for creating and editing Gists.

I was kind of dreading doing all the git internal stuff because, frankly,
I am not an expert on it and it's not exactly something I want to spend my weekend 
debugging.

But I found a [Perl library][5] (which seems to be the first to support all of the v3
methods) that has an example of making a commit. Between that sample code and
the instructions on the API documentation, I felt like I had enough information
to give it a solid attempt.

###Letting myself do stuff to my own stuff on my own behalf

So I started making a few calls to the API but I ended up realizing that I need
to authenticate myself in order to do most of the POST operations. The API allows
for you to send your username and password directly or use an OAuth token.

*Aside: I think Github could make it more clear which methods require authorization.
Maybe I wasn't looking in the right place, but it would have been helpful to have
a little note saying "This method requires auth" below the "Create a blob" section.*

OAuth and I don't get along at all, usually because I want to call the APIs from
the command line or a one-off script and OAuth seems to want me to build a whole web app first. 
But I know that I'll need to use OAuth at some point, so better to bite the bullet now.

Initially, I thought that I could use the `API token` from the Github
[Account Settings page][6] -- but that isn't the OAuth access token. I ended up using
a script from a [Ruby library][13] and making a test application to extract my
access token.

When you make requests, you need to include the token in the headers like this:  

`Authorization: token YOUR-TOKEN-HERE`

Also, I spent way too long banging my head against the wall because I was putting
the encoding and contents in the headers as well, instead of the POST body. Doh. You need to 
use JSON in the body as well, something like:  
    
    {
      "content": "test commit",
      "encoding": "utf-8"
    }
  

###Make a commit in just five easy\* steps!

After some investigating, I determined that the follow steps would result in a commit
being added:

 * GET `/repos/:user/:repo/git/refs/heads/master`
   <ul><li>Store the SHA for the latest commit (SHA-LATEST-COMMIT)</li></ul>  
 * GET `/repos/:user/:repo/git/commits/SHA-LATEST-COMMIT`
   <ul><li>Store the SHA for the tree (SHA-BASE-TREE)</li></ul>
 * POST `/repos/:user/:repo/git/trees/` while authenticated
   * Set `base_tree` to be SHA-BASE-TREE
   * Set `path` to be the full path of the file you are creating or editing
   * Set `content` to be the full contents of the file
   * From the response, get the top-level SHA (SHA-NEW-TREE)
 * POST `/repos/:user/:repo/git/commits` while authenticated
   * Set `parents` to be an array containing SHA-LATEST-COMMIT
   * Set `tree` to be SHA-NEW-TREE
   * From the response, get the top-level SHA (SHA-NEW-COMMIT)
 * POST `/repos/:user/:repo/git/refs/head/master` while authenticated
   * Set `sha` to be SHA-NEW-COMMIT
   * You may need to set `force` to be true

Now view your repository and make sure everything is correct. This approach skips the manual `blob` creation
since setting `tree.content` automatically builds one for you. The `/trees` API also handles deep paths and
recursively rewrites subtrees. These two shortcuts saved me an even bigger headache.

I'd like to see some abstraction, as I mentioned before, where you can POST something like this and it would
magically work:

     {
       "parent_commit": sha,
       "message": "commit msg",
       "content": [
           {
               "path":"path/to/file",
               "mode":"edit",
               "data":"editted version of file"
           },
           {
               "path":"path/to/new/file",
               "mode":"add",
               "data":"newly added file"
           }
       ]
     }

There is likely lots of complexity with branches and doing less trivial commits, but for the simple
use-case of making a new commit on the latest version on the `master` branch I think it could work.

###What's the point again?

So the question is now, "Why are you doing all this Github API stuff anyways?". I made a vague reference
to a project idea in my first post so here are the details.

I want to make a web-based editor for [Jekyll-based][7], [Github Pages][8] hosted blogs (like my own). The idea being
that I can add a static page to my blog that will allow me to login with my Github credentials, create and 
edit posts, and push the commits back to the underlying repo all from the browser. 

The page would have a WYSIWYG Markdown previewer and some kind of file browser showing all items in your 
`_posts` directory.

"But why don't you just write the posts in `gvim`?" Yeah, I know -- I can (and do) write most of my posts from 
`gvim` and push the changes up with the terminal. But sometimes I am not on my machine and don't want to setup my
SSH keys or install `git`. I also like the WYSIWYG side-by-side previews that you get from using something like
[this online Markdown editor][9].

A web-based editor also makes Jekyll more approachable for non-technical users. Most people that use WordPress
or something similar don't care that static files are faster or that they need to update constantly to avoid
security vulnerability; they use WordPress, in part, because it's easy to make posts in the browser.

Plus, the project will give me a chance to play with [HTML5][10], [Backbone.js][11], and making a single-page app.

I plan to continue writing posts as I work on the project. The [Weekly Noise][12] approach kind of fizzled out
the last time I tried it (for my first Node.js project) but I liked the idea of keeping an "engineering 
notebook" as I work.

[1]: /blog/2011/07/09/digging-around-the-github-v3-api.html
[2]: http://developer.github.com/v3/git/
[3]: http://news.ycombinator.com/
[4]: http://news.ycombinator.com/item?id=2746877
[5]: https://github.com/plu/Pithub
[6]: https://github.com/account/admin
[7]: http://jekyllrb.com/
[8]: http://pages.github.com/
[9]: http://www.ctrlshift.net/project/markdowneditor/
[10]: http://diveintohtml5.org/
[11]: http://documentcloud.github.com/backbone/
[12]: /blog/2010/10/24/weekly-noise.html
[13]: https://github.com/jwilger/github-v3-api
