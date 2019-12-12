#################################
#Optimizing a production function
#################################
mix1 <- c(1200, 600, 1050, 860, 720)
mix2 <- c(1050, 310, 2100, 990, 880)
mix3 <- c(720, 420, 1700, 1600, 1120)

my_func <- function(m1, m2, m3){
  total <- m1*mix1 + m2*mix2 + m3*mix3
  return(total)
}

objective <- c(1000, 480, 1800, 1000, 990)
library(minpack.lm)
nlsLM(objective ~ my_func(mix1, mix2, mix3))

