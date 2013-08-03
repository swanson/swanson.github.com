---
layout: post
title: "Don't Email Me at 2am"
categories:
- blog
---

Almost every web app these days sends emails. You've got your 
"thanks for registering" emails, your "password reset" emails, your "someone added
a comment to your post" emails. Whatever, that's fine.

But I wish developers would pay a little more to attention to the context in
which they are sending me these messages.

I've noticed the difference recently in two apps in particular.

[Beeminder][b] is a goal tracking application that encourages you to make steady
progress to stay on track. Every day or so you enter data into the app about
your goal. When you start going off track, Beeminder starts buzzing you.

[b]: https://www.beeminder.com

You start getting a daily email that summarizes your progress and lets you
enter data straight from the email by replying. But there are some
smaller details that I really like.

The email comes at 9:30am &mdash; at the start of the day &mdash; so I'm reminded
to make some progress that day. It is a small thing, but they could send an
email at 10pm asking me to log what I did that day. But at 10pm, it's probably
too late to do anything if I forgot.

Compare this to an email I got this morning from Leanpub. 

[Leanpub][l] is a tool for authors to create ebooks that makes it easy to add 
updates and get them automatically beam them down to my Kindle. I really like
the app and have brought a dozen books using their platform.

At 1:48am this morning, I was drifting off to sleep
when my phone buzzed. I had an email. It was Leanpub telling me that a new
version of a book I had purchased was available. That's great, Leanpub, but I
don't really care and you just woke me up. Now I have a negative connotation
associated with your emails, I might unsubscribe or mark them as spam. But
mostly I'm just annoyed.

[l]: https://leanpub.com/

If I had to guess, I bet the logic for Leanpub goes something like: when a
publisher updates their book, email all the book owners to tell them an update
is available. Sounds great, until you consider an author in California pushing
an update at 10:48pm that buzzes my phone in the wee hours of the night. Leanpub
should really batch up these emails and send them out during normal waking hours.

Another thing that Beeminder does well is when you stop entering data into
the app, it starts a gradual back-off. If I stop responding to daily emails, it
starts sending them every few days, then every week, then just stops completely.

This is another trick that Leanpub should steal. I've gotten 5 emails about
updates to a certain book I bought. I haven't click any of the "download update"
links in any of the emails. Why doesn't Leanpub start emailing less often? Maybe
only when a major update happens, instead of several minor ones?

The major difference between Beeminder and Leanpub emails is that one feels like
a thought-out user interaction and the other feels like a developer afterthought.

Beeminder probably sat down and worked through how a user would receive their
emails, where as it seems that Leanpub probably had a story that said "As a user,
I want to receive an email when a book I own gets updated" and just cranked it
out.

---

The moral of the story: if you are going to send an email in your application,
make sure you think about the context. Trivial details like when the user is
going to receive the email can make all the difference.
