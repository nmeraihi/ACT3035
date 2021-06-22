x<-5
setwd("~/Desktop/ACT3035E21/")

install.packages("ggplot2")
library(ggplot2)
plot()

search()

getwd()

ls()

x+3

rm(xx)
rm(y)

rm(list=ls())


y=8

z <- 29
char <- "vieux"
accident <- TRUE
accident <- T






is.numeric(z)
is.numeric(accident)

is.logical()
is.character()




x>y

x>=y

x==y
x!=y

x+y
x**2

pi

round(pi,1)
factorial(4)

vect <- c(1,2,3,4,5,6,7,8)

vect <- 1:55
vect

?seq

x <- seq(17,117,pi)

vect_pi <- seq(from=17,to=117,by=pi)

vect_pi[5]
vect_pi[5,7,9,11]
vect_pi[c(5,7,9,11)]
vect_pi[-c(5,7,9,11)]

length(vect_pi)
length(vect_pi[-c(5,7,9,11)])

vec2 <- c(1:8, c(100,1000,10000), c("Vitre", "auto"), c(T,F, F, F, T))

vec2[1]/2

x/2

vect_pi

sum(vect_pi)

range(vect_pi)[1]
mean(vect_pi)

?runif

set.seed(3035)
x <- runif(20, 0,1)

matrix()
?matrix
xx <- matrix(x, ncol = 5)
xx[3,]
xx[,5]
xx

set.seed(3035)
sample(vect_pi,5)

length(vect_pi)
sample(vect_pi,50, replace = T)
?sample


rnorm(100, 5, 1)

?rnorm



xx[2,3]

xx**2
