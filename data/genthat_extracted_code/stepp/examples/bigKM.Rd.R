library(stepp)


### Name: bigKM
### Title: The BIG 1-98 trial dataset for Kaplan-Meier STEPP.
### Aliases: bigKM
### Keywords: datasets

### ** Examples

data(bigKM)

rxgroup <- bigKM$trt
time    <- bigKM$time
evt     <- bigKM$event
cov     <- bigKM$ki67

# analyze using Cumulative Incidence method with
# sliding window size of 150 patients and a maximum of 50 patients in common
#
swin    <- new("stwin", type="sliding", r1=50, r2=150) # create a sliding window
subp    <- new("stsubpop")                             # create subpopulation object
subp    <- generate(subp, win=swin, covariate=cov) # generate the subpopulations
summary(subp)					   # summary of the subpopulations

# create a stepp model using Kaplan Meier Method to analyze the data
#
smodel  <- new("stmodelKM", coltrt=rxgroup, trts=c(1,2), survTime=time, censor=evt, timePoint=4)

statKM  <- new("steppes")		  # create a test object based on subpopulation and window
statKM  <- estimate(statKM, subp, smodel) # estimate the subpo10ulation results
# Warning: In this example, the permutations have been set to 0 to allow the function
# to finish in a short amount of time.  IT IS RECOMMEND TO USE AT LEAST 2500 PERMUTATIONS TO 
# PROVIDE STABLE RESULTS.
statKM  <- test(statKM, nperm=0)       # permutation test with 0 iterations

print(statKM)				  # print the estimates and test statistics
plot(statKM, ncex=0.65, legendy=30, pline=-15.5, color=c("blue","gold"),
        pointwise=FALSE, 
        xlabel="Median Ki-67 LI in Subpopulation (% immunoreactivity)",
        ylabel="4-year Disease Free Survival", 
        tlegend=c("Taxmoxifen", "Letrozole"), nlas=3)



	



