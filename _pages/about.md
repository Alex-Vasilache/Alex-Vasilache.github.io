---
permalink: /
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

<section id="publications" class="archive">
<h1 class="archive__title">Highlighted Work</h1>
{% if site.author.googlescholar and site.author.orcid %}
<div class="wordwrap">You can find a full list on <a href="{{site.author.googlescholar}}">Google Scholar
    </a> or <a href="{{site.author.orcid}}">ORCID</a>.</div>
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
{% include publication-single.html %}
{% endfor %}
{% endfor %}
{% else %}
{% for post in site.publications reversed %}
{% include publication-single.html %}
{% endfor %}
{% endif %}
</section>