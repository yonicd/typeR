library(MDPtoolbox)


### Name: mdp_policy_iteration_modified
### Title: Solves discounted MDP using modified policy iteration algorithm
### Aliases: mdp_policy_iteration_modified

### ** Examples

# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R<- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_policy_iteration_modified(P, R, 0.9)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_policy_iteration_modified(P, R, 0.9)




