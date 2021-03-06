library(PWFSLSmoke)


### Name: monitorDygraph
### Title: Create Interactive Time Series Plot
### Aliases: monitorDygraph
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D # Napa Fires -- October, 2017
##D ca <- airnow_load(2017) %>%
##D   monitor_subset(tlim=c(20171001,20171101), stateCodes='CA')
##D Vallejo <- monitor_subset(ca, monitorIDs='060950004_01')
##D Napa_Fires <- monitor_subsetByDistance(ca,
##D                                        longitude = Vallejo$meta$longitude,
##D                                        latitude = Vallejo$meta$latitude,
##D                                        radius = 50)
##D monitorDygraph(Napa_Fires, title='Napa Fires in California, Oct. 2017')
## End(Not run) 



