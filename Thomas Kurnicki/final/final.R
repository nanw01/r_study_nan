# Q A
# (1)
obs <- rexp(5000)
obs

# (2)
mean(obs)
var(obs)

# (3)
exp(-0.2 * 4)
1 - exp(-0.2 * 2)
exp(-0.2 * 6)



# Q B

library(MASS)
summary(Melanoma)

# (1)

mydf <- Melanoma
library(caTools)
train_index <- sample.split(mydf$time, SplitRatio = 0.7)
training <- mydf[ train_index, ]
testing <- mydf[!train_index, ]
str(training)
str(testing)

# (2)

my_mod <- glm(ulcer ~ time + status + sex + age + year + thickness, data = training, family = "binomial")
summary(my_mod)


# (3)
my_coefficients <- my_mod$coefficients
my_coefficients_name <- names(my_coefficients)

for (i in 1:length(my_coefficients_name)) {
  print(as.character(my_coefficients_name[i]))
  print(as.numeric(my_coefficients[i]) - 1)
}


# Q C
library(MASS)
library(rpart)
library(rpart.plot)

my_tree <- rpart(ulcer ~ time + status + sex + age + year + thickness,
  data = training, method = "class", cp = 0.007
)
rpart.plot(my_tree, type = 1, extra = 1)
plotcp(my_tree)


# (3)




# (4)
my_tree_pre <- predict(my_tree, mydf, type = "prob")
my_mod_logit <- predict(my_mod, mydf, type = "response")

library(ROCR)
pred_val_tree <- prediction(my_tree_pre[, 2], mydf$ulcer)
pred_val_logit <- prediction(my_mod_logit, mydf$ulcer)

perf_tree <- performance(pred_val_tree, "tpr", "fpr")
perf_logit <- performance(pred_val_logit, "tpr", "fpr")


plot(perf_tree, col = "black")
plot(perf_logit, col = "blue", add = TRUE)

# Q D
# Shiny




# Q E




company_1 <- c(10000, 40000, 10000, 50000)
company_2 <- c(6000, 45000, 20000, 33000)
company_3 <- c(20000, 70005, 40000, 70000)
company_4 <- c(40000, 10000, 8000, 70000)


my_df_co <- as.data.frame(matrix(nrow = 4, ncol = 4))
my_df_co[1, ] <- company_1
my_df_co[2, ] <- company_2
my_df_co[3, ] <- company_3
my_df_co[4, ] <- company_4

names(my_df_co) <- c("Net income", "Total asets", "Equity", "Net sales")
rownames(my_df_co) <- c("Company 1", "Company 2", "Company 3", "Company 4")
View(my_df_co)


# (1)

for (i in 1:nrow(my_df_co)) {
  my_df_co$ROA[i] <- my_df_co$`Net income`[i] / my_df_co$`Total asets`[i]
  my_df_co$ROE[i] <- my_df_co$`Net income`[i] / my_df_co$Equity[i]
  my_df_co$`Profit margin`[i] <- my_df_co$`Net income`[i] / my_df_co$`Net sales`[i]
}
print(my_df_co[, c("ROA", "ROE", "Profit margin")])



# (2)
weighted_average <- function(weight1, weight2, weight3, weight4) {
  weighted_ROA <- weight1 * my_df_co[1, "ROA"] + weight2 * my_df_co[2, "ROA"] + weight3 * my_df_co[3, "ROA"] + weight4 * my_df_co[4, "ROA"]
  weighted_ROE <- weight1 * my_df_co[1, "ROE"] + weight2 * my_df_co[2, "ROE"] + weight3 * my_df_co[3, "ROE"] + weight4 * my_df_co[4, "ROE"]
  weighted_Profit_margin <- weight1 * my_df_co[1, "Profit margin"] + weight2 * my_df_co[2, "Profit margin"] + weight3 * my_df_co[3, "Profit margin"] + weight4 * my_df_co[4, "Profit margin"]

  return(c(weighted_ROA, weighted_ROE, weighted_Profit_margin))
}

wa_init <- weighted_average(0.25, 0.25, 0.25, 0.25)
wa_init

# (3)

wa_changed <- weighted_average(0.20, 0.20, 0.35, 0.25)
wa_changed

# (4)

# the functions are
paste("weighted_ROA =", my_df_co[1, "ROA"], " *weight1+",  my_df_co[2, "ROA"],"*weight2 +", my_df_co[3, "ROA"],  "* weight3 +",  my_df_co[4, "ROA"],"* weight4")
paste("weighted_ROE =", my_df_co[1, "ROE"], " *weight1+",  my_df_co[2, "ROE"],"*weight2 +", my_df_co[3, "ROE"],  "* weight3 +",  my_df_co[4, "ROE"],"* weight4")
paste("weighted_Profit_margin =", my_df_co[1, "Profit margin"], "* weight1+",  my_df_co[2, "Profit margin"],"* weight2 +", my_df_co[3, "Profit margin"],  "* weight3+",  my_df_co[4, "Profit margin"],"* weight4")

for (i in 1:nrow(my_df_co)) {
  my_df_co$`business insight of weight of BOA`[i] = exp(my_df_co$ROA[i]) - 1
  my_df_co$`business insight of weight of BOE`[i] = exp(my_df_co$ROE[i]) - 1
  my_df_co$`business insight of weight of Profit margin`[i] = exp(my_df_co$`Profit margin`)[i] - 1
}


print("Business Insights Table")
business_insight <- my_df_co[,c("business insight of weight of BOA","business insight of weight of BOE","business insight of weight of Profit margin")]
names(business_insight) <- c("BOA","BOE","Profit margin")
rownames(business_insight) <- c("weight1","weight2","weight3","weight4")
business_insight

# (5)

wa_0 <- weighted_average(0.25, 0.25, 0.25, 0.25)
wa_0
wa_1 <- weighted_average(0.25-0.15, 0.25, 0.25, 0.25+0.15)
wa_1

ratio <- (wa_1 - wa_0) / wa_0
ratio
