# Introduction to Statistical Learning, Seventh Edition
# Lab: Intro to R
# Basic Commands
x <- c( 1, 3, 2, 5 )
x
x = c( 1, 6, 2 )

y = c( 1, 4, 3 )

length( x )
length(y)
# x and y must be same length to add the two vectors
x+y

ls()

# Following command will delete aby functions we do
# not want.
rm( x, y )
ls()
# To remove all objects at once
rm( list = ls() )

# Function to create a matrix of numbers
x <- matrix( data = c(1, 2, 3, 4), nrow = 2, ncol = 2 )
x
# Similar to previous line with ommitted argument titles
x <- matrix( c(1, 2, 3, 4), 2, 2 )
x

# Notice 'byrow=True' option used to populate the matrix
# in order of the rows.
matrix( c(1, 2, 3, 4), 2, 2, byrow = TRUE )

sqrt(x)
x^2

# Following function generates a vector of random normal
# variables, with 1st argument 'n' the sample space

x = rnorm( 50 )
y <- x + rnorm( 50, mean = 50, sd = 0.1 )
# The following function computes the correlation between
# the two provided arguments
cor( x, y )

# Use 'set.seed()' to reproduce the exact same set of
# random numbers in the code. Takes integer argument.
set.seed(1303)
rnorm(50)

set.seed(3)
y <- rnorm( 100 )
# Function to compute the mean of a vector of numbers
mean( y )

# Function to compute the variance of a vector of numbers.
var( y )

# Using two functions to compute the standard deviation.
# Recall standard deviation is the square root of the variance.
sqrt( var( y ) )

# Following is standard deviation via one function in R.
sd( y )

# Graphics
# Will invoke the 'plot()' function

a <- rnorm(100)
b <- rnorm(100)
# Produce scatterplot of the numbers in a vs numbers in b.
plot( a, b )
# Now add information such as title and axes labels.
plot( a, b, xlab = "The x-axis", ylab = "The y-axis", main = "Plot of a vs b" )

# Following to the save the plot in pdf or jpeg.
pdf("Figure1.pdf")
jpeg("Figure1.jpeg")
plot( a, b, col = "green" )
dev.off()
# Last function tells R we are done creating the plot.

# Now to create a sequence of numbers.
x <- seq( 1, 10 )
x

# Shorthand for previous line.
x <- 1:10
x

x = seq( -pi, pi, length = 50 )
x


# Contour plotting
y <- x
f <- outer( x, y, function( x, y )cos(y)/(1+x^2))
contour( x, y, f )
contour( x, y, f, nlevels = 45, add = T )
fa <- (f - t(f))/2
contour( x, y, fa, nlevels = 15 )

# 'image()' function to create heatamps.
image( x, y, fa )
# Following to produce 3D plots
persp( x, y, fa )
persp(x, y, fa, theta=30)
persp( x, y, fa, theta=30, phi=20 )
persp( x, y, fa, theta=30, phi=70 )
persp(x, y, fa, theta=30, phi=40)

## Indexing Data
A = matrix(1:16, 4, 4)
A
A[2, 3]
A[c(1, 3), c(2, 4)]
A[1:3, 2:4]
A[1:2, ]
A[, 1:2]
A[1, ]
# Negative sign in the index tells R to keep all rows or columns
# except for those indicated in the index.
A[-c(1, 3), ]
A[-c(1, 3), -c(1, 3, 4)]
dim(A)
