#before running the code, make sure to import the dataste
#mydata <- read.csv(file="/Users/thomaskurnicki/Desktop/HULT R class/Day3/german credit card.csv")
#head(mydata)
#summary(mydata)
library(sqldf)
lookup_model <- sqldf("
SELECT age, min(employed), median(employed), abs(median(employed)-2) as empl_diff, 
max(employed),
min(duration), median(duration), abs(median(duration)-18) as dur_diff, max(duration)
FROM german_credit
WHERE age>20
GROUP BY age
ORDER BY age
")

lookup_model

plot(lookup_model$`median(duration)`, lookup_model$`median(employed)`, ylim=c(0,6))

#which group would employed=3.65 and duration = 18.65 belong to?
#using Euclidean distance:
euclidean <- sqldf("
SELECT age, avg(employed), avg(duration), sqrt((abs(avg(employed)-3.65)+abs(avg(duration)-18.65))/2) as euclidean_dist
                   FROM german_credit
                   WHERE age>20
                   GROUP BY age
                   ORDER BY age
                   ")

#install.packages("deldir")
library(deldir)
vt <- deldir(euclidean$`avg(employed)`, euclidean$`avg(duration)`)
plot(euclidean$`avg(employed)`, euclidean$`avg(duration)`)
plot(vt, wlines="tess", lty="solid", add=TRUE)





