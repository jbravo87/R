# 
# Analyzing Simulations
#
# Fit statistical learning models to univariate data.
# Plot fitted models
# Interpret models
#
# @ J. Bravo

# Choose n between 30 - 200, and sample n values for x from a random uniform (0,1) distribution.
# Define y corresponding to x from the following quadratic function:
# y = 5x^2 - 4x - 10 + epsilon
# Where epsilon is normally dirtributed with mean 0 and standard deviation 0.1
# Will plot the data

set.seed(250)
# FirSt n
n <- 75

# Define x
x <- sort(runif(n, min = 0, max = 1))

# Noise will be stored in epsilon per relationship earlier
# Make sure to define arguments like mean though default is zero
epsilon <- rnorm(n, mean = 0, sd = 0.1)

# Now to define the relationship from earlier
# Between x and y
y <- 5*x^2 - 4*x + 10 + epsilon

xy_dframe <- data.frame(x, y)
with(xy_dframe, plot(x, y))

# Linear Model
xy_linefit <- lm(y ~ x, data = xy_dframe)
#
# The fitted model represents a line as a mathematical function of x
# It uses linear approximations to find the best fit for the data stored in x.
# Ultimately, it's the linear relationship that the model represents.
# Will implement the fitted model as a function in R
# And verify it model matches the values predicted by the model.
#
x2 <- seq(from = 0, to = 1, by = 0.1)
model_1 <- predict(xy_linefit, data.frame(xy_dframe))
print(model_1)

print(xy_linefit[["coefficients"]])
# model_1 first term value of 9.130463 is very close to the 9.121476 slope of the linear model.

#
# Quadratic Model
#