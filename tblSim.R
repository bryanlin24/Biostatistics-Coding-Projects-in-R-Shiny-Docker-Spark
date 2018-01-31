#table

install.packages("tidyr")
install.packages("dplyr")


library(data.table)
library(dplyr)

file.list
file.list <- list.files(pattern = '.txt')
data <- lapply(file.list, read.table)



data1 <- do.call("rbind", data)
data1 <- data1[,-1]

names(data1) <- c("PrimeAvg", "SampAvg")


View(data1)



#Make data frame
library(tidyr)


data2 <- gather(data1, "Method", "Avg")
View(data2)



d <- data.frame()

#Prime avg for t1
d[c(1,3,5,7,9), 1] <- data2[c(6:10), 2]

#Samp avg for t1
d[c(2,4,6,8,10), 1] <- data2[c(21:25), 2]

#Prime avg for t5
d[c(1,3,5,7,9), 2] <- data2[c(11:15), 2]

#Samp avg for t5
d[c(2,4,6,8,10), 2] <- data2[c(26:30), 2]

#Prime avg for Gaussian
d[c(1,3,5,7,9),3] <- data2[c(1:5), 2]

#Samp avg for Gaussian
d[c(2,4,6,8,10), 3] <- data2[c(16:20), 2]

View(d)



colnames(d) <- c("t1", "t5", "Gaussian")

Method <- rep(c("PrimeAvg", "SampAvg"), 5)
n <- c("100", "", "200", "", "300", "", "400", "" ,"500", "")

d$Method







data3 <- spread(data2, Method, Avg)
View(data3)

spread(table2, key, value)

#spread - convert from long to wide
#gather - 

#use tidyr package

#kable
# change from wide to long in R , 
#gather and spread command
