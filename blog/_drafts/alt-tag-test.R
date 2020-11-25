if (!require("remotes"))
  install.packages("remotes")
remotes::install_github("rstudio/shiny")

library(shiny)
shinyApp(
  ui = fluidPage(
    actionButton("btn1", "Update plots"),
    plotOutput("plot1", width = "400px")
  ),
  server = function(input, output, session) {
    vals <- reactive({
      rnorm(30)
    })
    output$plot1 <- renderPlot(
      {
        hist(vals())
      },
      alt = reactive({
        paste("Dynamic alt text. Mean(x):", round(mean(vals()), 3))
      })
    )
  }
)
