---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
---

<q>Academia and engineering are not in conflict. Only children would choose between them, i want them all.</q> &#8211;Tianhao Li

{% include base_path %}

{% for post in site.projects reversed %}
  {% include archive-single.html %}
{% endfor %}
