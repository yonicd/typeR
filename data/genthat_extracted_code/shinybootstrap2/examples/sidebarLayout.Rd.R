library(shinybootstrap2)


### Name: sidebarLayout
### Title: Layout a sidebar and main area
### Aliases: sidebarLayout

### ** Examples

library(shiny)

# Define UI
fluidPage(

  # Application title
  titlePanel("Hello Shiny!"),

  sidebarLayout(

    # Sidebar with a slider input
    sidebarPanel(
      sliderInput("obs",
                  "Number of observations:",
                  min = 0,
                  max = 1000,
                  value = 500)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)



