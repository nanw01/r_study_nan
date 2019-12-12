library(readxl)

mydf <- read_excel("../Basic data/german credit card.xls")

mydf$property <- as.numeric(gsub("x", "", mydf$property))

mydf$good_bad <- gsub("good", "1", mydf$good_bad)
mydf$good_bad <- gsub("bad", "0", mydf$good_bad)
mydf$good_bad <- as.numeric(mydf$good_bad)

my_ger_single <- glm(good_bad ~ age, data = mydf, family = "binomial")
summary(my_ger_single)
exp(.018440) - 1
my_ger_bigger <- glm(good_bad ~ age + amount + duration + checking, data = mydf, family = "binomial")
summary(my_ger_bigger)
exp(-3.231e-02) - 1

my_ger_game <- glm(good_bad ~ age + duration + checking + savings + employed + marital + property, data = mydf, family = "binomial")
summary(my_ger_game)





# install.packages("quantreg")
library(quantreg)
plot(iris$Sepal.Length, iris$Petal.Length)
bad_iris <- lm(Petal.Length ~ Sepal.Length, data = iris)
summary(bad_iris)

rq_model <- rq(Petal.Length ~ Sepal.Length, data = iris, tau = .2)
summary(rq_model)
rq_model <- rq(Petal.Length ~ Sepal.Length, data = iris, tau = .5)
summary(rq_model)
rq_model <- rq(Petal.Length ~ Sepal.Length, data = iris, tau = .9)
summary(rq_model)


library(ggplot2)
ggplot(data = iris, aes(Sepal.Length, Petal.Length)) +
  geom_point() +
  geom_quantile(quantiles = c(0.2, 0.5, 0.9))




rq_model <- rq(amount ~ age, data = mydf, tau = .2)
summary(rq_model)
rq_model <- rq(amount ~ age, data = mydf, tau = .5)
summary(rq_model)
rq_model <- rq(amount ~ age, data = mydf, tau = .9)
summary(rq_model)

library(ggplot2)
ggplot(data = mydf, aes(amount, age)) +
  geom_point() +
  geom_quantile(quantiles = c(0.2, 0.5, 0.9))




library(rpart)
library(rpart.plot)
library(titanic)
summary(titanic_train)

mydf_train <- as.data.frame(titanic_train)
my_logistic <- glm(Survived ~ Pclass + Sex + Age + SibSp, data = titanic_train, family = "binomial")
summary(my_logistic)
exp(-2.623483) - 1

logit_pred <- predict(my_logistic, mydf_train, type = "response")
logit_pred[1:5]


tree_tit <- rpart(Survived ~ Pclass + Sex + Age + SibSp, data = titanic_train, method = "class", cp = 0.013)
rpart.plot(tree_tit, type = 1, extra = 1)

tree_pred <- predict(tree_tit, titanic_train, type = "prob")
tree_pred





library(ROCR)
pred_val_tree <- prediction(tree_pred[, 2], mydf_train$Survived)
pred_val_logit <- prediction(logit_pred, mydf_train$Survived)

perf_logit <- performance(pred_val_logit,"tpr","fpr")
perf_tree <- performance(pred_val_tree,"tpr","fpr")

plot(perf_logit,col="black")
plot(perf_tree,col="blue",add=TRUE)

# auc 

