#hw2

install.packages("tidyr")
install.packages("ggplot2")
install.packages("dplyr")

library(ggplot2)
library(dplyr)
library(tidyr)


View(diamonds)

#Define variables
x <- diamonds$x
y <- diamonds$y
z <- diamonds$z

hist(x, main = "Hist of x in Diamonds")
hist(y, main = "Hist of y in Diamonds")
hist(z, main = "Hist of z in Diamonds")



#Histograms
xyz <- rbind(x, y, z)

typeof(xyz)
xyz<-as.data.frame((xyz))

ggplot(data = xyz, aes(value))
ggplot(vegLengths, aes(length, fill = veg)) + geom_density(alpha = 0.2)



ggplot(data = diamonds) + geom_histogram(aes(x=x), fill="lightblue")
+ geom_histogram(aes(x=y),  fill="darkblue")

ggplot() + 
  geom_histogram(aes(x=df1$Age, y=..density..),  fill="lightblue") + geom_histogram(aes(x=df2$Age, y=..density..),  fill="darkblue")




#Histogram of x

ggplot(data = diamonds, aes(x)) + geom_histogram()
ggplot(data = diamonds, aes(y)) + geom_histogram()


ggplot(data = diamonds, aes(x)) + 
  geom_histogram(breaks = seq(0, 60, by = 1) col="red", 
                 fill="green", 
                 alpha = .5) + 
  labs(title="Histogram for x") +
  labs(x="x", y="Count")

#Distribution has very small tails
#Most data clustered toward the middle
#Has a rough bell shape


#Histogram of y
ggplot(data = diamonds, aes(y)) + 
  geom_histogram(col="red", 
                 fill="green", 
                 alpha = .5) + 
  labs(title="Histogram for y") +
  labs(x="y", y="Count")

#Distribution is highly skewed right


#Histogram of z
ggplot(data = diamonds, aes(z)) + 
  geom_histogram(col="red", 
                 fill="green", 
                 alpha = .5) + 
  labs(title="Histogram for z") +
  labs(x="z", y="Count")

#Distribution is highly skewed right





diamonds %>%
  gather(key = dist, vals, x, y, z) %>%
  ggplot(aes(vals, colour = dist)) +
  geom_freqpoly(bins = 100)