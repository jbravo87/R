## Loading Data
library(ISLR)

# First as a regular data matrix
Auto = read.table("Auto.data", header=T, na.strings="?")
fix(Auto)
# fix() to view in spreadsheet-like window

# Now import as a CSV file
Auto = read.csv("Auto.csv", header = T, na.string = "?")
fix(Auto)

dim(Auto)
Auto[1:4, ]

# To omit rows containing missing observations.
Auto = na.omit(Auto)

# To check the variable names.
names(Auto)

plot(Auto$cylinders, Auto$mpg)
attach(Auto)
plot(cylinders, mpg)
# Now arguments in the plot function are stored as a
# numeric vector, i.e., quantaitative.

cylinders = as.factor(cylinders)

plot(cylinders, mpg)
plot(cylinders, mpg, col = "red")
plot(cylinders, mpg, col = "red", varwidth = T)
plot(cylinders, mpg, col = "red", varwidth = T, xlab = "Cylinders", ylab = "MPG")

# Now for some histograms.
hist(mpg)
hist( mpg, col = 2 )
hist(mpg, col = 2, breaks = 15)

plot(horsepower, mpg)
# Following corresponds to the rows for a selected row.
identify(horsepower, mpg, name)

# Summary statistics
summary(Auto)
summary(mpg)

# Following to shut down R
#q()