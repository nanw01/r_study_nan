library(readxl)
mydf = read.csv("./Thomas Kurnicki/Basic data/german credit card.csv")

mydf$good_bad <- gsub("good",1,mydf$good_bad)
mydf$good_bad <- gsub("bad",0,mydf$good_bad)
mydf$good_bad <- as.numeric(mydf$good_bad)

### Day 8
#########

library(titanic)
summary(titanic_train)
my_log_tit <- glm(Survived ~ Sex + Age + Pclass, data = titanic_train, family = "binomial")
summary(my_log_tit)

library(minpack.lm)
my_optimization <- nls.lm(titanic_train$Survived ~ my)