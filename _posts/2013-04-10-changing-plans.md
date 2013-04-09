---
layout: post
title: "Changing Plans"
categories:
- blog
---

There is some friction between agile methodologies and the desire for
upfront formal requirements that has really been bugging me lately.

I often find myself wanting to have my cake and eat it too: I want clear and
final requirements, but I don't want to be forced to design an entire system
upfront and drown in UML diagrams.

Part of this stance is due to the fear of change; the desire to not code
yourself into a corner later on in the project. No one wants to tell
their boss (or worse, their client) that they've picked a design that doesn't
accommodate the new changes that need to be made.

> You will never know less \[about your software\] than you do now. <cite style="float: right; display: block;"><a href="http://sandimetz.com/">Sandi Metz</a></cite>

This is a scary thought! 

There will never be a time on this project when you will know less about how
changes will impact the rest of the system then **right now**. Only with time 
and experience with the project will you begin to fully understand the 
consequences of your earlier design choices.

So should we just never code anything and twiddle our thumbs? Of course not.

But what can we do? What are some reasonable steps we can take to build a 
flexible system (but not end up with a pile of XML configuration files)?

### Recognize and manage dependencies

Dependency Injection (DI) gets a bad wrap and that is mainly because of some 
hairy DI *frameworks* that do a bunch of auto-wiring and other black magic. The 
principle of Dependency Injection is actually pretty simple: pass in objects 
you depend on as arguments.

Change from this:

{% highlight csharp %}
public class Appraisal {
  private ComicBook comicBook { get; set; }

  public Appraisal(long comicBookId) {
    comicBook = new ComicBookFinder.FindById(comicBookId);
  }

  public Money ComputePrice() {
    var percentageModifier = new ComicBookGrader.Grade(comicBook.condition);
    return comicBook.ListPrice * percentageModifier;
  }
}
{% endhighlight %}

to this:

{% highlight csharp %}
public class Appraisal {
  private ICollectible collectible { get; set; }
  private IGrader collectableGrader { get; set; }

  public Appraisal(ICollectable collectible, IGrader collectableGrader) {
    this.collectible = collectible;
    this.collectableGrader = collectableGrader;
  }

  public Money ComputePrice() {
    var percentageModifier = collectableGrader.Grade(collectible.condition);
    return collectible.ListPrice * percentageModifier;
  }
}
{% endhighlight %}

Did I have to define a Registry in an XML file? Is there some DI Container
framework I have to setup? Nope, just a constructor argument.

Maybe we never need to appraise other types of collectibles with this app. But 
it was a trivial change and it will save us later down the road when the client 
now wants to expand to include Action Figures.

And as a nice little bonus, the second version is way easier to test.

### Build re-usable modules

Single Responsibility Principle (SRP) is another hotly-debated pattern in 
software design. I think this is because it is really damn confusing. 

If you are asked, "What is the Single Responsibility of this class?" and you
respond with "Well, it manages all of the business logic. That is the one thing
it does!", you will probably get yelled at.

If you trace the [origin story of SRP][rdd], however, you will find the intention 
is a class that "has responsibilities that fulfill its purpose". Nothing about one
discrete job, but rather that the class as a whole is cohesive.

[rdd]: http://en.wikipedia.org/wiki/Responsibility-driven_design

Well great! Except what the heck is a "cohesive class"?

[Sandi Metz][poodr] has an interesting technique that has been helpful to me: 
to help identify if a class is cohesive or not, imagine it as someone you are
interrogating. For each public method, ask the object in the form of a question:

[poodr]: http://www.poodr.info/

{% highlight csharp %}
public class QuarterlySalesReport {
  public FiscalQuarter SalesQuarter() { ... }
  public IEnumerable<Sales> AllSales() { ... }
  public Product MostProfitableProduct() { ... }
}
{% endhighlight %}

"Mr. `QuarterlySalesReport`, what sale quarter are you for?"

"Mr. `QuarterlySalesReport`, what are all of your sales?"

"Mr. `QuarterlySalesReport`, what was the most profitable product?"

The first two questions seem reasonable. 

The third seems a bit out of place. There are many other objects that you might 
want to ask this same question to &mdash; a `YearlySalesReport`, a 
`StoreSalesReport`, a `ProductCatalogue`, etc.

Instead, we could ask the `QuarterlySalesReport` for the list of sales and pass
that to a `ProfitCalculator`. When the company expands over-seas and we have
to consider international tariffs and customs fees when calculation our profit,
we will be thankful we only need to make changes in one place.

If you find that your class has questions that don't seem reasonable, this is a
sign that your class is not cohesive and is holding on to too much behavior. Try
extracting that logic in a smaller, re-usable piece.

---

Changing requirements will happen. We cannot anticipate how a project's plan may
change, but we can take modest steps to make our systems more flexible and
better equipped to handle it.

Do not fear change, but rather embrace it and accept that it is a part of the 
process.

Software that doesn't change is software that isn't used. And I, for one, would
much rather work on projects that are actually used than a perfectly specified 
piece of adandonware.
