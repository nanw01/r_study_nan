library(readxl)
library(cowplot)
library(ggplot2)
Web_Analytics_Weekly_Visits <- read_excel("Web Analytics Case Student Spreadsheet.xls",
  sheet = "Weekly Visits", range = "A5:H71"
)
Web_Analytics_Financials <- read_excel("Web Analytics Case Student Spreadsheet.xls",
  sheet = "Financials", range = "A5:E71"
)

Web_Analytics_Weekly_Visits$period <- matrix(nrow = nrow(Web_Analytics_Weekly_Visits))
Web_Analytics_Weekly_Visits$period[1:14]<- "initil"
Web_Analytics_Weekly_Visits$period[15:35]<- "pro-promotion"
Web_Analytics_Weekly_Visits$period[36:52]<- "promotion"
Web_Analytics_Weekly_Visits$period[53:66]<- "pos-promotion"

Web_Analytics_Financials$period <- matrix(nrow = nrow(Web_Analytics_Financials))
Web_Analytics_Financials$period[1:14]<- "initil"
Web_Analytics_Financials$period[15:35]<- "pro-promotion"
Web_Analytics_Financials$period[36:52]<- "promotion"
Web_Analytics_Financials$period[53:66]<- "pos-promotion"


# 1) Using data in the Weekly Visits and Financials worksheets,
# create four column charts (like Figure 1:
# Visits to the QA Website per Week) for
# unique visits over time, revenue over time, profit over time, and pounds sold over time.
# You do not have to indicate on these charts the cutoffs for the four periods.

head(Web_Analytics_Weekly_Visits)

Web_Analytics_Weekly_Visits$`Week (2008-2009)` <- factor(Web_Analytics_Weekly_Visits$`Week (2008-2009)`, levels = Web_Analytics_Weekly_Visits$`Week (2008-2009)`)
Web_Analytics_Financials$`Week (2008-2009)` <- factor(Web_Analytics_Financials$`Week (2008-2009)`, levels = Web_Analytics_Financials$`Week (2008-2009)`)


q1_plot_bar_visits <- ggplot(data = Web_Analytics_Weekly_Visits, aes(x = Web_Analytics_Weekly_Visits$`Week (2008-2009)`, y = Web_Analytics_Weekly_Visits$Visits)) +
  geom_bar(stat = "identity", aes(fill=period)) + 
  theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "Week (2008-2009)", y = "Visits") + 
  ggtitle("FIGURE 1. VISITS TO THE QA WEBSITE PER WEEK. ") 
q1_plot_bar_visits

q1_plot_bar_uniqu_visits <- ggplot(data = Web_Analytics_Weekly_Visits, aes(x = Web_Analytics_Weekly_Visits$`Week (2008-2009)`, y = Web_Analytics_Weekly_Visits$`Unique Visits`)) +
  geom_bar(stat = "identity", aes(fill=period)) + theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "Week (2008-2009)", y = "Unique Visits") + ggtitle("FIGURE 2. UNIQU VISITS TO THE QA WEBSITE PER WEEK. ")
q1_plot_bar_uniqu_visits

q1_plot_bar_revenue <- ggplot(data = Web_Analytics_Financials, aes(x = Web_Analytics_Financials$`Week (2008-2009)`, y = Web_Analytics_Financials$Revenue)) +
  geom_bar(stat = "identity", aes(fill=period)) + theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "Week (2008-2009)", y = "Revenue") + ggtitle("FIGURE 3. REVENUE TO THE QA WEBSITE PER WEEK. ")
q1_plot_bar_revenue

q1_plot_bar_profit <- ggplot(data = Web_Analytics_Financials, aes(x = Web_Analytics_Financials$`Week (2008-2009)`, y = Web_Analytics_Financials$Profit)) +
  geom_bar(stat = "identity", aes(fill=period)) + theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "Week (2008-2009)", y = "Profit") + ggtitle("FIGURE 4. PROFIT TO THE QA WEBSITE PER WEEK. ")
q1_plot_bar_profit

q1_plot_bar_pounds_sold <- ggplot(data = Web_Analytics_Financials, aes(x = Web_Analytics_Financials$`Week (2008-2009)`, y = Web_Analytics_Financials$`Lbs. Sold`)) +
  geom_bar(stat = "identity", aes(fill=period)) + theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "Week (2008-2009)", y = "Lbs. Sold") + ggtitle("FIGURE 5. POUNDS SOLD TO THE QA WEBSITE PER WEEK. ")
