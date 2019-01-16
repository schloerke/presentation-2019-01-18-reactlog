library(shiny)
options("shiny.reactlog" = TRUE)

shinyApp(
  fluidPage(
    numericInput("A", "A:", 3),
    numericInput("B", "B:", 4),
    h4("C: "), textOutput("C_text"),
    h4("C: (print) "), verbatimTextOutput("C_verbatim")
  ),
  function(input, output) {

    a2 <- reactive(
      label = "A^2",
      {
        input$A ^ 2
      }
    )
    b2 <- reactive(
      label = "B^2",
      {
        input$B ^ 2
      }
    )
    c2 <- reactive(
      label = "C^2",
      {
        a2() + b2()
      }
    )
    ans <- reactive(
      label = "C",
      {
        sqrt(c2())
      }
    )

    output$C_text <- renderText({
      ans()
    })
    output$C_verbatim <- renderPrint({
      ans()
    })

})
