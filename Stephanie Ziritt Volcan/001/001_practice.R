
#Class_1_R_codes

mode(c(1,2,3,4,5))

mean(1:5) #Calculating Arithmetic Mean in R

help.start() #general help

?mean #opens the help page for the mean function

help("mean") #does the same thing as ?mean

??anova  #searches for topics containing anova

help.search("anova")  #does the same thing as ??anova

a_vector<-c(1,3,6,10)
apropos("vector") #recall the variable a_vector 

apropos("z$") #find all variable ending in z
apropos("[4-9]") #find all variables containing a number between 4-9

example(plot) #most functions have examples that you can run to get a better idea of how they work
plot<-plot(cars) #example

browseVignettes() #browse all vignettes related to packages

getwd() #getting working directorty

setwd() #setting working directory

library() #shows the packages you've saved in your library

.libPaths() #shows where your library is located

search() #shows which packages are loaded and ready to use

install.packages("gclus") #download and install the package

library(gclus) #command to use the package gclus

update.packages("gclus") #update any packages that have been installed

help(package=gclus) #list the functions and dataset available in the package gclus



#Source with file path 

source("C:/Users/Nabanita/Desktop/Hult_Teaching_Summer_2019/Hult_Fall_2019/Data_Science_R_Fall_2019/myfile.R")



#Source function submits a script to the current session

source("myfile.R")
y

head(ChickWeight)

head(mtcars)

#Sink function redirects output to the file example_2
sink("example_2.txt") #Create empty txt file
ChickWeight #Print ChickWeight data
sink() #Close connection to file

#Sink function with append and split 
sink("filename.txt", append=TRUE, split=TRUE)
mtcars
sink()








