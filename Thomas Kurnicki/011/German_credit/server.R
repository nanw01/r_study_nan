#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(readxl)
mydf <- read_excel("./german credit card.xls")
mydf$good_bad <- gsub("good",1,mydf$good_bad)
mydf$good_bad <- gsub("bad",0,mydf$good_bad)
mydf$good_bad <- as.numeric(mydf$good_bad)


library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$aaa <- renderPlot({

        library(rpart)
        library(rpart.plot)

        my_ger_tree <- rpart(good_bad~age+amount+checking+duration,
                             data = mydf,method = "class", cp= input$qqq)
        rpart.plot(my_ger_tree,type = 1,extra = 1)
        
    })

    output$logit <- renderPrint({
        
      
        
        my_ger_logitic <- glm(paste("good_bad~age+checking+duration",input$myvar),
                              data = mydf, family = "binomial")
        summary(my_ger_logitic)
    })
    
})
