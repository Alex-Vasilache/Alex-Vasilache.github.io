---
title: "Evolving Spatially Embedded Recurrent Spiking Neural Networks for Control Tasks"
collection: publications
category: conferences
permalink: /publication/2025-09-01-evolving-snn
excerpt: 'This paper is about evolving spatially embedded recurrent spiking neural networks for control tasks.'
date: 2025-09-01
venue: 'International Conference on Artificial Neural Networks ICANN 2025'
paperurl: '/files/2025-09-01-evolving-snn.pdf'
bibtexurl: '/files/2025-09-01-evolving-snn.bib'
header:
 teaser: '/files/2025-09-01-evolving-snn/teaser.png'
awards: 'ICANN 2025 <strong>(Best Student Paper Award)</strong>'
authors: '<strong>A Vasilache</strong>, J Scholz, Y Sandamirskaya, J Becker'
linkedin: 'https://www.linkedin.com/posts/alexandru-vasilache-99b7b8213_icann2025-beststudentpaper-bestpaperaward-activity-7374414286808444928-FLyw?utm_source=social_share_send&utm_medium=member_desktop_web&rcm=ACoAADYLuocB_1uEIUwQkpQgukX8aAn-v1Os43E'
youtube: 'https://youtu.be/Y0yKGLlRkW4?si=C_zlVfM02jfUKsmg'
githuburl: 'https://github.com/Alex-Vasilache/Spatial-SNNs'

excerpt: '<ul><li>Spatial Embedding to optimize RNN topology for control tasks.</li>
<li>SOTA performance on simple tasks using 1.46% of the weights</li>
<li>66% SOTA performance on complex tasks using 0.06% of the weights (200 vs. 350.000)</li>
</ul>
'

tags:
  - Low-power

---
# Results

