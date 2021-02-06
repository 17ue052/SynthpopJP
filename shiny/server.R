library(shiny)
library(tidyverse)
library(synthpopJP)
library(DT)
library(shinythemes)

shinyServer(function(input, output) {
  number <- eventReactive(input$action, {
    input$num -> num2
    num2
    })

  V <- eventReactive(input$action, {
    input$checkvariable -> checkV
    checkV
  })
  
  
  Japandata <- reactive({
    Japandata <- if("姓名" %in% V()){
      synthpopJP::syn3(V()[-1], number()) 
    }else{
      synthpopJP::syn2(V(), number())
    }
    Japandata
  })
  
  
  output$JPdata2 = DT::renderDataTable({
    Japandata()
  })
  
  
  output$downloadData = downloadHandler(
    filename = "gijidata.csv",
    content = function(file) {
      write.csv(Japandata(), file) 
    }
  )
}
)



