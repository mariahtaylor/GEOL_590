a <- 1
b <- 2
c <- a + b
# 'a' and 'b' are representing the numbers '1' and '2' respectively
#'c' is used to calculate the sum of the representative letters
set.seed(0) # This ensures that 'random' results will be the same for everyone
d <- rnorm(20)
e <- rnorm(20)
f <- d + e

new.var <- c(1:5)
x<-c(a=1,b=2,c=3,d=4,e=5)
attr(x,"my_atrribute") <- "mpg"
attr(x, "colors") <- "blue"

str(attributes(x))
f1 <- factor(letters)
levels(f1) <- rev(levels(f1))

dim(x)

f2 <- rev(factor(letters))
f3 <- factor(letters, levels = rev(letters))

plate.reader<-read.csv(file="2016_10_11_plate_reader.csv",skip = 33)
str(plate.reader)
library("tidyverse")
read_csv(file="2016_10_11_plate_reader.csv")
plate <- read_csv(file = "2016_10_11_plate_reader.csv")

mtcars
nrow(mtcars)
length(mtcars)
ncol(mtcars)

cyl <- mtcars$cyl
str(cyl)
steve <- mtcars["cyl"]

data.frame(mtcars)
mtcars[mtcars$wt <- 4 | 6]

gill<-subset(df,wt<3|wt>4)

median <- median(mtcars$mpg)
mtcars[mtcars$bob]
data.frame(mtcars,
mtcars[c(which(mtcars$mpg == median(mtcars$mpg))), ]
equal.median <- mtcars[c(which(mtcars$mpg == median(mtcars$mpg))), ]

mtcars[mtcars$cyl == 4, ]
mtcars[mtcars$cyl<-4 | 6]
sarah <- col(mpg)
df[mtcars$cyl == 4, ]


mtcars[mtcars$cyl,4]
mtcars[-0:4]
mtcars[mtcars$cyl <- 4 | 6,]
mtcars[mtcars$cyl == 4 | 6, ] 
as.numeric(mtcars$cyl)
which(mtcars$mpg,median(mpg))
mtcars[mtcars$cyl <- 4 | 6]
mtcars[0:6]
mtcars[-0:6]
data.frame(a=numeric(0))

as.matrix(df)


getwd()
mtcars[mtcars$wt <- 4 | 6]
str()


