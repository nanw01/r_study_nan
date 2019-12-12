# df = read.csv("cylinder_bands.csv")
df <- read.csv('cylinder_bands.csv',stringsAsFactors = FALSE)
tail(df)
str(df)

df[df=="?"]<-""

# 1
is.numeric(df$timestamp)

str(df$timestamp)
# 2

# 3
df$customer <- toupper(df$customer)

# 4

# 5
df$grain_screened <- gsub("YES","1",df$grain_screened)
df$grain_screened <- gsub("NO","0",df$grain_screened)

# 6
df <- df[,-which(names(df)%in%c("ink_color"))]

# 7
df$proof_ink <- gsub("YES","1",df$proof_ink)
df$proof_ink <- gsub("NO","0",df$proof_ink)

# 8

# 9
df$blade_mg <- (df$blade_mg)

# 10
df$paper_type <- toupper(df$paper_type)

# 11
df$ink_type <- toupper(df$ink_type)

# 12
df$direct_steam <- toupper(df$direct_steam)
df$direct_steam <- gsub("YES","1", df$direct_steam)
df$direct_steam <- gsub("NO","0", df$direct_steam)

# 13


# 14
df$type_on_cylinder <- toupper(df$type_on_cylinder)
df$type_on_cylinder <- gsub("YES","1", df$type_on_cylinder)
df$type_on_cylinder <- gsub("NO","0", df$type_on_cylinder)

# 15

# 16

# 17

# 18
df$cylinder_size <- toupper(df$cylinder_size)
tail(df)

# 19
df$paper_mill_location <- toupper(df$paper_mill_location)

# 20

# 21

# 22

# 23

# 24

# 25

# 26

# 27

# 28

# 29

# 30

# 31

# 32

# 33

# 34

# 35

# 36

# 37

# 38

# 39

# 40
toupper(df$type_on_cylinder)
df$type_on_cylinder <- gsub("YES","1", df$type_on_cylinder)
df$type_on_cylinder <- gsub("NO","0", df$type_on_cylinder)


df$a <- df$type_on_cylinder 

df$bbbbb <-





