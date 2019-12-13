########################################## Practice Example #############################################
#########################################################################################################
########################################## Calling Libraries ############################################
library(MASS)
library(rpart)
library(rpart.plot)
library(ggplot2)
library(quantreg)
library(lmtest)


#########################################################################################################
########################################## Getting the dataset ##########################################
#########################################################################################################
birthwt

##### Creating a new dataset
mydf <- birthwt
View(mydf)


#########################################################################################################
########################################## Understanding the dataset ####################################
#########################################################################################################
View(mydf) #Overview of the data
names(mydf) #Looking at the Column names
colnames(mydf) #Looking at the Column names
summary(mydf) #Viewing the mean, median, quartiles for columns
str(mydf) #Finding classes of columns

## Checking for missing values
is.null(mydf)
sum(is.null(mydf)) 
is.na(mydf)
sum(is.na(mydf))

##### Understanding the variables to focus on
mydf$age #Ranges from 10 to 45
mydf$bwt
class(mydf$age)
class(mydf$bwt)

##### Histograms,  Boxplots & Scatterplots help understand the distribution of variables
#Not a normal distribution; Plot in ggplot or plotly to investigate further, if ever need be
Histogram_of_age <- plot(mydf$age, type = "h") 
Histogram_of_bwt <- plot(mydf$bwt, type = "h")
Histogram_of_age <- hist(x = mydf$age, 15)
Histogram_of_bwt <- hist(x = mydf$bwt, 15)
Boxplot_of_age   <- boxplot(x = mydf$age)
Boxplot_of_bwt   <- boxplot(x = mydf$bwt)
Scatterplot_age  <- plot(x = mydf$bwt, y = mydf$age)
Scatterplot_bwt  <- plot(x = mydf$age, y = mydf$bwt)


#########################################################################################################
########################################## Investigating causation between age & bwt ####################
#########################################################################################################
# The case says, "The age of the mother should impact the weight of the baby"
# Thus, weight of the baby (bwt is the response/dependent variable i.e y) is dependent on the 
# age of the mother (age is the explanatory/independent variable i.e x)

### Plotting a scatterplot to understand it better (Consider using ggplot or plotly if time permits)
Scatterplot_bwt <- plot(mydf$age, mydf$bwt) ## Heteroscedastic Data
# i.e. one line will not be the best fit to reduce the residual sum of squares (RSS)
# We might need to perform a quantile regression 


#########################################################################################################
########################################## Creating the Champion Model :: Linear Model ##################
#########################################################################################################
linear_model <- lm(data = mydf, formula=bwt~age)
summary(linear_model)

##### Testing the champion model :: Checking the co-efficient 
lm_coefficients <- linear_model$coefficients
lm_coefficients #Gives the co-efficients (Co-efficient: 12.42)
lm_estimates <- linear_model$fitted.values
lm_estimates #Gives the estimates

##### Testing the model :: Method 2
## Breush-Pagan Test
bptest(linear_model)
# p-value = 0.006735 (< 0.05) i.e. null hypothesis (that the data is homoscedastic) is rejected
# The data is heteroscedastic

##### Plotting the Linear Model
with(mydf, plot(age, bwt))
abline(linear_model)
# ?abline

#########################################################################################################
########################################## Insights from the champion model (linear_model) ##############
#########################################################################################################
# The p-value is extremely high (more than 0.05%); thus, this isn't the best possible model
# p-value: 0.2165 (Statistically insignificant)
# Residual standard error: 728.2
# R-square: 0.002853
# F-statistic: 1.538


#########################################################################################################
########################################## Challenging the champion model :: Quantile Model #############
#########################################################################################################
quantile_model <- rq(data = mydf, formula = bwt~age, tau=1:9/10)
summary(quantile_model)
quantile(x=mydf$age, 1:9/10) #This gives a quick overview of the age at various quantiles
qm_coefficients <- quantile_model$coefficients
qm_coefficients
qm_estimates <- quantile_model$fitted.values
qm_estimates

# At 5th percentile
quantile_model_1 <- rq(data = mydf, formula = bwt~age, tau=0.05)
summary(quantile_model_1)
quantile(x=mydf$age, 0.05)
qm_1_coefficients <- quantile_model_1$coefficients
qm_1_coefficients
qm_1_estimates <- quantile_model_1$fitted.values
qm_1_estimates
# At 5th percentile i.e. 16 years of age, a 1 year increase in age, will
# result in up to 56.64 grams decrease in the weight of the baby on an average

# At 20th percentile
quantile_model_2 <- rq(data=mydf, formula=bwt~age, tau=0.2)
summary(quantile_model_2)
quantile(x=mydf$age, 0.2)
qm_2_coefficients <- quantile_model_2$coefficients
qm_2_coefficients
qm_2_estimates <- quantile_model_2$fitted.values
qm_2_estimates
# At 20th percentile i.e. 19 years of age, a 1 year increase in age, will
# result in a 10.66 grams increase in the weight of the baby on an average

quantile_model_3 <- rq(data=mydf, formula=bwt~age, tau=0.9)
summary(quantile_model_3)
quantile(x=mydf$age, 0.9)
qm_3_coefficients <- quantile_model_3$coefficients
qm_3_coefficients
qm_3_estimates <- quantile_model_3$fitted.values
qm_3_estimates
# At 90th percentile i.e. 31 years of age, a 1 unit (year) increase in age, will
# result in a 23.66 units increase in the weight of the baby on an average


##### Plotting the Quantile Regression Model
# Method 1
plot(quantile_model)
plot(quantile_model, parm = 2, main = "Challenger Model", xlab = "Percentile", 
     ylab = "Weight at birth", cex = 1, pch = 19)

# Method 2
qs <- 1:9/10
ggplot(data = mydf, aes(x=age, y=bwt)) +
  geom_point()+
  geom_quantile(quantile=qs)


#########################################################################################################
########################################## Closing Insights #############################################
#########################################################################################################
# Conclusion :: Since the data is heteroscedastic, a quantile model is the best fit to regress the 
# weight of the baby at birth. 
# It can be said that babies of younger mothers (around age 16 years), tend to reduce in weight by
# up to 56 grams with increase in the age by a year. 
# Although, as the mothers' age increases, at around 19 years, the babies tend to get heavier
# by 10.66 grams with a year's increase in the mother's age; While as babies of older mothers, 
# of around 31 years, tend to increase in weight by up to 23 grams.
#########################################################################################################
################################################# Fin ###################################################
#########################################################################################################











