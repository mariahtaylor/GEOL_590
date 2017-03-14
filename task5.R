###############
# We always start scripts with some comments about the script, like a title
###############

library(ggplot2)
ggplot(data = mtcars)+
  geom_point(mapping = (aes(x= mpg, y= disp)))

