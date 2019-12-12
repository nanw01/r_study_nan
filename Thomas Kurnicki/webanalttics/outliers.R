# 给数据集插入离群值
cars1 <- cars[1:30, ] # 原始数据
cars_outliers <- data.frame(
  speed = c(19, 19, 20, 20, 20),
  dist = c(190, 186, 210, 220, 218)
) # 引入离群值
cars2 <- rbind(cars1, cars_outliers) # 包含李全职的数据

cars1
cars2

cars2 <- cars2[cars2$speed!=c(19, 19, 20, 20, 20),]
cars2
# 绘制包含离群值的数据建模结果
par(mfrow = c(1, 2))
plot(cars2$speed, cars2$dist,
  xlim = c(0, 28), ylim = c(0, 230),
  main = "With Outliers", xlab = "speed", ylab = "dist",
  pch = "*", col = "red", cex = 2
)
abline(lm(dist ~ speed, data = cars2), col = "blue", lwd = 3, lty = 2)

# 绘制原始数据建模加过，留意回归线斜率的变化
plot(cars1$speed, cars1$dist,
  xlim = c(0, 28), ylim = c(0, 230),
  main = "Outliers removed \n A much better fit!",
  xlab = "speed", ylab = "dist", pch = "*", col = "red", cex = 2
)
abline(lm(dist ~ speed, data = cars1), col = "blue", lwd = 3, lty = 2)
