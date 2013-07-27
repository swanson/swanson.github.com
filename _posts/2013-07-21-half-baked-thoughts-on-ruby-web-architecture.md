---
layout: post
title: "Half-Baked Thoughts on Ruby Web Architecture"
categories:
- blog
---

Some half-baked ideas I've been playing around with on my Ruby projects recently.

# Informal DCI

I got really into DCI a few months ago. I picked up [Clean Ruby][cr] and acquired a copy of 
[Lean Architecture][la] (didn't make it past page 10), but I need to explore most ideas in actual
code instead of books.

[cr]: http://www.clean-ruby.com/
[la]: http://www.leansoftwarearchitecture.com/

The idea of DCI &mdash; as I have cystallized it &mdash; is to extract behavior into groups
of roles or actions and then inject this new behavior into objects. 

The canonical example, instead of this:

{% highlight ruby %}
class User < ActiveRecord::Base
  attr_accessible :email, :name

  ... bunch of validators ...

  ... tons of other crap ...

  def approve(request)
    request.state = :approved
    ApprovalMailer.send_approval_mail(request)
  end
end

user.approve(request)
{% endhighlight %}

Do something like this:

{% highlight ruby %}
class User < ActiveRecord::Base
  ... only user model stuff ...
end

class Approver
  def approve(request)
    request.state = :approved
    ApprovalMailer.send_approval_mail(request)
  end
end

user.extend(Approver)
user.approve(request)
{% endhighlight %}

It is now easier to test the `Approver` behavior in isolation, `User` becomes less of a junk
drawer, it sort of makes more sense from a real-world sense since a user will be acting as 
an approver in some contexts (and maybe acting as a `Moderator` or something in another context).

I've seen some people [arguing for a convention][call] were all of the behavior roles have a method
called `call`. This seems really silly to me and I can't think of a good reason for it (and
the reason against it is that it hurts readability). I've also read arguments that using `extend`
really screws up the "method cache" and is [apparently bad][busted].

So for a while I was in this weird state: I liked the idea of DCI but none of the implementations
felt right. And if it didn't feel right, I knew I wasn't going to stick with it.

I tried to take some of the ideas about roles and behavior extraction in a slightly different way.
I looked at some of the Command/Query stuff that seems to be more popular in .NET-land and tried
building an app using Commands (or Use Cases, there is so much overloaded terminology it is
maddening).

This style felt right to me. I was writing a bunch of small, super focused classes to do some work.
My controllers were pretty simple and I stopped testing them for the most part.

Some examples from my [RSS reader][stringer] (small Sinatra app):

[stringer]: https://github.com/swanson/stringer

{% highlight ruby %}
class MarkAsRead
  def initialize(story_id, repository = StoryRepository)
    @story_id = story_id
    @repo = repository
  end

  def mark_as_read
    @repo.fetch(@story_id).update_attributes(is_read: true)
  end
end

post "/stories/mark_all_as_read" do
  MarkAllAsRead.new(params[:story_ids]).mark_as_read
  
  redirect to("/news")
end
{% endhighlight %}

{% highlight ruby %}
class ImportFromOpml
  ONE_DAY = 24 * 60 * 60

  def self.import(opml_contents)
    feeds = OpmlParser.new.parse_feeds(opml_contents)

    feeds.each do |feed|
      Feed.create(name: feed[:name],
                  url: feed[:url],
                  last_fetched: Time.now - ONE_DAY)
    end
  end
end

post "/feeds/import" do
  ImportFromOpml.import(params["opml_file"][:tempfile].read)

  redirect to("/setup/tutorial")
end
{% endhighlight %}

I combined these command/use-case things with Repositories and wrote most of the
test as isolated unit tests &mdash; super fast to run because I mock out the database...well,
and I'm not using Rails so they are pretty fast already.

# Persistence Layer Separation

Repositories seem like a natural fit given the recent change of heart about Fat Models from
the Rails community. Again, my experience with this pattern comes from .NET, but the basic idea
is use a class to get a group of domain objects out of a database. I think about a Repository
as a group of Query objects with a common theme (usually the underlying model).

The code looks like:

{% highlight ruby %}
class StoryRepository
  def self.read(page = 1)
    Story.where(is_read: true).includes(:feed)
      .order("published desc").page(page).per_page(20)
  end
