# 
# Analyzing Simulations
#
# Visualize and compare complex data. Use higher order functions.
#
# @ J. Bravo

# Function to calculate odds form casino game roulette.
# Will use the following betting strategies column vs straightup.

# The following are various types of bets in roulette.
even <- function( x )
{
  win = ( x %% 2 == 0 ) & ( x != 0 )
  ifelse( win, 1, -1 )
}

high <- function( x )
{
  win = ( 18 < x ) & ( x != 0 )
  ifelse( win, 1, -1 )
}

column <- function( x )
{
  ifelse( x %% 3 == 1, 2, -1 )
}

straightup <- function( x, d = 1 )
{
  ifelse( x == d, 35, -1 )
}

# Construct a simple betting strategy.
simple_strategy <- function( bet = column )
{
  function( x ) cumsum( bet(x) )
}
# Used the cumulative sum function.

# Create another simple betting strategy.
simple_strategy <- function( bet = straightup )
{
  function( x, d = 12 ) cumsum( bet(x) )
}

play <- function( strategy = simple_strategy(), nplayers = 100L, ntimes = 1000L, ballvalues = 0:36 )
{
  out = replicate( nplayers, strategy( sample( ballvalues, size = ntimes, replace = TRUE ) ),
                   simplify = FALSE)
  data.frame( winnings = do.call( c, out ), player = rep( seq(nplayers), each = ntimes ),
              time = rep( seq( ntimes ), times = nplayers ) )
}

# Simple stategies. Will create a visualization of a simulation of how much two players win at a given time,
# if they sit down and each play 75 times. One player will use the 'column' betting strategy and anotherwill
# will use the 'straightup' betting strategy.

library("ggplot2")
theme_set( theme_grey() )

# Global variable.
TIMEs = 75

# Standardize the starting point of the random number generator.
set.seed( 890 )

# Player 1 will use the 'column' strategy.
player_1 <- play( strategy = simple_strategy( column ), nplayers = 1, ntimes = 75L )

# Player 2 will use the 'straightup' betting strategy.
player_2 <- play( strategy = simple_strategy( straightup ), nplayers = 1, ntimes = 75L )

# Now to create the two new columns with information of interest.
player_1$strategy <- "Column"
player_2$strategy <- "Straight up"

# Will use the rbind function
dataset <- rbind( player_1, player_2 )

# Now to plot.
plot_1 <- ggplot( data = dataset, mapping = aes( x = time, y = winnings) ) + geom_step( aes(color=strategy))
print( plot_1 )

# The Martingale strategy.
doublebet = function( x, initalbet = 1, strategy = even )
{
  winnings = rep( NA, length( x ) )
  betsize = initialbet
  current_winnings = 0
  for( i in seq_along( x ) )
  {
    if( strategy( x[i] ) == 1 )
    {
      current_winnings = current_winnings + betsize
      betsize = initialbet
    }
    else
    {
      current_winnings = current_winnings - betsize
      betsize = 2*betsize
    }
    winnings[i] = current_winnings
  }
  winnings
}
# 'doublebet' implements basic Matingale doubling strategy but inefficient.

# Analyzing the Martingale strategy
# For the 'high' strategy
doublebet_high = function( x, initialbet = 1, strategy=high)
{
  winnings = rep(NA, length(x))
  betsize = initialbet
  current_winnings = 0
  for(i in seq_along(x))
  {
    if(strategy(x[i]) == 1) 
    {
      current_winnings = current_winnings + betsize
      betsize = initialbet
    }
    else
    {
      current_winnings = current_winnings - betsize
      betsize = 2*betsize
    }
    winnings[i] = current_winnings
  }
  winnings
}

# For the 'straightup' strategy
doublebet_straightup  = function(x, initialbet = 1, strategy = straightup)
{
  winnings = rep(NA, length(x))
  betsize = initialbet
  current_winnings = 0
  for(i in seq_along(x))
  {
    if(strategy(x[i]) == 1)
    {
      current_winnings = current_winnings + betsize
      betsize = initialbet
    }
    else
    {
      current_winnings = current_winnings - betsize
      betsize = 2*betsize
    }
    winnings[i] = current_winnings
  }
  winnings
}

martingale_straightup = play(doublebet_straightup, nplayers = 1, ntimes = 75L)

g1 <- ggplot(data = martingale_straightup, mapping = aes(x = time, y = winnings)) + geom_line() + labs(title = "The Martingale Strategy in Roulette - Straight up")
print(g1)

martingale_high <- play(doublebet_high, nplayers = 1, ntimes = 75L)
g2 = ggplot(data = martingale_high, mapping = aes(x = time, y = winnings)) + geom_line() + labs(title = "The Martingale Strategy in Roulette - High")
print(g2)
