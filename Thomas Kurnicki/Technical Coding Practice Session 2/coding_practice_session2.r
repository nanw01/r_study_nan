#Review session code by Masato Eguchi for Dec/10,12/2019
#Please note that dataset used here is modified for this session.


############################# Preparation ##################################


#setwd("/Users/eguchimasato/HULT/After_graduation/R class script 2019")
#install.packages("ROCR")
#install.packages("rpart")
#install.packages("readr")
library(readr)

#Read data
pkdf <- read.csv("Pokemon_for_session.csv")


#Let's see what's in the data
head(pkdf)
summary(pkdf)


############################### logistic regression ################################

#Try with all the dependent variables first.
pk_logit_model <- glm(Legendary ~ Attack + Defense + Sp_Atk + Sp_Def + HP + Speed, data = pkdf, family = "binomial")
summary(pk_logit_model)

#Try deelating Defense
#Note to do it one by one because changing one variable affects on all the variables.  
pk_logit_model <- glm(Legendary ~ Attack + Sp_Atk + Sp_Def + HP + Speed, data = pkdf, family = "binomial")
summary(pk_logit_model)

#Try deleting Speed
pk_logit_model <- glm(Legendary ~ Attack + Sp_Atk + Sp_Def + HP, data = pkdf, family = "binomial")
summary(pk_logit_model)
#Good model!

# How do you interpret coefficient on Attack?
exp(0.029982)-1
#if Attack increases by 1 point, chance of this Pokemon being legendary increases by 3.04%



################################## Tree #######################################


# Try creating tree model.
library(rpart)

# Putting the same variables from tree.
pk_tree_model <- rpart(Legendary ~  Attack + Sp_Atk + Sp_Def + HP, data = pkdf, method = "class")  #, control=rpart.control(minsplit=50, cp=0.018))
rpart.plot::rpart.plot(pk_tree_model, type = 1, extra=1, box.palette =c("pink", "green"), branch.lty=3, shadow.col = "gray")
summary(pk_tree_model)


# Let's try protting cp
plotcp(pk_tree_model)


################################# Comparison ####################################
#Let's compare! (logistic regression vs tree)

library(ROCR)

#We want to predict probability of 1 for each observations

#predict with logistic regression
pk_predict_logit <- predict(pk_logit_model, pkdf, type="response")
print(pk_predict_logit)


#Is pokemo ID 59 legendary?
pk_predict_logit[59]
#most likely not


#Is pokemo ID 799 legendary?
pk_predict_logit[799]
#most likely yes!


#predict with tree
pk_predict_tree <- predict(pk_tree_model, pkdf, type="prob")
print(pk_predict_tree)


#Storing Model Performance Scores
pk_logit_prediction <- prediction(pk_predict_logit, pkdf$Legendary)
pk_tree_prediction <- prediction(pk_predict_tree[,2], pkdf$Legendary) 


#Let's get performance.
pk_performance_logit <- performance(pk_logit_prediction,"tpr","fpr")
pk_performance_tree <- performance(pk_tree_prediction,"tpr","fpr")



#Let's plot and compare. The more area under the curve, the better the model is.
plot(pk_performance_logit,col="blue",lty=3, lwd=3)
plot(pk_performance_tree,col="black",lty=3, lwd=3, add=TRUE)
#logistic regression wins!

