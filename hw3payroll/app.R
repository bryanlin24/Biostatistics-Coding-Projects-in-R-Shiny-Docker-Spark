
library(shiny)
library(tidyverse)

#Read in RDS files
totalpay <- read_rds("/home/bryanlin24/biostat-m280-2018-winter/hw3payroll/totalpay.rds")

earn <- read_rds("/home/bryanlin24/biostat-m280-2018-winter/hw3payroll/earn.rds")

depcost <- read_rds("/home/bryanlin24/biostat-m280-2018-winter/hw3payroll/depcost.rds")

depearn <- read_rds("/home/bryanlin24/biostat-m280-2018-winter/hw3payroll/depearn.rds")


# Define UI for application that draws a histogram
ui <- fluidPage(
   tabsetPanel(
     tabPanel("Total payroll in LA", uiOutput("q2"), fluid = TRUE,
              titlePanel("Los Angeles City Total Payroll by Year"),
              verticalLayout(
                # Create a spot for the barplot
                mainPanel(
                  plotOutput("totalpaybarplot")  
                )
              )
)
)
)


# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$totalpaybarplot <- renderPlot({
     ggplot(data = totalpay, aes(x=Year, y=Amount, fill=Type)) +
       geom_bar(stat="identity", position=position_dodge())   })
}

# Run the application 
shinyApp(ui = ui, server = server)

