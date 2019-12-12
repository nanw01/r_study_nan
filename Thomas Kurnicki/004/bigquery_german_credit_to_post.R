#install.packages("bigrquery")

library(bigrquery)
proj_id <- "hutfidi1" # replace this with your project ID 
sql <- "SELECT * FROM `german_credit.german_credit`"

tb <- bq_project_query(proj_id, sql)
#> Auto-refreshing stale OAuth token.
my_google_dataset <- bq_table_download(tb)
german_google <- as.data.frame(my_google_dataset)


