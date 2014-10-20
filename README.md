# MATLAB Fall 2014 – Research Plan
(text between brackets to be removed)

> * Group Name: somethingsomething
> * Group participants names: Sebastian Lechner, Adrian Oesch, Zuzana Sediva & Amrollah Seifoddini
> * Project Title: MemeDiff

## General Introduction

We decided to use paper “Multiparameter Models of Innovation Diffusion on Complex Networks” as the base theory for our project and extend their model to find the relation between seed characteristics and model parameters in clustered networks.

## The Model

The model which they propose is applicable to a range of innovation diffusion applications with a strong peer-to-peer component. A particular application is to individual households deciding whether to install an energy efficiency measure in their home. The model represents these individuals as nodes on a network, each with a variable representing their current state of adoption of the innovation. The motivation to adopt is composed of three terms, representing personal preference, an average of each individual’s network neighbors’ states, and a system average, which is a measure of the current social trend. The adoption state of a node changes if a weighted linear combination of these factors exceeds some threshold. For extending their model we argue that every node can have different rate for getting influence from other nodes. The intuition for this parameter comes from paper entitled “Influentials, Networks, and Public Opinion Formation”. This paper shows that under most conditions that they consider, large cascades of influence are driven not by Influentials but by a critical mass of easily influenced individuals.  

## Fundamental Questions

Our proposed model explains the diffusion of innovation using a threshold model. In a threshold model a node i accepts an innovation if the utility gain u from accepting exceeds a certain threshold θ.


## Expected Results

The total utility is given by (t)=(αp_i+ βs(t)+ γm(t))*w-i where p_i is the personal benefit, s_i is the community benefit, m(t) is the mainstream social norm and w_i is the degree determining how easy this node can be influenced by others. Remarkably, in this model the personal benefit p_i is independent from the time. Here α+ β+ γ=1 and we choose w_i randomly between 0.5-1.5.
Then we looked at the number of neighbors needed to induce uptake of an innovation. As u_i needs to be at least θ in order for an innovation to spread to node i, one obtains the critical community benefit s^* (s^*=  (θ- αp_i- γm(t))/β
From here one gets the required number of active contacts Y_i^*. If Y_i^*=0, the innovation is adopted immediately by all nodes.
In this paper, both random networks (ER network) and structured networks (Watts-Strogatz network) are studied. For us the Watts-Strogatz model is more interesting since we are concerned about the spreading of innovation between communities.
Eventually, we will observe the network in stable state and will analyses how seed characteristics relate to parameters of our model in a highly clustered network.


## References 

Mccullen, N. J., Rucklidge, A. M., Bale, C. S. E., Foxon, T. J., & Gale, W. F. (2013). Multiparameter Models of Innovation Diffusion on Complex Networks, 12(1), 515–532.
Watts, D. J., Dodds, P. S., & Dodds, P. S. (2014). Formation, 34(4), 441–458.


## Research Methods

Agent-Based Model
