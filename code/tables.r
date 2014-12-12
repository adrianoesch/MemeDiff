setwd('~/Dropbox/msssm_project/adrian/data')
list.files()
d <- read.csv(list.files()[74],header=T)
library(xtable)
library(stargazer)

getPseudoR <- function(mod){
  r2 <- 1-(mod[10]/mod[12])
  return(r2)
}

#descriptives
stargazer(subset(d,select=c(success,seed_perspref,seed_degree,seed_eigenc,seed_betweenness,
                            seed_localc)),title="Descriptive Statistics")

#normalize data for later regressions
scd <- data.frame(unlist(apply(d,2,scale)))
scd$success <- d$success

mod1 = glm(success ~ seed_degree,data=scd,family=binomial(logit))
mod2 = glm(success ~ seed_perspref,data=scd,family=binomial(logit))
mod3 = glm(success ~  seed_betweenness,data=scd,family=binomial(logit))
mod4 = glm(success ~  seed_eigenc,data=scd,family=binomial(logit))
mod5 = glm(success ~  seed_localc,data=scd,family=binomial(logit))
modall = glm(success ~ seed_degree + seed_perspref + seed_localc + seed_betweenness + seed_eigenc ,
             data=scd,family=binomial(logit))
summary(glm(success ~  seed_degree + seed_eigenc*seed_localc,data=scd,family=binomial(logit)))

stargazer(mod1,mod2,mod3,mod4,mod5,modall,title="Results Seed Characteristics")


#maximum value of neighbouring nodes
mod1 = glm(success ~ neighsmax_degree,data=scd,family=binomial(logit))
mod2 = glm(success ~ neighsmax_perspref,data=scd,family=binomial(logit))
mod3 = glm(success ~  neighsmax_betweenness,data=scd,family=binomial(logit))
mod4 = glm(success ~  neighsmax_eigenc,data=scd,family=binomial(logit))
mod5 = glm(success ~  neighsmax_localc,data=scd,family=binomial(logit))
modall = glm(success ~ neighsmax_degree + neighsmax_perspref + neighsmax_localc + neighsmax_betweenness + neighsmax_eigenc ,
             data=scd,family=binomial(logit))

stargazer(mod1,mod2,mod3,mod4,mod5,modall,title="Results Maximum Value of Neighbouring Nodes")


#neighbouring mean regression
mod1 = glm(success ~ neighs_degree,data=scd,family=binomial(logit))
mod2 = glm(success ~ neighs_perspref,data=scd,family=binomial(logit))
mod3 = glm(success ~  neighs_betweenness,data=scd,family=binomial(logit))
mod4 = glm(success ~  neighs_eigenc,data=scd,family=binomial(logit))
mod5 = glm(success ~  neighs_localc,data=scd,family=binomial(logit))
modall = glm(success ~ neighs_degree + neighs_perspref + neighs_localc + neighs_betweenness
             + neighs_eigenc , data=scd,family=binomial(logit))

stargazer(mod1,mod2,mod3,mod4,mod5,modall,title="Results Mean of Neighboring Nodes")

#correlation table of independent variables
xtable(corstarsl(subset(d,select=c(seed_perspref,seed_degree,seed_eigenc,seed_betweenness,
                                   seed_localc))))

#################### compare data sources ##############################

seedmod <- glm(success ~ seed_eigenc + seed_degree + seed_localc + seed_betweenness + seed_perspref,
               data=scd,family=binomial(logit))
neighmaxmod <- glm(success ~ seed_eigenc + seed_degree + seed_localc + seed_betweenness + seed_perspref + 
                     neighsmax_eigenc + neighsmax_degree + neighsmax_localc + neighsmax_betweenness + neighsmax_perspref,
                   data=scd,family=binomial(logit))
neighsmod <- glm(success ~ seed_eigenc + seed_degree + seed_localc + seed_betweenness + seed_perspref+
                   neighs_eigenc + neighs_degree + neighs_localc+neighs_betweenness + neighs_perspref,
                 data=scd,family=binomial(logit))
allmod <- glm(success ~ seed_eigenc + seed_degree + seed_localc + seed_betweenness + seed_perspref 
              + neighs_eigenc + neighs_degree + neighs_localc+neighs_betweenness + neighs_perspref 
              + neighsmax_eigenc + neighsmax_degree + neighsmax_localc + neighsmax_betweenness + neighsmax_perspref,
              data=scd,family=binomial(logit))

stargazer(seedmod,neighmaxmod,neighsmod,allmod)
