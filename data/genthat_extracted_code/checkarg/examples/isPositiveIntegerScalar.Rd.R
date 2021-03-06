library(checkarg)


### Name: isPositiveIntegerScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerScalar

### ** Examples

isPositiveIntegerScalar(2)
   # returns TRUE (argument is valid)
isPositiveIntegerScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




