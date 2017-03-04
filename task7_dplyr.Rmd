###########################################################
###########################
#######TASK 7: Understanding DPLYR
#############################################

install.packages("nycflights13")
install.packages("babynames")
library(nycflights13)

####Shows table of weather for nycflights dataset
nycflights13::weather

#Plot of year vs wind_speed to find outlier
nycflights13::weather %>%
  ggplot(aes(year,wind_speed)) +
  geom_point()

#Filters wind speed for every number under 250 to get rid of outlier
nycflights13::weather %>%
  filter(wind_speed <250)

#Add the median of speed variable to table
nycflights13::airports

#Add new column with median values for each airport
m_wspd <- nycflights13::weather %>%
  mutate(median_wspeed = median(wind_speed, na.rm = FALSE))

#Median wind speed for each airport
my_df <- nycflights13::weather %>%
  filter(wind_speed <250) %>%
  group_by(origin, wind_dir) %>%
  summarise(median_wind_speed = median(wind_speed, na.rm = TRUE))

#plot of wind_dir and median_wind_speed
ggplot(my_df, aes(x = wind_dir, y = median_wind_speed)) +
  geom_point() +
  facet_wrap(~origin)

#select to view columns involving origin, wind speed, and median wind speed
nycflights13::weather %>%
  select(origin, wind_speed, median_wspeed)

#Make table with columns for airline name and median distance flown from JFK
median_dist_JFK <- nycflights13::flights %>%
  inner_join(airlines) %>%
  select(name, origin, distance) %>%
  filter(origin == "JFK") %>%
  group_by(name) %>%
  arrange(desc(distance)) %>%
  summarise(median_dist_JFK = median(distance))

#Make wide-format data frame displaying # of flights leaving EWR each month,
#from each airline
EWR <- nycflights13::flights %>%
  group_by(origin, flight) %>%
  filter(origin == "EWR") %>%
  count(origin == "EWR") %>%
  spread(origin, fill = NA, convert = FALSE, drop = TRUE, sep = NULL) %>%
  summarise(origin = n())

## Ten most common male and female names in 2014. 
babynames::babynames %>%
  arrange(desc(n)) %>%
  filter(year == "2014") %>%
  slice(1:10) %>%
  print()

#Plot frequency of top ten 2014 babynames since 1880.
babynames::babynames %>%
  ggplot(babynames, mapping = aes(x = year, y = prop)) +
  geom_point() %>%
  print()
  
#Table 26-29th most common girls names in 1896, 1942, and 2016
babynames::babynames %>%
  filter(sex == "F", year == "1896"| year == "1942"| year == "2016") %>%
  arrange(desc(prop)) %>%
  slice(26:29)
  print()

##My own task:
  ##My task is to use fueleconomy dataset and from this isolate compact car from
  ##midsize car and make a table comparing the year and model
install.packages("fueleconomy")
fueleconomy <- fueleconomy::vehicles %>%
  filter(class == "Compact Car" | class == "Midsize Car") %>%
  select(class, year, model) %>%
  print()


