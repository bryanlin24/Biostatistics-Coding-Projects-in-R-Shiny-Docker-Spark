library("tidyverse")


la_payroll <- read_csv("/home/m280-data/la_payroll/LA_City_Employee_Payroll.csv")
data <- write_rds(la_payroll, "/home/bryanlin24/biostat-m280-2018-winter/hw3/la_payroll.rds")


names(la_payroll) <- str_replace_all(names(la_payroll), " ", "_")

data_la_payroll <- la_payroll %>% 
  select(Row_ID, Base_Pay, Overtime_Pay, Total_Payments, Department_Title, Job_Class_Title) %>% 
  mutate()


