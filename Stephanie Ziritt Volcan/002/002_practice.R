1:5 + 2:6

typeof(c(1,2,3))
typeof(2)
mode(c(1,2,3))

class(3+2i)

(gender <- factor(c("male","female","female","male","female")))

levels(gender)
nlevels(gender)



gender_char <- sample(c("female","male"),10000,replace = TRUE)
gender_fac <- as.factor(gender_char)
object.size(gender_char)





x <- "123.123"
class(x)<-"numeric"
x
is.numeric(x)




ulams_spiral <- c(1, 8, 23, 46, 77)  #See http://oeis.org/A033951 
for(i in ulams_spiral) i             #uh-oh, the values aren't printed 
for(i in ulams_spiral) print(i)



num <- runif(30)
summary(num)

fac <- factor(sample(letters[1:5], 30, replace = TRUE))
summary(fac)

bool <- sample(c(TRUE,FALSE,NA),30,replace = TRUE)
summary(bool)


dfr <- data.frame(num,fac,bool)
head(dfr)


summary(dfr)

str(num)

unclass(fac)
attr(fac,"levels")


attributes(fac)



install.packages("xquartz")

View(dfr)
new_dfr <- edit(dfr)
fix(dfr)



x <- (1:5) ^ 2

x[c(1, 3, 5)]
x[c(-2,-4)]
x[c(TRUE,FALSE,TRUE,FALSE,TRUE)]


x<-matrix(1:15,nrow = 5)
x
names(x) <- c('a','b','c')
x




1:5 +1:15
1:5+1:7



rep(1:5,3)
rep(1:5,each=3)
rep(1:5,time=1:5)
rep(1:5,length.out=7)

rep.int(1:5,3)

rep_len(1:5,13)




"dimension"
(
three_d_array <- array(1:24,
                      dim=c(4,3,2),
                      dimnames=list(
                        c('one','two','three','four'),
                        c('ein','zwei','drei'),
                        c('un','deux')
                      )
                      )
)




(a_matrix <- matrix(   1:12,   
                       nrow = 4,            #ncol = 3 works the same   
                       dimnames = list(     
                         c("one", "two", "three", "four"),     
                         c("ein", "zwei", "drei")   
                         ) 
                       ))


a_matrix['one','ein']
a_matrix[1,1]

class(a_matrix)


matrix(
  1:12,
  nrow = 4,
  byrow = TRUE,
  dimnames = list(
    c("one","two","three","four"),
    c("ein","zwei","drei")
  )
)

dim(three_d_array)

nrow(three_d_array)
ncol(three_d_array)

length(three_d_array)


dim(a_matrix) <- c(6,2)
a_matrix

dimnames(a_matrix) <- list(
  c("one","two","three","four","five","six"),
  c("一","二")
)
a_matrix

(a_matrix <- matrix(   1:12,   
                       nrow = 4,            #ncol = 3 works the same   
                       dimnames = list(     
                         c("one", "two", "three", "four"),     
                         c("ein", "zwei", "drei")   
                       ) 
))

(another_matrix <- matrix(
  seq.int(2, 24, 2),
  nrow = 4,
  dimnames = list(
    c("five", "six", "seven", "eight"),
    c("vier", "funf", "sechs")
    )
  ))

c(a_matrix, another_matrix)




cbind(a_matrix, another_matrix)

rbind(a_matrix, another_matrix)

t(a_matrix)
t(a_matrix)






vector1<-c(2,9,3)
vector2<-c(10, 16, 17, 13, 11, 15,1,2,3,4,5,6)
z<-array(c(1,2,3,4,5), dim=c(3,3,1))
z







