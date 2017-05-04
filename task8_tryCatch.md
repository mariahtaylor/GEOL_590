Function that adds WARNING messages using tryCatch
==================================================

    #Open necessary packages
    library (tidyverse)

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

    library (forcats)

    #Write function that follows task 08 criteria of adding "warning" messages
    my_function <- function(df, x, y, z) {
      tryCatch(
        
        df[, z] <- (df[, x] + df[, y]),
               warning=function(w){
                 message("Cannot sum words by a number")
                 return(NA) #this is not working for some reason
                 
               },
                 error=function(e) {
                   stop("df is not a data frame") #changed error message
                 })
      return(df)
    }


    diamonds <- diamonds

    #test function to get "warning" message
    my_function(diamonds, "cut", "depth", "new.col")

    ## Cannot sum words by a number

    ## # A tibble: 53,940 × 10
    ##    carat       cut color clarity depth table price     x     y     z
    ##    <dbl>     <ord> <ord>   <ord> <dbl> <dbl> <int> <dbl> <dbl> <dbl>
    ## 1   0.23     Ideal     E     SI2  61.5    55   326  3.95  3.98  2.43
    ## 2   0.21   Premium     E     SI1  59.8    61   326  3.89  3.84  2.31
    ## 3   0.23      Good     E     VS1  56.9    65   327  4.05  4.07  2.31
    ## 4   0.29   Premium     I     VS2  62.4    58   334  4.20  4.23  2.63
    ## 5   0.31      Good     J     SI2  63.3    58   335  4.34  4.35  2.75
    ## 6   0.24 Very Good     J    VVS2  62.8    57   336  3.94  3.96  2.48
    ## 7   0.24 Very Good     I    VVS1  62.3    57   336  3.95  3.98  2.47
    ## 8   0.26 Very Good     H     SI1  61.9    55   337  4.07  4.11  2.53
    ## 9   0.22      Fair     E     VS2  65.1    61   337  3.87  3.78  2.49
    ## 10  0.23 Very Good     H     VS1  59.4    61   338  4.00  4.05  2.39
    ## # ... with 53,930 more rows

    #test my function to get "error" message
    my_function(diamonds, "cut", "clarity", "new.col2")

    ## Cannot sum words by a number

    ## # A tibble: 53,940 × 10
    ##    carat       cut color clarity depth table price     x     y     z
    ##    <dbl>     <ord> <ord>   <ord> <dbl> <dbl> <int> <dbl> <dbl> <dbl>
    ## 1   0.23     Ideal     E     SI2  61.5    55   326  3.95  3.98  2.43
    ## 2   0.21   Premium     E     SI1  59.8    61   326  3.89  3.84  2.31
    ## 3   0.23      Good     E     VS1  56.9    65   327  4.05  4.07  2.31
    ## 4   0.29   Premium     I     VS2  62.4    58   334  4.20  4.23  2.63
    ## 5   0.31      Good     J     SI2  63.3    58   335  4.34  4.35  2.75
    ## 6   0.24 Very Good     J    VVS2  62.8    57   336  3.94  3.96  2.48
    ## 7   0.24 Very Good     I    VVS1  62.3    57   336  3.95  3.98  2.47
    ## 8   0.26 Very Good     H     SI1  61.9    55   337  4.07  4.11  2.53
    ## 9   0.22      Fair     E     VS2  65.1    61   337  3.87  3.78  2.49
    ## 10  0.23 Very Good     H     VS1  59.4    61   338  4.00  4.05  2.39
    ## # ... with 53,930 more rows

    #test my function to get correct dataframe column
    my_function(diamonds, "depth", "table", "new.col3")

    ## # A tibble: 53,940 × 11
    ##    carat       cut color clarity depth table price     x     y     z
    ##    <dbl>     <ord> <ord>   <ord> <dbl> <dbl> <int> <dbl> <dbl> <dbl>
    ## 1   0.23     Ideal     E     SI2  61.5    55   326  3.95  3.98  2.43
    ## 2   0.21   Premium     E     SI1  59.8    61   326  3.89  3.84  2.31
    ## 3   0.23      Good     E     VS1  56.9    65   327  4.05  4.07  2.31
    ## 4   0.29   Premium     I     VS2  62.4    58   334  4.20  4.23  2.63
    ## 5   0.31      Good     J     SI2  63.3    58   335  4.34  4.35  2.75
    ## 6   0.24 Very Good     J    VVS2  62.8    57   336  3.94  3.96  2.48
    ## 7   0.24 Very Good     I    VVS1  62.3    57   336  3.95  3.98  2.47
    ## 8   0.26 Very Good     H     SI1  61.9    55   337  4.07  4.11  2.53
    ## 9   0.22      Fair     E     VS2  65.1    61   337  3.87  3.78  2.49
    ## 10  0.23 Very Good     H     VS1  59.4    61   338  4.00  4.05  2.39
    ## # ... with 53,930 more rows, and 1 more variables: new.col3 <dbl>

    ##this makes a new column labled "new.col3" that returns correct numerical values.

