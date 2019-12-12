library(readxl)
qa_lbs_sold_df <- read_excel("Web Analytics Case Student Spreadsheet.xls",
                                     sheet = "Lbs. Sold", range = "A5:B295"
)
qa_lbs_sold_df


q8_z_score_func <- function(vector_1, m, sd) {
  z_score_list <- c()
  for (i in nrow(vector_1)) {
    z_score_list[i] <- (vector_1[i] - m) / sd
  }
  return(z_score_list)
}

qa_lbs_sold_df$zscore <- (qa_lbs_sold_df$`Lbs. Sold` - mean(qa_lbs_sold_df$`Lbs. Sold`)) / sd(qa_lbs_sold_df$`Lbs. Sold`)
qa_lbs_sold_df

qa_lbs_sold_df <- qa_lbs_sold_df[order(qa_lbs_sold_df$zscore), ]
qa_lbs_sold_df


refined_emp_rule_df <- data.frame(matrix(nrow = 6,ncol = 3))
names(refined_emp_rule_df) <- c('theorical %','theorical no. obs.','actual no. obs.')
refined_emp_rule_df$`theorical %` <- c(0.34,0.34,0.135,0.135,0.02,0.02)
refined_emp_rule_df$`actual no. obs.` <- c(0,0,0,0,0,0)

for(i in 1:nrow(refined_emp_rule_df)){
  refined_emp_rule_df$`theorical no. obs.`[i] <- refined_emp_rule_df$`theorical %`[i] * nrow(qa_lbs_sold_df)
}

for (i in 1:nrow(qa_lbs_sold_df)) {
  if(qa_lbs_sold_df$zscore[i] <= 1 & qa_lbs_sold_df$zscore[i] >= 0){
    refined_emp_rule_df$`actual no. obs.`[1] = refined_emp_rule_df$`actual no. obs.`[1] + 1
  }
  if(qa_lbs_sold_df$zscore[i] <= 0 & qa_lbs_sold_df$zscore[i] >= -1){
    refined_emp_rule_df$`actual no. obs.`[2] = refined_emp_rule_df$`actual no. obs.`[2] + 1
  }
  if(qa_lbs_sold_df$zscore[i] <= 2 & qa_lbs_sold_df$zscore[i] >= 1){
    refined_emp_rule_df$`actual no. obs.`[3] = refined_emp_rule_df$`actual no. obs.`[3] + 1
  }
  if(qa_lbs_sold_df$zscore[i] <= -1 & qa_lbs_sold_df$zscore[i] >= -2){
    refined_emp_rule_df$`actual no. obs.`[4] = refined_emp_rule_df$`actual no. obs.`[4] + 1
  }
  if(qa_lbs_sold_df$zscore[i] <= 3 & qa_lbs_sold_df$zscore[i] >= 2){
    refined_emp_rule_df$`actual no. obs.`[5] = refined_emp_rule_df$`actual no. obs.`[5] + 1
  }
  if(qa_lbs_sold_df$zscore[i] <= -2 & qa_lbs_sold_df$zscore[i] >= -3){
    refined_emp_rule_df$`actual no. obs.`[6] = refined_emp_rule_df$`actual no. obs.`[6] + 1
  }
}

refined_emp_rule_df

