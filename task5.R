library(ggplot2)
ggplot(data = mtcars)+
  geom_point(mapping = (aes(x= mpg, y= disp)))

