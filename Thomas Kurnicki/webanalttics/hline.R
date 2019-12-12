
#Graph
library(cowplot) #theme
library(ggplot2)

library(readxl)
Web_Analytics_Weekly_Visits <- read_excel("Web Analytics Case Student Spreadsheet.xls",
                                          sheet = "Weekly Visits", range = "A5:I71"
)

Web_Analytics_Weekly_Visits$`Week (2008-2009)` <- factor(Web_Analytics_Weekly_Visits$`Week (2008-2009)`, levels = Web_Analytics_Weekly_Visits$`Week (2008-2009)`)

q1_plot_bar_visits <- ggplot(data = Web_Analytics_Weekly_Visits, aes(x = Web_Analytics_Weekly_Visits$`Week (2008-2009)`, y = Web_Analytics_Weekly_Visits$Visits)) + geom_bar(stat = "identity", aes(fill=period)) + theme(axis.text.x = element_text(angle = 90, colour = "black")) + labs(x = "", y = "") + ggtitle("FIGURE 1. VISITS TO THE QA WEBSITE PER WEEK. ") 
q1_plot_bar_visits



