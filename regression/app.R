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
    titlePanel("Simple Linear Regression Model: A trend line is a line that is drawn above, below or through various data points in order to show their general direction."),

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
           plotOutput("distPlot")
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
