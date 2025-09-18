#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Randomise order of meerkats"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            radioButtons("group",
                        "Meerkat Group:",
                        choices = list("Hata group" = 1, "Mata group" = 2))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           verbatimTextOutput("meerkatchoice")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {


    
    output$meerkatchoice <- renderText({
        h<-sample(c("Hata", "Solomon", "Hanna", "Hercules", "Harmony", "Hagar"),6)
        m<-sample(c("Mata", "Maris", "Major", "Majesty", "Mocha", "Martini", "Macaroon", "Charles", "Jeff", "Yan"),10)
        ifelse(input$group==1, paste("Observe in this order: ",  h[1],  h[2],  h[3],  h[4],  h[5],  h[6], sep="\n"),
               paste("observe in this order: ",  m[1],  m[2],  m[3],  m[4],  m[5],  m[6],  m[7],
                           m[8],  m[9],  m[10], sep="\n"))

    })
    

}

# Run the application 
shinyApp(ui = ui, server = server)
