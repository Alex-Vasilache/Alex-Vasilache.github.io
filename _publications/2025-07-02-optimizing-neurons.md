---
title: "Training Neural Networks by Optimizing Neuron Positions"
collection: publications
category: conferences
permalink: /publication/2025-07-02-optimizing-neurons
excerpt: '<ul><li>Spatial Embedding to reduce trainable parameters from O(N^2) to O(N)
</li>
<li>Neuron positions are optimized via backprop</li></ul>'
date: 2025-07-02
venue: 'LIVING MACHINES 2025'
paperurl: '/files/2025-07-02-optimizing-neurons.pdf'
bibtexurl: '/files/2025-07-02-optimizing-neurons.bib'
awards: 'LIVING MACHINES 2025'
authors: 'L Erb, T Boccato, <strong>A Vasilache</strong>, J Becker, N Toschi'
header: 
    teaser: '/files/2025-07-02-optimizing-neurons/teaser.png'
---

We introduce a parameter-efficient approach where
neurons are embedded within Euclidean space and their spatial positions are
optimized during training. The neurons
are organized into layers by constraining their z-coordinates, as illustrated
in the figure below, and a regularization term prevents the
layers from collapsing. By using distance-dependent wiring rules, we reduce the
training parameter complexity from $$\mathcal{O}(n^2)$$ to $$\mathcal{O}(n)$$.

<p align="center">
  <img src="/files/2025-07-02-optimizing-neurons/images/3d-ann-structure.png" alt="3D ANN Structure">
</p>
*Illustration of a three-layer feedforward network embedded in three-dimensional Euclidean space. Neurons optimize their positions within their respective two-dimensional layers while maintaining fixed z-coordinates corresponding to their layer indices.*

## Spatial Neuron Embedding

In this framework, each neuron $$i$$ is assigned a position $$\mathbf{p}_{i}=
    (x_{i} , y_{i}, z_{i}) \in \mathbb{R}^{3}$$ in three-dimensional Euclidean
space. The connection weight between any two neurons $$i$$ and $$j$$ is computed as
a differentiable function of their spatial distance:

$$w_{ij}= \frac{1}{\|\mathbf{p}_{i}- \mathbf{p}_{j}\|_{2}}$$

This formulation is inspired by the inverse relationship between conductance
$$G$$ and length $$L$$ in electrical circuits:

$$G = \frac{A}{\rho \cdot L}$$

where $$A$$ represents the cross-sectional area and $$\rho$$ is the resistivity of
the material. This biological analogy reflects how synaptic strength in neural
systems often decreases with increasing physical distance between neurons.