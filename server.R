library(shiny)

data(iris)

#Initialization of server.R
shinyServer(function(input, output) {
  
  sset <- reactive(subset(iris, Species == input$species))
  
  #text to output
  output$report <- renderText(
    paste0("The filtered data set contains ",nrow(sset()), " rows")
  )
  
  #Download handler
  output$download <- downloadHandler(
    filename=paste0("Data_",input$species,"_",Sys.Date(),".csv"),
    content = function(file){
      write.csv(sset(),file, row.names=F)}
  )
  })