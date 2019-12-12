##################################
#This is where we import the data
##################################
library(readxl)
german_credit <- read_excel("~/Documents/Hult/Data Science R - DAT-5302 - FMSBA1/Thomas Kurnicki/Basic data/german credit card.xls")
View(german_credit)#I want to see what's in my data
#Exercise in groups... what can we see in the data?
#What can we see in the data?

###########################################
##Massaging the data
###########################################
#What do I need to fix?
my_replace <- as.numeric(eplace(german_credit_card$purpose, "", "X"))
my_new_var <- gsub()
summary(as.numeric(my_new_var))

replace(german_credit$age ,which(german_credit$purpose=="X" & german_credit$duration > 2),"100")
#Converting our binary variable to 1 and 0
german_credit$good_bad <- gsub()#why do I need the first gsub
german_credit$good_bad <- gsub()#why do I need the second gsub
german_credit$good_bad  <- as.numeric(german_credit$good_bad)

replace(german_credit$age ,which(german_credit$purpose=="X" & german_credit$duration > 2),"100")

##################################################
## taking care of the german_credit purpose characters
##################################################
german_credit$purpose <- gsub(xxxxxxx, german_credit$purpose)
german_credit$num_purpose <- as.numeric(xxxxxxxx)
