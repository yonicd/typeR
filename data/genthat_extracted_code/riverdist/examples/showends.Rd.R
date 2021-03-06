library(riverdist)


### Name: showends
### Title: Identify Vertex Coordinates of Segment Endpoints
### Aliases: showends

### ** Examples

data(Gulk)

# say we know that segment 1 is the lowest segment in this river network, but we don't know 
# which end is the mouth.
showends(seg=1, rivers=Gulk)

# this means that the mouth is row 1, so we can specify this:
Gulk <- setmouth(seg=1, vert=1, rivers=Gulk)



