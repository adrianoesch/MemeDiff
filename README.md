# MATLAB Fall 2014 – Research Plan

> * Group Name: somethingsomething
> * Group participants names: Sebastian Lechner, Adrian Oesch, Zuzana Sediva & Amrollah Seifoddini
> * Project Title: MemeDiff

## General Introduction

We decided to use the paper “Multiparameter Models of Innovation Diffusion on Complex Networks” (McCullen et al. 2013) as the basis for our project and extend their model to find the relationship between seed characteristics and the success of an innovation. The success of an innovation is given by a) the time it needs to reach the maximum acceptance within a given network and b) the proportion of nodes that accepted the innovation at equilibrium. 

## The Model

The model that McCullen et al. propose is applicable to a range of innovation diffusion models with a strong peer-to-peer component. The model represents these individuals as nodes in a network, each with a variable representing their current state of adoption of the innovation. The motivation to adopt is composed of three terms, representing personal preference, an average of each individual’s network neighbors’ states, and a system average, which is a measure of the current social trend. The adoption state of a node changes if a weighted linear combination of these factors exceeds some threshold. For extending their model we argue that every node can have different rate for getting influence from other nodes. The intuition for this parameter influence comes from paper entitled “Influentials, Networks, and Public Opinion Formation”(Watts and Dodds 2007). This paper shows that under most conditions that they consider, large cascades of influence are driven not by Influentials but by a critical mass of easily influenced individuals.  

The model which they propose is applicable to a range of innovation diffusion applications with a strong peer-to-peer component. A particular application is to individual households deciding whether to install an energy efficiency measure in their home. The model represents these individuals as nodes on a network, each with a variable representing their current state of adoption of the innovation. The motivation to adopt is composed of three terms, representing personal preference, an average of each individual’s network neighbors’ states, and a system average, which is a measure of the current social trend. The adoption state of a node changes if a weighted linear combination of these factors exceeds some threshold. For extending their model we argue that every node can have different rate for getting influence from other nodes. The intuition for this parameter comes from paper entitled “Influentials, Networks, and Public Opinion Formation”. This paper shows that under most conditions that they consider, large cascades of influence are driven not by Influentials but by a critical mass of easily influenced individuals. 

The total utility is given by (t)=(αp<sub>i</sub>+ βs<sub>i</sub>(t)+ γm(t))* I<sub>i</sub> where p<sub>i</sub> is the personal benefit, s<sub>i</sub> is the community benefit, m(t) is the mainstream social norm and I<sub>i</sub> is the degree determining how easy this node can be influenced by others. Remarkably, in this model the personal benefit p<sub>i</sub> is independent from the time. Here α+ β+ γ=1 and we choose I<sub>i</sub> randomly between 0.5-2.
Then we looked at the number of neighbors needed to induce uptake of an innovation. As u<sub>i</sub> needs to be at least θ in order for an innovation to spread to node i, one obtains the critical community benefit s<sub>i</sub><sup>x</sup> (s<sub>i</sub><sup>x</sup>=  (θ- αp<sub>i</sub>- γm(t))/β). From here one gets the required number of active contacts Y<sub>i</sub><sup>x</sup>. If Y<sub>i</sub><sup>x</sup>=0, the innovation is adopted immediately by all nodes.
In this paper, both random networks (ER network) and structured networks (Watts-Strogatz network) are studied. For us the Watts-Strogatz model is more interesting since we are concerned about the spreading of innovation between communities.
Eventually, we will observe the network in stable state and will analyses how seed characteristics relate to parameters of our model in a highly clustered network.

## Fundamental Questions

In general we would like to understand how the characteristics of the first nodes in a network that accept an innovation, also known as seeds, influence the diffusion of the very same innovation. In particular we would to know whether including a variable for the node’s i influenceability in the model of McCullen et al. will allow us replicate the finding of Watts and Doods (Watts and Dodds 2007), who showed that the success of an innovation primarily depends on to what the extent easily influenced individuals with a large node degree have accepted the innovation.


## Expected Results

Eventually, we will observe the network at steady-state and analyse how seed characteristics relate to parameters of our model in a highly clustered network. We replicate the model of Watts and Doods in a more sophisticated manner and thus expect to also observe that the success of innovation diffusion primarily depends on clusters of nodes that easily accept an innovation.


## References 

McCullen, N J, A M Rucklidge, C S E Bale, T J Foxon, and W F Gale. 2013. “Multiparameter Models of Innovation Diffusion on Complex Networks.” SIAM Journal on Applied Dynamical Systems 12 (1): 515–32. doi:10.1137/120885371.
Watts, Duncan J, and Peter Sheridan Dodds. 2007. “Influentials, Networks, and Public Opinion Formation.” Journal of Consumer Research 34 (4): 441–58. doi:10.1086/518527.




