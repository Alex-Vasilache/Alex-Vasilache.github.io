---
title: 'Sparse NNs for Control'
collection: publications
date: 2025-09-01
permalink: /publication/2025-09-01-evolving-snn
venue: 'International Conference on Artificial Neural Networks ICANN 2025'
paperurl: '/files/2025-09-01-evolving-snn.pdf'
bibtexurl: '/files/2025-09-01-evolving-snn.bib'
permalink: /portfolio/2025-09-01-evolving-snn
image: images/favicon-192x192.png
awards: '<strong>Best Student Paper Award</strong>, ICANN 2025'
linkedin: 'https://www.linkedin.com/posts/alexandru-vasilache-99b7b8213_icann2025-beststudentpaper-bestpaperaward-activity-7374414286808444928-FLyw?utm_source=social_share_send&utm_medium=member_desktop_web&rcm=ACoAADYLuocB_1uEIUwQkpQgukX8aAn-v1Os43E'
youtube: 'https://youtu.be/Y0yKGLlRkW4?si=C_zlVfM02jfUKsmg'
githuburl: 'https://github.com/Alex-Vasilache/Spatial-SNNs'

excerpt: '
<ul>
<li>Spatial Embedding to optimize RNN topology for control tasks.</li>
<li>SOTA performance on simple tasks using 1.46% of the weights</li>
<li>66% SOTA performance on complex tasks using 0.06% of the weights (200 vs. 350.000)</li>
</ul>
'

tags:
  - Low-power

---
## Results

The following table compares our spatially embedded models to the best performing models ("expert") from the [Farama-Minari repository](https://huggingface.co/farama-minari), trained with PPO, SAC, and TQC, by analyzing their architectures and weight counts. The "RWN" column indicates the ratio of non-zero weights in the spatial SNN compared to the SOTA model, while "RP" shows the relative performance.

| Environment | SOTA Weights | Spatial Weights | RWN (%) | SOTA Performance | Spatial Performance | RP (%) |
| ----------- | ------------ | --------------- | ------- | ---------------- | ------------------- | ------ |
| Swimmer     | 9,408        | 137             | 1.46    | 363.7 ± 1.8      | 361.8 ± 1.7         | 99.48  |
| Hopper      | 347,392      | 222             | 0.06    | 4098.2 ± 247.7   | 2706.1 ± 73.7       | 66.03  |
| HalfCheetah | 384,256      | 703             | 0.18    | 17641.8 ± 61.9   | 3670.4 ± 1198.3     | 20.81  |
| Walker2d    | 359,680      | 694             | 0.19    | 6956.6 ± 15.9    | 2492.0 ± 247.7      | 35.82  |
| Ant         | 475,392      | 1,208           | 0.25    | 5846.3 ± 138.5   | 1346.8 ± 35.1       | 23.04  |