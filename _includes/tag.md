{% assign tag = site.tags[include.tag] %}

## Quick Start

{% for post in tag %}{% if post.category == 'quickstart' %}
  - [{{ post.title }}]({{ post.url | relative_url }}){% endif %}{% endfor %}

## FAQ

{% for post in tag %}{% if post.category == 'FAQ' %}
  - [{{ post.title }}]({{ post.url | relative_url }}){% endif %}{% endfor %}

## Blog

{% for post in tag %}{% if post.category == 'blog' %}
  - [{{ post.title }}]({{ post.url | relative_url }}){% endif %}{% endfor %}

## Lesson

{% for post in tag %}{% if post.category == 'lesson' %}
  - [{{ post.title }}]({{ post.url | relative_url }}){% endif %}{% endfor %}
