library(SSN)


### Name: plot.glmssn.predict
### Title: Plot glmssn.predict Objects
### Aliases: plot.glmssn.predict

### ** Examples


library(SSN)
#for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()
# NOT RUN
# Create a SpatialStreamNetork object that also contains prediction sites
#mf04p <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), 
#  predpts = "pred1km", o.write = TRUE)
#use mf04p SpatialStreamNetwork object, already created
data(mf04p)
#for examples only, make sure mf04p has the correct path
#if you use importSSN(), path will be correct
mf04p <- updatePath(mf04p, paste0(tempdir(),'/MiddleFork04.ssn'))

# get some model fits stored as data objects
data(modelFits)
#NOT RUN use this one
#fitSp <- glmssn(Summer_mn ~ ELEV_DEM + netID,
#    ssn.object = mf04p, EstMeth = "REML", family = "Gaussian",
#    CorModels = c("Exponential.tailup","Exponential.taildown",
#    "Exponential.Euclid"), addfunccol = "afvArea")
#for examples only, make sure fitSp has the correct path
#if you use importSSN(), path will be correct
fitSp$ssn.object <- updatePath(fitSp$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))

# NOT RUN
# make sure the distance matrix is there
# createDistMat(mf04p, predpts = "pred1km", o.write = TRUE)

## create predictions
ssnpred <- predict(fitSp, "pred1km")

##default graph
plot(ssnpred)

## max maximum size smaller
plot(ssnpred, SEcex.max = 1.5)

## predictions only
plot(ssnpred, VarPlot = "Predictions", breaktype = "quantile")

## change line width
plot(ssnpred, VarPlot = "Predictions", breaktype = "quantile", lwd = 2)

## change line type
plot(ssnpred, VarPlot = "Predictions", breaktype = "quantile", lwd = 2, lty = 2)

## standard errors only
plot(ssnpred, VarPlot = "Standard Errors", breaktype = "quantile")

## use even spacing for breaks
plot(ssnpred, VarPlot = "Standard Errors", breaktype = "even")

## use custom breaks and colors - specify four break points and four
## colours, but the actual range of standard errors requires a fifth break
## point and a fifth colour (see legend on RHS) chosen by default
plot(ssnpred, VarPlot = "Standard Errors", breaktype = "user",
 brks = seq(0,2.4,by=0.6), color.palette = c("darkblue", "purple",
   "green", "red"))

## add predictions to colored observations
brks <- as.matrix(plot(fitSp$ssn.object, "Summer_mn", cex = 2))
plot(ssnpred, add = TRUE, breaktype = "user", brks = brks, nclasses=length(brks),
    SEcex.max = 1)




