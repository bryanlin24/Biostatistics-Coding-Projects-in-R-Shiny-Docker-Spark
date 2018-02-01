#table
suppressMessages(if (!require("pacman")) install.packages("pacman"))
suppressMessages(pacman::p_load("tidyr", "dplyr", "knitr", "data.table"))


file.list4 <- list.files(path = "/home/bryanlin24/biostat-m280-2018-winter", pattern='.txt')
data5 <- lapply(file.list4, read.table)


data1 <- do.call("rbind", data5)
data1 <- data1[,-1]

names(data1) <- c("PrimeAvg", "SampAvg")




data2 <- gather(data1, "Method", "Avg")


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



colnames(d) <- c("t1", "t5", "Gaussian")

Method <- rep(c("PrimeAvg", "SampAvg"), 5)
n <- c("100", "", "200", "", "300", "", "400", "" ,"500", "")

d <- cbind(n, Method, d)

knitr::kable(d)








#library(data.table)
#library(dplyr)

# ?list.files
# file.list <- list.files(pattern = 'gaussian')
# file.list1 <- list.files(pattern = 't1')
# file.list2 <- list.files(pattern = 't5')
# 
# file.list3 <- merge(file.list, file.list1, file.list2)

#data <- lapply(file.list, read.table(file.list,h=T))
#data5 <- lapply(file.list, fread, header = FALSE)


#Make data frame
#library(tidyr)
