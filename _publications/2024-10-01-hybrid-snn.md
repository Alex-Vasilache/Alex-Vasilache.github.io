---
title: "Hybrid Spiking Neural Networks for Low-Power Intra-Cortical Brain-Machine Interfaces"
collection: publications
category: conferences
permalink: /publication/2024-10-01-hybrid-snn
excerpt: '<ul>
<li>Deep learning neuromorphic model for neural decoding of primate motor commands.</li>
<li>Model optimization for resource constrained environments.</li></ul>'
date: 2024-10-01
venue: '2024 IEEE Biomedical Circuits and Systems Conference (BioCAS)'
paperurl: '/files/2024-10-01-hybrid-snn.pdf'
bibtexurl: '/files/2024-10-01-hybrid-snn.bib'
awards: 'BioCAS 2024 <strong>(Winner of 2nd Place in the Grand Challenge)</strong>'
authors: '<strong>A Vasilache*</strong>, J Krausse*, K Knoblock, J Becker'
linkedin: 'https://www.linkedin.com/posts/alexandru-vasilache-99b7b8213_biocas2024-neuraldecoding-brainmachineinterface-activity-7244721696656498689--krN?utm_source=share&utm_medium=member_desktop&rcm=ACoAADYLuocB_1uEIUwQkpQgukX8aAn-v1Os43E'
header:
    teaser: '/files/2024-10-01-hybrid-snn/teaser.png'
---

# Neural Decoding

As the name suggests, the task of neural decoding translates the activity of neurons into motor commands, and is performed by Brain Machine Interfaces.
Wireless intracortical Brain Machine Interfaces have the potential to combat the mobility issues of traditional intracortical Brain Machine Interfaces, that arise due to bulky wiring.
Despite this, wireless IBMIs still suffer due to limited data rates, and as a result, careful consideration has to be put into model design.
For this reason, in the context of the Grand Challenge for Neural Decoding, we targeted hybrid spiking neural networks for embedded neural decoding in wireless iBMIs.

# Approach
The dataset consits of recordings of motor cortex and somatosensory cortex recordings in primates, alongisde cursor movements on a screen. 

When analyzing the videos we observed that the movements can be described as having a “target-locking” behaviour, which means that every time a new target appears on the screen, it prompts a rapid goal directed movement towards it.

We thus hypothesized that in order to predict velocities of this type, maybe what one can do is not predict very fine grained continuous adjustments, but rather more coarse, discrete keypoints and then use these and interpolate the values between them. The advantage of this approachis that it simplifies the machine learning problem by reducing the resolution of the target signal.

<p align="center">
  <img src="/files/2024-10-01-hybrid-snn/images/interp.jpg" alt="Interpolation Approach">
</p>


Of course, by discretizing the signal, some information is necessarily lost during the process.
So in order to chose exactly how coarse we segment, we took the original signal and discretized it to various degrees. We then quantifyied the amount of information loss during the interpolation using the R^2 score (which has values ranging from –inf to +1, with values closer to 1 being of better quality).

<p align="center">
  <img src="/files/2024-10-01-hybrid-snn/images/interp_val.jpg" alt="Validation of Interpolation Approach">
</p>

With a 4-step discretization, the reconstruction is almost perfect within 2 decimals. Looking at 8 and 16 step discretization, we see that one can achieve up to a 16x data reduction at a cost of 0.045 R^2. This suggests that the prediction of a few keypoints along the velocity trajectory can be sufficient for accurately predicting cursor movements, while reducing the number of predicted outputs by a factor of 4, 8 or even 16, which is perfectly suited to the limited data rates available on wireless iBMIs.

# Network Architecture

In order to detect the velocity keypoints, we had to reduce and aggregate the signal from the original size, down to a lower dimension. We accomplished this by use of Temporal Convolutional Layers with pooling, allowing us to downscale the data and extract temporal information.
We then pass each data point through a recurrent layer, followed by a linear one, to finally detect the desired keypoints. We then apply linear interpolation between these to come back to the original input size.

<p align="center">
  <img src="/files/2024-10-01-hybrid-snn/images/net.png" alt="Network Architecture">
</p>

## Recurrent Layer
For the recurrent units we tested 3 different types. For the traditional ANN approach, we looked at the Gated Recurrent Unit (GRU). On the SNN side, we went with the Leaky Integrate and Fire (LIF) neuron. And for the hybrid approach, we combined the two to form the spiking Gated Recurrent Unit (sGRU).

<p align="center">
  <img src="/files/2024-10-01-hybrid-snn/images/recs.png" alt="The tested recurrent units.">
</p>

As a qualitative observation from the visual representations, it is evident that on the ANN to SNN gradient, the more closer to SNN we get, the higher the observed sparsity.

# Visualization of predicted movement

Finally, we can convert the velocity predictions of our models back to positions and visualize the predicted movement of the cursor across time, while also displaying the incoming neuron activity. The blue star displays the original trajectory, the yellow shows the GRU movement, green stands for sGRU, and red visualizes the LIF model.

<p align="center">
<video width="640" height="480" controls>
  <source src="{{ '/files/2024-10-01-hybrid-snn/video/vis.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>
</p>

As smaller velocity errors accumulate, the overall difference in position builds up over time. Despite this, the general direction and magnitude are being predicted fairly well, even by our lowest performing model, the LIF. This suggests there is potential for real-world deployment of such models.


# Awards
<p align="center">
  <img src="/files/2024-10-01-hybrid-snn/images/bpa.png" alt="Grand Challenge Award">
</p>