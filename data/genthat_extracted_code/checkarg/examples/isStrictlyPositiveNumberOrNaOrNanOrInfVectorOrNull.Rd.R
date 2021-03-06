library(checkarg)


### Name: isStrictlyPositiveNumberOrNaOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaOrNanOrInfVectorOrNull

### ** Examples

isStrictlyPositiveNumberOrNaOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




