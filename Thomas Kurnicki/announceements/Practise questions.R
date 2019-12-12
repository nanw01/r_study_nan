#install.packages("MASS")
library(MASS)
data("Cars93")

#######################################
# data massaging
#######################################

#1 - How to convert character variable to numeric?

unique(Cars93$Origin) # checking unique values in origin variable
Cars93$originbin <- NA # create empty variable to store binary values


for(i in 1:nrow(Cars93)){
  if(Cars93$Origin[i] == "USA"){
    Cars93$originbin[i]<- 1
  }else{Cars93$originbin[i]<- 0}
} 

Cars93$originbin 

#2 - NA values
anyNA(Cars93) # checking for null values
sum(is.na(Cars93)) #sum up total null values
summary(Cars93)# quick way to check which column has NAs

# How to interpolate NA values?
for(i in 1:nrow(Cars93)){
  if(is.na(Cars93$Rear.seat.room[i])){
    Cars93$Rear.seat.room[i] <- mean(Cars93$Rear.seat.room[-which(is.na(Cars93$Rear.seat.room))])}
} 


# 3 - How to create a subset of a df based on a condition?
cars_nonUS <- subset(x = Cars93, subset = originbin == 0)



#######################################
# UDFs
#######################################

# 1 - Create a function to get x raised to power y
raised_2_power <- function(x, y){
  a <- x^y
  return(a)
}
raised_2_power(2,2)

# 2 - Create a funcion to take log of numeric and multiply that log by another number
my_log_y <- function(x, y){
  log <- log(x)
  log_y <- log*y
  return(log_y)
}
my_log_y(5, 1)

# 3 - Create a function to get mean and median of a numeric variable  
my_function <- function(col){     
  if(is.numeric(col)==TRUE){
    meme <- c(mean(col), median(col))
    return(meme)}else{print("Variable is not numeric!")}
}
my_function(Cars93$Weight)
my_function(Cars93$Model)


#######################################
# Distributions - Exponential - describes time between events
#######################################
# only one parameter: lambda-describes the rate of events arriving
# higher lambda = steeper curve

## time between each phone call on a festival

# 1 - What is expected value (mean) of the phone ringing if the lambda is 0.1 
      # theoretically = 1/0.1 = 10
mean(rexp(1000, rate = 0.1)) # for 1000 observations. Mean gets closer to 10 as we increase number of observations.

# 2 - what is the probability of phone ringing in more than 15 minutes after the previous call?
exp(-0.1*15)

# what is the probability of phone ringing in less than 15 minutes after the first call?
1 - exp(-0.1*15)

# 3 - what is the probability of phone ringing in less than 2 minutes after the previous call?
1 - exp(-0.1*2)

