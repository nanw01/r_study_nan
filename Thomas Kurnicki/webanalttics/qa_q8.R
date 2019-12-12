library(readxl)
library(pastecs)
library(e1071) 

qa_lbs_sold_df <- as.data.frame(
  read_excel("Web Analytics Case Student Spreadsheet.xls",
             sheet = "Lbs. Sold", range = "A5:B295"
  )
)

#a desciptive stats
options(scipen=100)
options(digits=2)
desc_stats <- stat.desc(qa_lbs_sold_df[,'Lbs. Sold'])

#b histogram lbs. sold
hist(qa_lbs_sold_df[,'Lbs. Sold'])

#d  empirical rule
emp_rule_df <- data.frame(matrix(nrow = 3,ncol = 3))
names(emp_rule_df) <- c('theorical %','theorical no. obs.','actual no. obs.')
emp_rule_df$`theorical %` <- c(0.68,0.95,0.99)
emp_rule_df$`actual no. obs.` <- c(0,0,0)

for(i in 1:nrow(emp_rule_df)){
  emp_rule_df$`theorical no. obs.`[i] <- emp_rule_df$`theorical %`[i] * nrow(qa_lbs_sold_df)
}

for(i in 1:nrow(qa_lbs_sold_df)){
  qa_lbs_sold_df$zscore[i] <- (qa_lbs_sold_df$`Lbs. Sold`[i] - desc_stats['mean'])/desc_stats['std.dev']
}

qa_lbs_sold_df$zscore[1] <= 1 & qa_lbs_sold_df$zscore[1] >= -1

for (i in 1:nrow(qa_lbs_sold_df)) {
  if(qa_lbs_sold_df$zscore[i] <= 1 & qa_lbs_sold_df$zscore[i] >= -1){
    emp_rule_df$`actual no. obs.`[1] = emp_rule_df$`actual no. obs.`[1] + 1
  }
  if(qa_lbs_sold_df$zscore[i] <= 2 & qa_lbs_sold_df$zscore[i] >= -2){
    emp_rule_df$`actual no. obs.`[2] = emp_rule_df$`actual no. obs.`[2] + 1
  }
  if(qa_lbs_sold_df$zscore[i] <= 3 & qa_lbs_sold_df$zscore[i] >= -3){
    emp_rule_df$`actual no. obs.`[3] = emp_rule_df$`actual no. obs.`[3] + 1
  }
}
emp_rule_df
#e refined

#g kurtosis and skewness and kurtosis
df_skewnes <- skewness(qa_lbs_sold_df[,'Lbs. Sold'])
df_kurtosis <- kurtosis(qa_lbs_sold_df[,'Lbs. Sold'])

