---
layout: post
title: "How not to validate email addresses"
categories:
- blog
from_newsletter: true
---


One task I've seen in nearly every web project I've worked on was: make sure this form field is a
valid email address.

Whether this is for creating an account or some other function inside your app (inviting others,
sending reports, etc), email address validation seems totally reasonable on the surface.

And it is a typical computer science-y problem. If you look around the internet, you will quickly
find [RFC 2822][rfc], a 47 page technical spec describing what a valid email address is. Or maybe
you will find a regular expression that looks something like `^[_a-z0-9-]+(\.[_a-z0-9-]omg-whyyyyy$`.

You can probably even find a library in your language of choice that implements a full, RFC 2822
compliant parser or wraps that unreadable 200 line regex.

Both of these solutions are **wrong and a waste of development hours**.

So what should you do instead?

Just check for the existence of `@`. Every email address will have at least one of them and it is
trivially easy to write this code.

---

Let's step back and talk about why you might want to validate an email address in the first place.

The most common two reasons I hear are:

* To prevent fake/spam signups
* To make sure the real email account owner is the one signing up

I think trying to prevent spammy signups is a pre-mature optimization, but let's put that
aside for now. Trying to prevent fake email addresses from getting into your app harms legitimate
users.

How sure are you that your complex validator is not going to have any false positives? People use
Gmail's tag-syntax (i.e. `matt+whatever@gmail.com`) to sign up for stuff all the time. Are you allowing
those? 

How about `!matt$=awesome@mail.aol.biz`? Yep, that is a valid email address according to the spec.

Especially in the early stages of a product, every user counts when you are trying to learn about
how real people use your software. Don't lose a potential customer in order to block a few spammers
(if they really want to get in, they will just make tons of real email addresses anyways).

The second reason really has nothing to do with the *format* of the email address, but it often
gets conflated. If you require a user to confirm their email address, why don't you just let them
enter whatever they want and let fake emails bounce? Just make sure you tell the user they have to
confirm their address to use your software.

---

Here are my recommendations for how to use the time you saved from _not_ implementing complex email
address validation and dealing with bugs and support tickets from valid users that can't sign up 
for your app.

# Detect typos

How about checking for common domain typos? There is a really slick Javascript library called 
[mailcheck][mc] that handles this well.

![mailcheck example]({{site.baseul}}/static/mailcheck-example.png)

Again, don't be strict and auto-correct the address, but pointing out that `bob@gmial.com` is
a typo is a win for user experience. You can even add custom domains easily &mdash; if you know
the current user's email is from "microsoft.com" and he tries to send a report to someone
with a "microsotf.com" address, you can catch this!

# Be more accepting

Have you ever copied an email address from your Outlook address book and tried to paste it into a
form? It probably pasted something like `Matt Swanson <matt@mdswanson.com>` when you really just
wanted the email part. That's going to break some email validations.

Does your app handle this case and extract the address for the user? No? Well, adding that sure 
seems more valuable than implementing the complex validation.

---

Do you know any other UX improvements for email address fields? I'd love to hear them, let me know 
on [Twitter](http://twitter.com/_swanson).

[rfc]: http://tools.ietf.org/html/rfc2822
[mc]: https://github.com/Kicksend/mailcheck
