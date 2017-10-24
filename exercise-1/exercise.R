# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles.1997 <- vehicles[vehicles$year == 1997,]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles.1997$year==1997)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
fuelefficient <- vehicles[vehicles$cty > 20,]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worstfuelcty <- fuelefficient$id[fuelefficient$cty == min(fuelefficient$cty)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MostEfficent <- function(make, year) {
  miles <- vehicles[vehicles$make == make & vehicles$year == vehicles$year,]
  return(miles[miles$hwy == max(miles$highway), ])
}

# What was the most efficient honda model of 1995?
MostEfficent('Honda', 1995)

