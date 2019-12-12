sailors <- as.data.frame(matrix(nrow=10))
sailors$sid <- c(22, 29, 31, 32, 58, 64, 71, 74, 85, 95)
sailors$sname <- c("Dustin", "Brutus", "Luber", "Andy", "Rusty", "Horatio", "Zorba", "Horatio", "Art", "Bob")
sailors$rating <- c(7, 1 ,8, 8, 10, 7, 10, 9, 3, 3)
sailors$age <- c(45, 33, 55.5, 25.5, 35, 35, 16, 35, 25.5, 63.5)
summary(sailors)

reserves <- as.data.frame(matrix(nrow=10))
reserves$sid <- c(22, 22, 22, 22, 31, 31, 31, 64, 64, 74)
reserves$bid <- c(101, 102, 103, 104, 102, 103, 104, 101, 102, 103)
reserves$day <- c("10/10/98", "10/10/98", "10/8/98", "10/7/98", "11/10/98", "11/6/98", "11/12/98", "9/5/98",
               "9/8/98", "9/8/98")
summary(reserves)

boats <- as.data.frame(matrix(nrow=4))
boats$bid <- c(101, 102, 103, 104)
boats$bname <- c("Interlake", "Interlake", "Clipper", "Marine")
boats$color <- c("blue", "red", "green", "red")
summary(boats)

library(sqldf)
sqldf("
SELECT distinct s.sname
FROM sailors s, reserves r 
WHERE s.sid=r.sid
      ")

sqldf("
  SELECT s.rating, min(s.age)
FROM sailors s
      WHERE s.age >= 18
      GROUP BY s.rating
      HAVING COUNT(*)>1
     ")

sqldf("
      Select s.sname as sailorname,
      case when s.age>35 then 1
          when s.age<35 then 0
          else 2 
          end as binary
      FROM sailors s
      ")
