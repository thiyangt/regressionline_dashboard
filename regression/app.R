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
    titlePanel("Simple Linear Regression "),
    print("I want to fit a line (Y=mx+c, where m - slope and c - intercept) to model the relationship between Daughters' height and Mothers' height. What is best guess for the slope and the intercept of the line? Help: Use slider."),
    hr(),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          
            sliderInput("slope",
                        "Slope:",
                        min = 0.4,
                        max = 0.6,
                        value = 100),
            
            sliderInput("intercept",
                        "Intercept:",
                        min = 28.1,
                        max = 35.1,
                        value = 200)
        ),

        # Show a plot of the generated distribution
       mainPanel(
           plotOutput("distPlot"),
           hr(),
           tags$h4("Developed by"),
           tags$a(href="https://thiyanga.netlify.app/", 
                  "Thiyanga S Talagala, StatisticsMART.org"),
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        slope <- input$slope 
        intercept <- input$intercept
        

        # scatterplot
        #hist(x, breaks = bins, col = 'darkgray', border = 'white')
        library(ggplot2)
        library(alr3)
        ggplot(heights, aes(x=Mheight, y=Dheight))+geom_point(alpha=0.5,) + 
            geom_abline(intercept = intercept, slope = slope, colour="forestgreen", lwd=2) +
            xlab("Mother's height") + 
            ylab("Daughter's height") +
            ggtitle("Scatter plot of daughters' height vs mothers' height") + 
            theme(aspect.ratio = 1)
    
      
    })


}

# Run the application 
shinyApp(ui = ui, server = server)
