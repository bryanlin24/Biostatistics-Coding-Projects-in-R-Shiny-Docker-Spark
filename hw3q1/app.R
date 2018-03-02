
library("shiny")
library("ggplot2")
library("tidyverse")



#Read in RDS file
la_payroll <- read_csv("/home/m280-data/la_payroll/LA_City_Employee_Payroll.csv")

saveRDS(la_payroll, "la_payroll.rds", compress = TRUE)
LApayroll <- readRDS("la_payroll.rds")

#Rename the names of the columns
names(LApayroll) <- str_replace_all(names(LApayroll), " ", "_")

pay <- 
  LApayroll %>% 
  select(Row_ID, Base_Pay, Overtime_Pay, Total_Payments, 
         `Other_Pay_(Payroll_Explorer)`, Department_Title, Job_Class_Title, Year)  


#remove dollar signs
pay$Base_Pay  <- as.numeric(gsub("\\$", "", pay$Base_Pay))

pay$Total_Payments <- as.numeric(gsub("\\$", "", pay$Total_Payments))
pay$Overtime_Pay <- as.numeric(gsub("\\$", "", pay$Overtime_Pay))

Other_Pay <- pay$`Other_Pay_(Payroll_Explorer)` 
Other_Pay <- as.numeric(gsub("\\$", "", pay$`Other_Pay_(Payroll_Explorer)`))




# Define UI for application that plots
ui <- fluidPage(
  
  # Sidebar layout with a input and output definitions
  sidebarLayout(
    
    # Inputs
    sidebarPanel(
      
      # Select variable for y-axis
      selectInput(inputId = "year", 
                  label = "Year",
                  choices = c("2013", "2014", "2015", "2016"), 
                  selected = "2013")
    ),
    
    # Outputs
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)

# Define server function required to create the scatterplot
server <- function(input, output) {
  
  # Create the scatterplot object the plotOutput function is expecting
  output$distPlot <- renderPlot({
    plot_data = 
      pay %>% 
      filter(Year == input$year) %>% 
      summarize(Base_Pay_Total = sum(Base_Pay, na.rm = TRUE), Overtime_Pay_Total = sum(Overtime_Pay, na.rm = TRUE), 
                Other_Pay_Total = sum(Other_Pay, na.rm = TRUE)) %>% 
      gather(Base_Pay_Total, Overtime_Pay_Total, Other_Pay_Total, key = "Variable", value = "Value")
    
    ggplot(plot_data, aes(x = "", y = Value, fill = Variable)) +
      geom_col(width = 1) +
      scale_fill_manual(values = c("red", "blue", "yellow")) +
      coord_polar("y", start = pi / 3) +
      ggtitle("Pie Chart")
  })
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)


