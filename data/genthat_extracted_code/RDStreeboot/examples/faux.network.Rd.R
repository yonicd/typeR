library(RDStreeboot)


### Name: faux.network
### Title: Faux Social Network Dataset
### Aliases: faux.network
### Keywords: datasets

### ** Examples

## load data
data(faux.network)

## draw RDS from network
samp <- sample.RDS(faux.network$traits, faux.network$adj.mat, 100, 2, 3, c(0,1/3,1/3,1/3), TRUE)



