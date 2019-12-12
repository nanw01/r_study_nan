library(readxl)
mydf <- read_excel("Basic data/german credit card.xls")
mydf$purpose_num <- as.numeric(gsub("x","",mydf$purpose))

mydf$good_bad<-gsub("good",1,mydf$good_bad)
mydf$good_bad<-gsub("bad",0,mydf$good_bad)
mydf$good_bad<-as.numeric(mydf$good_bad)


a = c()
for(i in 1:nrow(mydf$purpose)){
  a[i] <- mydf$purpose[i]
}
mydf$a <- a


# uniform
hist(sample(c(1,2,3,4,5,6),1000,replace = T))
# binomail
hist(sample(c(0,1),1000,replace = T))

hist(rexp(1000,rate = 2), breaks = seq(from = 0,to = 60, by = 2))

exp(-0.5*15)
1-exp(-0.5*15)
     