q1_plot_bar_pounds_sold

q1_plot_bar_avg_time_on_site <- ggplot(data = Web_Analytics_Weekly_Visits, aes(x = Web_Analytics_Weekly_Visits$`Week (2008-2009)`, y = Web_Analytics_Weekly_Visits$`Avg. Time on Site (secs.)`)) +
  geom_bar(stat = "identity", aes(fill=period)) + 
  theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "Week (2008-2009)", y = "Avg. Time on Site (secs.)") + 
  ggtitle("FIGURE 6. AVG. TIME ON SITE (SECS.) TO THE QA WEBSITE PER WEEK. ") 
q1_plot_bar_avg_time_on_site

# new_web_analytics_dataset <- as.data.frame(matrix(nrow = nrow(Web_Analytics_Weekly_Visits), ncol = 0))
# new_web_analytics_dataset$`Unique Visits` <- Web_Analytics_Weekly_Visits$`Unique Visits`
# new_web_analytics_dataset$Revenue <- Web_Analytics_Financials$Revenue
# new_web_analytics_dataset$Profit <- Web_Analytics_Financials$Profit
# new_web_analytics_dataset$`Lbs. Sold` <- Web_Analytics_Financials$`Lbs. Sold`
# head(new_web_analytics_dataset)


# 1）add people repeat browse website

Web_Analytics_Weekly_Visits$`Visits Repeat` <- Web_Analytics_Weekly_Visits$Visits - Web_Analytics_Weekly_Visits$`Unique Visits`
Web_Analytics_Weekly_Visits$`Visits Repeat`


q1_plot_line_visits_repeat <- ggplot(data = Web_Analytics_Weekly_Visits, aes(x = Web_Analytics_Weekly_Visits$`Week (2008-2009)`, y = Web_Analytics_Weekly_Visits$`Visits Repeat`)) +
  geom_bar(stat = "identity", aes(fill=period)) + theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "Week (2008-2009)", y = "Visits Repeat") + ggtitle("") + geom_hline(aes(yintercept=mean(Web_Analytics_Weekly_Visits$`Visits Repeat`)),linetype="dashed",colour="#990000") +
  annotate("text", x=63, y=mean(Web_Analytics_Weekly_Visits$`Visits Repeat`), colour="#990000", label=mean(Web_Analytics_Weekly_Visits$`Visits Repeat`))
q1_plot_line_visits_repeat



Web_Analytics_Weekly_Visits <- read_excel("Web Analytics Case Student Spreadsheet.xls",sheet = "Weekly Visits", range = "A5:I71")
Web_Analytics_Financials <- read_excel("Web Analytics Case Student Spreadsheet.xls",sheet = "Financials", range = "A5:F71")
dataset_all<- data.frame(matrix(nrow = nrow(Web_Analytics_Weekly_Visits),ncol = 0))
dataset_all$Visits <- Web_Analytics_Weekly_Visits$Visits
dataset_all$`Unique Visits` <- Web_Analytics_Weekly_Visits$`Unique Visits`
dataset_all$Pageviews <- Web_Analytics_Weekly_Visits$Pageviews
dataset_all$`Pages/Visit` <- Web_Analytics_Weekly_Visits$`Pages/Visit`
dataset_all$`Avg. Time on Site (secs.)` <- Web_Analytics_Weekly_Visits$`Avg. Time on Site (secs.)`
dataset_all$`Bounce Rate` <- Web_Analytics_Weekly_Visits$`Bounce Rate`
dataset_all$`% New Visits` <- Web_Analytics_Weekly_Visits$`% New Visits`

dataset_all$Revenue <- Web_Analytics_Financials$Revenue
dataset_all$Profit <- Web_Analytics_Financials$Profit
dataset_all$`Lbs. Sold` <- Web_Analytics_Financials$`Lbs. Sold`
dataset_all$Inquiries <- Web_Analytics_Financials$Inquiries

dataset_all

dataset_all_cor <- cor(dataset_all)
dataset_all_cor


library(ggcorrplot)
ggcorrplot(dataset_all_cor, hc.order = TRUE,
           outline.col = "white", lab = TRUE)

