library(ggsci)


### Name: scale_color_rickandmorty
### Title: Rick and Morty Color Scales
### Aliases: scale_color_rickandmorty scale_colour_rickandmorty
###   scale_fill_rickandmorty

### ** Examples

library("ggplot2")
data("diamonds")

ggplot(subset(diamonds, carat >= 2.2),
       aes(x = table, y = price, colour = cut)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
  theme_bw() + scale_color_rickandmorty()

ggplot(subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
       aes(x = depth, fill = cut)) +
  geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
  theme_bw() + scale_fill_rickandmorty()



