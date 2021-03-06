library(DescTools)


### Name: power.chisq.test
### Title: Power Calculations for ChiSquared Tests
### Aliases: power.chisq.test
### Keywords: htest

### ** Examples

## Exercise 7.1 P. 249 from Cohen (1988) 
power.chisq.test(w=0.289, df=(4-1), n=100, sig.level=0.05)

## Exercise 7.3 p. 251
power.chisq.test(w=0.346, df=(2-1)*(3-1), n=140, sig.level=0.01)

## Exercise 7.8 p. 270
power.chisq.test(w=0.1, df=(5-1)*(6-1), power=0.80, sig.level=0.05)



