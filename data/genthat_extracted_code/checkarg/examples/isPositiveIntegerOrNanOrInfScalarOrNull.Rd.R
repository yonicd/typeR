library(checkarg)


### Name: isPositiveIntegerOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNanOrInfScalarOrNull

### ** Examples

isPositiveIntegerOrNanOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNanOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




