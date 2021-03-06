library(iWeigReg)


### Name: ate.clik
### Title: Calibrated likelihood estimator for the causal-inference setup
### Aliases: ate.clik
### Keywords: Causal inference

### ** Examples

data(KS.data)
attach(KS.data)
z=cbind(z1,z2,z3,z4)
x=cbind(x1,x2,x3,x4)

#logistic propensity score model, correct
ppi.glm <- glm(tr~z, family=binomial(link=logit))

X <- model.matrix(ppi.glm)
ppi.hat <- ppi.glm$fitted

#outcome regression model, misspecified
y.fam <- gaussian(link=identity)

eta1.glm <- glm(y ~ x, subset=tr==1, 
               family=y.fam, control=glm.control(maxit=1000))
eta1.hat <- predict.glm(eta1.glm, 
               newdata=data.frame(x=x), type="response")

eta0.glm <- glm(y ~ x, subset=tr==0, 
               family=y.fam, control=glm.control(maxit=1000))
eta0.hat <- predict.glm(eta0.glm, 
               newdata=data.frame(x=x), type="response")

#ppi.hat treated as known
out.lik <- ate.clik(y, tr, ppi.hat, 
                     g0=cbind(1,eta0.hat),g1=cbind(1,eta1.hat))
out.lik$diff
out.lik$v.diff

#ppi.hat treated as estimated (see the details)
out.lik <- ate.clik(y, tr, ppi.hat, 
                     g0=cbind(1,eta0.hat),g1=cbind(1,eta1.hat), X)
out.lik$diff
out.lik$v.diff



