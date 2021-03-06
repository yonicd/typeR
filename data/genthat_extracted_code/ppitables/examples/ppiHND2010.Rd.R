library(ppitables)


### Name: ppiHND2010
### Title: ppiHND2010
### Aliases: ppiHND2010
### Keywords: datasets

### ** Examples

  # Access Honduras PPI table
  ppiHND2010

  # Given a specific PPI score (from 0 - 100), get the row of poverty
  # probabilities from PPI table it corresponds to
  ppiScore <- 50
  ppiHND2010[ppiHND2010$score == ppiScore, ]

  # Use subset() function to get the row of poverty probabilities corresponding
  # to specific PPI score
  ppiScore <- 50
  subset(ppiHND2010, score == ppiScore)

  # Given a specific PPI score (from 0 - 100), get a poverty probability
  # based on a specific poverty definition. In this example, the USAID
  # extreme poverty definition
  ppiScore <- 50
  ppiHND2010[ppiHND2010$score == ppiScore, "extreme"]




