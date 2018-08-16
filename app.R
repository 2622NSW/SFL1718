library(shiny)
library(ggplot2)
ui <- fluidPage(
   titlePanel("Equalising After Conceding First Goal: EPL 2017-2018"),
   sidebarLayout(
      sidebarPanel(
        helpText("Choose a Variable for the Y Axis"),
        selectInput(inputId = "y", label = "Y Axis",
                    choices = c("Game" = "Game", "Game Result" = "Score",
                                "Venue"="Venue", "Time in Minutes to Equalse"="Equal",
                                "Team Scored First Lost"="TSFL",
                                "Team Did Not Score First Won"= "DNSFW"),
                    selected = "Game"),
        helpText("Choose a Variable for the X Axis"),
        selectInput(inputId = "x", label = "X Axis",
                    choices = c("Week in Season"="Week", "Game" = "Game", "Game Result" = "Score",
                                "Venue"="Venue", "Time in Minutes to Equalse"="Equal",
                                "Team Scored First Lost"="TSFL",
                                "Team Did Not Score First Won"= "DNSFW"),
                    selected = "Week"),
        selectInput(inputId = "z", 
                    label = "Colour By",
                    choices = c("Game" = "Game", "Game Result" = "Score",
                                "Venue"="Venue", "Time in Minutes to Equalse"="Equal",
                                "Team Scored First Lost"="TSFL",
                                "Team Did Not Score First Won"= "DNSFW"),
                    selected = "Week")
      ),
      mainPanel(
         plotOutput(outputId = "scatterplot")
      )
   )
)
server <- function(input, output) {
   
   output$scatterplot <- renderPlot({
      ggplot(data = df, aes_string(x=input$x, y=input$y, colour = input$z)) +
       geom_point() +
       theme_bw()
   })
}
shinyApp(ui = ui, server = server)

