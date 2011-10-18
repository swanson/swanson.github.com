---
layout: post
title: Web Development Kata - Tweet Viewer
categories:
- blog
---

> I've been on the lookout for practical katas related to web
> development. I couldn't really find any I liked so I tried my hand at writing
> one myself.
>
> I think this problem fits the kata model pretty well - iterative steps
> that build on each other and an almost infinite way to accomplish most of the tasks.


**Problem:**  
The boss wants to keep up-to-date on that new social media thing,
but Twitter's UI is too advanced for him. He wants you to whip up a simple Tweet Viewer
so he can maximize his synergy and improve team dynamics.

**Pre-Reqs:**
* A web environment that can speak HTTP
* A text editor
* A browser

**Provided:**  
A static list of tweets: [sample-tweets.txt](/static/sample-tweets.txt) 

**Steps:**
1. Display a tweet
2. Display a static list of tweets
3. Linkify @mentions and #hashtags
4. "Pretty print" timestamps
5. Display tweets for a specific user
6. Display live Twitter data using API
7. (Bonus) Infinite Loading button with AJAX

<br/>
---
<br/>

1\. Display a tweet
---
When I visit `http://localhost/`, display a single tweet. It should
include the username, message and timestamp and be similar
in design to this template.

![](/static/tweet-template.png)

2\. Display a static list of tweets
---
When I visit `http://localhost/`, it should now display the 
[list of 5 tweets](/static/sample-tweets.txt) using the same template as before.

3\. Linkify @mentions and #hashtags
---
Any words beginning with the `@` characters are @mentions, they should
be converted into links that point to the mentioned user's Twitter page.
For example, `@github` should be a link to `http://twitter.com/github`.

Any words beginning with the `#` are #hashtags, they should be converted
into links that point to the Twitter search page for that tag.
For example `#pun` should be a link to `http://twitter.com/search/%23pun` 
(note the encoded `#`).

4\. "Pretty print" timestamps
---
Instead of displaying the timestamp like `Jan 01, 2011 10:24:55 +0000`, use a
more readable format like `Around 5 minutes ago`.

Less than a minute ago  
Around X minutes ago  
Around X hours ago  
Around X days ago  
Around X weeks ago  
Around X months ago  
A year or more ago  

Use the bigger time range whenever possible (i.e. `Around 1 week ago` instead of `Around 7 days 
ago`); feel free to modify the timestamp of the sample tweets for testing.

5\. Display tweets for a specific user
---
When I visit `http://localhost/?user=johnsmith`, display a list of all tweets with a
username of `johnsmith` in the sample list. If I input a user with no tweets,
display the message `No tweets found for @USERNAME`.

6\. Display live Twitter data
---
When I visit `http://localhost/?user=someuser`, display the last 15 tweets from the desired
user using live Twitter data. If the user has less than 15 tweets, display all of their
tweets.

One way to get the data is to use the 
[Twitter Search API](https://dev.twitter.com/docs/api/1/get/search). Read through the documentation
to figure out the parameters you can use.

Bonus: Infinite Loading button with AJAX
---
Add a button below the list of tweets, when clicked the page should use AJAX to load the next 
15 tweets from the desired user using live Twitter data. 

Hide the button and display a loading spinner (or the string `Loading...`) while the page is 
waiting for the data.

If all of a user's tweets are displayed, the button should disappear.

---

Some things you practice with this kata: basic HTML/CSS layouts, simple data modeling, 
rendering stored data, templating/partials, URL/query parameters, view helpers, querying data,
interacting with external APIs, and AJAX POSTs (if you do the bonus). 

You can extend the kata once you master it; try adding OAuth, the ability to write tweets, real 
time updates, caching results, better styling, moving work from server side to client side.