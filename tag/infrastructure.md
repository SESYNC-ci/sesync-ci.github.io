---
---

{% assign tagged = site.tags[page.slug] %}

### Quick Start

{% for post in tagged %}{% if post.category == 'quickstart' %}
  - [{{ post.title }}]({{ post.url }}){% endif %}{% endfor %}

### FAQ

{% for post in tagged %}{% if post.category == 'FAQ' %}
  - [{{ post.title }}]({{ post.url }}){% endif %}{% endfor %}

### Blog

{% for post in tagged %}{% if post.category == 'blog' %}
  - [{{ post.title }}]({{ post.url }}){% endif %}{% endfor %}

### Lesson

{% for post in tagged %}{% if post.category == 'lesson' %}
  - [{{ post.title }}]({{ post.url }}){% endif %}{% endfor %}
