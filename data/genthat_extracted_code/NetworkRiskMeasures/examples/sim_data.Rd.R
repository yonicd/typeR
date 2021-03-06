library(NetworkRiskMeasures)


### Name: sim_data
### Title: Simulated Interbank Data
### Aliases: sim_data
### Keywords: dataset

### ** Examples


# Simulated data for ilustration purposes

# Setting Seed
set.seed(1100)

# Heavy tailed assets
assets <- rlnorm(125, 0, 2)
assets[assets < 4] <- runif(length(assets[assets < 4]))

# Heavy tailed liabilities
liabilities <- rlnorm(125, 0, 2) 
liabilities[liabilities < 4] <- runif(length(liabilities[liabilities < 4]))

# Making sure assets = liabilities
assets <- sum(liabilities) * (assets/sum(assets))

# Buffer as a function of assets
buffer <- pmax(0.01, runif(length(liabilities))*liabilities + abs(rnorm(125, 4, 2.6)))

# Weights as a function of assets, buffer and liabilities
weights <- (assets + liabilities + buffer + 1) + rlnorm(125, 0, 1)

# creating data.frame
sim_data <- data.frame(bank  = paste0("b", 1:125),
                       assets = assets,
                       liabilities = liabilities,
                       buffer = buffer,
                       weights = weights)
 



