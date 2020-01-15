# ceci est un commentaire 
age=25
age <- 26
age
age+36
# print(age) ~ age (donc meme chose)
class(age)
coucou <- "coucou"
coucou+5
class(coucou)
is.numeric(coucou)
is.logical(coucou)
vraiFaux <- TRUE
is.logical(vraiFaux)
ageChar <- as.character(age)
ageChar
age<=26
age<26
age==83
age!=83 #vba <>
df <- read.csv("")
?read.csv
getwd()
setwd("C:/Users/ec291358/Desktop/act3035")
ls()
rm(ageChar)
maMemoire <- ls()
maMemoire
rm(maMemoire)
rm(list = ls())

x <- 13
y <- 29
z <- 33

x^2
x**2

pi
round(pi, 2)
floor(pi)
ceiling(pi)
abs(-x)
log(x)
exp(1)

MonPremierVecteur <- c(1,2,3,4)
MonPremierVecteur
vecteur1001 <- 1:1001
vecteur1001
vecX <- 15.8:88.8
vecX
?seq

vecY <- seq(from = 1, to = 1001, by =pi)
vecY <- seq(1, 1001, pi)

vecY


vec <- 1:15

vec[11]
vecY[11]
vec[11:13]

vecteurM <- c(1,"2",1)
vecteurM

length(vecY)-1
vecY[length(vecY)-1]
vecY
vecY[-1]

vecY/2

vv1 <- vecY[4:length(vecY)]
vv2 <- vecY[-(1:3)]
vv1==vv2
all.equal(vv1, vv2)

char <- c("Tesla", "BMW", "Audi")
bool <- c(TRUE, TRUE, FALSE)
bool2 <- c(T,T,F)

seq(5)

