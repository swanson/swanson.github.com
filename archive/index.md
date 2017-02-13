---
layout: post
title: Archives
skip_related: true
---

{% assign totalwords = 0 %}
{% for post in site.posts %}
  {% assign wordcount = post.content | number_of_words %}
  {% assign totalwords = totalwords | plus: wordcount %}
{% endfor %}

Since {{ site.posts.last.date | date: "%B %d, %Y" }}, I've written {{ totalwords }} words on software, product development, and professional growth. I hope you've enjoyed reading at least some of those words. My favorite posts are **bolded** below.

<div id="archive">
{% for post in site.posts %}
  {% assign currentdate = post.date | date: "%Y" %}
  {% if currentdate != date %}
    {% unless forloop.first %}</ul>{% endunless %}
<h2>{{ currentdate }}</h2>
<ul>
    {% assign date = currentdate %}
  {% endif %}
  <li {% if post.favorite and post.layout != "writeup" %}class="favorite"{% endif %}>
    <a href="{{ post.url }}">{{ post.title }}</a>
  </li>
  {% if forloop.last %}</ul>{% endif %}
{% endfor %}
</div>


