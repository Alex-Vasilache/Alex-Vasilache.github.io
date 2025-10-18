---
title: "Spiking Neural Networks for Low-Power Vibration-Based Predictive Maintenance"
collection: publications
category: conferences
permalink: /publication/2025-07-01-vibration-maintenance
excerpt: '<ul>
<li>The benefits of Hardware-Software co-design on energy consumption</li>
<li>Up to 4000x less estimated energy</li></ul>'
date: 2025-07-01
venue: 'International Conference on Neuromorphic Systems (ICONS) 2025'
paperurl: '/files/2025-07-01-vibration-maintenance.pdf'
bibtexurl: '/files/2025-07-01-vibration-maintenance.bib'
awards: 'ICONS 2025'
authors: '<strong>A Vasilache</strong>, S Nitzsche, C Kneidl, M Tekneyan, M Neher, J Becker'
header:
    teaser: '/files/2025-07-01-vibration-maintenance/teaser.png'

---

The approach involes integrating spiking neurons into recurrent neural architectures, applied to the industrial domain of Predictive Maintenance.

# Use Case
The methodology was applied to a vibration-based monitoring system for a Progressing Cavity Pump (PCP). The pump's eccentric and rotating motion creates specific vibration patterns that reflect its operational state. To detect deviations from normal operation, we developed a model that could identify impermissible conditions including overpressure (exceeding 12 bar discharge pressure) and cavitation (suction pressure below 0.75 bar).

<p align="center">
  <img src="/files/2025-07-01-vibration-maintenance/images/netzsch_pumpe_sy.png" alt="Progressing Cavity Pump (PCP)">
</p>

# Data Preprocessing and Spike Encoding
The preprocessing pipeline, illustrated below, converted raw accelerometer data into spike trains.

<p align="center">
  <img src="/files/2025-07-01-vibration-maintenance/images/preprocessing_grey.png" alt="Preprocessing pipeline">
</p>
*Preprocessing pipeline applied to each accelerometer axis. After global standardization, local normalization produces a normalized time series and extracts local statistics. These components are converted to spike trains using distinct encoding methods: Step-Forward encoding for the time series and Poisson rate encoding for the statistical features.*

<ul><li> <strong>Standardization:</strong> Raw data was normalized using global mean and standard deviation. Local statistics (mean and standard deviation) were extracted from each time window to capture segment-specific characteristics and later encoded as additional features. </li>
<li> <strong>Spike Encoding:</strong> The normalized signal was encoded using the Step-Forward algorithm, and the local statistics were encoded using Poisson rate encoding, with scalar values normalized to [0,1] and then rate-encoded over the time window. </li></ul>

# Recurrent SNN Architecture

The network architecture, shown below, employed a recurrent SNN and performed simultaneous regression and classification.

<p align="center">
  <img src="/files/2025-07-01-vibration-maintenance/images/thinkisense_snn.png" alt="Network Architecture">
</p>

### Energy Consumption Analysis

The model was developed for energy efficiency, achieved through activation and connection sparsity, without explicit regularization.

*   **Activation Sparsity:** The model's neurons fire in only **9.75%** of timesteps. This results in an activation sparsity of **90.25%**, which reduces computation on a neuromorphic platform.

*   **Connection Sparsity:** Achieved with pruning, leading to a **32.82%** connection sparsity.

Energy usage was estimated across different hardware platforms:

<table>
  <thead>
    <tr>
      <th rowspan="2" style="text-align:left">Device</th>
      <th colspan="3" style="text-align:center">Energy (J)</th>
    </tr>
    <tr>
      <th style="text-align:center">Total</th>
      <th style="text-align:center">Synaptic</th>
      <th style="text-align:center">Neuron</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">x86</td>
      <td style="text-align:center">1.13 &times; 10<sup>1</sup></td>
      <td style="text-align:center">1.12 &times; 10<sup>1</sup></td>
      <td style="text-align:center">4.59 &times; 10<sup>-2</sup></td>
    </tr>
    <tr>
      <td style="text-align:left">ARM</td>
      <td style="text-align:center">1.18 &times; 10<sup>0</sup></td>
      <td style="text-align:center">1.17 &times; 10<sup>0</sup></td>
      <td style="text-align:center">4.81 &times; 10<sup>-3</sup></td>
    </tr>
    <tr>
      <td style="text-align:left"><strong>Loihi</strong></td>
      <td style="text-align:center"><strong>(3.16 &plusmn; 0.33) &times; 10<sup>-3</sup></strong></td>
      <td style="text-align:center"><strong>(2.73 &plusmn; 0.33) &times; 10<sup>-3</sup></strong></td>
      <td style="text-align:center"><strong>4.33 &times; 10<sup>-4</sup></strong></td>
    </tr>
  </tbody>
</table>

*   When running on a neuromorphic chip (Loihi), the estimated energy consumption was **3.16 mJ per inference**.
*   This efficiency is a result of:
    1.  **Software-level sparsity (~15x gain):** From the combined effect of activation and connection sparsity.
    2.  **Hardware efficiency:** The Loihi platform is approximately **~300x** more energy-efficient for synaptic operations than a standard x86 CPU.
*   Together, these software and hardware optimizations produce an estimated **4100x reduction in synaptic energy** compared to an x86 processor.

When combining software-level optimizations like sparsity with specialized neuromorphic hardware,such a co-design approach can create highly efficient on-device AI.
