library(copBasic)


### Name: bicCOP
### Title: The Bayesian Information Criterion between a Fitted Coupla and
###   an Empirical Copula
### Aliases: bicCOP
### Keywords: copula (goodness-of-fit) copula (inference) inference
###   goodness-of-fit

### ** Examples

## Not run: 
##D S <- simCOP(80, cop=GHcop, para=5) # Simulate some probabilities, but we
##D # must then treat these as data and recompute empirical probabilities.
##D U <- lmomco::pp(S$U, sort=FALSE); V <- lmomco::pp(S$V, sort=FALSE)
##D # The parent distribution is Gumbel-Hougaard extreme value copula.
##D # But in practical application we don't know that but say we speculate that
##D # perhaps the Galambos extreme value might be the parent. Then maximum
##D # likelihood is used on that copula to fit the single parameter.
##D pGL <- mleCOP(U,V, cop=GLcop, interval=c(0,20))$par
##D 
##D bics <- c(bicCOP(U,V, cop=GLcop, para=pGL),
##D           bicCOP(U,V, cop=P),
##D           bicCOP(U,V, cop=PSP))
##D print(bics) # We will see that the first BIC is the smallest as the
##D # Galambos has the nearest overall behavior than the P and PSP copulas.
## End(Not run)



