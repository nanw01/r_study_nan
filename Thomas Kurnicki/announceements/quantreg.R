# https://www.cnblogs.com/shangfr/p/5736738.html

library(quantreg)  # 载入quantreg包
data(engel)        # 加载quantreg包自带的数据集

# 分位数回归(tau = 0.5)
fit1 = rq(foodexp ~ income, tau = 0.5, data = engel)         
r1 = resid(fit1)   # 得到残差序列，并赋值为变量r1
c1 = coef(fit1)    # 得到模型的系数，并赋值给变量c1

summary(fit1)      # 显示分位数回归的模型和系数
# `
# Call: rq(formula = foodexp ~ income, tau = 0.5, data = engel)
# 
# tau: [1] 0.5
# 
# Coefficients:
#   coefficients lower bd  upper bd 
# (Intercept)  81.48225     53.25915 114.01156
# income        0.56018      0.48702   0.60199
# `

summary(fit1, se = "boot") # 通过设置参数se，可以得到系数的假设检验
# `
# Call: rq(formula = foodexp ~ income, tau = 0.5, data = engel)
# 
# tau: [1] 0.5
# 
# Coefficients:
#   Value    Std. Error t value  Pr(>|t|)
# (Intercept) 81.48225 27.57092    2.95537  0.00344
# income       0.56018  0.03507   15.97392  0.00000
# `

# 分位数回归(tau = 0.5、0.75)
fit1 = rq(foodexp ~ income, tau = 0.5, data = engel)
fit2 = rq(foodexp ~ income, tau = 0.75, data = engel)

# 模型比较
anova(fit1,fit2)    #方差分析
# `   
# Quantile Regression Analysis of Deviance Table
# 
# Model: foodexp ~ income
# Joint Test of Equality of Slopes: tau in {  0.5 0.75  }
# 
# Df Resid Df F value    Pr(>F)    
# 1  1      469  12.093 0.0005532 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# `   
# 画图比较分析
plot(engel$foodexp , engel$income,pch=20, col = "#2E8B57",
     main = "家庭收入与食品支出的分位数回归",xlab="食品支出",ylab="家庭收入")
lines(fitted(fit1), engel$income,lwd=2, col = "#EEEE00")
lines(fitted(fit2), engel$income,lwd=2, col = "#EE6363")
legend("topright", c("tau=.5","tau=.75"), lty=c(1,1),
       col=c("#EEEE00","#EE6363"))
# 不同分位点的回归比较
fit = rq(foodexp ~ income,  tau = c(0.05,0.25,0.5,0.75,0.95), data = engel)
plot( summary(fit))




data(barro)

fit1 <- rq(y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, data = barro,tau=.25)
fit2 <- rq(y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, data = barro,tau=.50)
fit3 <- rq(y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, data = barro,tau=.75)
# 替代方式 fit <- rq(y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, method = "fn", tau = 1:4/5, data = barro)

anova(fit1,fit2,fit3)             # 不同分位点模型比较-方差分析
anova(fit1,fit2,fit3,joint=FALSE)
# `
# Quantile Regression Analysis of Deviance Table
# 
# Model: y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2
# Tests of Equality of Distinct Slopes: tau in {  0.25 0.5 0.75  }
# 
# Df Resid Df F value  Pr(>F)  
# lgdp2   2      481  1.0656 0.34535  
# fse2    2      481  2.6398 0.07241 .
# gedy2   2      481  0.7862 0.45614  
# Iy2     2      481  0.0447 0.95632  
# gcony2  2      481  0.0653 0.93675  
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# Warning message:
#   In summary.rq(x, se = se, covariance = TRUE) : 1 non-positive fis
# `
# 不同分位点拟合曲线的比较
plot(barro$y.net,pch=20, col = "#2E8B57",
     main = "不同分位点拟合曲线的比较")
lines(fitted(fit1),lwd=2, col = "#FF00FF")
lines(fitted(fit2),lwd=2, col = "#EEEE00")
lines(fitted(fit3),lwd=2, col = "#EE6363")
legend("topright", c("tau=.25","tau=.50","tau=.75"), lty=c(1,1),
       col=c( "#FF00FF","#EEEE00","#EE6363"))
