---
layout: post
title: "\"Have It Your Way\" Software"
categories:
- blog
---

[Have It Your Way][ad] is an iconic slogan from Burger King.

[ad]: http://www.youtube.com/watch?feature=player_embedded&v=u4YAcsAe6UI

Letting the customer pick and chose whatever toppings and
condiments they want works really great when you are making
burgers.

Customization is good for the customer and the business. If BK
only sold hamburgers with pickles, they would lose the business
of anyone who doesn't like slimy cucumbers on their food. And 
like-wise, everyone ordering gets a burger that they like.

So when it comes to software, clients want things to be customizable
as well. After all, the users all have slightly different workflows
and want to tweak certain aspects of the tool to their own liking.

The beauty of how Burger King's customization works is that
it is the **illusion of choice**. 

Though they offer to make a burger in any way the customer wants,
there are actually a limited number of choices. And most of those
choices are isolated and independent.

You can opt out of pickles, but that has no effect on whether or
not you want ketchup. The kitchen only needs to stock eight or so
condiments that are used for every menu item they prepare.

And it is not like each customer can specify their own list of
toppings. You can't roll up and order a flame-broiled burger with
a fried egg and Sriracha (*though that would be awesome, they should
totally add that...*).

Burger King has come up with [sensible defaults][sd] and lets you
tweak your own preferences just slightly.

[sd]: http://patrickrhone.com/2010/11/08/sensible-defaults/

---

Compare to this how software customization usually works.

Take your generic invoicing software. Customers might want to
customize the stages of the invoice process: not sent, awaiting
payment, paid in full, etc.

You could probably get away with having the 8-10 most common stages,
toggling on the most common 3-4 and letting the customer opt-in to
the rest. This would be the Burger King way.

Instead, what often gets built is an `Invoice Stage List Manager`.

You can add, remove, or edit the stages - ultimate 
customization, everything is great! Except now your system is a 
whole lot more complex.

Every time you show a drop-down of all the stages, you need to do a
database query with several `joins`. You'll need admin pages to 
allow the user to manage the list of stages. You need to handle
old invoices that are in states that have since been removed (do 
you soft-delete? or de-normalize?). Do all users of the system
have permission to create new stages? Do some users have access to
different stages? What about sub-stages or stage categories? How
do you handle "bucketed" reports (what invoices are paid, out, not
paid) if the user can modify every stage? What if the user enters
a stage that is 500 characters long, is the CSS going to explode?

This is not a deathblow on it's own. But once you have the first
completely customizable field, why stop there? Why not let the
user customize the Due Date field? Don't use Net-15, Net-30, or
Net-45? We can let you bill with Net-23! All you need to do is
setup a custom Billing Rule in the Admin section (under Billing
Settings and then click Custom Rules).

If you tried this level of customization in a Burger King it would
be nuts, right?

Every new person that strolls up to the counter will have a 
different set of toppings for their burgers. How is the kitchen
supposed to keep track of all that? It would be pretty difficult
and you certainly couldn't staff a team of minimum-wage teens on
summer break.

Adding a new menu item would be a big ordeal, since the type of bun,
type of meat, list of toppings, weight, and side options might all
be customizable.

---

I recently did an estimate for a project that featured lots of
per-user customization. Compared to a stripped down version (with
sensible defaults that cover the 80% cases), the fully custom
estimate bloated to ***nearly 4x the cost***!

And we all knew that every new feature after `V1` was going to cost
more and take longer because of the added complexity.

At the end of the day, I don't think most users want to really 'Have
it their way' when it comes to software. They want to use an
app to help them achieve a goal or make more money. 

They probably will want to tweak some things to make it feel more
personalized, but all they really need is the illusion of choice
&mdash; not 27 different customizable drop-downs.

