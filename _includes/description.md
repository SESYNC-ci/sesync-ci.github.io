{% assign repos = site.github.public_repositories %}
{% assign lesson = repos | where:'name',include.name | first %}
{{ lesson.description }}
