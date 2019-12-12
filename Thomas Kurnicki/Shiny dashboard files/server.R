#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  library(readxl)
  mydf <- read_excel("german credit card.xls")
  
  mydf$purpose <- as.numeric(gsub("x", "", mydf$purpose))
  
  mydf$good_bad <- gsub("good", "1", mydf$good_bad)
  mydf$good_bad <- gsub("bad", "0", mydf$good_bad)
  mydf$good_bad <- as.numeric(mydf$good_bad)
  
  output$distPlot <- renderPlot({
    library(rpart)
    library(rpart.plot)
    my_tree <- rpart(good_bad~age+duration+checking+amount, 
                     data=mydf, method="class", cp=input$bins)
    rpart.plot(my_tree)
  })
  
  output$summar <- renderPrint({
    my_logit <- glm(paste("good_bad~age+duration+amount+",input$Input1), 
                    data=mydf,family="binomial")
  summary(my_logit)
    })
  
 
  
  
})
