install.packages("ggplot2")
library(ggplot2)


graph<-ggplot(women, aes(height , weight ))
graph + geom_point()


mtcars 



mtcarsBoxplot<- ggplot(mtcars, aes(group=cyl, y=mpg))
mtcarsBoxplot + geom_boxplot() +labs(x="cylinders", y="mpg")



spiderData<-read.delim("SpiderLong.dat", header =TRUE)
bar <- ggplot(spiderData, aes(x=Group,y=Anxiety))
bar + stat_summary(fun.y = mean, geom = "bar", position="dodge") 