# 2) Using the same data, calculate the following
# summary statistics for
# visits, unique visits, revenue, profit, and pounds sold:
# mean, median, standard deviation, minimum, and maximum,
# for the initial, pre-promotion, promotion, and post-promotion periods.
# So, for each period you should provide 25 values:
# five summary measures for each of five variables,
# as per the table below for the initial period.

q2_summary_data <- function(my_data, period_code = 0) {
  if (period_code == 1) {
    my_data <- my_data[1:14]
  } else if (period_code == 2) {
    my_data <- my_data[15:35]
  } else if (period_code == 3) {
    my_data <- my_data[36:52]
  } else if (period_code == 4) {
    my_data <- my_data[53:66]
  } else {
    my_data <- my_data
  }

  return(c(mean(my_data), median(my_data), sd(my_data), min(my_data), max(my_data)))
}

q2_table_1 <- as.data.frame(matrix(nrow = 5, ncol = 0))
q2_table_1$Visits <- q2_summary_data(Web_Analytics_Weekly_Visits$Visits, 1)
q2_table_1$`Unique Visits` <- q2_summary_data(Web_Analytics_Weekly_Visits$`Unique Visits`, 1)
q2_table_1$Revenue <- q2_summary_data(Web_Analytics_Financials$Revenue, 1)
q2_table_1$Profit <- q2_summary_data(Web_Analytics_Financials$Profit, 1)
q2_table_1$`Lbs. Sold` <- q2_summary_data(Web_Analytics_Financials$`Lbs. Sold`, 1)

q2_table_2 <- as.data.frame(matrix(nrow = 5, ncol = 0))
q2_table_2$Visits <- q2_summary_data(Web_Analytics_Weekly_Visits$Visits, 2)
q2_table_2$`Unique Visits` <- q2_summary_data(Web_Analytics_Weekly_Visits$`Unique Visits`, 2)
q2_table_2$Revenue <- q2_summary_data(Web_Analytics_Financials$Revenue, 2)
q2_table_2$Profit <- q2_summary_data(Web_Analytics_Financials$Profit, 2)
q2_table_2$`Lbs. Sold` <- q2_summary_data(Web_Analytics_Financials$`Lbs. Sold`, 2)

q2_table_3 <- as.data.frame(matrix(nrow = 5, ncol = 0))
q2_table_3$Visits <- q2_summary_data(Web_Analytics_Weekly_Visits$Visits, 3)
q2_table_3$`Unique Visits` <- q2_summary_data(Web_Analytics_Weekly_Visits$`Unique Visits`, 3)
q2_table_3$Revenue <- q2_summary_data(Web_Analytics_Financials$Revenue, 3)
q2_table_3$Profit <- q2_summary_data(Web_Analytics_Financials$Profit, 3)
q2_table_3$`Lbs. Sold` <- q2_summary_data(Web_Analytics_Financials$`Lbs. Sold`, 3)

q2_table_4 <- as.data.frame(matrix(nrow = 5, ncol = 0))
q2_table_4$Visits <- q2_summary_data(Web_Analytics_Weekly_Visits$Visits, 4)
q2_table_4$`Unique Visits` <- q2_summary_data(Web_Analytics_Weekly_Visits$`Unique Visits`, 4)
q2_table_4$Revenue <- q2_summary_data(Web_Analytics_Financials$Revenue, 4)
q2_table_4$Profit <- q2_summary_data(Web_Analytics_Financials$Profit, 4)
q2_table_4$`Lbs. Sold` <- q2_summary_data(Web_Analytics_Financials$`Lbs. Sold`, 4)

row.names(q2_table_1) <- c("mean", "median", "standard deviation", "minimum", "maximum")
row.names(q2_table_2) <- c("mean", "median", "standard deviation", "minimum", "maximum")
row.names(q2_table_3) <- c("mean", "median", "standard deviation", "minimum", "maximum")
row.names(q2_table_4) <- c("mean", "median", "standard deviation", "minimum", "maximum")


q2_table_1
q2_table_2
q2_table_3
q2_table_4



# 3. Create a column chart of the mean visits over the four periods—that is,
# your chart should have four columns,
# the first representing the mean visits during the initial period,
# the second representing the mean visits during the pre-promotion period, etc.
# Create four more such charts, this time using the
# mean unique visits, mean revenue, mean profit, and mean pounds sold statistics.

means_df <- function(my_data) {
  return(c(mean(my_data[1:14]), mean(my_data[15:35]), mean(my_data[36:52]), mean(my_data[53:66])))
}

