## Values
X <- 2
Y <- "San Francisco"
Z <- HULT
ABC <- exp(12345)

#Vectors:
#Fist way of defining vectors:
my_vec <- c(1,2,3,4,5)
my_char_vec <- c("SFO", "OAK", "SCJ")
my_binary_vec <- as.logical(1)
my_binary_vec_2 <- as.logical(0)
my_factors <- factor(c("yes", "no", "yes", "no"))

#Dates!!
rawdates <- c("05/27/84", "07/07/05")
formattedDates <- as.Date(rawdates,
                       format = "%m/%d/%y")

#importing dates from Excel:
numericdates <- c(30829, 38540)
ExcelDates <- as.Date(numericdates,
                       origin = "1899-12-30")


#Defining vectors based on patterns:
pattern_1 <- seq(from=1, to=20, by=1)
pattern_2 <- rep(c(1,0,1), each=10)

#creating a matrix
?matrix #getting help for the matrix function
my_mat <- matrix(c(1,2,3,4,5,6,7,8,9,10),nrow=5,ncol=2)

#data frames
my_df <- as.data.frame(my_mat)

my_df <- as.data.frame(matrix(rep(1:20,2), ncol=5, nrow=8))


ncol(my_df)
nrow(my_df)
colnames(my_df)
colnames(my_df) <- c("column_1", "column_2")

#is. and as. families
is.numeric(numericdates)
as.character(numericdates)

is.logical(my_binary_vec)
as.numeric(my_binary_vec)

#subsetting vectors, matrixes, and data frames
#vectors have only one index
my_char_vec[1]
my_char_vec[1:2]
my_char_vec[c(1,2)]

#matrixes and data frames have two indexes
my_mat[1,2]
my_mat[1:3,2]
my_mat[1:2,1:2]

#subsetting data frames
my_df$column_1[1:3] #a column has one index, the $ sign tells us column name
my_df[1:2,2:3]

my_df[which(my_df$column_1 > 3),]
subset(my_df, column_1>3)

#if we were to have N/As:
my_df[-which(is.na(my_df$column_1)),]

#using the summary() function
summary(my_df)
summary(pattern_1)

#the is family:
is.numeric(X)
is.character(X)
is.logical(Y)

#the as family
as.numeric(ABC)
as.array(my_mat)

#in class
german_credit_lessthan3 <- subset(german_credit, history < 3)
 replacement_for_gc <- gsub("4", "5", german_credit$history)
 replacement_for_gc <- gsub(4, 5, german_credit$history)
 german_credit[which(german_credit$history == 4),]