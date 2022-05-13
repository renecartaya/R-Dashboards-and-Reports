library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "My dashboard"),
  dashboardSidebar(),
  dashboardBody(
    box(plotOutput("correlation_plot"), width = 8),
    box(
      selectInput("features","Features:",
                  c("Sepal.Width","Petal.Length",
                    "Petal.Width")), width = 4
    )
  )
)

server <- function(input, output){
  output$correlation_plot <- renderPlot({
    plot(iris$Sepal.Length, iris[[input$features]],
         xlab = "Sepal length", ylab = "Feature")
  })
}
