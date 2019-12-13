library(readxl)
german_credit <- read_excel("./Thomas Kurnicki/Basic data/german credit card.xls")
german_credit$good_bad <- gsub("good",1,german_credit$good_bad)
german_credit$good_bad <- gsub("bad",0,german_credit$good_bad)
german_credit$good_bad <- as.numeric(german_credit$good_bad)

#lets split our german credit data for training and testing using random sampling

# ?sample
# sample(x, size, replace = FALSE, prob = NULL)

train_index <- sample(1:nrow(german_credit), size=round(0.6*nrow(german_credit)))
test_index <- c(1:nrow(german_credit))[-train_index]
gc_train <- german_credit[train_index,]
gc_test <- german_credit[test_index,]

#Creating one variable logistic regression
my_mod <- glm(good_bad~age, data=gc_train, family="binomial")
summary(my_mod)

# family 参数的不同写法，代表不同的方式
# my_mod <- glm(good_bad~age, data=gc_train, family=binomial(link="logit"))
# summary(my_mod)

#using the model to predict the 1/0 var in the test dataset
# 返回列表是没个数据的概率
predict(my_mod, gc_test, type="response")

#what if the model we got was not very acurate, 
#what if it got just 1s and no 0s?
#then you would do stratified sampling
#install.packages("caTools")
# 一个基础工具包,同样的方式进行测试数据跟训练数据的分割，选择数据
library(caTools) 
train_index <- sample.split(german_credit$good_bad, SplitRatio=0.7)
train <- german_credit[ train_index,]
test <- german_credit[!train_index,]

#Creating one variable logistic regression with stratified sampling
my_mod <- glm(good_bad~age, data=train, family="binomial")
summary(my_mod)

#using the model to predict the 1/0 var in the test dataset with stratified sampling
test$response_0 <- predict(my_mod, test, type="response")
View(test)

#now that we know that the response from the model is bad quality, 
#what should we do?
#what if age is not the best variable? let's use telephon and property and other

my_mod <- glm(good_bad~telephon+property+duration+checking, data=train, family="binomial")
summary(my_mod)

#using the model to predict the 1/0 var in the test dataset with stratified sampling
?preedict
test$response_1 <- predict(my_mod, test, type="response")
View(test)



#suddenly our model is much better! Take a look at the AIC score - it's getting lower
#also, look at some of the 0s and how low the probability is!!

#how can I get confidence intervals on the coefficients for this model:
## odds ratios and 95% CI
exp(cbind(OR = coef(my_mod), confint(my_mod)))