q3_table <- as.data.frame(matrix(nrow = 4, ncol = 0))
q3_table

q3_table$Visits <- means_df(Web_Analytics_Weekly_Visits$Visits)
q3_table$`Unique Visits` <- means_df(Web_Analytics_Weekly_Visits$`Unique Visits`)
q3_table$Revenue <- means_df(Web_Analytics_Financials$Revenue)
q3_table$Profit <- means_df(Web_Analytics_Financials$Profit)
q3_table$`Lbs. Sold` <- means_df(Web_Analytics_Financials$`Lbs. Sold`)
q3_table$period <- c("initial", "pre-promotion", "promotion", "post-promotion")

q3_table

q3_table$period <- factor(q3_table$period, levels = c("initial", "pre-promotion", "promotion", "post-promotion"))

q3_box <- ggplot(data = q3_table, aes(x = q3_table$period, y = q3_table$Visits)) +
  geom_bar(stat = "identity", fill = "steelblue") + theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "", y = "") + ggtitle("  ")
q3_box

q3_box_revenue <- ggplot(data = q3_table, aes(x = q3_table$period, y = q3_table$Revenue)) +
  geom_bar(stat = "identity", fill = "steelblue") + theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "", y = "") + ggtitle("means of revenue in four periods")
q3_box_revenue

q3_box_profit <- ggplot(data = q3_table, aes(x = q3_table$period, y = q3_table$Profit)) +
  geom_bar(stat = "identity", fill = "steelblue") + theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "", y = "") + ggtitle("means of profit in four periods")
q3_box_profit

q3_box_lbs_sold <- ggplot(data = q3_table, aes(x = q3_table$period, y = q3_table$`Lbs. Sold`)) +
  geom_bar(stat = "identity", fill = "steelblue") + theme(axis.text.x = element_text(angle = 90, colour = "black")) +
  labs(x = "", y = "") + ggtitle("means of lbs. sold in four periods")
q3_box_lbs_sold

# 5 Start by taking a look at revenue and pounds sold.
# (Before proceeding, what does your intuition say about the relationship
#   between these two variables?)
# Create a scatter diagram of revenue versus pounds sold.
# (Revenue should be on the y, or vertical, axis.)
# Determine the correlation coefficient of revenue and pounds sold.

q5_df <- as.data.frame(matrix(nrow = nrow(Web_Analytics_Financials), ncol = 0))

q5_df$Revenue <- Web_Analytics_Financials$Revenue
q5_df$`Lbs. Sold` <- Web_Analytics_Financials$`Lbs. Sold`

q5_cor <- cor(q5_df)
q5_cor

q5_sca <- ggplot(q5_df, aes(x = q5_df$`Lbs. Sold`, y = q5_df$Revenue)) + geom_point() + geom_smooth(method = lm) + theme(axis.text.x = element_text(colour = "black")) +
  labs(x = "Lbs. Sold", y = "Revenue") + ggtitle("scatter diagram of revenue versus pounds sold")
q5_sca


# 6 Now create the scatter diagram of revenue versus visits.
# (Given your previous work, what do you expect this plot to look like?)
# Determine the correlation coefficient of revenue and visits.


q6_df <- as.data.frame(matrix(nrow = nrow(Web_Analytics_Financials), ncol = 0))

q6_df$Revenue <- Web_Analytics_Financials$Revenue
q6_df$Visits <- Web_Analytics_Weekly_Visits$Visits

q6_cor <- cor(q6_cor)
q6_cor

q6_sca <- ggplot(q6_df, aes(x = q6_df$Visits, y = q6_df$Revenue)) + geom_point() + geom_smooth(method = lm) + theme(axis.text.x = element_text(colour = "black")) +
  labs(x = "Visits", y = "Revenue") + ggtitle("scatter diagram of revenue versus visits")
q6_sca

# 7) Summarize your results.
# In particular, elaborate on the implications of the relationship
# between revenue and number of visits to the website.
# Feel free to examine any other variable pairs you think might be important.






# 8) QA is interested in modeling data critical to their business.
# For example, if data for a particular variable appears
# to be reasonably approximated by a normal distribution,
# with a predictable mean and standard deviation,
# future values for that variable can be reasonably estimated.
# The purpose of the following exercise is to pursue this modeling process.

# The Lbs. Sold worksheet contains the pounds of material
# sold per week from January 3, 2005, through the week of July 19, 2010.

