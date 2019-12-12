##############
#The for loop#
##############

for(i in 1:10){#opening i loop
  print(i)
}#closing i loop
###########################################
#creating a new object(vector) with a loop#
###########################################
my_vect <- c()
for(i in 1:10 ) {
  my_vect[i] <- i^3
  print(my_vect)
}#closing z loop

################
# Exercise : 5-7 minutes
# Create a for loop that takes the value of purpose for each observation 
#and puts it to a new vector
################


#################
#Nested for loop#
#################

my_df <- as.data.frame(matrix(nrow=4, ncol=3))
for (a in 1:3){#this loop goes over the columns
  for(b in 1:4){#this loop goes over the rows
    my_df[b,a]<- a*b
  }
}
print(my_df)

library(readxl)
mydf <- read_excel("../Basic data/german credit card.xls")
mydf$purpose_num <- as.numeric(gsub("x","",mydf$purpose))

mydf$good_bad<-gsub("good",1,mydf$good_bad)
mydf$good_bad<-gsub("bad",0,mydf$good_bad)
mydf$good_bad<-as.numeric(mydf$good_bad)

mydf_sub <- mydf[,c("age","duration","good_bad")]
newdf <- as.data.frame(matrix(nrow = 1000, ncol = 2))
for (a in 1:2) {
  for (b in 1:nrow(mydf_sub)) {
    newdf[b,a]<-mydf_sub[b,a]*mydf_sub$good_bad[b]
  }
}

colnames(newdf) <- c("newage","newXXX")

##############
#The while loop#
##############

z <- 1
while(z < 20){
  z <- z+1 
  print(z)
}

###########################
#One condition if statment#
###########################
pk <- c(1,2,3,4,5,6)

if(pk[2]==2){pk[1]<-2}
if(sum(pk)>10){pk <- NULL}

#############################
#Multi condition if statment#
#############################

pk <- c(6,5,4,3,2,1)

if(pk[2]==2){pk[1]<-2}else{pk[2]<-2}
if(sum(pk)>10){pk <- NULL}

#########################################
## Exercise:
# Create a a for loop that checks every observation in the good_bad variable
# If the value is one (good), then mark the observation as "positive" in a new variable called description
##########################################


for (i in 1:nrow(mydf)) {
  if (mydf$good_bad[i] == 1) {
    mydf$description[i] <- "positive"
  } else {
    mydf$description[i] <- "negtive"
  }
}




########################
#User defined functions#
########################


my_function <- function(x, y, z){ #x,y,z are inputs
  
  #This is the body of the function that has to return an object . The body will use all the variables specified in the function call.
  my_final_obj <- x+y+z
  return(my_final_obj)
}
new <- my_function(x=1, y=2, z=3)#I'm calling "myfunction"

##################################
## Exercise:
# What task can a User Defined Function automate in
#the German Creadit Dataset
###################################



mix1 = c(1200,600,1050,860,720)
mix2 = c(1050,310,2100,990,880)
mix3 = c(720,420,1700,1000,1120)

my_func = function(m1,m2,m3){
  total = m1*mix1 + m2*mix2 + m3*mix3
  return(total)
}

objective = c(1000,480,1800,1000,990)
library(minpack.lm)
nlsLM(objective ~ my_func(m1,m2,m3))






mean(c(2,6,2,3,2))
mean(c(1,6,2,6,3))
mean(c(3,4,4,2,4))
mean(c(5,6,1,2,3))