Function that returns NA values in new column
=============================================

    #Write function that follows task 08 criteria of adding non-numeric columns
    add_function <- function(df, x, y, z) {
      tryCatch(df[, z] <- df[, x] + df[, y])
               warning=function(w){
                 message("Cannot sum words by a number")
                 return(NA)
               }
                 error=function(e) {
                   stop("x is not a numeric vector")
                 }
      return(df)

      }
    my_diamonds <- diamonds

    #test my function to get "warning" message
    add_function(my_diamonds, "cut", "depth", "new.col")

    ## Warning in Ops.ordered(left, right): '+' is not meaningful for ordered
    ## factors

    ## # A tibble: 53,940 × 11
    ##    carat       cut color clarity depth table price     x     y     z
    ##    <dbl>     <ord> <ord>   <ord> <dbl> <dbl> <int> <dbl> <dbl> <dbl>
    ## 1   0.23     Ideal     E     SI2  61.5    55   326  3.95  3.98  2.43
    ## 2   0.21   Premium     E     SI1  59.8    61   326  3.89  3.84  2.31
    ## 3   0.23      Good     E     VS1  56.9    65   327  4.05  4.07  2.31
    ## 4   0.29   Premium     I     VS2  62.4    58   334  4.20  4.23  2.63
    ## 5   0.31      Good     J     SI2  63.3    58   335  4.34  4.35  2.75
    ## 6   0.24 Very Good     J    VVS2  62.8    57   336  3.94  3.96  2.48
    ## 7   0.24 Very Good     I    VVS1  62.3    57   336  3.95  3.98  2.47
    ## 8   0.26 Very Good     H     SI1  61.9    55   337  4.07  4.11  2.53
    ## 9   0.22      Fair     E     VS2  65.1    61   337  3.87  3.78  2.49
    ## 10  0.23 Very Good     H     VS1  59.4    61   338  4.00  4.05  2.39
    ## # ... with 53,930 more rows, and 1 more variables: new.col <lgl>

    ##this makes a new column labeled "new.col" in the diamonds dataframe that has NA values 

    #test my function to get "error" message
    add_function(my_diamonds, "cut", "color", "new.col2")

    ## Warning in Ops.ordered(left, right): '+' is not meaningful for ordered
    ## factors

    ## # A tibble: 53,940 × 11
    ##    carat       cut color clarity depth table price     x     y     z
    ##    <dbl>     <ord> <ord>   <ord> <dbl> <dbl> <int> <dbl> <dbl> <dbl>
    ## 1   0.23     Ideal     E     SI2  61.5    55   326  3.95  3.98  2.43
    ## 2   0.21   Premium     E     SI1  59.8    61   326  3.89  3.84  2.31
    ## 3   0.23      Good     E     VS1  56.9    65   327  4.05  4.07  2.31
    ## 4   0.29   Premium     I     VS2  62.4    58   334  4.20  4.23  2.63
    ## 5   0.31      Good     J     SI2  63.3    58   335  4.34  4.35  2.75
    ## 6   0.24 Very Good     J    VVS2  62.8    57   336  3.94  3.96  2.48
    ## 7   0.24 Very Good     I    VVS1  62.3    57   336  3.95  3.98  2.47
    ## 8   0.26 Very Good     H     SI1  61.9    55   337  4.07  4.11  2.53
    ## 9   0.22      Fair     E     VS2  65.1    61   337  3.87  3.78  2.49
    ## 10  0.23 Very Good     H     VS1  59.4    61   338  4.00  4.05  2.39
    ## # ... with 53,930 more rows, and 1 more variables: new.col2 <lgl>

    ##this makes a new column labeled "new.col2" that has NA values.

    #test my function to get correct dataframe column
    add_function(my_diamonds, "depth", "table", "new.col3")

    ## # A tibble: 53,940 × 11
    ##    carat       cut color clarity depth table price     x     y     z
    ##    <dbl>     <ord> <ord>   <ord> <dbl> <dbl> <int> <dbl> <dbl> <dbl>
    ## 1   0.23     Ideal     E     SI2  61.5    55   326  3.95  3.98  2.43
    ## 2   0.21   Premium     E     SI1  59.8    61   326  3.89  3.84  2.31
    ## 3   0.23      Good     E     VS1  56.9    65   327  4.05  4.07  2.31
    ## 4   0.29   Premium     I     VS2  62.4    58   334  4.20  4.23  2.63
    ## 5   0.31      Good     J     SI2  63.3    58   335  4.34  4.35  2.75
    ## 6   0.24 Very Good     J    VVS2  62.8    57   336  3.94  3.96  2.48
    ## 7   0.24 Very Good     I    VVS1  62.3    57   336  3.95  3.98  2.47
    ## 8   0.26 Very Good     H     SI1  61.9    55   337  4.07  4.11  2.53
    ## 9   0.22      Fair     E     VS2  65.1    61   337  3.87  3.78  2.49
    ## 10  0.23 Very Good     H     VS1  59.4    61   338  4.00  4.05  2.39
    ## # ... with 53,930 more rows, and 1 more variables: new.col3 <dbl>

    ##this makes a new column labled "new.col3" that returns correct numerical values.

Loop and Performance Metric Tests
=================================

Create a function that uses a for loop to add the elements of a vector
----------------------------------------------------------------------

    #For Loop: Sum of all vector elements
    library(microbenchmark)
    my_add <- function(x) {
      sum <- 0 
      for(i in x) {
         sum <- sum + i
      }
      return(sum)
    }

Compare my function to "sum" function
=====================================

    #Comparing my addition function to the RStudio "sum" function
    test <- 1:10^4
    microbenchmark(
        my_add(test),
        sum(test)
        )

    ## Unit: microseconds
    ##          expr      min       lq       mean   median       uq       max
    ##  my_add(test) 1428.088 1440.917 1647.17665 1471.193 1620.005 12945.162
    ##     sum(test)   45.157   46.183   89.10305   50.802   52.854  3901.971
    ##  neval
    ##    100
    ##    100

    sum(1:10^4)

    ## [1] 50005000

    my_add(1:10^4)

    ## [1] 50005000

Is there a difference between the two functions? Why?
=====================================================

The sum function is much more efficient than my function because it runs in a shorter time span.
------------------------------------------------------------------------------------------------
