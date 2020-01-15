# comment installer un package
install.packages("ggplot2")
# Comment charger un package
library(ggplot2)
require(ggplot2)

x <- 4
# x=4
y <- 5
# y=5

z <- x+y

assign("ex_variable", 30)
ex_variable <- 25

num <- 199.136
string <- "Bonjou"
bool <- TRUE
bool2 <- T
boolF <- F

class(string)
class(boolF)
class(num)

# utilisation de l afonction juste pour
# voir le resultat
as.character(num)

num/2
# jecrase mon ancienne valeur
num <- as.character(num)
num/2
# je remprends mon num en numerique
num <- as.numeric(num)

num<100

num==199.136
num!=199.136

getwd()

# setwd("C:\Users\ec291358\Desktop\ACT3035_H19")
setwd("C:/Users/ec291358/Desktop/ACT3035_H19")
?setwd
ls()
rm(n)
ls()
rm(list=ls())
?sqrt
example(sqrt)

x <- 3
x**2
x^2

round(pi,6)
floor(pi)
ceiling(pi)


9^1/2
9^(1/2)

factorial(4)
vec <- c(1,2,3,4,5)
class(vec)
vec25 <- 1:25
vec25dec <- 19.33:33.33

vecSeq <- seq(from=19.33,to=25.33, by=.33)
vecSeq <- seq(19.33, 25.33, .33)
vecSeq
?seq

vecteur <- 1:8
vecteur[6]
vecteur[c(2,6)]

vec2_6 <- c(2,6)
vecteur[vec2_6]


length(vec25dec)
vect_string <- c("Bonjour", "hi")
vect_bool <- c(T,F,F,T,T,T
               ,F,F,F)
length(vec25dec/13)
length(vec25dec)==length(vec25dec/13)


vec5 <- 1:5
vec6 <- 1:6
vec5+vec6

seq(-30,-5, 1)



