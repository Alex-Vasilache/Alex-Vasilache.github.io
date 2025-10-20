---
title: "A PyTorch-Compatible Spike Encoding Framework for Energy-Efficient Neuromorphic Applications"
collection: publications
category: conferences
permalink: /publication/2025-05-01-spike-encoding
excerpt: '<ul>
<li>Open-source framework for converting numerical data into sparse signals.</li></ul>'
date: 2025-05-01
venue: 'International Conference on Systems ICONS 2025'
paperurl: '/files/2025-05-01-spike-encoding.pdf'
bibtexurl: '/files/2025-05-01-spike-encoding.bib'
awards: 'ICONS 2025 <strong>(Best Paper Award)</strong>'
authors: '<strong>A Vasilache</strong>, J Scholz, V Schilling, S Nitzsche, F Kaelber, J Korsch, J Becker'
githuburl: 'https://github.com/Alex-Vasilache/Spike-Encoding'
header:
    teaser: '/files/2025-05-01-spike-encoding/teaser.png'
---

# Spike Encoding

To reduce the amount of computation in Neural Networks on Neuromorphic Hardware, it is necessary to increase the percentage of the signal that is made up of zeros. This is because on such event-based platforms the processing time, amount of compute and power consumption are all proportional to the number of dense element multiplications. Thus, it is desirable to find signal representations that preserve information while increasing sparsity. This can be achieved through appropriate Spike Encoding.

This repository presents 4 common spike encoding algorithms (SF, BSA, PWM, LIF), as well as 2 specialized ones, a Population Coding Encoder and a Gymnasium Encoder.