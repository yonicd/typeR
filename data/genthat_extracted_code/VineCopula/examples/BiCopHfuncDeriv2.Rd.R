library(VineCopula)


### Name: BiCopHfuncDeriv2
### Title: Second Derivatives of the h-Function of a Bivariate Copula
### Aliases: BiCopHfuncDeriv2

### ** Examples


## simulate from a bivariate Student-t copula
set.seed(123)
cop <- BiCop(family = 2, par = -0.7, par2 = 4)
simdata <- BiCopSim(100, cop)

## second derivative of the conditional bivariate t-copula
## with respect to the first parameter
u1 <- simdata[,1]
u2 <- simdata[,2]
BiCopHfuncDeriv2(u1, u2, cop, deriv = "par")

## estimate a Student-t copula for the simulated data
cop <- BiCopEst(u1, u2, family = 2)
## and evaluate the derivative of the conditional copula
## w.r.t. the second argument u2
BiCopHfuncDeriv2(u1, u2, cop, deriv = "u2")




