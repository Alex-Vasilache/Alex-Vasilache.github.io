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
<div class="wordwrap">You can find a full list on <a href="{{site.author.orcid}}">ORCID</a>.</div>
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
{% include archive-single.html %}
{% endfor %}
{% endfor %}
{% else %}
{% for post in site.publications reversed %}
{% include archive-single.html %}
{% endfor %}
{% endif %}
</section>

<section id="awards" class="archive">
<h1 class="archive__title">Awards and Achievements</h1>
<div class="wordwrap">
<ul>
<li>Finished PhD in 3 years at the age of 26 (fastest ever in the group).</li>
<li>In 1 year of publications: 7 first-author, 3 best paper awards and 2nd place winner in the Grand Challenge on Neural Decoding at BioCAS 2024.</li>
<li>Best New Neuromorph (BNN) Nominee at the Telluride Neuromorphic Workshop.</li>
</ul>
</div>
</section>

<section id="bio" class="archive">
<h1 class="archive__title">Short Biography</h1>
<div class="wordwrap">Research Scientist at the <a href="https://www.fzi.de/en/" target="_blank" style="text-decoration: underline;">FZI Research Center for Information Technology</a> in Germany for the past 3 years. Received BS and MS at the <a href="https://www.kit.edu/english/index.php" target="_blank" style="text-decoration: underline;">KIT Karlsruhe Institute of Technology</a> in Computer Science, specializing in AI and Robotics. Currently wrapping up PhD in AI and Neuromorphic Computing at the <a href="https://www.kit.edu/english/index.php" target="_blank" style="text-decoration: underline;">KIT</a> under the supervision of Juergen Becker and co-supervision of Yulia Sandamirskaya.</div>
</section>

<section id="other-interests" class="archive">
<h1 class="archive__title">Other Interests</h1>
<div class="wordwrap">
<ul>
<li><a href="https://www.youtube.com/@alexvasi_guitar" target="_blank" style="text-decoration: underline;">Guitar</a></li>
<li><a href="https://www.artstation.com/alexvasilache" target="_blank" style="text-decoration: underline;">Drawing</a></li>
<li><a href="https://www.instagram.com/standstill_frames/" target="_blank" style="text-decoration: underline;">Photography</a></li>
<li><a href="https://www.goodreads.com/user/show/53076633-alex" target="_blank" style="text-decoration: underline;">Reading</a></li>
<li>Fitness</li>
<li>Language Learning: Romanian (Native), English (C2), German (C1), Japanese (N4)</li>
</ul>
</div>
</section>
