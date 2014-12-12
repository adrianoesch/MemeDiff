# set current working directory first!

# setwd('~/Dropbox/msssm_project/adrian/data')
# list.files()
d <- read.csv('data/results_(3-6-1)_th-0.262_suc-0.104_08-Dec-2014 17-34-20.csv')
scd <- data.frame(unlist(apply(d,2,scale)))
scd$success <- d$success
source('functions.r')
mean(d$success)

############### seeds ###############

summary(glm(success ~ seed_degree,data=scd,family=binomial(logit)))
summary(glm(success ~ seed_perspref,data=scd,family=binomial(logit)))
summary(glm(success ~  seed_betweenness,data=scd,family=binomial(logit)))
summary(glm(success ~  seed_eigenc,data=scd,family=binomial(logit)))
summary(glm(success ~  seed_localc,data=scd,family=binomial(logit)))

summary(glm(success ~ seed_degree + seed_perspref + seed_localc + seed_betweenness + seed_eigenc ,
            data=scd,family=binomial(logit)))

####################### neighs #######################

summary(glm(success ~  neighs_perspref,data=scd,family=binomial(logit)))
summary(glm(success ~  neighs_localc,data=scd,family=binomial(logit)))
summary(glm(success ~  neighs_degree,data=scd,family=binomial(logit)))
summary(glm(success ~  neighs_eigenc,data=scd,family=binomial(logit)))
summary(glm(success ~  neighs_betweenness,data=scd,family=binomial(logit)))

summary(glm(success ~ neighs_degree + neighs_perspref + neighs_localc + neighs_eigenc + neighs_betweenness,
            data=scd,family=binomial(logit)))


####################### neighmax #######################
summary(glm(success ~  neighsmax_perspref,data=scd,family=binomial(logit)))
summary(glm(success ~  neighsmax_localc,data=scd,family=binomial(logit)))
summary(glm(success ~  neighsmax_degree,data=scd,family=binomial(logit)))
summary(glm(success ~  neighsmax_eigenc,data=scd,family=binomial(logit)))
summary(glm(success ~  neighsmax_betweenness,data=scd,family=binomial(logit)))


summary(glm(success ~ neighsmax_degree + neighsmax_perspref + neighsmax_betweenness + neighsmax_eigenc + neighsmax_localc,
            data=scd,family=binomial(logit)))



####################### comparisons #######################

summary(glm(success ~ seed_degree + seed_perspref + seed_localc + seed_betweenness + seed_eigenc ,
            data=scd,family=binomial(logit)))
summary(glm(success ~ neighs_degree + neighs_perspref + neighs_localc + neighs_betweenness + neighs_eigenc ,
            data=scd,family=binomial(logit))))
summary(glm(success ~ neighsmax_degree + neighsmax_perspref + neighsmax_localc + neighsmax_betweenness + neighsmax_eigenc ,
            data=scd,family=binomial(logit)))

summary(glm(success ~ seed_degree,data=scd,family=binomial(logit)))
summary(glm(success ~ neighs_degree,data=scd,family=binomial(logit)))
summary(glm(success ~ neighsmax_degree,data=scd,family=binomial(logit)))


##################################################
#################speed analysis###################
##################################################

summary(lm(speed ~ seed_eigenc,data=subset(d,success==1)))
summary(lm(speed ~ seed_perspref,data=subset(d,success==1)))
summary(lm(speed ~ seed_degree,data=subset(d,success==1)))
summary(lm(speed ~ seed_betweenness,data=subset(d,success==1)))
summary(lm(speed ~ seed_localc,data=subset(d,success==1)))
summary(lm(speed ~ seed_degree + seed_localc + seed_perspref +
             seed_betweenness+seed_eigenc,data=subset(d,success==1)))
summary(lm(speed ~ seed_degree + seed_localc*seed_eigenc ,data=subset(d,success==1)))
