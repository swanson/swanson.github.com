---
layout: post
title: Github v3 API - Making a commit
published: false
categories:
- blog
---

So the last time I was playing around with the Github API I was able to pull
out all of the files and their contents for a given repo.

The next task I needed to be able to do was make a commit. The process looks
fairly involved from the outside; you have to make the blob, find and update
the trees and make the commit all manually. As mentioned on HN, the guys at
Github acknowledged this was a pain point and may introduce some helper methods
like those used for creating and editing Gists.

I was kind of dreading doing all the git internal stuff by hand because, frankly,
I am not an expert on it and it's not exactly what I want to spend my weekend 
debugging.

But I found a perl library (which seems to be the first to support all of the v3
methods) that has an example of making a commit. Between that sample code and
the instructions on the API documentation, I felt like I had enough information
to give it a solid attempt.

###Letting myself do stuff to my own stuff on my behalf

So I started making a few calls to the API but I ended up realizing that I need
to authenticate myself in order to do most of the POST operations. The API allows
for you to send your username and password directly or use an OAuth2 token.

I think Github could it make it a bit more clear which methods require authorization.
Maybe I wasn't looking in the right place, but it would have been helpful to have
a little note saying "This method requires auth" below the "Create a blob" section.

OAuth and I don't get along at all, usually because I want to call the APIs from
the command line or a script and the OAuth use-case seems to want me to build a
whole webapp first. But I know that I'll need to use OAuth method at some point,
so better to bite the bullet now.

I first thought that I could use the API token that you can get to from the Github
Account Settings page -- but that isn't the OAuth access token. I ended up using
a script for this ruby library and making a test application to extract my
access token.

When you make requests, you need to include the token in the headers like this:  

`Authorization: token YOUR-TOKEN-HERE`


Also, I spent way too long banging my head against the wall because I was putting
the encoding and contents in the headers, instead of the POST body. Doh. You need to 
use JSON in the body as well, something like:  
    
    {
      "content": "test commit",
      "encoding": "utf-8"
    }

###Make a commit in just five easy steps

After some investigating, I determined that the follow steps would result in a commit
being added:

 * GET `/repo/:user/:repo/git/refs/heads/master`, get the SHA for the latest commit (SHA-LATEST-COMMIT)
 * GET `/repo/:user/:repo/git/commits/SHA-LATEST-COMMIT`, get the SHA for the tree (SHA-BASE-TREE)
 * POST `/repo/:user/:repo/git/trees/` while authenticated
 ** Set `base_tree` to be SHA-BASE-TREE, `path` should be the full path of the new file you are creating
 or editing, `content` should be the full contents of the new file
 ** from the response, get the top-level SHA (SHA-NEW-TREE)
 * POST `/repo/:user/:repo/git/commits` while authenticated
 ** Set `parents` to be SHA-LATEST-COMMIT and `tree` to be SHA-NEW-TREE
 ** from the response, get the top-level SHA (SHA-NEW-COMMIT)
 * POST `/repo/:user/:repo/git/refs/head/master` while authenticated
 ** Set `sha` to be SHA-NEW-COMMIT

 Now view your repository and make sure everything is correct. This approach skips the manual `blob` creation
 since setting `tree.content` automatically builds one for you. The `trees` API also handles deep paths and
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

I imagine there is lots of complexity with branches and doing less trivial commits, but for the simple
use-case of making a new commit on the latest commit on the `master` branch I think could work.

###So what's the point again?

So the question is now, "Why are you doing all this Github API stuff anyways?". I made a vague reference
to a project idea in my first post so here are the details.

I want to make a web-based editor for Jekyll-based, Github Pages hosted blogs (like my own). The idea being
that I can add a static page to my blog that will allow me to login with my Github credentials, create and 
edit posts, and push the commits back to the underlying repo. The page would have a WYSIWYG Markdown editor
and some kind of file browser showing all items in your `_posts` directory.

"But why don't you just write the posts in gvim?" Yeah, I know -- I can (and do) write most of my posts from gvim
and push the changes up with the terminal. But sometimes I am not on my machine and don't want to setup my
SSH keys or install git. I also like the WYSIWYG side-by-side previews that you get from using something like
[this online Markdown editor](http://www.ctrlshift.net/project/markdowneditor/)

A web-based editor also makes Jekyll more approachable for non-technical users. Most people that use WordPress
or something similar don't care that static files are faster or that they need to update constantly to avoid
security vulnerability; they use it, in part, because it's easy to make posts in the browser.

Plus, the project will give me a chance to play with HTML5, Backbone.js, and making a single-page app. I plan
to continue writing more blog posts as I work on the project. The Weekly Noise approach kind of fizzled out
the last time I tried it (for my first Node.js project) but I liked the idea of keeping an 'engineering 
notebook' as I work.
