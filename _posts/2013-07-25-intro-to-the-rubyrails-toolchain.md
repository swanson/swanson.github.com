---
layout: post
title: "Intro to the Ruby/Rails Toolchain"
categories:
- blog
published: false
---

# The very basics

Ruby: a dynamic language designed to optimize programmer 
happiness; if you are from a .NET background, Ruby has the same 
role as C#

Rails: an opinionated web application framework designed to optimize
programmer productivity; some analogous frameworks in other
languages/environments: Django (Python), Laravel (PHP), ASP.NET
MVC4 (C#).

When people say "Ruby on Rails", they probably mean Rails. Since
Ruby is the only [language][1] that Rails supports, the Ruby on
Rails designator doesn't really mean much (compared to e.g. .NET
which works with C# or Visual Basic).

# Basic tools

Gems are self-contained Ruby libraries, usually designed to
perform one task. Ruby has a quirky personality so sometimes
gems have silly names &mdash; in Java an XML parsing library is
probably named `JXmlSaxParser`, but in Ruby it might be named 
something like `nokogiri` (Japanese for chainsaw).

In the context of a web application, there are gems for
authentication, form builders, improved debugging, handling file
uploads, and more. Rails itself is actually a Ruby gem.

When you install Ruby it comes with a command for installing gems
called (not surprisingly) `gem`. 

You can install gems on your system like this:

`gem install nokogiki`

The canonical source downloading and publishing gems is RubyGems.

# Dependency management

If you have ever used 3rd party dependencies in a software project,
you will understand that it can be painful to manage what exact
version of a library you are using. You also need to maintain a
list of all the dependencies in case you need to recreate your
development environment.

In Ruby, we use a tool called Bundler to manage what gems we are
using in a project. Bundler reads in a file named `Gemfile` that
tells Bundler what gems to install, what version of the gem to
use, and where to find the gems.

A sample `Gemfile` looks like this:


    source 'https://rubygems.org'
    
    gem 'rails', '4.0.0'
    gem 'pg'

When you need to add a dependency, you run `bundle install` in
the terminal. In this sample, Bundler would know to get gems
from RubyGems and to install version 4.0.0 of `rails` and install
the latest version of `pg` (a gem for connecting to a PostgreSQL
database), as well as any dependencies they need.

# Utilities

Sometimes you need to run one-off bits of code or other utilities
that are related to an app, but aren't necessarily part of the 
application.

In C, you would use a `Makefile` for things like compiling and
linking source code. Ruby uses another tool call `Rake` (short
for Ruby make).

In a Rails application, you can use the `rake` command to do
things like migrating your database:

`rake db:migrate`

Or running weekly jobs:

`rake compute_weekly_expense_report`

Or run some tests:

`rake test test/models/post_test.rb`

Rake is a gem so you can also use it in a stand-alone Ruby 
project.

# Rails Utilities

Rails comes with a few handy utilities that you will use
frequently.

Instead of having to configure Apache or IIS, you can run a
development server using:

`rails server` (`rails s` for short)

You can access a REPL for testing database queries with:

`rails console` (`rails c` for short)

# Managing Ruby Versions

Eventually, you may end up with several Rails applications
and you may be using different versions of Ruby (I have apps
running on Ruby 1.8.7, 1.9.3 and 2.0.0). There are tools that
you can use to manage which version of Ruby your project uses.

The main two (at the time of the writing) are RVM and Rbenv.
They both allow you to easily swap between multiple versions of
Ruby that are installed on your system.


[1]: Server-side language, don't get hung up on JavaScript,
CoffeeScript, etc
