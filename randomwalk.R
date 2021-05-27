true_p <- 0.4

set.seed( 2487 )

x = rbinom( 10, 1, true_p )

typeof( x )


p_hat = mean( x )

n = 100
x = rbinom( n, size = 3, prob = true_p )

plot( table(x) )

h = hist( x )

str( h )

library( ggplot2 )

x = 1:10
y <- runif( 10 )

y_without_last2 <- y[ -c( 9, 10 ) ]
y_without_last2

# Type coercion
z = c( 1, 2L, 3.14159, "hello" )

z[2] = NA
z2 = NA

is.na( z2 )

is.na( z )

length( y_without_last2 )

qplot( x, y )

# Random stuff.
set.seed( 542893 )

# Random walk
random_walk <- function( n = 100 )
{
  x0 = rnorm( n )
  x = cumsum( x0 )
  
  y0 = rnorm( n )
  y <- cumsum( y0 )
  
  plot( x, y, type = "l" )
}

random_walk( 500 )

rm( list = ls() )

directions <- c( "north", "east", "south" , "west" )

step <- function( position, directions )
{
  if(direction == "north"){
    position$y = position$y + 1L
  } else if(direction == "east"){
    position$x = position$x + 1L
  } else if(direction == "south"){
    position$y = position$y - 1L
  } else if(direction == "west"){
    position$x = position$x - 1L
  }
  position
}

# Plot a single step
plot_step = function(from, to)
{
  arrows(from$x, from$y, to$x, to$y, length = 0.1)
}

# Run an entire simulation
#simulate = function(position = list(x = 0, y = 0),pause = 0.2, bounds = 10, nsteps = bounds * 10)
#{
#  b = c(-bounds, bounds)
#  plot(b, b, type = "n")
#  walk = sample(directions, nsteps, replace = TRUE)
#  to = position
#  for(d in walk){
#    from = to
#    to = step(from, d)
#    plot_step(from, to)
#    Sys.sleep(pause)
#  }
#  from
#}

#set.seed(4378)
#simulate()

#simulate()

