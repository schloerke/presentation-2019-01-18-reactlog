library(shiny)
options("shiny.reactlog" = TRUE)
options("shiny.suppressMissingContextError" = TRUE)

shinyApp(
  fluidPage(
    numericInput("KEY_A", "Number:", 42),
    textOutput("KEY_B")
  ),
  function(input, output) {

# Sources
input$KEY_A

# Conductors
val <- reactive({
  input$KEY_A + 1
})

# Endpoints
output$KEY_B <- renderPrint({
  val()
})

observe({
  str(val())
})

})
