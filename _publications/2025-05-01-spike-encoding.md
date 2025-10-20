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

To reduce the amount of computation in Neural Networks on Neuromorphic Hardware, it is necessary to increase the percentage of zeroes in the signal. This is because on such event-based platforms the processing time, amount of compute and power consumption are all proportional to the number of dense element multiplications. Thus, it is desirable to find signal representations that preserve information while increasing sparsity. This can be achieved through appropriate Spike Encoding.

## Repository

Even though many spike encoding methods are publicly available, no open-source framework or library currently groups various such algorithms and allows for straightforward integration into popular machine-learning workflows.

This repository presents 4 common spike encoding algorithms (SF, BSA, PWM, LIF), as well as 2 specialized ones, a Population Coding Encoder and a Gymnasium Encoder.

## Parameter Optimization

Since the conversion process is inherently lossy, it is necessary to optimize the parameters of the encoding method specifically to the given dataset, in order to minimize the amount of information loss. Since such a tool is not readily available, our repository adresses the need by providing a modular framework that allows the optimization of any algorithm. This is achieved by providing the inverse of each encoding function (decoding), such that an encoded signal can be reconstructed and then compared with the original one using an error metric (MSE, MAE). The parameters of the encoding algorithm can be then optimized in order to minimize the reconstruction error, thus minimizing information loss in the conversion. The implementation of the parameter tuning tool also allows extension to any other optimization criteria, such as signal sparsity, to minimize computation in event-based systems.

<p align="center">
  <img src="/files/2025-05-01-spike-encoding/images/enc-dec-opt.png" alt="Encoding-decoding optimization">
</p>
*Encoding-decoding-optimization concept showing parameter tuning effect for achieving optimal reconstruction.*

## Encoding Methods

<p align="center">
  <img src="/files/2025-05-01-spike-encoding/images/sf.png" alt="Step-Forward (SF) Encoding">
</p>
*Step-Forward (SF) Encoding: generates spikes whenever the input signal surpasses a dynamically adjusted baseline threshold. When the signal exceeds the threshold above baseline, a positive spike is emitted and the baseline is incremented by the threshold value. Conversely, if the signal drops below the threshold under the baseline, a negative spike is emitted and the baseline is decreased by the threshold value. Finally, if the signal remains within bounds, no spike occurs and the baseline remains constant. This adaptive thresholding mechanism allows the encoder to track signal variations while maintaining sensitivity to changes.*

<p align="center">
  <img src="/files/2025-05-01-spike-encoding/images/lif.png" alt="LIF Encoding">
</p>
*LIF Encoding: draws inspiration from biological neuron models. The input signal serves as a current that charges a virtual membrane potential. When this potential exceeds a predefined threshold, a spike is generated and the membrane potential resets. Between spikes, the potential decays exponentially according to a membrane time constant. This approach requires signal normalization to ensure compatibility with fixed threshold and decay parameters, making it particularly suitable for signals that fluctuate around a baseline value.*

<p align="center">
  <img src="/files/2025-05-01-spike-encoding/images/bsa.png" alt="Ben's Spiker Algorithm (BSA)">
</p>
*Ben's Spiker Algorithm (BSA): employs a more complex approach based on signal reconstruction principles. The algorithm assumes the input signal can be represented through convolution with a Finite Impulse Response (FIR) filter. At each time step, an error term quantifies the difference between the filtered spike train and the original signal. When this error exceeds a threshold, a spike is generated to minimize reconstruction error. This method requires careful parameter tuning but can achieve high reconstruction accuracy for specific signal types.*

<p align="center">
  <img src="/files/2025-05-01-spike-encoding/images/pwm.png" alt="Pulse Width Modulation (PWM) Encoding">
</p>
*Pulse Width Modulation (PWM) Encoding: compares the input signal against a periodic carrier signal, typically a sawtooth wave. Spikes are generated when the input signal exceeds the carrier signal, with the carrier frequency determining the temporal resolution of the encoding. The method requires signal normalization to ensure proper overlap between input and carrier signals.*

<p align="center">
  <img src="/files/2025-05-01-spike-encoding/images/bin.png" alt="Population Coding">
</p>
*Population Coding: uses a group of neurons to collectively represent a single value, where each neuron is tuned to a specific preferred stimulus value. An input value activates the entire population to varying degrees. The BinEncoder implements Gaussian Receptive Field (GRF)-based population coding to transform single values into multi-dimensional spike representations.*

<p align="center">
  <img src="/files/2025-05-01-spike-encoding/images/gym.png" alt="Gymnasium Encoder">
</p>
*The GymnasiumEncoder extends rate encoding methods with utility functions tailored for reinforcement learning environments, enabling direct integration with Gymnasium workflows.*

