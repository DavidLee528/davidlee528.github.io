---
title: work
layout: page
permalink: /work
---

<style>
.publications {
  margin-top: 1.8rem;
}

.publication-year {
  margin-top: 2.6rem;
  margin-bottom: 1.4rem;
  font-weight: 700;
}

.publication-year:first-child {
  margin-top: 0;
}

.publication-item {
  margin-bottom: 0.75em;
}

.publication-title {
  line-height: 1.5;
}

.publication-authors {
  line-height: 1.5;
  color: #888;
}

.publication-authors strong {
  font-weight: 700;
}

.publication-meta {
  line-height: 1.5;
  color: #888;
}

.publication-note {
  line-height: 1.5;
  color: #888;
}
</style>


[[Google Scholar](https://scholar.google.com/citations?user=vWqek4oAAAAJ&hl=en)]
## Publications
{% include publications.html %}
## Technical Reports
{% include publications.html items=site.data.technical_reports hide_years=true %}
