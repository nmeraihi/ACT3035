setwd("C:/Users/meraihi_n/Desktop/ACT3035/")
5+5
# ctrl+L
# Ceci est un autre exemple de texte free
library()
library(MASS)
install.packages("tidyverse")
library(tidyverse)
sqrt(25)
sqrt("qqchh")
?sqrt
?pi



pi
pi/2


# Exemple sqrt de help

require(stats) # for spline
require(graphics)
xx <- -9:9
plot(xx, sqrt(abs(xx)),  col = "red")
lines(spline(xx, sqrt(abs(xx)), n=101), col = "pink")

?Cars93

data("Cars93")
View(Cars93)
Cars93$MPG.city


y=5
x<-5
x+y
# Alt - ça me donne le signe de la flèche vers la gauche
x <- 11
x+y

x <- "BMW"
x+y

x <- TRUE
x+y
x <- T
x <- F
x+y

y <- c(2024, 2025, 2026, T, F, T, "BMW", "AUDI", "Tesla")

y/2
y

x <- "11"
x+y
x <- as.numeric(x)
x+y

y[1] <- as.numeric(y[1])
y[1]
as.numeric(y[1])
as.numeric(y[1])/2



x>0
x>=0
x<0
x<=0
x==0  
# vba ineg <>
x!=0
# <- 
x <- c(1,2,3,4,5,6,7,8,9)
x <- c(1:100)
x <- "bonjoue"
x
x/2

x <- c(pi:99.18)
seq(2024,2100,4)[8:10]
seq(2024,2100,4)[c(9,11,13)]

?seq
seq(from=2024, to=2100, by=4)
vecteur_char <- c("BMW", "Honda", "Toyota", "Lada")
veteur <- c(T, F, T, F, F, F, F)
annees_olymp <- seq(2024,2100,4)
length(annees_olymp)
rep("Je t'aime", 101)
replicate(101, "Je t'aime")

annees_olymp <- seq(2024,2100,4)

annees_olymp[8:10]
