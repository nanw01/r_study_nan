

library(shiny)
library(plotly)
library(xxxxxxxxxxx)

# Define server logic required to draw a histogram
shinyServer(function(input, output, xxxxxxxxx) {
  library(readxl)
  mydf <- read_excel("xxxxxxxxxxxx")
  
  mydf$purpose <- xxxxxxxxxxx
  
  mydf$good_bad <- xxxxxxxxxxxxx
  mydf$good_bad <- xxxxxxxxxxxxx
  mydf$good_bad <- xxxxxxxxxxxxx
  xxxxxx <<- xxxxxxxx
  
  output$p <- renderPlotly({
    z <- plot_ly(mydf, x=~age, y=~amount)%>%
      layout(xxxxxxx = "xxxxxxx")
    z
  })
  
  
  
  
  output$hot <- renderRHandsontable({
    DF <<- as.data.frame(event_data("plotly_selected"))
    if (!is.null(DF))
      rhandsontable(DF, stretchH = "all")
  })
  ###########################################
  ###########################################
  ##########################################
  correlation <- round(cor(mydf), 3)
  
  output$heat <- renderPlotly({
    plot_ly(xxxxxxxxxxxx) %>%
      add_heatmap(
       xxxxxxxxx,
       xxxxxxxxxx,
       xxxxxxxxx
      )
  })
  
  output$scatterplot <- renderPlotly({
    # if there is no click data, render nothing!
    clickData <- event_data("xxxxxxxxxx", source = "xxxxxxxxx")
    if (is.null(clickData)) return(NULL)
    
    # Obtain the clicked x/y variables and fit linear model
    vars <- c(clickData[["x"]], clickData[["y"]])
    d <- setNames(mydf[vars], c("x", "y"))
    yhat <- fitted(lm(y ~ x, data = d))
    

    xxxxxxxxxxxxxxx
    xxxxxxxxxxxxxx
    xxxxxxxxxxxxxxx
    xxxxxxxxxxxxxx
    
  })
  
  
})
