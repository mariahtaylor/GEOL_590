TASK 7: Understanding DPLYR
===========================

    library(tidyverse)

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

    library(nycflights13)

    ####Shows table of weather for nycflights dataset
    nycflights13::weather

    ## # A tibble: 26,130 × 15
    ##    origin  year month   day  hour  temp  dewp humid wind_dir wind_speed
    ##     <chr> <dbl> <dbl> <int> <int> <dbl> <dbl> <dbl>    <dbl>      <dbl>
    ## 1     EWR  2013     1     1     0 37.04 21.92 53.97      230   10.35702
    ## 2     EWR  2013     1     1     1 37.04 21.92 53.97      230   13.80936
    ## 3     EWR  2013     1     1     2 37.94 21.92 52.09      230   12.65858
    ## 4     EWR  2013     1     1     3 37.94 23.00 54.51      230   13.80936
    ## 5     EWR  2013     1     1     4 37.94 24.08 57.04      240   14.96014
    ## 6     EWR  2013     1     1     6 39.02 26.06 59.37      270   10.35702
    ## 7     EWR  2013     1     1     7 39.02 26.96 61.63      250    8.05546
    ## 8     EWR  2013     1     1     8 39.02 28.04 64.43      240   11.50780
    ## 9     EWR  2013     1     1     9 39.92 28.04 62.21      250   12.65858
    ## 10    EWR  2013     1     1    10 39.02 28.04 64.43      260   12.65858
    ## # ... with 26,120 more rows, and 5 more variables: wind_gust <dbl>,
    ## #   precip <dbl>, pressure <dbl>, visib <dbl>, time_hour <dttm>

    #Plot of year vs wind_speed to find outlier
    nycflights13::weather %>%
      ggplot(aes(year,wind_speed)) +
      geom_point()

    ## Warning: Removed 3 rows containing missing values (geom_point).

![](task7_dplyr_files/figure-markdown_strict/unnamed-chunk-1-1.png)

    #Filters wind speed for every number under 250 to get rid of outlier
    nycflights13::weather %>%
      filter(wind_speed <250)

    ## # A tibble: 26,126 × 15
    ##    origin  year month   day  hour  temp  dewp humid wind_dir wind_speed
    ##     <chr> <dbl> <dbl> <int> <int> <dbl> <dbl> <dbl>    <dbl>      <dbl>
    ## 1     EWR  2013     1     1     0 37.04 21.92 53.97      230   10.35702
    ## 2     EWR  2013     1     1     1 37.04 21.92 53.97      230   13.80936
    ## 3     EWR  2013     1     1     2 37.94 21.92 52.09      230   12.65858
    ## 4     EWR  2013     1     1     3 37.94 23.00 54.51      230   13.80936
    ## 5     EWR  2013     1     1     4 37.94 24.08 57.04      240   14.96014
    ## 6     EWR  2013     1     1     6 39.02 26.06 59.37      270   10.35702
    ## 7     EWR  2013     1     1     7 39.02 26.96 61.63      250    8.05546
    ## 8     EWR  2013     1     1     8 39.02 28.04 64.43      240   11.50780
    ## 9     EWR  2013     1     1     9 39.92 28.04 62.21      250   12.65858
    ## 10    EWR  2013     1     1    10 39.02 28.04 64.43      260   12.65858
    ## # ... with 26,116 more rows, and 5 more variables: wind_gust <dbl>,
    ## #   precip <dbl>, pressure <dbl>, visib <dbl>, time_hour <dttm>

    #Add the median of speed variable to table
    nycflights13::airports

    ## # A tibble: 1,458 × 8
    ##      faa                           name      lat        lon   alt    tz
    ##    <chr>                          <chr>    <dbl>      <dbl> <int> <dbl>
    ## 1    04G              Lansdowne Airport 41.13047  -80.61958  1044    -5
    ## 2    06A  Moton Field Municipal Airport 32.46057  -85.68003   264    -6
    ## 3    06C            Schaumburg Regional 41.98934  -88.10124   801    -6
    ## 4    06N                Randall Airport 41.43191  -74.39156   523    -5
    ## 5    09J          Jekyll Island Airport 31.07447  -81.42778    11    -5
    ## 6    0A9 Elizabethton Municipal Airport 36.37122  -82.17342  1593    -5
    ## 7    0G6        Williams County Airport 41.46731  -84.50678   730    -5
    ## 8    0G7  Finger Lakes Regional Airport 42.88356  -76.78123   492    -5
    ## 9    0P2   Shoestring Aviation Airfield 39.79482  -76.64719  1000    -5
    ## 10   0S9          Jefferson County Intl 48.05381 -122.81064   108    -8
    ## # ... with 1,448 more rows, and 2 more variables: dst <chr>, tzone <chr>

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

    ## Warning: Removed 3 rows containing missing values (geom_point).

