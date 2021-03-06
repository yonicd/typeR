library(cricketr)


### Name: batsmanMovingAverage
### Title: Calculate and plot the Moving Average of the batsman in his
###   career
### Aliases: batsmanMovingAverage
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Get or use the <batsman>.csv obtained with getPlayerData()
#  <- getPlayerData(35320,file="tendulkar.csv",type="batting", homeOrAway=c(1,2),result=c(1,2,4))

# retrieve the file path of a data file installed with cricketr
pathToFile <- system.file("data", "tendulkar.csv", package = "cricketr")
batsmanMovingAverage(pathToFile,"Sachin Tendulkar")

# Note: The above example uses the file tendulkar.csv from the /data directory. However
# you can use any directory as long as the data file exists in that directory.
# The general format is pkg-function(pathToFile,par1,...)



