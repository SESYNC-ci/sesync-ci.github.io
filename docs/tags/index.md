---
---

{% for tag in site.tags %}
# <i class="fa fa-tags"></i> {{ tag[0] }}

{% for post in tag[1] %}
  - ({{post.category}}) [{{ post.title }}]({{ post.url }})
{% endfor %}
  
{% endfor %}
