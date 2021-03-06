library(queueing)


### Name: VN.o_MM1K
### Title: Returns the variance of the number of customers in the M/M/1/K
###   queueing model
### Aliases: VN.o_MM1K
### Keywords: M/M/1/K

### ** Examples


## create input parameters
i_mm1k <- NewInput.MM1K(lambda=5, mu=5.714, k=15)

## Build the model
o_mm1k <- QueueingModel(i_mm1k)

## Returns the variance
VN(o_mm1k)



