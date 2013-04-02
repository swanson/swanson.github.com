---
layout: post
title: "More Complicated Than It Needs To Be"
categories:
- blog
---

> Once you’ve hit the point where a simpler pattern isn’t working for you anymore and you
> have to start using the more complicated one, \[there’s a natural tendency\] to then 
> always reach for the complicated one in other situations where the simple one would 
> be just fine.
> <cite style="float: right;"><a href="http://rubyrogues.com/097-rr-book-club-patterns-of-enterprise-architecture-with-martin-fowler/">Martin Fowler</a></cite>

The Boss needs an app to capture employee suggestions --- we can't use a cardboard box with 
a cut-out slot, we are a software company!

{% highlight ruby %}
class SuggestionsController < ApplicationController::Base
  before_filter :authenticate!
  before_filter :boss_only, except: [:new, :create]

  def index
    @suggestions = Redis.find_by_key("suggestions")
    
    unless @suggestions
      @suggestions = Respository.for(:suggestion).all

      Resque.enqueue(CacheSuggestionJob, @suggestions)
      Logger.log(I18n.t(:cache_not_warm))
    end

    @suggestions = SuggestionDecorator.decorate_collection(@suggestions)
  end

  def new
    @suggestion = FormBuilder.for(:suggestion)
  end

  def create
    @suggestion = Suggestion.new params.require(:idea).permit(:category)

    if @suggestion.valid?
      current_user.extend SuggestionSubmitter
      current_user.suggest(@suggestion)

      Resque.enqueue(NotifyBossJob, @suggestion) unless current_user.intern?
      Resque.enqueue(AddToDailyEmailDigestJob, @suggestion)

      flash[:success] = I18n.t(:thank_you)
      redirect_to root_url
    else
      Logger.log(I18n.t(:invalid_suggestion_attempt), 
                 current_user, @suggestion)
      
      flash[:error] = @suggestion.error_messages
      render :new
    end
  end
end
{% endhighlight %}


Sometimes simple is better.

{% highlight ruby %}
class SuggestionBox < Sinatra::Base
  get "/" do
    erb :form
  end

  post "/suggest" do
    suggestion = "#{params[:idea]} #{params[:category]}\n"

    # The Boss ♥'s Dropbox
    system("echo '#{suggestion}' >> ~/Dropbox/suggestion_box.txt")

    flash[:success] = "Thanks!"
    redirect to("/")
  end
end
{% endhighlight %}