The following table compares our spatially embedded models to the best performing models ("expert") from the [Farama-Minari repository](https://huggingface.co/farama-minari), trained with PPO, SAC, and TQC, by analyzing their architectures and weight counts. The "RWN" column indicates the ratio of non-zero weights in the spatial SNN compared to the SOTA model, while "RP" shows the relative performance.

| Environment | SOTA Weights | Spatial Weights | RWN (%) | SOTA Performance | Spatial Performance | RP (%) |
| ----------- | ------------ | --------------- | ------- | ---------------- | ------------------- | ------ |
| Swimmer     | 9,408        | 137             | 1.46    | 363.7 ± 1.8      | 361.8 ± 1.7         | 99.48  |
| Hopper      | 347,392      | 222             | 0.06    | 4098.2 ± 247.7   | 2706.1 ± 73.7       | 66.03  |
| HalfCheetah | 384,256      | 703             | 0.18    | 17641.8 ± 61.9   | 3670.4 ± 1198.3     | 20.81  |
| Walker2d    | 359,680      | 694             | 0.19    | 6956.6 ± 15.9    | 2492.0 ± 247.7      | 35.82  |
| Ant         | 475,392      | 1,208           | 0.25    | 5846.3 ± 138.5   | 1346.8 ± 35.1       | 23.04  |

Comparing the performance of spatial embeddings, we observed that the 2D spatial embedding generally achieved the best performance especially in less complex environments, which may represent evidence for the similar 2D sheet-like structures observed in the brain, as cortical sheets.

## Demonstrations

<table>
  <tr>
    <td align="center"><b>Ant</b></td>
    <td align="center"><b>Cartpole</b></td>
  </tr>
  <tr>
    <td><img src="/files/2025-09-01-evolving-snn/vid/ant.gif" alt="Ant"></td>
    <td><img src="/files/2025-09-01-evolving-snn/vid/cartpole.gif" alt="Cartpole"></td>
  </tr>
  <tr>
    <td align="center"><b>HalfCheetah</b></td>
    <td align="center"><b>Hopper</b></td>
  </tr>
  <tr>
    <td><img src="/files/2025-09-01-evolving-snn/vid/halfcheetah.gif" alt="HalfCheetah"></td>
    <td><img src="/files/2025-09-01-evolving-snn/vid/hopper.gif" alt="Hopper"></td>
  </tr>
</table>

A version of the code in this repository was adapted to evolve a neuromorphic controller for a physical inverted pendulum. The following video demonstrates the resulting SNN controller successfully performing the swing-up and balancing task in a real-world setting:

<p align="center">
  <img src="/files/2025-09-01-evolving-snn/vid/real_cartpole.gif" alt="Real-World Cartpole Demonstration">
</p>

Full video available on [YouTube](https://www.youtube.com/watch?v=Y0yKGLlRkW4).

The process involved training a network in a finely hand-tuned simulation of the physical environment. Furthermore, to solve the task, a handcrafted solution of two networks was requried: one for swing-up and one for balancing, with the switching point arbitrarily chosen.

The difficulty in adapting the evolutionary aproach for a real-world scenario, prompted me to start looking into sample-efficient algorithms that can be deployed to train on real-world hardware in a short amount of time, which lead me to Model-based Reinforcement Learning. 


## Sparsity Analysis

*   **Connection Sparsity:** Because of the spatial embedding and the distance dependent connectivity, the evolved Spiking Neural Networks (SNNs) is inherently sparse, having over **95% connection sparsity**.

*   **Activation Sparsity:** Because of the spiking neurons, the networks also have high temporal sparsity, with activation sparsity ranging from **66% to 80%**. This means that, on average, a neuron was inactive for the majority of timesteps.

<summary><b>Table: Spiking Activity and Activation Sparsity</b></summary>
<table>
  <thead>
    <tr>
      <th style="text-align:left">Environment</th>
      <th style="text-align:center">Spikes per Step</th>
      <th style="text-align:center">Activation Sparsity</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">Swimmer</td>
      <td style="text-align:center">(9.40 &plusmn; 0.01) &times; 10<sup>2</sup></td>
      <td style="text-align:center">80 &plusmn; 0%</td>
    </tr>
    <tr>
      <td style="text-align:left">Hopper</td>
      <td style="text-align:center">(1.12 &plusmn; 0.02) &times; 10<sup>3</sup></td>
      <td style="text-align:center">77 &plusmn; 0%</td>
    </tr>
    <tr>
      <td style="text-align:left">HalfCheetah</td>
      <td style="text-align:center">(1.47 &plusmn; 0.04) &times; 10<sup>3</sup></td>
      <td style="text-align:center">72 &plusmn; 1%</td>
    </tr>
    <tr>
      <td style="text-align:left">Walker2d</td>
      <td style="text-align:center">(1.69 &plusmn; 0.06) &times; 10<sup>3</sup></td>
      <td style="text-align:center">67 &plusmn; 1%</td>
    </tr>
     <tr>
      <td style="text-align:left">Ant</td>
      <td style="text-align:center">(3.68 &plusmn; 0.04) &times; 10<sup>3</sup></td>
      <td style="text-align:center">66 &plusmn; 0%</td>
    </tr>
  </tbody>
</table>

## Energy Evaluation

The energy efficiency of the evolved networks was estimated by comparing the SNNs on a simulated neuromorphic platform (Intel's Loihi) against the SOTA baselines on conventional hardware (x86 CPU and ARM).

*   **Synaptic Operations:** Due to their sparse activity, the SNNs required fewer synaptic operations per environment step, up to **nearly 50x fewer** than the dense SOTA models.

*   **Energy Consumption:** This reduction in operations, combined with the efficiency of the Loihi platform, resulted in massive energy savings. The SNN on Loihi consumed up to **500x less energy** than a SOTA model on an ARM processor and over **5,000x less energy** than one on a conventional CPU.

<summary><b>Table: Estimated Energy per Environment Step (Joules)</b></summary>
<table>
  <thead>
    <tr>
      <th style="text-align:left">Environment</th>
      <th style="text-align:center">Model</th>
      <th style="text-align:center">Energy (J)</th>
      <th style="text-align:left">Platform</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left" rowspan="3">Swimmer</td>
      <td style="text-align:center">SOTA</td>
      <td style="text-align:center">8.31 &times; 10<sup>-5</sup></td>
      <td style="text-align:left">CPU</td>
    </tr>
    <tr>
      <td style="text-align:center">SOTA</td>
      <td style="text-align:center">8.70 &times; 10<sup>-6</sup></td>
      <td style="text-align:left">ARM</td>
    </tr>
    <tr>
      <td style="text-align:center"><strong>Spatial SNN</strong></td>
      <td style="text-align:center"><strong>(4.91 &plusmn; 0.00) &times; 10<sup>-7</sup></strong></td>
      <td style="text-align:left"><strong>Loihi</strong></td>
    </tr>
    <tr>
      <td style="text-align:left" rowspan="3">Hopper</td>
      <td style="text-align:center">SOTA</td>
      <td style="text-align:center">3.01 &times; 10<sup>-3</sup></td>
      <td style="text-align:left">CPU</td>
    </tr>
    <tr>
      <td style="text-align:center">SOTA</td>
      <td style="text-align:center">3.15 &times; 10<sup>-4</sup></td>
      <td style="text-align:left">ARM</td>
    </tr>
    <tr>
      <td style="text-align:center"><strong>Spatial SNN</strong></td>
      <td style="text-align:center"><strong>(5.63 &plusmn; 0.00) &times; 10<sup>-7</sup></strong></td>
      <td style="text-align:left"><strong>Loihi</strong></td>
    </tr>
     <tr>
      <td style="text-align:left" rowspan="3">HalfCheetah</td>
      <td style="text-align:center">SOTA</td>
      <td style="text-align:center">3.33 &times; 10<sup>-3</sup></td>
      <td style="text-align:left">CPU</td>
    </tr>
    <tr>
      <td style="text-align:center">SOTA</td>
      <td style="text-align:center">3.48 &times; 10<sup>-4</sup></td>
      <td style="text-align:left">ARM</td>
    </tr>
    <tr>
      <td style="text-align:center"><strong>Spatial SNN</strong></td>
      <td style="text-align:center"><strong>(7.79 &plusmn; 0.01) &times; 10<sup>-7</sup></strong></td>
      <td style="text-align:left"><strong>Loihi</strong></td>
    </tr>
     <tr>
      <td style="text-align:left" rowspan="3">Walker2d</td>
      <td style="text-align:center">SOTA</td>
      <td style="text-align:center">3.12 &times; 10<sup>-3</sup></td>
      <td style="text-align:left">CPU</td>
    </tr>
    <tr>
      <td style="text-align:center">SOTA</td>
      <td style="text-align:center">3.26 &times; 10<sup>-4</sup></td>
      <td style="text-align:left">ARM</td>
    </tr>
    <tr>
      <td style="text-align:center"><strong>Spatial SNN</strong></td>
      <td style="text-align:center"><strong>(8.28 &plusmn; 0.01) &times; 10<sup>-7</sup></strong></td>
      <td style="text-align:left"><strong>Loihi</strong></td>
    </tr>
     <tr>
      <td style="text-align:left" rowspan="3">Ant</td>
      <td style="text-align:center">SOTA</td>
      <td style="text-align:center">4.11 &times; 10<sup>-3</sup></td>
      <td style="text-align:left">CPU</td>
    </tr>
    <tr>
      <td style="text-align:center">SOTA</td>
      <td style="text-align:center">4.30 &times; 10<sup>-4</sup></td>
      <td style="text-align:left">ARM</td>
    </tr>
    <tr>
      <td style="text-align:center"><strong>Spatial SNN</strong></td>
      <td style="text-align:center"><strong>(1.41 &plusmn; 0.01) &times; 10<sup>-6</sup></strong></td>
      <td style="text-align:left"><strong>Loihi</strong></td>
    </tr>
  </tbody>
</table>

The results hint at a trade-off between task performance and network sparsity. While the evolved SNNs show a performance gap on more complex tasks (largely due to their constrained size), they achieve this with extreme efficiency.

# Methods

Our framework evolves Spiking Neural Networks (SNNs) for continuous control tasks using a genetic algorithm. The core idea is to embed the neurons in a 3D space, where the connection probabilities and strengths are influenced by the distance between them. This encourages the evolution of efficient, spatially organized networks.

<p align="center">
  <img src="/files/2025-09-01-evolving-snn/img/evolution_concept_v3.png" alt="Evolution Concept">
</p>

The SNNs are composed of Leaky Integrate-and-Fire (LIF) neurons and are trained to control agents in various Gymnasium environments. The network's connectivity is determined by the Euclidean distance between neurons, promoting local connections.

<p align="center">
  <img src="/files/2025-09-01-evolving-snn/img/combined_networks.png" alt="Network Architectures">
</p>

The evolutionary process starts with a population of randomly initialized networks. In each generation, the networks are evaluated, and the best-performing individuals are selected to produce offspring through crossover and mutation. This process iteratively refines the SNNs, leading to specialized and efficient controllers.

The results from the gradient-based optimization approach demonstrate a clear trade-off between task performance, network size, and training stability. While the evolved networks show competitive performance, particularly on less complex tasks, there is a noticeable gap on more challenging environments. This is largely attributed to the constrained network size of 128 neurons and the use of a simple two-layer architecture. Future work could explore larger and more complex network structures to close this performance gap. The key advantage of this method lies in its ability to produce extremely sparse and energy-efficient solutions, making it a promising direction for resource-constrained applications.

# Future Work

A key limitation of the current study is the computational cost of the framework. Simulating larger networks, which preliminary experiments suggest would improve performance, is currently infeasible due to the implementation’s inefficiency. For this reason we are working on a JAX implementation of the current PyTorch version to allow for faster experimentation and testing of the approach.

# Awards
<p align="center">
  <img src="/files/2025-09-01-evolving-snn/img/best_paper_award_ICANN.jpg" alt="Best Paper Award">
</p>