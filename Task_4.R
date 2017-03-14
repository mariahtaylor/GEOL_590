
# Task 4: Creating Plots

# Load required packages
library(tidyverse)

# Make small, working dataset (random number generator)
set.seed(1410) 
#chooses 100 random rows from the diamonds dataset
dsmall <- diamonds[sample(nrow(diamonds), 100), ]
#Task Goal: find out number of rows for diamonds dataset
nrow(diamonds) 
#dataset has 53,940 rows

#create faceted plot
ggplot(data = dsmall) + 
  geom_point (mapping = aes(x,y, color = z)) + 
  facet_wrap(~ cut, nrow = 4)

#create plot w/o standard error
ggplot(data = dsmall) +
  geom_point (mapping = aes(x = carat, y = price, color = cut)) +
  geom_smooth(se = FALSE, method = "lm", mapping = aes(x = carat, y = price, 
                                            color = cut, group = cut))

#create density plot
ggplot(data = dsmall) +
  geom_density (mapping = aes(carat, color = clarity)) +
  facet_wrap(~clarity)

#create a bloxplot
ggplot(data = dsmall, mapping = aes(x = cut, y = price)) + 
  geom_boxplot()

#create a scatterplot
ggplot(dsmall, aes(y,x, xlab= "y, in mm",ylab= "x, in mm")) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", colour = "blue", linetype = 2)+
  xlab("x, in mm")+
  ylab("y, in mm")

#Ugly Plot Contest
ggplot(presidential, aes(party, name))+
  geom_jitter(colour = "blue")+
  theme(plot.background = element_rect(fill = "yellow"))

