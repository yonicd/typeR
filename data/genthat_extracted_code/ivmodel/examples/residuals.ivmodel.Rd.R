library(ivmodel)


### Name: residuals.ivmodel
### Title: Residuals from the Fitted Model in the 'ivmodel' Object
### Aliases: residuals.ivmodel resid.ivmodel

### ** Examples

data(card.data)
Y=card.data[,"lwage"]
D=card.data[,"educ"]
Z=card.data[,"nearc4"]
Xname=c("exper", "expersq", "black", "south", "smsa", "reg661", 
        "reg662", "reg663", "reg664", "reg665", "reg666", "reg667", 
		"reg668", "smsa66")
X=card.data[,Xname]
foo = ivmodel(Y=Y,D=D,Z=Z,X=X)
resid(foo)
residuals(foo)



