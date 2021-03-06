library(fpc)


### Name: cluster.varstats
### Title: Variablewise statistics for clusters
### Aliases: cluster.varstats print.varwisetables
### Keywords: cluster

### ** Examples

  set.seed(112233)
  options(digits=3)
  require(MASS)
  require(flexmix)
  data(Cars93)
  Cars934 <- Cars93[,c(3,5,8,10)]
  cc <-
    discrete.recode(Cars934,xvarsorted=FALSE,continuous=c(2,3),discrete=c(1,4))
  fcc <- flexmix(cc$data~1,k=2,
  model=lcmixed(continuous=2,discrete=2,ppdim=c(6,3),diagonal=TRUE))
  cv <-
    cluster.varstats(fcc@cluster,Cars934, contdata=Cars934[,c(2,3)],
    tablevar=c(1,4),catvar=c(2,3),quantvar=c(2,3),projmethod="awc",
    ask=FALSE)
  print(cv)



