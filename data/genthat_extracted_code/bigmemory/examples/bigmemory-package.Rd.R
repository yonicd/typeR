library(bigmemory)


### Name: bigmemory-package
### Title: Manage massive matrices with shared memory and memory-mapped
###   files.
### Aliases: bigmemory-package bigmemory
### Keywords: package

### ** Examples



# Our examples are all trivial in size, rather than burning huge amounts
# of memory.

x <- big.matrix(5, 2, type="integer", init=0,
                dimnames=list(NULL, c("alpha", "beta")))
x
x[1:2,]
x[,1] <- 1:5
x[,"alpha"]
colnames(x)
options(bigmemory.allow.dimnames=TRUE)
colnames(x) <- NULL
x[,]





