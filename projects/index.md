---
layout: post
title: Projects
subtitle: In various states of completion
skip_related: true
---

{% for project_group in site.data.projects %}
<h3 class="project-date">{{ project_group.year }} &raquo;</h3>
<ul class="posts">
  {% for project in project_group.projects %}
    <li>
      <a href="{{ project.url }}">{{ project.name }}:</a> {{ project.blurb }}
    </li>
  {% endfor %}
</ul>
{% endfor %}