library(readxl)
library(ggplot2)
Web_Analytics_Lbs_Sold <- read_excel("Web Analytics Case Student Spreadsheet.xls",
  sheet = "Lbs. Sold", range = "A5:B295"
)

# a) Determine the following summary values for this data:
# mean, median, standard deviation, minimum, and maximum.

q8_a_summary_value <- as.data.frame(matrix())
q8_a_summary_value <- c(mean(Web_Analytics_Lbs_Sold$`Lbs. Sold`), median(Web_Analytics_Lbs_Sold$`Lbs. Sold`), sd(Web_Analytics_Lbs_Sold$`Lbs. Sold`), min(Web_Analytics_Lbs_Sold$`Lbs. Sold`), max(Web_Analytics_Lbs_Sold$`Lbs. Sold`))
names(q8_a_summary_value) <- c("mean", "median", "standard deviation", "minimum", "maximum")
q8_a_summary_value

# b) Create a histogram of the pounds of material sold data.

# outlier values.


# q8_b_web_analytics_lbs_sold <- Web_Analytics_Lbs_Sold
# q8_b_outlier_values <- boxplot.stats(q8_b_web_analytics_lbs_sold$`Lbs. Sold`)$out
# q8_b_outlier_values
# 
# for (i in q8_b_outlier_values) {
#   q8_b_web_analytics_lbs_sold <- q8_b_web_analytics_lbs_sold[which(q8_b_web_analytics_lbs_sold$`Lbs. Sold` != i), ]
# }
# q8_b_web_analytics_lbs_sold


q8_b_hist <- ggplot(data = q8_b_web_analytics_lbs_sold, aes(x = q8_b_web_analytics_lbs_sold$`Lbs. Sold`)) + geom_histogram(aes(y = ..density..), colour = "black") + geom_density(alpha = .2, fill = "#FF6666")
q8_b_hist

# c) Describe the histogram. Does it appear bell-shaped?


# d) Determine how well this data follows the Empirical Rule by completing the following table.



q8_z_score_func <- function(vector_1, m, sd) {
  z_score_list <- c()
  for (i in nrow(vector_1)) {
    z_score_list[i] <- (vector_1[i] - m) / sd
  }
  return(z_score_list)
}

q8_d_table <- as.data.frame(matrix(nrow = 3, ncol = 0))
q8_d_table$Interval <- c("mean ± 1 std. dev.", "mean ± 2 std. dev.", "mean ± 3 std. dev.")
q8_d_table$`Theoretical % of Data` <- c("68%", "95%", "99%")
q8_d_table$`Theoretical No. Obs.` <- c(0.68, 0.95, 0.99) * nrow(Web_Analytics_Lbs_Sold)
q8_d_table$`Actual No. Obs.` <- c(0, 0, 0)

Web_Analytics_Lbs_Sold$`z-score` <- (Web_Analytics_Lbs_Sold$`Lbs. Sold` - mean(Web_Analytics_Lbs_Sold$`Lbs. Sold`)) / sd(Web_Analytics_Lbs_Sold$`Lbs. Sold`)
Web_Analytics_Lbs_Sold

q8_Web_Analytics_Lbs_Sold <- Web_Analytics_Lbs_Sold[order(Web_Analytics_Lbs_Sold$`z-score`), ]
q8_Web_Analytics_Lbs_Sold

for (i in 1:nrow(q8_Web_Analytics_Lbs_Sold)) {
  if (q8_Web_Analytics_Lbs_Sold$`z-score`[i] <= 1 & q8_Web_Analytics_Lbs_Sold$`z-score`[i] >= -1) {
    q8_d_table$`Actual No. Obs.`[1] <- q8_d_table$`Actual No. Obs.`[1] + 1
  }
  if (q8_Web_Analytics_Lbs_Sold$`z-score`[i] <= 2 & q8_Web_Analytics_Lbs_Sold$`z-score`[i] >= -2) {
    q8_d_table$`Actual No. Obs.`[2] <- q8_d_table$`Actual No. Obs.`[2] + 1
  }
  if (q8_Web_Analytics_Lbs_Sold$`z-score`[i] <= 3 & q8_Web_Analytics_Lbs_Sold$`z-score`[i] >= -3) {
    q8_d_table$`Actual No. Obs.`[3] <- q8_d_table$`Actual No. Obs.`[3] + 1
  }
}

