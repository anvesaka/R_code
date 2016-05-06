# Using the download button to build a file download.
# Note that this only works in a browser.

library(shiny)

# Starting line
shinyUI(fluidPage(
  
  #Application title
  titlePanel("Download Button Example"),
  
  sidebarLayout(
    
  #Sidebar
    sidebarPanel(
      #Species selection
      selectInput("species", "Select a species:",
                 c("setosa", "versicolor", "virginica")),
                downloadButton("download", "Download Data")),
      
      mainPanel(textOutput("report"))
  )
  ))


