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

    #Making factors for dataframe
    hantavirus <- c("ANDV", "PHV", "SNV", "BCCV")
    Geography <- c("South America", "United States", "North America", "United States")
    Reservoir <- c("Long-tailed pygmy rice rat", "Meadow vole", "Deer mouse", "Cotton rat")
    Disease_Outcome <- c("HPS", "None", "HPS", "HPS")

    #add factors into dataframe
    hvirus_data_sheet <- data.frame(hantavirus, Geography, Reservoir, Disease_Outcome)

    #view dataframe
    str(hvirus_data_sheet)

    ## 'data.frame':    4 obs. of  4 variables:
    ##  $ hantavirus     : Factor w/ 4 levels "ANDV","BCCV",..: 1 3 4 2
    ##  $ Geography      : Factor w/ 3 levels "North America",..: 2 3 1 3
    ##  $ Reservoir      : Factor w/ 4 levels "Cotton rat","Deer mouse",..: 3 4 2 1
    ##  $ Disease_Outcome: Factor w/ 2 levels "HPS","None": 1 2 1 1

    #add two randomly nonsensical columns
    hvirus_data_sheet$virus_fav_chocolate <- c("dark", "milk", "eww_white", "cookie")
    hvirus_data_sheet$total_length_kb <- c(1452, 6459, 9530, 8542)

    #Create a function
    divideby2 <- function(data_frame_to_divide, column.to.divide, new.col) {
      tryCatch(data_frame_to_divide$new.col <- (data_frame_to_divide$column.to.divide/2),
               warning=function(w){
                 message("Cannot divide words by a number")
                 })
      return(data_frame_to_divide)
    }

    #testfunction
    mydf<- divideby2(diamonds, cut, jewelery)

    ## Cannot divide words by a number

    #For Loop: Sum of all vector elements
    library(microbenchmark)

    ## Warning: package 'microbenchmark' was built under R version 3.3.3

    my_add <- function(x) {
      sum <- 0 
      for(i in x) {
         sum <- sum + i
      }
      return(sum)
    }

    #Comparing my sum to other function
    test <- 1:10^4
    microbenchmark(
        my_add(test),
        sum(test)
        )

    ## Unit: microseconds
    ##          expr       min        lq       mean     median         uq
    ##  my_add(test) 13287.047 15007.389 16498.5633 15252.9325 15555.1790
    ##     sum(test)    45.157    51.315    56.3904    55.1635    61.0655
    ##         max neval
    ##  105463.530   100
    ##     122.644   100

    sum(1:10^4)

    ## [1] 50005000

    my_add(1:10^4)

    ## [1] 50005000

    #Is there a difference? Why?
    ##The sum function is much more efficient than my function because it runs in a shorter time span.