q8_d_table



# e) Refine your analysis by completing the following table for the pounds sold data.

q8_e_table <- as.data.frame(matrix(nrow = 6, ncol = 0))
q8_e_table$Interval <- c("mean + 1 std. dev.", "mean - 1 std. dev.", "1 std. dev. to 2 std. dev.", "-1 std. dev. to -2 std. dev.", "2 std. dev. to 3 std. dev.", "-2 std. dev. to -3 std. dev.")
q8_e_table$`Theoretical % of Data` <- c("34%", "34%", "13.5%", "13.5%", "2%", "2%")
q8_e_table$`Theoretical No. Obs.` <- c(0.34, 0.34, 0.135, 0.135, 0.02, 0.02) * nrow(Web_Analytics_Lbs_Sold)
q8_e_table$`Actual No. Obs.` <- c(0, 0, 0, 0, 0, 0)


for (i in 1:nrow(q8_Web_Analytics_Lbs_Sold)) {
  if (q8_Web_Analytics_Lbs_Sold$`z-score`[i] <= 1 & q8_Web_Analytics_Lbs_Sold$`z-score`[i] >= 0) {
    q8_e_table$`Actual No. Obs.`[1] <- q8_e_table$`Actual No. Obs.`[1] + 1
  }
  if (q8_Web_Analytics_Lbs_Sold$`z-score`[i] <= 0 & q8_Web_Analytics_Lbs_Sold$`z-score`[i] >= -1) {
    q8_e_table$`Actual No. Obs.`[2] <- q8_e_table$`Actual No. Obs.`[2] + 1
  }
  if (q8_Web_Analytics_Lbs_Sold$`z-score`[i] <= 2 & q8_Web_Analytics_Lbs_Sold$`z-score`[i] >= 1) {
    q8_e_table$`Actual No. Obs.`[3] <- q8_e_table$`Actual No. Obs.`[3] + 1
  }
  if (q8_Web_Analytics_Lbs_Sold$`z-score`[i] <= -1 & q8_Web_Analytics_Lbs_Sold$`z-score`[i] >= -2) {
    q8_e_table$`Actual No. Obs.`[4] <- q8_e_table$`Actual No. Obs.`[4] + 1
  }
  if (q8_Web_Analytics_Lbs_Sold$`z-score`[i] <= 3 & q8_Web_Analytics_Lbs_Sold$`z-score`[i] >= 2) {
    q8_e_table$`Actual No. Obs.`[5] <- q8_e_table$`Actual No. Obs.`[5] + 1
  }
  if (q8_Web_Analytics_Lbs_Sold$`z-score`[i] <= -2 & q8_Web_Analytics_Lbs_Sold$`z-score`[i] >= -3) {
    q8_e_table$`Actual No. Obs.`[6] <- q8_e_table$`Actual No. Obs.`[6] + 1
  }
}


q8_e_table



# f) How well does the data for pounds of material sold seem
# to follow the normal (bell-shaped) distribution?
#   Support your response from your results in parts a through e.
# (I realize you don’t have a standard here against
#   which to assess “goodness of fit”—just use your best judgment.)







# g) Determine the skewness and kurtosis for the pounds sold data.
# Are these values consistent with your analysis of the pounds of material sold data?

# q8_g_skewness <- skewness(Web_Analytics_Lbs_Sold$`Lbs. Sold`)
# q8_g_skewness
#
# q8_g_kurtosis <- kurtosis(Web_Analytics_Lbs_Sold$`Lbs. Sold`)


# exclude outliers
q8_g_outlier_values <- boxplot.stats(Web_Analytics_Lbs_Sold$`Lbs. Sold`)$out # outlier values.
q8_g_outlier_values

q8_g_web_analytics_lbs_sold <- Web_Analytics_Lbs_Sold
for (i in q8_g_outlier_values) {
  q8_g_web_analytics_lbs_sold <- q8_g_web_analytics_lbs_sold[which(q8_g_web_analytics_lbs_sold$`Lbs. Sold` != i), ]
}
q8_g_web_analytics_lbs_sold

q8_g_skewness <- skewness(q8_g_web_analytics_lbs_sold$`Lbs. Sold`)
q8_g_skewness

q8_g_kurtosis <- kurtosis(q8_g_web_analytics_lbs_sold$`Lbs. Sold`)
q8_g_kurtosis