end
{% endhighlight %}

Instead of using a `scope` or putting more methods on `Story`, we just do the querying behind
a clean `StoryRepository#read` interface. This is definitely not common in the Rails apps I've
seen. I really like using this pattern: my controller isn't cluttered with sort order or pagination
stuff, my model doesn't need to know every possible way a caller wants to query it, I can
stub out that nasty method chain in a test easily.

This feels kind of strange for `ActiveRecord` based applications &mdash; since the domain objects
and the data mapping are the same thing, `ActiveRecord::Base` subclasses. In my experience
with other tools like `NHibernate` you have dumber domain objects and explicit mapping objects
that link up database columns to properties.

This separation comes with trade-offs: the Rails Way is quicker to code up (with just one class)
but you end up with hard coupling to the database whenever you create domain objects (not good
for tests). Maybe the [Ruby Object Mapper][rom] project will bring more popularity to splitting out
domain models and mapping objects.

I haven't really found a good solution for this yet. My latest exploration was just stubbing the
Repository methods to return `OpenStruct`-like objects built in test factories.

# Dependency Injection

DI is so easy in Ruby and really helps with testing. I don't think I would ever go without it
anymore. I also like how glaringly obvious your dependencies become when you use injection.

{% highlight ruby %}
class FeedDiscovery
  def discover(url, finder = Feedbag, parser = Feedzirra::Feed)
    ...
  end
end
{% endhighlight %}

I could lie and say that this pattern is handy if I ever need to swap out gems, but who am I 
kidding? That never actually happens. Since Ruby allows for default arguments there is really 
no downside to this style of coding &mdash; the calling interface is the same but I can test much 
easier. Win, win.

# Controller Callbacks

The biggest problem I had with my use-case/command style was that handling more than the happy
path flow in the controller got clunky. I see two possible solutions to look into: returning
result objects or some kind of callbacks on the controller.

Result objects seem like the more tame path. Define some convention for status, probably a hash
with keys like `:status`, `:errors`, and `:model` and then handle that in the controller.

{% highlight ruby %}
def create
  result = AddFeedSubscription.subscribe(params[:feed])

  if result[:status] == :success
    flash[:success] = "Subscribed!"
    redirect_to result[:model]
  else
    flash[:errors] = result[:errors]
    render "new"
  end
end
{% endhighlight %}

I don't think this is a bad approach and probably what I would do with a team larger than 2.

The other approach, which I first saw in Hexagonal Rails, is to pass the controller as an 
argument and call methods on it.

{% highlight ruby %}
def create
  result = AddFeedSubscription.new(self, params[:feed]).subscribe
end

private
  def subscription_succeeded(subscription)
    flash[:success] = "Subscribed!"
    redirect_to subscription
  end

  def subscription_failed(subscription)
    flash[:errors] = subscription.errors
    render "new"
  end
end

class AddFeedSubscription
  def initialize(callback, params)
    @callback = callback
    @params = params
  end

  def subscribe
    ... some work ...

    @callback.subscription_succeeded(subscription)
  end
end
{% endhighlight %}

This seems kind of inside-out, but something feels right about it to me. If you are going to have
more than a if/else branch in the controller action, then the callbacks seem like they might be a
win.

And controller testing can mostly go out the window. Throw in a double for callback and keep the
actual callbacks simple and mostly framework plumbing and I think you have a recipe for good design.

This idea seems to be the one advocated by the [DCI in Ruby sample application][dci-sample], which
is the closest resource I've found that mirrors my own preferences and findings.

# What's still stewing?

Decorators/Presenters/View Models - I think if you are going all-in on view models then you should
use something logicless, but that means Liquid right now for your templating. I can't imagine
building a whole app using Liquid and not wanting to pull my hair out.

Client-side JS - Can this co-exist with a typically server side app? Or are you in for a world of
hurt if you don't put clients-ide MVC as the first class citizen and just build a JSON API backend?
My limited experience trying to use Backbone with Sinatra was painful, but workable.

[dci-sample]: http://dci-in-ruby.info/technical_overview.html
[rom]: https://github.com/rom-rb
[call]: http://mikepackdev.com/blog_posts/24-the-right-way-to-code-dci-in-ruby
[busted]: http://tonyarcieri.com/dci-in-ruby-is-completely-broken
