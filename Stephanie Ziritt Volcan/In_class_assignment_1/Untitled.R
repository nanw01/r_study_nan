df4<- read.table("teach.txt", header=TRUE, sep="\t")
df4


df5<-read.table("generic.csv", header=TRUE, sep = ",") 
df5

job <-c("Lecturer", "Assistant Professor", "Professor")
fator_job <-factor(job , order=TRUE,levels=c("Lecturer", "Assistant Professor", "Professor"))
fator_job 





