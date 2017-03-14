2+2
a <- 2+2
a*2
my.variable <- 2+2
my.variable/3

x <- seq(from=1, to=20, length.out=10)
y <- rnorm(10)
labels <- letters[10] 

d <- data.frame(x, y, labels)
png("test_plot.png", height=3, width=4, units="in", res=300)
plot(x, y)
dev.off()
write.csv(d, "test_data.csv")

