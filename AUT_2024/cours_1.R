# Pour clear la console on peut taper le shortcut touches ctrl+l
3+2
3*2
# 3!
  # :
library()
install.packages("MASS")
getwd()
setwd("C:/Users/meraihi_n/Desktop/ACT3035")
# donnees <- read.csv("declarations-exterminations-punaises-de-lit.csv")
3+3
x <- 3
y <- 1
x+y
x_num <- 13
charc <- "Bonjour ACT3035"
var_vrai_bool <- TRUE
var_vrai_bool <- T

var_false_bool <- F

# deux façons de voir la valeurs d'une variable
charc
print(charc)

class(charc)
class(var_false_bool)
class(x_num)

is.numeric(var_false_bool)

as.numeric(var_false_bool)
var_false_bool


13==12
13!=12

var_vrai_bool==var_false_bool

13<12
13>12
13<=12
13>=12


x <- 3
x <- c(1,2,3,4,5)
x <- 1:5
x <- 1:1001
x <- 1.23:1001
x

y <- c(13,12,15,77,19)
y[4] <- 16
z_vf <- c(T, F, T,F,F,F)

y*2

y[2:4]
y[c(2,5)]
y[-c(2,5)]
z_vf[-c(2,5)]

y/2
y**2
mean(y)
sd(y)

min(y)
max(y)

?sd

?seq
pi
seq(15,125,pi)

rep(c("rouge", "jaune", "bleu"), 15)



