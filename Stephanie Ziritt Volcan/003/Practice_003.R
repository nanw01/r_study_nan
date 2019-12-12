mydata2 <- read.csv(file="german credit card.csv",header = T,sep = ",")
mydata2

head(mydata2)

which.min(mydata2$amount)
which.max(mydata2$amount)


y<-subset(mydata2,amount>250,select=c(amount,purpose,history))
y



# The easiest way to get ggplot2 is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just ggplot2:
install.packages("ggplot2")

# Or the the development version from GitHub:
# install.packages("devtools")
devtools::install_github("tidyverse/ggplot2")



x <− rnorm(100,mean = 5,sd = 0.1) mean(x)
sd(x)
summary ( x )
demo( graphics )





