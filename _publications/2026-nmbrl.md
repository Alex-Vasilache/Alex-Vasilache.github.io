---
title: "Efficient Model-Based RL"
header:
    teaser: '/files/2026-nmbrl/teaser.png'
collection: publications
category: conferences
permalink: /wip/2025-nmbrl
excerpt: '<ul><li>Model-based RL based on Dreamer.</li>
</ul>'
awards: 'Telluride Neuromorphic Workshop 2025 <strong>(Project Leader)</strong>'
authors: '(Work in Progress)'
githuburl: 'https://github.com/Alex-Vasilache/NMBRL'
---
This project implements a model-based reinforcement learning (MBRL) framework that uses a Gated Recurrent Unit (GRU)-based recurrent neural network to approximate environment dynamics. The system operates in a closed loop, where a world model is continuously updated from collected experience data while an agent trains within the simulated environment. This approach, demonstrated on the CartPole swing-up task, enables agent training through internal simulation for improved sample efficiency. 

The framework is designed as a foundation for developing future MBRL systems on neuromorphic and embedded hardware for real-world applications. The final goal is to enable computational efficiency for Model-based RL algorithms.

![Concept](/files/2026-nmbrl/img/concept.png)

## Results

The following visualizations demonstrate the core components of the trained system.

**1. World Model Prediction**

The animation below shows the world model's prediction of the CartPole's next states and rewards based on a given actions, overlaid with the actual outcome from the environment.

![World Model Visualization](/files/2026-nmbrl/vid/world_model_vis.gif)

The plots below provide a more detailed view of the world model's accuracy, comparing the predicted values against the actual values for each state variable and the reward over a sequence of steps.

![State Comparison](/files/2026-nmbrl/img/state_comparison_combined.png)
![Reward Comparison](/files/2026-nmbrl/img/reward_comparison_combined.png)

**2. Trained Agent Performance**

This animation shows the final agent, trained entirely within the world model's "imagination," successfully performing the CartPole swing-up and balancing task in the real environment.

![Agent Performance](/files/2026-nmbrl/vid/evaluation_combined.gif)