---
layout: writeup
title: "Algorithms to Live By"
full_title: "Algorithms to Live By: The Computer Science of Human Decisions"
author: Brian Christian and Tom Griffiths
isbn: 1627790365
image: algorithms-live-by.jpg
categories:
- writeup
favorite: true
---

**What's the point?**

"Algorithms to Live By" covers a wide breadth of computer science and machine learning topics (caching, halting problem, Big O, Bayesian statistics, NP-completeness, etc) -- but it frames each topic as a tool for understanding or solving real-world problems. It's basically ["The Personal MBA"][mba] for computer science. The format is superb -- enough detail to get readers familiar with a concept and be able to recognize potential uses, while providing source material references for when you need to go deeper.

**What are my takeaways?**

There are a lot of problems we encounter in our personal and work life that could be solved with basic algorithms. The optimal stopping algorithm can help us know when we've seen enough candidates for a job position. Caching algorithms can help you clean out old clothes in your closet. Sometimes just doing things randomly can you get very close to an optimal result, for a fraction of the effort.

I'm less interested in sorting my sock drawer with a merge-sort, but seeing examples of how to apply algorithms served as a useful guideline for finding non-silly applications.

The chapter on Bayes' Rule was my favorite. My biggest insight was the discussion of how to consider the distribution of a system when trying to estimate. Even knowing if something is Gaussian, power-law, or Erlang distributed can have a huge impact in how we predict things.

Consider the following examples:

If a boy is currently 6 years old, how long should we predict they will live if we know nothing else about them? Since we know life expectancy is a roughly normal distribution, we should predict they will live to be a little more than 78 (the average, plus a bit more since they aren't in the far-left tail).

Now what if we need to predict how much a movie will gross at the box office given it did $12M in it's opening weekend? If we try to use the average like for predicting age, we will have a very high error because box office totals follow a power-law distribution. Instead, we should use a multiplicative factor.

I found the book to be really enjoyable and helped me breach topics that I had previously ignored because of a high barrier to entry. Coming from an engineering background (not a CS background), I really appreciate this style of teaching topics through practical examples.

[mba]: http://mdswanson.com/writeup/2012/07/25/the-personal-mba.html
