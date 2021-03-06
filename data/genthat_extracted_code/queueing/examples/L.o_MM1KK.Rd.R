library(queueing)


### Name: L.o_MM1KK
### Title: Returns the mean number of customers in the M/M/1/K/K queueing
###   model
### Aliases: L.o_MM1KK
### Keywords: M/M/1/K/K

### ** Examples

## See example 10.13 in reference [Sixto2004] for more details.
## create input parameters
i_mm1kk <- NewInput.MM1KK(lambda=0.25, mu=4, k=2, method=3)

## Build the model
o_mm1kk <- QueueingModel(i_mm1kk)

## Returns the L
L(o_mm1kk)



