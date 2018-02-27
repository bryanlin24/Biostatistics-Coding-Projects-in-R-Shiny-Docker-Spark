library("tidyverse")
library("ggplot2")
install.packages("shiny")


#QUESTION 1

library("readr")

la_payroll <- read_csv("/home/m280-data/la_payroll/LA_City_Employee_Payroll.csv")
data <- write_rds(la_payroll, "/home/bryanlin24/biostat-m280-2018-winter/hw3/la_payroll.rds", compress = c("gz"))


names(la_payroll) <- str_replace_all(names(la_payroll), " ", "_")
View(la_payroll)

Total_Payments <- parse_number(la_payroll$Total_Payments)
Base_Pay <- parse_number(la_payroll$Base_Pay)
Overtime_Pay <- parse_number(la_payroll$Overtime_Pay)

data_la_payroll <- la_payroll %>% 
  select(Row_ID, Base_Pay, Overtime_Pay, Total_Payments, Department_Title, Job_Class_Title, Year) %>% 
  mutate(Other_Pay = Total_Payments - Base_Pay - Overtime_Pay)








qplot(data_la_payroll$Year, geom="histogram")
hist(data_la_payroll$Year)


View(data_la_payroll)












#QUESTION 2

library("DBI")
library("RSQLite")
library("tidyverse")

la <- read_csv("/home/m280-data/LAParkingCitations.csv")



if (Sys.info()[["sysname"]] == "Linux") {
  db <- dbConnect(RSQLite::SQLite(), 
                  dbname = "/home/m280-data/la_parking/LA_Parking_Citations.sqlite")
} else if (Sys.info()[["sysname"]] == "Darwin") {
  db <- dbConnect(RSQLite::SQLite(), 
                  dbname = "./LA_Parking_Citations.sqlite")
}


dbWriteTable(db, "la_parking", la_parking, overwrite = TRUE)


dbListTables(db)






latix_sql <- dplyr::tbl(db, "latix")

str(latix_sql)


count(latix_sql)
View(latix_sql)


tix <- latix_sql %>% 
  select(Issue_DateTime, Meter_Id) %>% 
  collect()
tix

tix %>% 
  ggplot() +
  geom_bar(aes(x = Issue_DateTime))

addr <- nyc_sql %>%
  select(Issue_Date, Issuing_Agency, Violation_Precinct, Number, Street) %>%
  filter(Violation_Precinct >= 1, Violation_Precinct <= 34)
addr




latix_sql %>% 
  select(Issue_DateTime) %>% 
  summarise(n = n())


max(latix_sql$Issue_DateTime)
max()

select %>% 
max(latix_sql$Issue_DateTime)




library("DBI")
library("RSQLite")
library("tidyverse")
if (Sys.info()[["sysname"]] == "Linux") {
  db <- dbConnect(RSQLite::SQLite(), 
                  dbname = "/home/m280-data/nyc_parking/NYParkingViolations.sqlite")
} else if (Sys.info()[["sysname"]] == "Darwin") {
  db <- dbConnect(RSQLite::SQLite(), 
                  dbname = "./NYParkingViolations.sqlite")
}
dbWriteTable(db, "nyc", nyc, overwrite = TRUE)
dbListTables(db)


nyc_sql <- dplyr::tbl(db, "nyc")
str(nyc_sql)
