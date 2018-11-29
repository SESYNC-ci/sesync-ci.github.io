---
title: false
toc: true
order:
 - category: quickstart
   heading: Quick Start
 - category: faq
   heading: FAQ
 - category: blog
   heading: Blog
 - category: lesson
   heading: Lesson
---

{% for section in page.order %}
## {{ section.heading }}

<div class="posts">
  {% for post in site.categories[section.category] %}
  <div class="post" data-tags="[&quot;{{ post.tags | join: '&quot;,&quot;' }}&quot;]">
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
  </div>
  {% endfor %}
</div>
{% endfor %}
