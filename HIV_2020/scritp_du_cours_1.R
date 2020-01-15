# pour instraller un package
#install.packages("tidyverse")

# pour appeler un package:
library(tidyverse)
setwd("C:/Users/ec291358/Desktop/ACT3035")


3+3

pi

x=3
9999 -> z

#Best way
x<-3
y<-33

string <- "ceci est un string"
string2 <- 'ceci est un string'

class(string)
class(y)

bool <- T
bool2<-TRUE

class(bool)

x<100
x>100

x<=100

x==y
x!=y

string==string2
string!=string2

rm(list=ls())


log(exp(3))
log10(1e7) # = 7

x <- 10^-(1+2*1:9)
cbind(x, log(1+x), log1p(x), exp(x)-1, expm1(x))


?log
example(sqrt)

xx<- -25:25
plot(x=xx, sqrt(abs(xx)), col='blue')

data()
plot(cars)
cars

?cars

colnames(cars)
colnames(cars)<- c("speed_mph", "dist_ft")

head(cars)






