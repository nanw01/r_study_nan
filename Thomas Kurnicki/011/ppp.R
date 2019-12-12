# You will focus on two variables:
#   -age – this is the age of the mother
#   -bwt – this is the weight of the newborn in grams
# You think that there’s causation between age and bwt. The age of the mother should impact the weight of the baby.
# Create a linear model for this causation and provide business insight.

library(MASS)

summary(birthwt)
View(birthwt)

birthwt_line <- lm(age ~ bwt, data = birthwt)
summary(birthwt_line)

as.numeric(birthwt_line$coefficients[1])

library(ggplot2)
p <- ggplot(birthwt_line, aes(age, bwt))
p + geom_point() + geom_abline(intercept = as.numeric(birthwt_line$coefficients[1]), slope = as.numeric(birthwt_line$coefficients["bwt"]))
