# MATLAB Fall 2014 – Research Plan

> * Group Name: somethingsomething
> * Group participants names: Sebastian Lechner, Adrian Oesch, Zuzana Sediva & Amrollah Seifoddini
> * Project Title: MemeDiff

## General Introduction

We decided to use the paper “Multiparameter Models of Innovation Diffusion on Complex Networks” (McCullen et al. 2013) as the basis for our project and extend their model to find the relationship between seed characteristics and the success of an innovation. The success of an innovation is given by a) the time it needs to reach the maximum acceptance within a given network and b) the proportion of nodes that accepted the innovation at equilibrium. 

## The Model

The model that McCullen et al. propose is applicable to a range of innovation diffusion models with a strong peer-to-peer component. The model represents these individuals as nodes in a network, each with a variable representing their current state of adoption of the innovation. The motivation to adopt is composed of three terms, representing personal preference, an average of each individual’s network neighbors’ states, and a system average, which is a measure of the current social trend. The adoption state of a node changes if a weighted linear combination of these factors exceeds some threshold. For extending their model we argue that every node can have different rate for getting influence from other nodes. The intuition for this parameter influence comes from paper entitled “Influentials, Networks, and Public Opinion Formation”(Watts and Dodds 2007). This paper shows that under most conditions that they consider, large cascades of influence are driven not by Influentials but by a critical mass of easily influenced individuals.  

The total utility is given by <img src="http://www.sciweavers.org/tex2img.php?eq=%20u_%7Bi%7D%20%28t%29%3D%28%20%5Calpha%20%20p_%7Bi%7D%20%2B%20%5Cbeta%20s_%7Bi%7D%28t%29%2B%20%20%5Cgamma%20m%28t%29%29%2A%20I_%7Bi%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt=" u_{i} (t)=( \alpha  p_{i} + \beta s_{i}(t)+  \gamma m(t))* I_{i} " width="271" height="19" /> where <img src="http://www.sciweavers.org/tex2img.php?eq=%20p_%7Bi%7D&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt=" p_{i}" width="21" height="17" /> is the personal benefit, <img src="http://www.sciweavers.org/tex2img.php?eq=s_%7Bi%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="s_{i} " width="18" height="15" /> is the community benefit, <img src="http://www.sciweavers.org/tex2img.php?eq=m%28t%29&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="m(t)" width="42" height="18" /> is the mainstream social norm and <img src="http://www.sciweavers.org/tex2img.php?eq=I_%7Bi%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="I_{i} " width="13" height="18" /> is the degree determining how easy this node can be influenced by others. Remarkably, in this model the personal benefit p<sub>i</sub> is independent from the time. Here <img src="http://www.sciweavers.org/tex2img.php?eq=%20%5Calpha%20%2B%20%20%5Cbeta%20%2B%20%5Cgamma%20%20%3D%201&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt=" \alpha +  \beta + \gamma  = 1" width="110" height="19" /> and we choose <img src="http://www.sciweavers.org/tex2img.php?eq=I_%7Bi%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="I_{i} " width="13" height="18" /> randomly between 0.5-2.
Then we looked at the number of neighbors needed to induce uptake of an innovation. As u<sub>i</sub> needs to be at least θ in order for an innovation to spread to node i, one obtains the critical community benefit <img src="http://www.sciweavers.org/tex2img.php?eq=%20s_%7Bi%7D%5E%7B%2A%7D&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt=" s_{i}^{*}" width="22" height="25" />, <img src="http://www.sciweavers.org/tex2img.php?eq=%20s_%7Bi%7D%5E%7B%2A%7D%3D%20%5Cfrac%7B%20%5Ctheta%20-%20%20%5Calpha%20%20p_%7Bi%7D%20-%20%20%5Cgamma%20m%28t%29%20%20%7D%7B%20%5Cbeta%20%7D%20%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt=" s_{i}^{*}= \frac{ \theta -  \alpha  p_{i} -  \gamma m(t)  }{ \beta }  " width="174" height="47" />. From here one gets the required number of active contacts Y<sub>i</sub><sup>x</sup>. If Y<sub>i</sub><sup>x</sup>=0, the innovation is adopted immediately by all nodes.
In this paper, both random networks (ER network) and structured networks (Watts-Strogatz network) are studied. For us the Watts-Strogatz model is more interesting since we are concerned about the spreading of innovation between communities.
Eventually, we will observe the network in stable state and will analyses how seed characteristics relate to parameters of our model in a highly clustered network.

## Fundamental Questions

In general we would like to understand how the characteristics of the first nodes in a network that accept an innovation, also known as seeds, influence the diffusion of the very same innovation. In particular we want to know whether including a variable for the node’s i influenceability in the model of McCullen et al. will allow us replicate the finding of Watts and Doods (Watts and Dodds 2007), who showed that the success of an innovation primarily depends on to what extent, easily influenced individuals with a large connectivity degree have accepted the innovation.


## Expected Results

Eventually, we will observe the network at steady-state and analyse how seed characteristics relate to parameters of our model in a highly clustered network. We replicate the model of Watts and Doods in a more sophisticated manner and thus expect to also observe that the success of innovation diffusion primarily depends on clusters of nodes that easily accept an innovation.


## References 

* McCullen, N J, A M Rucklidge, C S E Bale, T J Foxon, and W F Gale. 2013. “Multiparameter Models of Innovation Diffusion on Complex Networks.” SIAM Journal on Applied Dynamical Systems 12 (1): 515–32. doi:10.1137/120885371.
* Watts, Duncan J, and Peter Sheridan Dodds. 2007. “Influentials, Networks, and Public Opinion Formation.” Journal of Consumer Research 34 (4): 441–58. doi:10.1086/518527.




