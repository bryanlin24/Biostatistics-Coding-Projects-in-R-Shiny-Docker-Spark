#hw2

install.packages("tidyverse")
install.packages("tidyr")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("nycflights13")
install.packages("ggstance")
install.packages("lvplot")
install.packages("ggbeeswarm")
install.packages("viridis")

library("viridis")
library("tidyverse")
library("dplyr")



SNP <- read_tsv(file = "/home/m280-data/hw1/merge-geno.bim", col_names = FALSE)
persons <- read_delim(file = "/home/m280-data/hw1/merge-geno.fam", delim = " ", col_names = FALSE)

SNP <- rename(SNP, Chromosome = X1, SNP_ID = X2, Genetic_Distance = X3, BP = X4, Allele1 = X5, Allele2 = X6 )

persons <- rename(persons, FamilyID = X1, PersonID = X2, FatherID = X3, 
                  MotherID = X4, Sex = X5, Affection_Status = X6)




View(SNP)
View(persons)


persons <- read_delim(file = "/home/m280-data/hw1/merge-geno.fam", delim = " ", col_names = FALSE)
persons <- rename(persons, FamilyID = X1, PersonID = X2, FatherID = X3,
                  MotherID = X4, Sex = X5, Affection_Status = X6)


mutate(gradebook, Pass.Fail = ifelse(grade > 60, "Passs", "Fail"))
mutate(mpg=replace(mpg, cyl==4, NA)) %>%
  

persons %>% 
  persons$PersonID <- substr(persons$PersonID, 5, 11) %>% 
  persons$MotherID <- substr(persons$MotherID, 5, 11) %>% 
  persons$FatherID <- substr(persons$FatherID, 5, 11) %>% 
  mutate(persons, persons$)

persons$Sex[persons$Sex == "1"] <- "M"
persons$Sex[persons$Sex == "2"] <- "F"
persons$Affection_Status[persons$Affection_Status == 0] <- " "

write_delim(persons, path = "mendel_persons.txt", delim = ",", append = FALSE, col_names = F)











persons$PersonID <- substr(persons$PersonID, 5, 11)
persons$MotherID <- substr(persons$MotherID, 5, 11)
persons$FatherID <- substr(persons$FatherID, 5, 11)
persons$Sex[persons$Sex == "1"] <- "M"
persons$Sex[persons$Sex == "2"] <- "F"
persons$Affection_Status[persons$Affection_Status == 0] <- " "

write_delim(persons, path = "mendel_persons.txt", delim = ",", append = FALSE, col_names = F)
file.show("mendel_persons.txt")


if persons$Sex[]


#convert 0 and 1 to M and F



  


#Mendel snp txt file

#Write to a txt file
mendel_snp <- file("mendel_snp.txt")
writeLines(c("2.40 = FILE FORMAT VERSION NUMBER.", "8348674 = NUMBER OF SNPS LISTED HERE"), mendel_snp)


SNP1 <- SNP %>% 
  select(SNP_ID, Chromosome, BP) %>% 
  unite(SNP_ID, Chromosome, BP, col=" ", sep = ",", remove = TRUE)


write_delim(SNP1, path = "mendel_snp.txt", delim = ",", append = TRUE, col_names = F)

head("mendel_snp.txt", 10)

file.show("mendel_snp.txt")


knitr::kable(head("mendel_snp.txt", n = 10))

knitr::kable(cat(head(readLines("mendel_snp.txt"), n = 10)))


cat(readLines('a.csv'), sep = '\n')








SNP %>% 
  select(SNP_ID, Chromosome, BP) %>% 
  write_delim

  
  
  unite(SNP_ID, Chromosome, BP, col=" ", sep = ",", remove = TRUE) %>% 
  

write.table(SNP1, "mendel_snp.txt")
table <- read_table("mendel_snp.txt")




read_table



write_rds(SNP1, "test.rds")
x=read_rds("test.rds")

write_tsv(SNP1, path = "mendel_snp.txt", append = TRUE, col_names = FALSE) %>%
  strsplit(SNP1, ",") %>% head(10) 



unite (SNP, .., col=" ", sep = ",", remove=TRUE)


#strsplit(SNP1) made R crash



#use file.show to look at your txt file.
file.show("mendel_snp.txt")







#Mendel pedigree

#Strip T2DG


persons1 <- persons %>% str_replace(persons$PersonID, "T2DG")

persons <- sub("_T2DG.*", "")

sub("_3.*", "", df1[,1])


View(persons1)

SNP %>% 
  filter(!grepl(".*T2DG.", SNP))







SNP %>%
  group_by(Chromosome) %>%
  summarize(., n()) 





#3
filter(SNP, Chromosome == 3 & (SNP$BP >= 47892180) & (SNP$BP <= 48130769)) %>%
  nrow()

View(SNP)







library(ggplot2)
library(dplyr)
library(tidyr)
library(nycflights13)


View(diamonds)

#Question 7.3.4
# Explore the distribution of each of the x, y, and z variables in 
# diamonds. What do you learn? Think about a diamond and how you might 
# decide which dimension is the length, width, and depth


#Define variables

x <- diamonds$x
y <- diamonds$y
z <- diamonds$z


x <- cbind(x, y, z)
View(x)


hist(x, main = "Hist of x in Diamonds")
hist(y, main = "Hist of y in Diamonds")
hist(z, main = "Hist of z in Diamonds")


max(z)
max(y)
diamonds %>%
  gather(key = dist, vals, x, y, z) %>%
  ggplot(aes(vals, colour = dist)) +
  geom_freqpoly(bins = 100)

price <- diamonds$price


carat <- diamonds$carat

diamonds %>%
  subset(diamonds, carat %in% c(0.99,1))

diamonds %>%
  filter(diamonds, carat %in% c(0.99,1))

filter_carat <- diamonds %>%
  filter(carat >= 0.99 & carat <= 1)

max(filter_carat$carat)

View(diamonds)








#Define carat variable
carat <- diamonds$carat

filter_carat <- diamonds %>%
  filter(carat >= 0.99 & carat <= 1)

#Check if code worked. Min and max should be between 0.99 and 1 inclusive
min(filter_carat$carat)
max(filter_carat$carat)

#Define filtered carat variable
filtered_carat <- filter_carat$carat


#Check if code worked. Min and max should be between 0.99 and 1
min(filtered_carat)
max(filtered_carat)

count(filtered_carat)


diamonds %>%
  ggplot(aes(y)) +
  geom_histogram() +
  coord_cartesian(ylim = c(0, 50))
# Note how xlim deleted the observations at 0.


diamonds %>%
  ggplot(aes(x)) +
  geom_histogram() +
  coord_cartesian(ylim = c(0, 50))
# Note how xlim deleted the observations at 0.

ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = price)) +
  xlim(100, 5000) +
  ylim(0, 3000)


#Exercise 7.5.2

diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))

SNP <- read.table(file = "/home/m280-data/hw1/merge-geno.bim")
persons <- read.table(file = "/home/m280-data/hw1/merge-geno.fam")


#delay: dep_delay
#destination: dest
#month: month

flights %>%
  count(dep_delay) %>%
  group_by(month, dest)





diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))



