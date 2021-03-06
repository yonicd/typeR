library(sft)


### Name: capacity.or
### Title: Capacity Coefficient for First-Terminating (OR) Processing
### Aliases: capacity.or
### Keywords: sft

### ** Examples

rate1 <- .35
rate2 <- .3
RT.pa <- rexp(100, rate1)
RT.ap <- rexp(100, rate2)
RT.pp.limited <- pmin( rexp(100, .5*rate1), rexp(100, .5*rate2))
RT.pp.unlimited <- pmin( rexp(100, rate1), rexp(100, rate2))
RT.pp.super <- pmin( rexp(100, 2*rate1), rexp(100, 2*rate2))
tvec <- sort(unique(c(RT.pa, RT.ap, RT.pp.limited, RT.pp.unlimited, RT.pp.super)))

cap.limited <- capacity.or(RT=list(RT.pp.limited, RT.pa, RT.ap))
print(cap.limited$Ctest)
cap.unlimited <- capacity.or(RT=list(RT.pp.unlimited, RT.pa, RT.ap))
cap.super <- capacity.or(list(RT=RT.pp.super, RT.pa, RT.ap))

matplot(tvec, cbind(cap.limited$Ct(tvec), cap.unlimited$Ct(tvec), cap.super$Ct(tvec)),
  type='l', lty=1, ylim=c(0,3), col=2:4, main="Example Capacity Functions", xlab="Time", 
  ylab="C(t)")
abline(1,0)
legend('topright', c("Limited", "Unlimited", "Super"), lty=1, col=2:4)



