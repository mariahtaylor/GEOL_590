#Task 2

#Add numbers and designate value "my.variable" to the sum of two numbers
2+2
my.variable <- 2+2
my.variable/3
print()

#Make 3 vectors
x <- seq(from=1, to=20, length.out=10)
y <- rnorm(10)
labels <- letters[10] 

d <- data.frame(x, y, labels)

#Save a plot
png("test_plot.png", height=3, width=4, units="in", res=300)
plot(x, y)
dev.off()

#Save a .csv file
write.csv(d, "test_data.csv")

