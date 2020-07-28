# https://tepuna.mfe.govt.nz/otcs/cs.dll/fetch/2000/107165/107179/107189/107191/design-toolkit-march-2018.pdf?nodeid=10131895&vernum=-2

library(ggplot2)

ggplot(data = mtcars, aes(x = disp, y = mpg)) + 
  geom_point() + 
  theme_bw()

# check which fonts R has access to
windowsFonts()

# this is needed to tell R where the windows fonts are located
library(extrafont)
font_import()
loadfonts(device = "win")

# modify existing theme
newtheme <- theme_bw() +
  theme(plot.title = element_text(size = 25, family = "Merriweather", colour = branded_colors$dark_blue, 
                                  face = "plain")) +
  theme(text=element_text(size=16, family="Lato Light")) +  # Merriweather  # Lato
  # theme(axis.text.x=element_text(colour="#32809c"), # axis font colour
  #       axis.text.y=element_text(colour="#32809c")) + 
  theme(axis.title.x = element_text(colour = branded_colors$brown,
                                    size = 18), # axis label font colour
        axis.title.y = element_text(colour = branded_colors$brown,
                                    size = 18)) +
  theme(plot.caption = element_text(size=8, family="Lato Medium")) +
  theme(panel.grid = element_line(size = 0.1,
                                  colour = branded_colors$light_green))

ggplot(data = mtcars, aes(x = disp, y = mpg)) + 
  geom_point(aes(colour = factor(cyl))) +
  labs(x = "Displacement",
       y = "Miles per gallon",
       title = "This is a test of the title font",
       caption = "Data source: blahdeblah 2018") +
  newtheme +
  scale_colour_viridis_d()

ggplot(economics, aes(x=date)) + 
  geom_line(aes(y = psavert), colour = branded_colors$dark_green, size = 1) + 
  geom_line(aes(y = uempmed), colour = branded_colors$orange, size = 1) +
  newtheme +
  scale_colour_viridis_d() +
  labs(x = "Date",
       y = "Variable",
       title = "This is a test of the title font",
       caption = "Data source: blahdeblah 2018")
