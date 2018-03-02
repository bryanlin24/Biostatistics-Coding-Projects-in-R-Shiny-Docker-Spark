#Shiny app for Q1 LA City Payroll

library(shiny)
library(tidyverse)

#"/home/bryanlin24/biostat-m280-2018-winter/hw3shiny"
totalpay <- read_rds("/home/bryanlin24/biostat-m280-2018-winter/hw3shiny1/totalpay.rds")


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Make bar chart for total payroll by year
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
  ),
  
  #Make panel for Who earned the most?
  tabPanel("Top Paid LA Employees", uiOutput("q3"), fluid = TRUE,
           titlePanel("Highest Paid Employees"),
           sidebarLayout(
             sidebarPanel(
               numericInput(inputId = "rowq3", label = "How many rows?",
                            value = 10, min = 5, max = count(earn), step = 10),
               selectInput(inputid = "useryearq3", label = "Year", choices = c(distinct(earn, Year)), selected = 2017),
               width=2
             )
           )
  
  
  
  
  
  
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  output$totalpaybarplot <- renderPlot({
    ggplot(data = totalpay, aes(x=Year, y=Amount, fill=Type)) +
      geom_bar(stat="identity", position=position_dodge())
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

