
library(shiny)
library(plotly)
library(rpart)
library(rpart.plot)
library(rhandsontable)
library(MASS)
summary(Melanoma)

shinyServer(function(input, output) {

    output$scaterplot <- renderPlot({

        plot_ly(Melanoma, x=~time, y=~age)%>%
            layout(dragmode = "select")
        

    })

})
