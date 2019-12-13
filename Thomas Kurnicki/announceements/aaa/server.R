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

    output$distPlot <- renderPlot({

        library(readxl)
        mydf <<- read_excel("german credit card.xls")
        
        mydf$purpose <- as.numeric(gsub("x", "", mydf$purpose))
        
        mydf$good_bad <-gsub('good', '1', mydf$good_bad)
        mydf$good_bad <-gsub('bad', '0', mydf$good_bad)
        mydf$good_bad <- as.numeric(mydf$good_bad)
        
        library(rpart)
        library(rpart.plot)
        
        my_tree <- rpart(good_bad ~ age+amount+checking+duration, data = mydf, method = "class", cp= input$bins)
        rpart.plot(my_tree, extra = 1, type = 1)

    })
    
    output$logit <-renderPrint({
                library(readxl)

        #mydf_1 <- mydf
        #mydf_1$checking <- mydf_1$checking + 50000
        
        my_logit <- glm(paste("good_bad ~ age + amount + duration + ", input$var), data = mydf, family = "binomial")
        summary(my_logit)
        
    })
    
    
    

})
