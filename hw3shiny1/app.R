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
    ),
  
  #Make panel for Who earned the most?
  tabPanel("Top Paid LA Employees", uiOutput("q3"), fluid = TRUE,
           titlePanel("Highest Paid Employees"),
           sidebarLayout(
             sidebarPanel(
               numericInput(inputId = "rowq3", label = "How many rows?",
                            value = 10, min = 5, max = count(earn), step = 5),
               selectInput(inputId = "useryearq3", label = "Year",
                           choices = c(distinct(earn, Year)), selected = 2017),
               width = 2
             ),
             mainPanel(
               tableOutput("tableq3")
             )
           )
          ),
  tabPanel("Highest Costing Departments", fluid = TRUE,
           titlePanel("Highest Costing Departments"),
           sidebarLayout(
             sidebarPanel(
               numericInput(inputId = "rowq5", label = "How many rows?",
                            value = 5, min = 5, max = count(depcost), step = 5),
               selectInput(inputId = "useryearq5", label = "Year",
                           choices = c(distinct(depcost, Year)), selected = 2017),
               width = 2
             ),
             mainPanel(
               tableOutput("tableq5")
             )
           )
  )
  
           
)
)


# Define server logic required to draw a histogram
server <- function(input, output) {
   
  output$totalpaybarplot <- renderPlot({
    ggplot(data = totalpay, aes(x=Year, y=Amount, fill=Type)) +
      geom_bar(stat="identity", position=position_dodge())
  })
  
  output$tableq3 <- renderTable({
    earn %>%
      group_by(Year) %>%
      filter(Year == input$useryearq3) %>%
      arrange(desc(Total_Payments)) %>%
      head(input$rowq3)
  })
  
  output$tableq4 <- renderTable({
    depearnout <- depearn %>% filter(Year == input$useryearq4)
    
    group_by(Year) %>%
      filter(Year == input$useryearq3) %>%
      arrange(desc(Total_Payments)) %>%
      head(input$rowq3)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

