---
title: "Sleep Stage and Apnea Classification from Single-Lead ECG Using Artificial and Spiking Neural Networks"
collection: publications
category: conferences
permalink: /publication/2024-12-01-sleep-apnea
excerpt: '<ul>
<li>Deep learning neuromorphic model for Sleep Stage Detection.</li>
<li>Comparison with traditional Deep Learning Model.</li>
<li>New SOTA Performance on Sleep Stage Detection.</li></ul>'
date: 2024-12-11
venue: '2024 IEEE-EMBS Conference on Biomedical Engineering and Sciences (IECBES)'
paperurl: '/files/2024-12-01-sleep-apnea.pdf'
bibtexurl: '/files/2024-12-01-sleep-apnea.bib'
awards: 'IECBES 2024 <strong>(Best Paper Award)</strong>'
authors: 'G Biri*, <strong>A Vasilache*</strong>, T Hu, M Themistocli, S Nitzsche, J Juhl, C Erler, S Fuhrhop, W Stork, J Becker'
linkedin: 'https://www.linkedin.com/posts/alexandru-vasilache-99b7b8213_bestpaperaward-ai-healthcare-activity-7283054262173978626-w5ep?utm_source=share&utm_medium=member_desktop&rcm=ACoAADYLuocB_1uEIUwQkpQgukX8aAn-v1Os43E'
header:
    teaser: '/files/2024-12-01-sleep-apnea/teaser.png'
    
---

# Architecture

We integrate LIF neurons into a Deep Convolutional Recurrent (DCR) design, maintaining the CNN structure while replacing traditional ReLU activations with LIF neurons.

<p align="center">
  <img src="/files/2024-12-01-sleep-apnea/teaser.png" alt="Architecture">
</p>
*Spiking neural network architecture showing the integration of LIF neurons in convolutional layers. Different textures represent convolution, batch normalization, LIF activation, and max-pooling operations. The dotted line indicates the temporal enhancement strategy where data passes through the backbone multiple times.*

# Temporal Enhancement Strategy

A challenge in applying spiking neurons to non-temporal dimensions of convolutional layers is generating sufficient temporal dynamics for the spiking mechanisms. To address this, the convolutional backbone processes the same input multiple times within a single forward pass. Each iteration's output is stored, and after a set number of passes, these outputs are summed before being fed to the subsequent network stage.

# Sparsity Analysis 

Analysis of the LIF layer activations across 67,200 samples revealed high sparsity in the convolutional layers (see Figure below). The three LIF layers achieved average sparsity levels of 85.51%, 80.02%, and 78.62% respectively, with a weighted average sparsity of 84.25% across all layers. This corresponds to approximately 6× reduction in synaptic activations compared to a dense ANN during a single forward pass.

<p align="center">
  <img src="/files/2024-12-01-sleep-apnea/images/ecg_spiking_output.png" alt="Activation patterns showing spiking behavior across different network layers during ECG-based sleep classification.">
</p>
*Activation patterns showing spiking behavior across different network layers during ECG-based sleep classification.*

However, the temporal repetition strategy creates a trade-off. While the 10 repetitions enable high classification accuracy, they increase the total computational load, resulting in synaptic activations that exceed a single ANN forward pass by approximately 1.6×. Reducing repetitions to fewer than six would make the SNN computationally more efficient than the ANN. Since the observed sparsity was achieved without sparsity-aware training, further computational and energy reductions are possible.

# Awards
<p align="center">
  <img src="/files/2024-12-01-sleep-apnea/images/bpa.png" alt="Best Paper Award">
</p>