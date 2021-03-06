library(gMWT)


### Name: summary.re
### Title: Summarize an re Object
### Aliases: summary.re summary,re-method
### Keywords: methods print

### ** Examples

  X <- matrix(c(rnorm(500,2,1),rnorm(600,2,1),rnorm(400,2.2,1)),byrow=TRUE, ncol=10)
  colnames(X) <- letters[1:10]
  g <- c(rep(1,50),rep(2,60),rep(3,40))

  test <- gmw(X,g,test="kw",type="external")

  re1 <- getSigTests(test)
  
  summary(re1)