# 9) Summary statistics using Excel’s Data/Data Analysis/Descriptive Statistics command:

library(readxl)
Web_Analytics_Daily_Visits <- read_excel("Web Analytics Case Student Spreadsheet.xls",
  sheet = "Daily Visits", range = "A5:b467"
)

# a) ANALYSIS OUTPUT FOR THE NUMBER OF DAILY VISITS TO THE QA WEBSITE OVER THE PERIOD MAY 25, 2008–AUGUST 29, 2009

# Create the function.
q9_a_getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

q9_a_summary_value <- as.data.frame(matrix(nrow = 13, ncol = 0))
q9_a_summary_value$Statistic <- c(
  "Mean",
  "Standard Error",
  "Median",
  "Mode",
  "Standard",
  "Sample Variance",
  "Kurtosis",
  "Skewness",
  "Range", 
  "Minimum", 
  "Maximum",
  "Sum",
  "Count"
)
options(digits=7)
q9_a_summary_value$Value <- c(
  mean(Web_Analytics_Daily_Visits$Visits),
 ( sd(Web_Analytics_Daily_Visits$Visits)/sqrt(nrow(Web_Analytics_Daily_Visits))),
  median(Web_Analytics_Daily_Visits$Visits),
 q9_a_getmode(Web_Analytics_Daily_Visits$Visits),
  sd(Web_Analytics_Daily_Visits$Visits),
  0,
  kurtosis(Web_Analytics_Daily_Visits$Visits),
  skewness(Web_Analytics_Daily_Visits$Visits) ,
  (range(Web_Analytics_Daily_Visits$Visits)[2]-range(Web_Analytics_Daily_Visits$Visits)[1]),
  min(Web_Analytics_Daily_Visits$Visits),
  max(Web_Analytics_Daily_Visits$Visits),
  sum(Web_Analytics_Daily_Visits$Visits),
  nrow(Web_Analytics_Daily_Visits)
)

q9_a_summary_value

# b) Histogram of Daily Visits May 25,2008 - August 29,2009


# outlier values.


q9_b_web_analytics_daily_visits <- Web_Analytics_Daily_Visits

# q9_b_outlier_values <- boxplot.stats(q9_b_web_analytics_daily_visits$Visits)$out
# q9_b_outlier_values
# 
# for (i in q9_b_outlier_values) {
#   q9_b_web_analytics_daily_visits <- q9_b_web_analytics_daily_visits[which(q9_b_web_analytics_daily_visits$Visits != i), ]
# }
# q9_b_web_analytics_daily_visits


q8_b_hist <- ggplot(data = q9_b_web_analytics_daily_visits, aes(x = q9_b_web_analytics_daily_visits$Visits)) + geom_histogram(aes(y = ..density..), colour = "black") + geom_density(alpha = .2, fill = "#FF6666")+
  theme(axis.text.x = element_text(angle = 90, colour = "black")) +scale_y_continuous()+
  labs(x = "Visits", y = "Frequency") + ggtitle("Histogram of Daily Visits \n May 25,2008 - August 29,2009 ")
q8_b_hist

# d) EMPIRICAL RULE AND MORE DETAILED ANALYSIS


q9_z_score_func <- function(vector_1, m, sd) {
  z_score_list <- c()
  for (i in nrow(vector_1)) {
    z_score_list[i] <- (vector_1[i] - m) / sd
  }
  return(z_score_list)
}

q9_d_table <- as.data.frame(matrix(nrow = 3, ncol = 0))
q9_d_table$Interval <- c("mean ± 1 std. dev.", "mean ± 2 std. dev.", "mean ± 3 std. dev.")
q9_d_table$`Theoretical % of Data` <- c("68%", "95%", "99%")
q9_d_table$`Theoretical No. Obs.` <- c(0.68, 0.95, 0.99) * nrow(Web_Analytics_Daily_Visits)
q9_d_table$`Actual No. Obs.` <- c(0, 0, 0)

Web_Analytics_Daily_Visits$`z-score` <- (Web_Analytics_Daily_Visits$Visits - mean(Web_Analytics_Daily_Visits$Visits)) / sd(Web_Analytics_Daily_Visits$Visits)
Web_Analytics_Daily_Visits

q9_Web_Analytics_Daily_Visits <- Web_Analytics_Daily_Visits[order(Web_Analytics_Daily_Visits$`z-score`), ]
q9_Web_Analytics_Daily_Visits

