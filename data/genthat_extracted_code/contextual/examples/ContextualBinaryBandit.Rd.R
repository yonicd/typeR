library(contextual)


### Name: ContextualBinaryBandit
### Title: Bandit: ContextualBinaryBandit
### Aliases: ContextualBinaryBandit

### ** Examples

## Not run: 
##D 
##D horizon            <- 100
##D sims               <- 100
##D 
##D policy             <- EpsilonGreedyPolicy$new(epsilon = 0.1)
##D 
##D bandit             <- ContextualBinaryBandit$new(weights = c(0.6, 0.1, 0.1))
##D agent              <- Agent$new(policy,bandit)
##D 
##D history            <- Simulator$new(agent, horizon, sims)$run()
##D 
##D plot(history, type = "cumulative", regret = TRUE)
##D 
## End(Not run)



