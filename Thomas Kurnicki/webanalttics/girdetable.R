library(gridBase)
library(gridExtra)

pdf("test-grid.pdf")
par(mfrow=c(2,2))

data(mtcars)
sample_table1 <- matrix(1,3,5)
sample_table2 <- matrix(2,2,2)

plot.new()
vps <- baseViewports()
pushViewport(vps$figure)
vp1 <-plotViewport()
grid.table(sample_table1)

plot.new()
vps <- baseViewports()
pushViewport(vps$figure)
vp1 <-plotViewport()
grid.table(sample_table2)

plot(mtcars$mpg, mtcars$cyl)
plot(mtcars$disp, mtcars$hp)

dev.off()
