library(shiny)
options("shiny.reactlog" = TRUE)


shinyApp(
  fluidPage(
    textInput("questions", "Question:", "many"),
    "Ask Questions: ", textOutput("Q&A")
  ),
  function(input, output) {

    enjoy_presentation <- reactiveVal(TRUE, label = "enjoy_presentation")

    audience <- reactive(label = "audience", {
      input$questions
      enjoy_presentation()
    })

    answer <- reactiveVal(TRUE, label = "answers")

    speaker <- reactive(label = "speaker", {
      answer()
    })

    output$`Q&A` <- renderPrint({
      audience()
      speaker()
    })
  }
)
