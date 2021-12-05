####################
# Ambitious attempt to predict what will happen to future national parks
# based off actions from previous administrations.
# Will invoke use of Logistic Regression
#
####################

nat_parks <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/antiquities-act/actions_under_antiquities_act.csv", header = TRUE, stringsAsFactors = FALSE)

# Will begin by examining numerical and graphical summaries
# of the 'action' data under given data frame.

class(nat_parks)
# Indeed a data frame

str(nat_parks)
head(nat_parks)

# column of interest will be stored in coi
coi <- nat_parks$action

states <- nat_parks$states

coi
dim(coi)
cor(states, coi)

# Will try and turn each state into a numeric
states
as.numeric(as.character(states))
