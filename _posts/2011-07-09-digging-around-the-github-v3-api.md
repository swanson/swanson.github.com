---
layout: post
title: Digging around the Github v3 API
categories:
- blog
---

I've had a little project idea brewing for a while that would require
read and write access to a Github repository with client side Javascript,
which eliminates the ability to use existing libraries like 
[`grit`](https://github.com/mojombo/grit) and 
[`libgit2`](https://github.com/libgit2/libgit2). 

A few of the libraries have
Node.js bindings, but that's not exactly what I wanted. There is a cool project
called [`git.js`](https://github.com/danlucraft/git.js) that looked like it would be perfect, but it doesn't (yet) support
any write operations.

Instead, I'll have to use the [Github HTTP API](http://developer.github.com/).

The real problem was that, prior to v3, the Github API was pretty useless for
working with repositories. You could get the stats (forks, watchers, title, etc)
but the file data wasn't accessible. I guess you could just scrape the website
to get the data but that's a little hacky and wouldn't work for making commits
or pushing changes (theoretically possible now that you can Edit
files online and commit the changes through the web interface?).

*(Addendum: the v2 did have read access to git objects, but not write access, as
technoweenie from Github points out [here](http://news.ycombinator.com/item?id=2746877))*

Anyways, the Github v3 API exposes all the 
[raw git data](http://developer.github.com/v3/git/) now, so that seems like a much
more robust way to go.

Unfortunately, there is a lack of useful examples on the new API methods; instead
of showing you how to get file at a given commit from the API, you get pointed
to the [ProGit 'Git Internals' chapter](http://progit.org/book/ch9-0.html).
So I began to dig into the git internal
plumbing with the goal of getting the latest version of a file from one of my
repos.

I first started looking at the 
[`/blobs/`](http://developer.github.com/v3/git/blobs/) 
API route since that's where a file
is stored in a git repo. Before I went digging around with the command line
to find the SHA hash for the file, I tried to see if I could get it from the
Github website --- however most of the SHA identifiers are for commits, not files.

So that was a dead-end, but a bit of googling later, I found that you can get the
SHA for a file by running `git hash-object FILEPATH` (aside: 
[this StackOverflow question](http://stackoverflow.com/questions/552659/assigning-git-sha1s-without-git/552725#552725) 
was really insightful too). So I picked a random file from my blog repo and found
the SHA (`957e6b4efb22fa921d0e6b17a1fbf46788c97ed3`).

Then I pinged the `/blobs/:sha` route with [hurl.it](http://hurl.it) and got 
this response:

<script src="https://gist.github.com/1074083.js?file=blobs.json">
</script>

Interesting, the `content` field looks promising, <strike>but I <i>think</i> it is the
git <a href='http://book.git-scm.com/7_how_git_stores_objects.html'>loose object</a>,
which is the content deflated with <a href='http://www.zlib.net/'>zlib</a>.</strike> 
but it is base64 encoded. Not exactly ideal for showing the file contents to the user.

A bit more digging and I found that the API has some 
[custom MIME types](http://developer.github.com/v3/mimes/#git-blob). Adding the 
`Accept: application/vnd.github-blob.raw` to the HTTP Header, I got this response:

<script src="https://gist.github.com/1074083.js?file=blobsraw.json">
</script>

Bingo! Access to the file data and it's human readable. I suspect that using that
MIME type causes the API to call `git cat-file` or something similar on the server.

Now, I need to be able to get the data for any file in the repo and I would
prefer to not have to use the command line to get the SHA every time. So it looks
like the [`/trees/`](http://developer.github.com/v3/git/trees/)
API method will be useful --- it displays the directories and files
present at a given commit. And since you can use branch names (like `master`) instead
of SHA (read more [here](http://book.git-scm.com/4_git_treeishes.html)), I figured
I could try plugging that into the Github API.

<script src="https://gist.github.com/1074083.js?file=treesmaster.json">
</script>

Cool, it worked. And better yet, the `url` field gives me the API URL to call for to
get the file contents (or the tree if it's a directory).

So given a Github username and repo name, I can pull down the file structure
with `/tree/master` and then drill down on the individual files with `/blobs/` and the
special MIME type.

More to come later as I try to figure out how to make an edit to a file and commit it
to the repo and more details on the project this is all for once I make more progress.
