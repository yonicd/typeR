library(metricTester)


### Name: runSimulations
### Title: Run defined spatial simulations
### Aliases: runSimulations

### ** Examples

tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

prepped <- prepSimulations(tree, arena.length=300, mean.log.individuals=2, 
length.parameter=5000, sd.parameter=50, max.distance=20, proportion.killed=0.2,
competition.iterations=3)

results <- runSimulations(prepped)



