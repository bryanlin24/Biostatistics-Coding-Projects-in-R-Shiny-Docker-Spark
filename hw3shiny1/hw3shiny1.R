#Hw 3 R Code for Q1 LA Payroll

#Read CSV
library(tidyverse)

LA_payroll <- read_csv("/home/m280-data/la_payroll/LA_City_Employee_Payroll.csv",
                       col_names = FALSE, progress = TRUE)

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


#Make a generic path for writing RDS files
datapath <- paste(getwd(),"/hw3/hw3shiny1", sep = "")


#Filter pays
total_pays <- LA_payroll1 %>%
  select(Year, Base_Pay, Overtime_Pay, Other_Pay_PE) %>%
  group_by(Year) %>%
  summarise(BasePayTotal = sum(Base_Pay, na.rm = TRUE),
            OvertimeTotal = sum(Overtime_Pay, na.rm = TRUE),
            OtherTotal = sum(Other_Pay_PE, na.rm = TRUE)) %>%
  gather("BasePayTotal", "OvertimeTotal", "OtherTotal", key = "Type", value = "Amount")

write_rds(total_pays, path = paste(datapath, "totalpay.rds", sep = ""))
