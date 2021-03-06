library(crmPack)


### Name: DataMixture-class
### Title: Class for the data with mixture sharing
### Aliases: DataMixture-class .DataMixture
### Keywords: classes

### ** Examples

## decide on the dose grid:
doseGrid <- 1:80

## and MCMC options:
options <- McmcOptions()

## the classic model would be:
model <- LogisticLogNormal(mean = c(-0.85, 1),
                           cov = matrix(c(1, -0.5, -0.5, 1), nrow = 2),
                           refDose = 50)

nodata <- Data(doseGrid=doseGrid)

priorSamples <- mcmc(nodata, model, options)
plot(priorSamples, model, nodata)

## set up the mixture model and data share object:
modelShare <- LogisticLogNormalMixture(shareWeight=0.1,
                                       mean = c(-0.85, 1),
                                       cov = matrix(c(1, -0.5, -0.5, 1), nrow = 2),
                                       refDose = 50)

nodataShare <- DataMixture(doseGrid=doseGrid,
                           xshare=
                             c(rep(10, 4),
                               rep(20, 4),
                               rep(40, 4)),
                           yshare=
                             c(rep(0L, 4),
                               rep(0L, 4),
                               rep(0L, 4)))

## now compare with the resulting prior model:
priorSamplesShare <- mcmc(nodataShare, modelShare, options)
plot(priorSamplesShare, modelShare, nodataShare)



