library(rpart)
library(rpart.plot)
library(titanic)

tree_tit <- rpart(Survived ~ Pclass + Sex + Age + SibSp, data = titanic_train, method = "class", cp = 0.013)
rpart.plot(tree_tit, type = 1, extra = 1)


library(readxl)
mydf <- read_xls("../Basic data/german credit card.xls")
my_ger_tree <- rpart(good_bad~age+checking+duration+job+telephon+amount,
                     data = mydf,method = "class")
plotcp(my_ger_tree)
rpart.plot(my_ger_tree,type = 1,extra = 1)

mydf$good_bad <- gsub("good",1,mydf$good_bad)
mydf$good_bad <- gsub("bad",0,mydf$good_bad)
mydf$good_bad <- as.numeric(mydf$good_bad)

my_ger_logitic <- glm(good_bad~age+checking+duration+job+telephon+amount,
                      data = mydf, family = "binomial")
summary(my_ger_logitic)
tree_predict <- predict(my_ger_tree,mydf,type = "prob")
logit_predict <- predict(my_ger_logitic,mydf,type = "response")
head(tree_predict)
head(logit_predict)
library(ROCR)
pred_val_tree <- prediction(tree_predict[,2],mydf$good_bad)
pred_val_logit <- prediction(logit_predict,mydf$good_bad)

perf_tree <- performance(pred_val_tree,"tpr","fpr")
perf_logit <- performance(pred_val_logit,"tpr","fpr")

plot(perf_tree,col="black",lty=3, lwd=3)
plot(perf_logit,col="blue",lty=3, lwd=3, add=TRUE)
