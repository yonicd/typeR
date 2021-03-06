library(samplingVarEst)


### Name: Est.RegCo.Hajek
### Title: Estimator of the regression coefficient using the Hajek point
###   estimator
### Aliases: Est.RegCo.Hajek
### Keywords: point estimation regression coefficient

### ** Examples

data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$POPMAL10                    #Defines the variable of interest y2
x     <- oaxaca$HOMES10                     #Defines the variable of interest x
#Computes the regression coefficient estimator for y1 and x
Est.RegCo.Hajek(y1[s==1], x[s==1], pik.U[s==1])
#Computes the regression coefficient estimator for y2 and x
Est.RegCo.Hajek(y2[s==1], x[s==1], pik.U[s==1])



