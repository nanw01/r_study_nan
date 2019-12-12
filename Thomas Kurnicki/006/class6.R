new_mydf <- as.data.frame(mydf)

for (i  in 1:3) {
  hist(as.numeric(new_mydf[,i]))
}


size <- c(31,25,62,85,64,81,89,102)
signedup<-c("No","No","Yes","Yes","No","Yes","Yes","Yes")
salesforce <- as.data.frame(matrix(nrow = 8,ncol = 1))
salesforce$size <- size
salesforce$signedup <- signedup
# View(salesforce)

salesforce$signedup <- gsub("No","0",salesforce$signedup)
salesforce$signedup <- gsub("Yes","1",salesforce$signedup)
salesforce$signedup <- as.numeric(salesforce$signedup)
salesforce

salesforce_mod <- glm(signedup~size,data = salesforce,family = "binomial")
summary(salesforce_mod)

logittoprob <- function(beta_0,x,beta_1){
  logit <- beta_0 +x*beta_1
  odds<- exp(logit)
  prob<-odds/(1+odds)
  return(c(odds,prob))
}
logittoprob(beta_0 = -11.96,x = 80, beta_1 = 0.1912)
logittoprob(beta_0 = -11.96,x = 30, beta_1 = 0.1912)
hist()