for (i in 1:nrow(q9_Web_Analytics_Daily_Visits)) {
  if (q9_Web_Analytics_Daily_Visits$`z-score`[i] <= 1 & q9_Web_Analytics_Daily_Visits$`z-score`[i] >= -1) {
    q9_d_table$`Actual No. Obs.`[1] <- q9_d_table$`Actual No. Obs.`[1] + 1
  }
  if (q9_Web_Analytics_Daily_Visits$`z-score`[i] <= 2 & q9_Web_Analytics_Daily_Visits$`z-score`[i] >= -2) {
    q9_d_table$`Actual No. Obs.`[2] <- q9_d_table$`Actual No. Obs.`[2] + 1
  }
  if (q9_Web_Analytics_Daily_Visits$`z-score`[i] <= 3 & q9_Web_Analytics_Daily_Visits$`z-score`[i] >= -3) {
    q9_d_table$`Actual No. Obs.`[3] <- q9_d_table$`Actual No. Obs.`[3] + 1
  }
}

q9_d_table



# e) Refine your analysis by completing the following table for the pounds sold data.

# exclude outliers
q9_e_web_analytics_daily_visits <- Web_Analytics_Daily_Visits
# 
# q9_e_outlier_values <- boxplot.stats(q9_b_web_analytics_daily_visits$Visits)$out
# q9_e_outlier_values
# 
# for (i in q9_e_outlier_values) {
#   q9_b_web_analytics_daily_visits <- q9_b_web_analytics_daily_visits[which(q9_b_web_analytics_daily_visits$Visits != i), ]
# }
# q9_b_web_analytics_daily_visits

q9_e_table <- as.data.frame(matrix(nrow = 6, ncol = 0))
q9_e_table$Interval <- c("mean + 1 std. dev.", "mean - 1 std. dev.", "1 std. dev. to 2 std. dev.", "-1 std. dev. to -2 std. dev.", "2 std. dev. to 3 std. dev.", "-2 std. dev. to -3 std. dev.")
q9_e_table$`Theoretical % of Data` <- c("34%", "34%", "13.5%", "13.5%", "2%", "2%")
q9_e_table$`Theoretical No. Obs.` <- c(0.34, 0.34, 0.135, 0.135, 0.02, 0.02) * nrow(Web_Analytics_Daily_Visits)
q9_e_table$`Actual No. Obs.` <- c(0, 0, 0, 0, 0, 0)


for (i in 1:nrow(q9_Web_Analytics_Daily_Visits)) {
  if (q9_Web_Analytics_Daily_Visits$`z-score`[i] <= 1 & q9_Web_Analytics_Daily_Visits$`z-score`[i] >= 0) {
    q9_e_table$`Actual No. Obs.`[1] <- q9_e_table$`Actual No. Obs.`[1] + 1
  }
  if (q9_Web_Analytics_Daily_Visits$`z-score`[i] <= 0 & q9_Web_Analytics_Daily_Visits$`z-score`[i] >= -1) {
    q9_e_table$`Actual No. Obs.`[2] <- q9_e_table$`Actual No. Obs.`[2] + 1
  }
  if (q9_Web_Analytics_Daily_Visits$`z-score`[i] <= 2 & q9_Web_Analytics_Daily_Visits$`z-score`[i] >= 1) {
    q9_e_table$`Actual No. Obs.`[3] <- q9_e_table$`Actual No. Obs.`[3] + 1
  }
  if (q9_Web_Analytics_Daily_Visits$`z-score`[i] <= -1 & q9_Web_Analytics_Daily_Visits$`z-score`[i] >= -2) {
    q9_e_table$`Actual No. Obs.`[4] <- q9_e_table$`Actual No. Obs.`[4] + 1
  }
  if (q9_Web_Analytics_Daily_Visits$`z-score`[i] <= 3 & q9_Web_Analytics_Daily_Visits$`z-score`[i] >= 2) {
    q9_e_table$`Actual No. Obs.`[5] <- q9_e_table$`Actual No. Obs.`[5] + 1
  }
  if (q9_Web_Analytics_Daily_Visits$`z-score`[i] <= -2 & q9_Web_Analytics_Daily_Visits$`z-score`[i] >= -3) {
    q9_e_table$`Actual No. Obs.`[6] <- q9_e_table$`Actual No. Obs.`[6] + 1
  }
}


q9_e_table


# 10)

