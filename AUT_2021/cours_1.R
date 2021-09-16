# commentaire 
library(spatial)
library()
library(MASS)
# installation de package
install.packages("ggplot2")
library(ggplot2)
getwd()
setwd("C:/Users/meraihi_n/Desktop/ACT3035")

# age=25
# marque="Tesla"
# accident=FALSE

age <- 25
marque <- "Tesla"
# accident <- FALSE
accident <- F


ls()
rm(marque)

rm(list = ls())

?plot
plot(cars)

x <- 25
y <- 35

x+y

print(x)
x
pi
pi+x

class(X)
X+3

class(x)

class(accident)
class(marque)

is.numeric(marque)

x**2
x^2

round(pi,2)
floor(pi)
ceiling(pi)
abs(-5)
abs(-x)
sqrt(abs(x))
factorial(4)


vec <- c(1,2,3,4,5,6,7,8,9,10)
vec[7]
vec2 <- 1:10

vec3 <- 77:177
vec3[11]/age


vec3[4:8]
vec[-2]
vec[-c(2:5)]


vecteur <- c(3, marque, age, accident, vec)
class(vecteur)

vec/2

19:199
19.17:199.17

seq(from=19, to=199, by=25)

seq(from=19, to=199, by=pi)

seq(from=19, to=199, by=age)

seq(from=199, to=19, by=-25)

rep("Je t'aime", 1000)

marque <- "Tesla"
marque <- 'BMW'

# rep('je t'aime, 1000)

sum(vec3)
length(vec3)
sum(vec3)/length(vec3)
mean(vec3)
sum(vec3)/length(vec3)==mean(vec3)
sum(vec3)/length(vec3)!=mean(vec3)

min(vec3)
max(vec3)
sd(vec3)


set.seed(3035)
runif(15,10,25)

runif(10)

set.seed(3035)
sample(1:100,10)


set.seed(3035)
sample(1:100,200,replace = T)


set.seed(3035)
echant <- sample(0:4,1000,replace = T)

table(echant)

set.seed(3035)
echant_bias <- sample(0:4,1000,replace = T, prob = c(.5, .2, .1,.1,.1))

table(echant_bias)

set.seed(3035)
vec_norm <- rnorm(100)

mean(vec_norm)
sd(vec_norm)


set.seed(3035)
vec_norm <- rnorm(10000, 5, 25)

mean(vec_norm)
sd(vec_norm)

matrix(data=vec,nrow = 5)
matrix(data=vec,nrow = 5, byrow = T)

mat <- matrix(data=vec,nrow = 5)
t(mat)

dim(mat)
dim(t(mat))

mat_2 <- matrix(1:40, nrow = 5)
mat_2[,3]
mat_2[3,3]
mat_2[2,]

diag(6)

mat_2/2
sum(mat_2)

