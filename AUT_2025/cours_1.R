# ceci est le code source du scrupt que je veux coder dans le premier cours
library()
install.packages("MASS")
library(MASS)
# Une facon de savoir dans quel dossier on est
getwd()
# ca aussi c'est important dans un TP/exam
setwd("C:/Users/meraihi_n/Desktop/ACT3035A25")
# setwd("C:\Users\meraihi_n\Desktop\ACT3035_git")
prix_essence <- 1.61
prix_essence_j1 <- round(prix_essence*.95,2)
PrixEssence <- prix_essence
class(prix_essence)
is.numeric(prix_essence)
vrai <- TRUE
vrai <- T
faux <- FALSE
faux <- F

salutarion <- "Bonjour"
sexe <- "homme"

prix_essence>0
prix_essence>=0
prix_essence<0
prix_essence<=0
prix_essence==0
prix_essence!=0
prix_essence

vecteur <- c(1,2,3,4,5,6)
jour_semain_3 <- c("Lundi", "mardi", "mercredi")
prix_essence_3 <- c(1.61, 1.50, 1.49)
vecteur <- 1:50
vecteur <- 1.14:50.13
vecteur
vecteur <- 1:50
vecteur[17]
# je veux les élément de 17e index au 21e inclus
vecteur[17:21]
vecteur_2 <- c("Bonjour", "bon matin", "Hello")
vecteur_2[2]
# je ne veux pas ça
vecteur[-(17:21)]

vecteur_bool <- c(T, F, T, T, T, T, F)
vecteur_bool[3]

length(vecteur_bool)
vecteur[-(17:21)]*2
vecteur**2
sqrt(vecteur)
pi
floor(pi)
ceiling(pi)
abs(-15)
factorial(3)

sum(vecteur)
# n*(n+1)/2

min(vecteur)
max(vecteur)
median(vecteur)
var(vecteur)
sd(vecteur)

# ci-dessous les matrices
M <- matrix(c(1:12),nrow=3, ncol = 4)
M <- matrix(c(1:12),nrow=3)
M <- matrix(c(1:12),3)
M
M <- matrix(c(1:12),3, byrow = T)
M
?matrix
t(M)
dim(M)
dim(t(M))
M[2,3]
M[2,]

sum(M)
min(M)
max(M)

runif(10)
runif(10, 10, 15)

# générez 100 variable pseudp=aléatoires
# tirées d'une distributon UNIFORME 0-1
# stockées dans une matrice appelée M 10x10

M <- matrix(runif(100), 10)
round(M, 2)
set.seed(123)
M <- matrix(runif(100), 10)
round(M, 2)

rnorm(10)
rnorm(100, 10, 5)
mean(rnorm(100, 10, 5))

sample(1:5,2)
sample(1:5,10, replace = T)

# en 
set.seed(3035)
sample(1:49, 6, replace = T)

set.seed(3035)
sample(1:50, 3)










