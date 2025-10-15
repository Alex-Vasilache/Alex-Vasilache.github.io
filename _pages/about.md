---
permalink: /
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

<section id="portfolio" class="archive">
<h2 class="archive__subtitle">Portfolio</h2>
{% include base_path %}
{% for post in site.portfolio %}
  {% include archive-single.html %}
{% endfor %}
</section>

<section id="publications" class="archive">
<h2 class="archive__subtitle">Publications</h2>
{% if site.author.googlescholar and site.author.orcid %}
<div class="wordwrap">You can also find my articles on <a href="{{site.author.googlescholar}}">my Google Scholar
    profile</a> and <a href="{{site.author.orcid}}">my ORCID profile</a>.</div>
{% endif %}

{% include base_path %}

<!-- New style rendering if publication categories are defined -->
{% if site.publication_category %}
{% for category in site.publication_category %}
{% assign title_shown = false %}
{% for post in site.publications reversed %}
{% if post.category != category[0] %}
{% continue %}
{% endif %}
{% unless title_shown %}
<h2>{{ category[1].title }}</h2>
<hr />
{% assign title_shown = true %}
{% endunless %}
{% include publication-single.html %}
{% endfor %}
{% endfor %}
{% else %}
{% for post in site.publications reversed %}
{% include publication-single.html %}
{% endfor %}
{% endif %}
</section>