library(FGSG)


### Name: ncTL
### Title: Non Convex Truncated L1 Feature Grouping and Selection (FGSG)
### Aliases: ncTL

### ** Examples

A<-matrix(rnorm(25),5,5)
y<-rnorm(5)
tp<-c(1,2,2,3,3,4,4,5)
ncTL(A,y,tp,0,0)



