library(checkarg)


### Name: isNegativeNumberOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaScalarOrNull

### ** Examples

isNegativeNumberOrNaScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




