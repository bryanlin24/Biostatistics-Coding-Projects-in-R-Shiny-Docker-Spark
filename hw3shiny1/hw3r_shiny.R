#Hw3_R script for Shiny
library(tidyverse)

LA_payroll <- read_csv("/home/m280-data/la_payroll/LA_City_Employee_Payroll.csv", col_names = FALSE, progress = TRUE)

#Rename all columns
colnames(LA_payroll) <- c("Row_ID", "Year", "Department", "Pay_Dept", "Record_Num", 
                          "Job_Title", "Employment_Type", "Hourly_Rate", 
                          "Annualy_Salary_Projection", "Q1_Payment", "Q2_.Payment", "Q3_Payment", 
                          "Q4_Payment", "Overpay", "Pct_Overpay", "Total_Payments", 
                          "Base_Pay", "Permanent_Bonus", "Longevity_Bonus", 
                          "Temp_Bonus", "Lump_Sum_Pay", "Overtime_Pay", 
                          "Other_Pay", "Other_Pay_PE", "MOU", "MOU_Title", 
                          "FMS_Dept", "Job_Class", "Pay_Grade", 
                          "Avg_Health_Cost", "Avg_Dental_Cost", "Avg_Basic_Life", 
                          "Avg_Benefit_Cost", "Benefit_Plan", "Job_Link")

LA_payroll1 <- LA_payroll[-1, ]

LA_payroll1$Year <- as.integer(LA_payroll1$Year)

#Remove dollar signs

LA_payroll1$Base_Pay <- ifelse(!is.na(LA_payroll1$Base_Pay), 
                               as.numeric(str_replace(LA_payroll1$Base_Pay, "\\$", "")), NA)

LA_payroll1$Overtime_Pay <- ifelse(!is.na(LA_payroll1$Overtime_Pay), 
                                   as.numeric(str_replace(LA_payroll1$Overtime_Pay, "\\$", "")), NA)

LA_payroll1$Total_Payments <- ifelse(!is.na(LA_payroll1$Total_Payments), 
                                     as.numeric(str_replace(LA_payroll1$Total_Payments, "\\$", "")), NA)

LA_payroll1$Other_Pay_PE <- ifelse(!is.na(LA_payroll1$Other_Pay_PE), 
                                   as.numeric(str_replace(LA_payroll1$Other_Pay_PE, 
                                                          "\\$", "")), NA)

LA_payroll1$Avg_Benefit_Cost <- ifelse(!is.na(LA_payroll1$Avg_Benefit_Cost), 
                                       as.numeric(str_replace(LA_payroll1$Avg_Benefit_Cost, 
                                                              "\\$", "")), NA)


#Make a generic path for RDS
datapath <- paste(getwd(),"/hw3/hw3shiny", sep = "")

#Subset data for who earned most?
earn <- LA_payroll1 %>%
  select(Row_ID, Year, Department, Job_Title, Total_Payments, 
         Base_Pay, Overtime_Pay, Other_Pay_PE) 

write_rds(earn, path = paste(datapath, "earn.rds", sep = ""))


#Departments that earn the most
depearn <- LA_payroll1 %>% 
  select(Department, Year, Total_Payments, Base_Pay, Overtime_Pay, Other_Pay_PE) %>%
  group_by(Department, Year) %>% 
  summarise(
    Mean_Base_Pay = mean(Base_Pay, na.rm = TRUE),
    Mean_Overtime_Pay = mean(Overtime_Pay, na.rm = TRUE),
    Mean_Total_Payments = mean(Total_Payments, na.rm = TRUE),
    Mean_Other_Pay_PE = mean(Other_Pay_PE, na.rm = TRUE),
    
    Median_Base_Pay = median(Base_Pay, na.rm = TRUE),
    Median_Overtime_Pay = median(Overtime_Pay, na.rm = TRUE),
    Median_Total_Payments = median(Total_Payments, na.rm = TRUE),
    Median_Other_Pay_PE = median(Other_Pay_PE, na.rm = TRUE)) %>% 
  ungroup()
 

