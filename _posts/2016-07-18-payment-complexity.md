---
layout: post
title: "Payment Complexity"
categories:
- blog
tags:
- product_dev
published: false
---

I've sent the past couple of weeks building paid plans into MoraleApp -- the no-hassle team mood tracker. Services like Stripe are a huge help for the technical aspects of charging money. But the product decisions around pricing and billing are not solved problems.

The complexity of payments is almost fractal in nature. As you zoom in on any aspect, you find more and more decisions to make. All of these decisions are roughly equivalent from a technical standpoint, but the UX and business impacts can vary wildly.

Here are a few trade-offs that I've had to research, evaluate, and ultimately, wrangle into a decision:

# When do customers start paying?

Most products don't immediately provide value from the moment you sign up. Customers likely need a few days to determine if they want to pay for your product.

## Free trial
We won't charge your card until a certain point in the future. Usually the range goes from a few days up to a month or two. Ideally, the trial length should be long enough for the customer to see the full value of your product -- with some buffer to be safe.

Pros: Customers can try before they buy. There is a natural communication period to try converting trial users into full paid customers ("I see it's been a week since you started your trial and you haven't done $KEY_ACTIVITY -- can we help"?).

Cons: There is a delay in capturing revenue (potentially a cashflow issue early on). High churn (not buying after the trial expires) can cause a burden for support. Overall, not much to dislike about a free trial.

## Money Back Guarantee
A tactic that seems relatively new to SaaS products -- but has been around in the world of sales since forever ago -- is to replace the trial with a money back guarantee. This guarantee is usually longer than a trial and a good rule of thumb appears to be 2-3x the billing duration (i.e. 60-90 days for a monthly plan).

Pros: A guarantee is more favorable for the business as it relies on customers explicitly opting-out (asking for a refund) vs opting-in (converting at the end of a trial). Customers can potentially try out a product for a longer time and still pay nothing (try for 3 months, ask for refund vs 1 month free, 2 months paid, then cancel).

Cons: Potential accounting issues due to refunds. Higher barrier to registration could leave you with less users (for collecting feedback, trying A/B tests) and fewer opportunities to convert "on the fence" customers with an trial onboarding email sequence. Feels just the slightest bit sketchy.


# When do we customers to pull out their wallet?

Card upfront vs Progressive capture

If you decide to go with a trial, you'll also need to decide when to ask the user for their payment information.

## Card upfront
You can collect card information at registration time, but hold off on charging the card until the trial has ended.

Pros: Converting from trial to paid becomes opt-out ("your trial is ending, if everything is going well we'll start charging your card on file"). Simpler implementation as you can assume that any accounts that have been created have provided a card already.

Cons: This is a much higher barrier to signup and could significantly reduce the number of signups/potential customers.

## Progressive capture
Allow customers to sign up with a credit card and have them enter it "just in time" when it's time to start charging.

Pros: Lower barrier to entry that will get more people into your onboarding workflow.

Cons: Converting to paid is opt-in ("your trial is over, time to upgrade to a paid plan"). Need to consider how to handle account access when trial is over, but the customer has not upgraded to a paid plan (can they still use the app? export data? how long until they are 'deleted'?).

# To pro-rate or not? That is the question.

Changing plans: prorate or not

Customers might want to upgrade (or downgrade) their plan after they have become a paid customer. One wrinkle to think about as customers switch between plan is pro-rating: how do you handle billing when the plan changes in the middle of the billing period?

# Pro-rating plans
Pro-rating for SaaS plans will bill the customer at a rate proportional to the amount of time they were on the plan. If a customer upgrades from a $9/month plan to a $19/month plan 5 days into the month, you would bill them:

```
$9 * (5 / 31) + $19 * (26 / 31) = $17.38 pro-rated amount
```

Pros: Customers are getting exactly what they paid for (down the cent!). For large dollar amounts, pro-rating might offer significant savings. If longer term plans (annual billing) are offered, the math might work out differently.

Cons: It's confusing. Customers see a strange number on their credit card activity ($9, $9, $9, $9, $17.38?, $19, $19, $19). We might need extra logic for computing the pro-rated amount.

# Skip pro-rating
A simple option is to not do pro-rating and simply charge the customer the new amount on their next billing cycle. You can switch the customer to the new plan immediately if it has an impact on the product (more capacity, extra features). The customer will be see predictable, expected amounts billed to their card.

# Are we like the water company (metered) or the phone company (tiered)?

Metered billing vs Tiered plans

# Metered billing
This approach ties pricing to some usage metric (number of users, number of emails, number of projects, etc). Engineers love this because it makes pricing seem like an equation and we love equations :)

Pros: Customer is charged for exactly what they use. Usually straightforward to pick a metric and determine how much to charge per unit. Metered billing can align value with usage (as you use the app more, we make more money so we are incentivized to make the app better).

Cons: unpredictable monthly cost makes it hard to budget. Customers might want bulk-pricing discounts so you could end up with tiers anyway. Not every app maps nicely to metered billing (AWS pricing by CPU time makes sense, bug tracker pricing by number of bugs entered does not).

# Tiered plans

Pros: More levers to adjust pricing (adding/removing features from each plan, changing dollar amounts). Simple and consistent with most services that people use. Tiers can be helpful in creating segments in your userbase when there are clearly defined user types.

Cons: You could end up with the "Goldilocks problem" -- might be hard to find the right balance of cost and features to get it "just right".

# How often (and when) do we remind people they are paying us?

Billing Reminder vs Receipt vs Nothing

# Billing Reminder
A few days before charging a customers card, send them an email reminder ("We'll be charging your card $XX tomorrow"). 

Pros: This is a courtesy to the customer and helps build trust.

Cons: Might be annoying to customers who are already expecting to be billed. Customers that are on the fence about renewing might take this reminder as an opportunity to cancel.

# Receipt
Email customers a receipt after the fact for successful charges.

Pros: Very similar to billing reminder, but happens after charging. You'll most likely need some kind of receipt or invoice system for customers who need to expense it.

# Send nothing
You can still offer receipts/billing history in the app without notifying the customer about every time their card is charged.

Pros: The recurring revenue keeps coming in and customers are not given additional opportunities to churn.

Cons: Slightly sketchy pattern as customers might not notice recurring charges even after their use of the product has stopped.

---

The toughest part is that there are no right or wrong answers. Every product has different characteristics and each choice should be explored in your context. A money back guarantee might move the needle in one app, but hurt the bottom-line in another. Switching from card up front to progressive capture could be a huge win for your business.

The sheer number of decisions can be paralyzing so it's best to think about each option, but quickly pick a direction to start with. You can (and should) experiment with alternative down the line, but you have to start somewhere.

If you are curious, the combination I decided to start with for my product was: 30 day free trial (credit card upfront) on tiered plans (no pro-rating) with invoices/receipts available by request. In cases where I was unsure what to choose, I picked the option that required the least amount of work so that I could get paid plans in front of potential customers as soon as possible.