![](task7_dplyr_files/figure-markdown_strict/unnamed-chunk-1-2.png)

    #select to view columns involving origin, wind speed, and median wind speed
    #nycflights13::weather %>%
    #  select(origin, wind_speed, median_wspeed)

    #Make table with columns for airline name and median distance flown from JFK
    median_dist_JFK <- nycflights13::flights %>%
      inner_join(airlines) %>%
      select(name, origin, distance) %>%
      filter(origin == "JFK") %>%
      group_by(name) %>%
      arrange(desc(distance)) %>%
      summarise(median_dist_JFK = median(distance))

    ## Joining, by = "carrier"

    #Make wide-format data frame displaying # of flights leaving EWR each month,
    #from each airline
    EWR <- nycflights13::flights %>%
      filter(origin == "EWR") %>%
      group_by(month, carrier) %>%
      summarise(num_flights = n()) %>%
      spread(carrier, num_flights)

    ## Ten most common male and female names in 2014. 
    comm_2014 <- babynames::babynames %>%
      arrange(desc(n)) %>%
      filter(year == "2014") %>%
      slice(1:10) %>%
      print()

    ## # A tibble: 10 × 5
    ##     year   sex     name     n        prop
    ##    <dbl> <chr>    <chr> <int>       <dbl>
    ## 1   2014     F     Emma 20799 0.010729242
    ## 2   2014     F   Olivia 19674 0.010148906
    ## 3   2014     M     Noah 19144 0.009431494
    ## 4   2014     F   Sophia 18490 0.009538136
    ## 5   2014     M     Liam 18342 0.009036381
    ## 6   2014     M    Mason 17092 0.008420555
    ## 7   2014     F Isabella 16950 0.008743721
    ## 8   2014     M    Jacob 16712 0.008233344
    ## 9   2014     M  William 16687 0.008221027
    ## 10  2014     M    Ethan 15619 0.007694866

    #Plot frequency of top ten 2014 babynames since 1880.
    babynames::babynames %>%
      filter(year > 1879, name == "Emma" | name == "Olivia" | name == "Noah" | name == "Sophia" | name == "Liam" | name == "Mason" | name == "Isabella" | name == "Jacob" | name == "William" | name == "Ethan") %>%
      ggplot(aes(x = year, y = prop, colour = name)) +
      geom_point() %>%
      print()

    ## geom_point: na.rm = FALSE
    ## stat_identity: na.rm = FALSE
    ## position_identity

![](task7_dplyr_files/figure-markdown_strict/unnamed-chunk-1-3.png)

    #Table 26-29th most common girls names in 1896, 1942, and 2016
    babynames::babynames %>%
      filter(sex == "F", year == "1896" | year == "1942"| year == "2016") %>%
      arrange(desc(prop)) %>%
      slice(26:29) %>%
      print()

    ## # A tibble: 4 × 5
    ##    year   sex    name     n       prop
    ##   <dbl> <chr>   <chr> <int>      <dbl>
    ## 1  1942     F   Karen 15388 0.01106783
    ## 2  1942     F Dorothy 15031 0.01081106
    ## 3  1896     F Lillian  2702 0.01072243
    ## 4  1896     F   Alice  2652 0.01052402

    ##My own task:
      ##My task is to use fueleconomy dataset and from this isolate compact car from
      ##midsize car and make a table comparing the year and model
    fueleconomy <- fueleconomy::vehicles %>%
      filter(class == "Compact Car" | class == "Midsize Car") %>%
      select(class, year, model) %>%
      print()

    ## # A tibble: 0 × 3
    ## # ... with 3 variables: class <chr>, year <int>, model <chr>