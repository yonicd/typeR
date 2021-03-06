library(metavcov)


### Name: md_lgor
### Title: Covariance between mean difference and log odds ratio
### Aliases: md_lgor

### ** Examples

## simple example
md_lgor(r=0.71,n1c=34,n2c=35,n1t=25,n2t=32,
        s2c=5,s2t=8,f2c=30,f2t=24,sd1t=0.4,sd1c=8)
## calculate covariances for variable SBP and DD in Geeganage2010 data
attach(Geeganage2010)
SBP_DD=unlist(lapply(1:nrow(Geeganage2010),function(i){md_lgor(r=0.71,
               n1c=nc_SBP[i],n2c=nc_DD[i],n1t=nt_SBP[i],n2t=nt_DD[i],
               sd1t=sdt_SBP[i],s2t=st_DD[i],sd1c=sdc_SBP[i],s2c=sc_DD[i],
               f2c=nc_DD[i]-sc_DD[i],f2t=nt_DD[i]-st_DD[i])}))
SBP_DD



