autoscale: true

![](https://upload.wikimedia.org/wikipedia/commons/7/76/Dendroaspis_polylepis_%2814%29.jpg)

## [fit] Defanging Payments
## [fit] **_Taking the_** Scary **_out of_** charging credit cards

<br/>
<br/>
<br/>
<br/>
<br/>
Matt Swanson
August 9, 2016

^ Deep breath. Relax.

---

![right filtered](https://c1.staticflickr.com/1/580/23631208976_d45672032b_b.jpg)

# Credit cards are scary

* PCI Compliance
* Hard to test
* Integrations suck
* Death by poison

^ Charging credit cards is scary. There's this PCI Compliance thing that sounds scary and annoying. Accepting credit cards seems hard to test. Anytime we have to integrate with other services it can kind of suck. And it's scary because a lot of the details are unknown and might come back to bite you later if you don't plan ahead.

---

# **_The Antidote is_**
# [fit] Stripe.

^ But we don't need to be so scared. Because there is an antidote and that is Stripe. Stripe is a developer focused service for processing payments within your applications. It is awesome and let me tell you why.

---

![right filtered](https://c1.staticflickr.com/1/580/23631208976_d45672032b_b.jpg)

# PCI Compliance
* Encrypting details
* Firewalled access
* Monitor/log all access
* Redacting logs
* Routine security checks
* Formalized security policy
* Compliance of data centers
* Large fines (up to $500k)

Cost: ~$100k upfront, $30k/year

^ Take PCI Compliance. Some of the requirements seem reasonable. Encrypt credit card data, keep your data firewalled off from the internet. But other aspects just sound miserable. You've got to keep detailed logs of everyone that changes or accessed the credit card data. You have to remember to redact random places that plaintext data might live -- like server logs. You need a formalized process for security and auditing. You need to make sure the datacenter you use is also compliant. And if you mess up you could get fined or accidently leak a bunch of credit cards to the bad guys. Some estimates put the cost of becoming PCI Compliant at 100k upfront and 30k/year.

---

## **_Defanged with..._**
## [fit] Tokenization

^ The better way to go is tokenization

---

```html
<form action="" method="POST" id="payment-form">
  Card Number: <input type="text" data-stripe="number" />
  Expiration: <input type="text" data-stripe="expiration" />
  CVC: <input type="text" size="4" data-stripe="cvc" />
  <input type="submit" />
</form>
```

```javascript
// Include stripe.js
var $form = $('#payment-form');
$form.submit(function() {
  Stripe.card.createToken($form, function(response) {
    var token = response.id;

    $form.append($('<input type="hidden" name="stripeToken">').val(token));
    $form.get(0).submit();
  });

  return false;
});
```

^ Here is how it works. We let Stripe take care of being PCI Compliant. In our app, we have a form for your credit card but we don't send that to our servers. Instead we send that to Stripe and Stripe gives us back a one-time use, expiring token. We then send that token to our app and call the Stripe API with that token to charge the card. Credit card data never touches our servers so we don't need PCI Compliance. Huge bullet dodged.

---

![right filtered](https://c1.staticflickr.com/1/580/23631208976_d45672032b_b.jpg)

# Hard to test

* Card declined
* Card invalid
* Card expired
* Wrong CCV
* Wrong expiration
* Wrong billing address
* Chargeback/Disputed
* Credit? Debit? Pre-paid?

^ But charging cards also has a lot of complexity. Think about all the edge cases around credit cards. The card could be declined. The card could be invalid. It could be expired or closed out. The user might have fat-fingered the confirmation code or expiration date. The billing address might be wrong. Someone might dispute the charge. Are you testing a credit card or a debit card? What about a pre-paid Visa giftcard? These cases add up quickly and can be hard to reproduce in an isolated development environment.

---

## **_Defanged with..._**
## [fit] Test Mode

^ But it's no sweat with Stripe because they have an awesome test mode.

---

# Test Mode

* Stripe provides test card numbers

4242424242424242 -> Successful charge (Visa)
 378282246310005  -> Successful charge (Amex)
4000000000000002 -> Declined
4100000000000019 -> Declined (Fraud)
...and more

* "Live vs Test" Switch

^ Stripe provides test card numbers for every imaginable scenario. You don't have to use your personal card to test or flail around trying to find a card number that will pass validation but get declined. You can simulate all of these conditions very easily. Stripe also has a big switch you can flip to put your app into Test Mode. In this mode, everything works like normal, but no charges are actually filed. You can be confident that things will work once you go live.

---

![right filtered](https://c1.staticflickr.com/1/580/23631208976_d45672032b_b.jpg)

# Integrations suck

* Enterprise Banking Systems
* Fortan!
* SOAP XML-RPC
* Missing or outdated docs
* Syncing state between two systems

^ Historically taking payments typically meant dealing with enterprise banking systems. And just remember, the banking industry still uses Fortran for it's core systems. No thanks. Your best case was some kind of SOAP XML-RPC web service and an outdated MSWord file for documentation. And once you got the data into the system, you had to make sure everything was synced up. If your app thinks a user has an active subscription, but the payment system says the card is declined you are in for a bad time.

---

## **_Defanged with..._**
## [fit] Amazing developer 
## [fit] experience

^ But the past is the past. And Stripe is the future.

---

# Developer Experience

* JSON REST API (+ client libraries)
* The best docs I've ever read. Hands down.
* Robust webhooks to sync state

^ The developer experience is awesome. The Stripe API is well-built using modern standards. There are robust client libraries in every language. The documentation is the best I've ever read -- for any service or framework -- hands down. And syncing state is a snap because Stripe uses webhooks to relay what is happening with customer payments.

---

# Webooks

Event `charge.succeeded` ->  Update `plan.active = true`
Event `charge.failed` -> Update `plan.active = false`

```sh
Stripe sends POST /your-app/stripe with event data
```

```sh
Handle event, respond with HTTP 200
```

^ You point Stripe to a webhook endpoint in your app and you will get sent updates when a customers card is charged successfully, if the card is declined, if the card expires, or anytime anything changes. All your app needs to do is process these simple events and update the state of your app. Stripe does all the heavy-lifting around retries and error handling for you.

---

![right filtered](https://c1.staticflickr.com/1/580/23631208976_d45672032b_b.jpg)

# Death by poison
* Card expiring -> Dunning emails?
* Analytics for churn, MRR, LTV?
* Client-side UX (validation, form input)?
* 30 day trial?
* Refunds?
* Pro-rated canceling?
* Coupon codes?
* Annual billing?

^ Snakes don't kill you with the bite, it's the poison that eventually does you in. Getting a basic payment infrastructure setup with a gateway is not that bad. But all of the small other things can really kill you in the long-run. Are you sending customers an email when their card expires? Do you need to build an analytics dashboard for your key business metrics? Is your payment form well-designed? Do you have logic for trials? What happens if an unhappy customer wants a refund? How about pro-rated charges when someone cancels in the middle of a month? Got support for coupon codes? Oh, we need to bill annually too, not just monthly -- didn't they tell you?

---

## **_Defanged with..._**
## [fit] Deep understanding 
## [fit] of user needs

^ Stripe lets you skip those headaches because it was built with a deep understanding of its user's needs.

---

## **_Defanged with..._**
## [fit] Magic :crystal_ball:

^ And what I really mean is that there are some things that are just Magic.

---

# Card expired?
* Webhook + Dunning email
* "Smart cards" -> autoupdate expiration/card number

^ Your customers card expired? Easy fix: you get the webhook event and you shoot them off an email. But you know what is even easier? Stripe has arrangements with banks and the credit card companies so they can automatically update customers cards if the expiration date gets bumped or even if they have to be re-issued a new card. Let that sink in because that is a huge deal for SaaS apps.

---

# Financial metrics?

![inline](https://embedwistia-a.akamaihd.net/deliveries/5c652d077972695a04e858800b2599a5c7a57122/file.mp4)

^ Need detailed financial metrics. There is one-click integration with an app called Baremetrics that will slurp up your Stripe transactions and dashboard all the key metrics you care about.

---

# Client-side UX

![inline](https://thumbs.gfycat.com/ImpishSlushyIndri-size_restricted.gif)

^ Stripe has a drop-in form that has been optimized for conversion rates and ease of use. It's got client-side validation and even small delighters like showing the card brand as you enter the number.

---

# 30 day trial?

```ruby
Stripe::Customer.create(
  source: token, # obtained from Stripe.js
  plan: "basic_monthly",
  email: "payinguser@example.com",

  trial_end: => 1393407413 # 30 days from now
)
```

^ Need to implement a free trial? Of course you do because it's a super common thing. So Stripe makes it easy to do. Just add a timestamp for when Stripe should start charging. Oh, and they'll send you a webhook 3 days before the trial ends so you can notify your customer.

---

# All the other stuff

* Refunds? Click button on dashboard
* Pro-rated canceling? Built-in
* Coupon codes? Yep, by percent or by amount?
* Annual billing? Every N days, weeks, months, years

^ Just about everything you need is baked in -- because these are common things that nearly all software products need. So Stripe makes it easy to do the things that everyone needs to do.

---

# [fit] Snakes are scary.

# [fit] **_Taking money should_**
# [fit] **_not be scary._**

# [fit] Use Stripe.

^ In summary, snakes are scary. Taking money should not be scary. Use Stripe. It is awesome and making processing credit cards not scary.

---

# Let's have questions. Who's first?

