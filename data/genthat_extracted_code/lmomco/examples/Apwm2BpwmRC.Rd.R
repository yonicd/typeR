library(lmomco)


### Name: Apwm2BpwmRC
### Title: Conversion between A- and B-Type Probability-Weighted Moments
###   for Right-Tail Censoring of an Appropriate Distribution
### Aliases: Apwm2BpwmRC
### Keywords: probability-weighted moment (theoretical) data censoring

### ** Examples

# Data listed in Hosking (1995, table 29.2, p. 551)
H <- c(3,4,5,6,6,7,8,8,9,9,9,10,10,11,11,11,13,13,13,13,13,
             17,19,19,25,29,33,42,42,51.9999,52,52,52)
      # 51.9999 was really 52, a real (noncensored) data point.
z <-  pwmRC(H,52)
# The B-type PMWs are used for the parameter estimation of the
# Reverse Gumbel distribution. The parameter estimator requires
# conversion of the PWMs to L-moments by pwm2lmom().
para <- parrevgum(pwm2lmom(z$Bbetas),z$zeta) # parameter object
Bbetas <- Apwm2BpwmRC(z$Abetas,para)
Abetas <- Bpwm2ApwmRC(Bbetas$betas,para)
# Assertion that both of the vectors of B-type PWMs should be the same.
str(Abetas)   # A-type PWMs of the distribution
str(z$Abetas) # A-type PWMs of the original data



