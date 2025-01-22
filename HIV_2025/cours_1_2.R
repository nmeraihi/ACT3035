5+5
5**2
# ceci est un commentaire dans R
install.packages("dplyr")
library(dplyr)
?sqrt
abs(-5)
sqrt(25)

# Soit la variable x représentant l'âge des assurés 

x_1=28
# ou mieux encore
x_1 <- 28
annee_naissance <- 2025-x_1

nom <- "Donald"
Canadien <- FALSE
Canadien <- F
Americain <- T  

x_1>100
x_1<100
x_1==100  
x_1!=100  
  
class(Canadien)
class(x_1)

as.numeric(Canadien)
as.numeric(Americain)

x <- c(28, 25,23,49,65, 79)
annee_naissance <- 2025-x

annee_naissance
print(annee_naissance)

?seq
# Créer un vecteur qui donne les années des jeux olympique
# de Paris 2024 à Athena 1896 en utilisant la fonction seq

annees_olympiques <- seq(from=2024, to=1896, by=-4)
length(annees_olympiques)

# Changez l'année 2020 par 2021 pour année covid-19
annees_olympiques[2] <- 2021

annees_olympiques

annees_olympiques[30:32]

# Enlever les années 1940 et 1944 du vecteur
annees_olympiques[21:22]

annees_olympiques[!annees_olympiques %in% c(1940, 1944)] 

annees_olympiques %in% c(1940, 1944)
!annees_olympiques %in% c(1940, 1944)
annees_olympiques <- annees_olympiques[!annees_olympiques %in% c(1940, 1944)] 

annees_olympiques/2
annees_olympiques**2
log(annees_olympiques)
exp(annees_olympiques)
pi
min(annees_olympiques)
max(annees_olympiques)
mean(annees_olympiques)
sd(annees_olympiques)
var(annees_olympiques)

1:24
?matrix
A <- matrix(1:24, 4)
A
A <- matrix(1:24, 4, byrow = T)
A
t(A)
dim(A)
dim(t(A))
diag(7)

B <- matrix(1:30, ncol = 6)
B
rbind(A, B)

C <- matrix(1:40, nrow=4)
C
AC <- cbind(A, C)

mean(AC)
summary(AC)


set.seed(3035)
runif(100)
?runif

set.seed(123)
x <- rnorm(150000000)
mean(x)

urne <- c(1:10)
set.seed(1200)
sample(urne, 5)

set.seed(1200)
sample(urne, 20, replace = T)









