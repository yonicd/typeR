library(CPP)


### Name: CPP.Axes.Beta
### Title: CPP by axes using Beta PERT distributions
### Aliases: CPP.Axes.Beta

### ** Examples

# Alternatives' original scores
Alt.1 = c(2,30,86,-5)
Alt.2 = c(4,26,77,-12)
Alt.3 = c(3,22,93,-4)
Alt.4 = c(6,34,65,-10)
Alt.5 = c(5,31,80,-8)
x = rbind(Alt.1,Alt.2,Alt.3,Alt.4,Alt.5) # Decision matrix
s = 4 # Shape
CPP.Axes.Beta(x,s)



