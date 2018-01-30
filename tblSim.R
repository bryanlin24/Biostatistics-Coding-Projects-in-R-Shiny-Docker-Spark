#table


library(data.table)
library(dplyr)

file.list <- list.files(pattern = '.txt')
data <- lapply(file.list, fread, header = FALSE)
View(data)




data1 <- do.call("rbind", data)

data1 <- data1[,-1]

names(data1) <- c("PrimeAvg", "SampAvg")


View(data1)




library(tidyr)




#use tidyr package

#kable
# change from wide to long in R , 
#gather and spread command
