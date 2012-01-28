---
layout: post
title: "Let's build a Ruby mocking framework! Sorta...kinda?"
categories:
- blog
---

For whatever reason, I was thinking about mocking and stubbing the other day.

It's pretty cool that testing librarys allow such fine-grain control of 
objects under test. It's powerful to be able to write tests with
functionality like:

	stubbedObj.expect("foo").willReturn(123)
	mockObj.expect("bar").withArgs("baz").toBeCalled(4).shouldReturn(null)

    
I got to thinking about how you would actually implement such a library. I
wanted to explore some concepts of metaprogramming - but I didn't want to 
see what something like NUnit or RSpec did under the hood. That would be
cheating; I wanted to see if I could figure out an approach that might work
on *my own*.

I sat down to try out some ideas and quickly discovered that trying to 
duplicate all the functionality of a mocking/stubbing framework is hard
work. Certainly harder than I wanted to spend on a toy exercise on a Friday
evening!

So I settled on trying to implement a basic Stub.

My idea:

* Make a class StubbedFoo that derives from Foo
* Intercept all methods called on StubbedFoo before they went to Foo
* Return a canned response based on the method name
* Allow method/response pairs to be added to StubbedFoo

Here's the mostly-working toy implementation in Ruby (took me about 90 
minutes):

<script src="https://gist.github.com/1692237.js">
</script>

I used Ruby's `undef` to undefine the instance methods of the class
under test on-the-fly. I then build up a `@canned_responses` hash that uses
the method name (as a symbol) for the key.

When you try to call a method (like `Statistics#compute_average`) it hits 
the stub's `method_missing` (since that method is now Undefined). The stub
simply returns the canned value from the hash or raises an exception if there
is no response setup.

I tried to figure out how to structure the code so I could just mix it into
a class, instead of deriving directly - but I couldn't get it working. Any
tips would be appreciated!

I've only scratched the surface of what you can do with 
metaprogramming but I think this was a worthwhile exercise. I learned 
some new Ruby tricks and challenged myself to think about how code I take for 
granted is actually implemented.