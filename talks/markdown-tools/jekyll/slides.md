!SLIDE bullets
#Jekyll
* Static site/blog generator
* Templates, categories
* Lightweight

!SLIDE
#Sample Jekyll project
    @@@
    .
    |-- _config.yml
    |-- _layouts
    |   |-- default.html
    |   `-- post.html
    |-- _posts
    |   |-- 2007-10-29-post-one.markdown
    |   `-- 2009-04-26-post-two.markdown
    |-- _site
    `-- index.html

!SLIDE
#YAML Front Matter
    @@@ Ruby
    ---
    layout: post
    title: Blogging Like a Hacker
    permalink: hacker-blogging
    categories: 
    - rants
    - tools
    ---

## All files with this section
## will be run through the parser

!SLIDE
#Templates
    @@@
    {% for post in site.categories.blog %}
      <li>
        <span>
          {{ post.date | date_to_string }}
        </span> 
        <a href="{{ post.url }}">
          {{ post.title }}
        </a>
      </li>
    {% endfor %}

        
