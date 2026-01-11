
### Cours #1 ----

#### Print + Les Operations de base ----

2

3

#Addition
1+1

#Soustraction
2-1

#Multiplication
2*1

#Division
2/1

#Exposant
2^2
2**2

#exponentiel
exp(1)

#logarithme
log(1, base = 10)

#Priorité d'opération
(2+ 1) * 2

#Valeur numérique enregistré 
pi




#### Assignation ----

x = 2
x

y = 3 
y


# Alt + - = <- 

 
x <- 3
x

y <- 2 
y

x+y

#Case sensitive 

X


x <-  y 

x 
y


x <- y <- z <-  9  

x
y
z

15 -> p 
p


#Function Assign 

assign("q", 30)
q

#remove 

rm(p)


#### Type de variable -----

#numeric
num <- 25

class(num)
class(25)

num.decimal <- 1.5 
class(num.decimal)

#string/character
string <- "bonjour"
string

string2 <- 'bonjour'
string2

class(string)
class(string2)


# booléen 
booleenT <- TRUE
booleenT2 <- T 
stringbooleen <- "TRUE"

booleenT
stringbooleen
booleenT2

booleenF <-  FALSE 
booleenF2 <- F 

booleenF
booleenF2

class(booleenT)
class(booleenF)


#Test type 

is.numeric(num)
is.numeric(string)

is.logical(booleenT)
is.logical(num)


is.character(string)
is.character(num)


# Changement de type 

num

as.character(num)

as.character(num) + 25

class(as.character(num))


#String en numeric

string

as.numeric(string)

as.numeric("25")



# Booleen en numeric et vice versa

as.numeric(booleenT)
as.numeric(booleenF)

as.logical(1)
as.logical(0)

as.logical(25)

# Test équation

#superieur/inferieur
num <100

num <= 100 

num >100

num >= 100  


x == y

x == num

x != y 

x != num

string2 <- "bonjour2"

string == string2

string != string2


#### Libraries (Packages) ----

library()

search()

#Installation package dplyr

install.packages('dplyr')
library(dplyr)


#### Workspace -----

getwd()

class(getwd())

dir <- getwd()

setwd("...")  #Aussi possible de le faire via l'onglet Session 
getwd()


#Lister les objet en memoire

ls()

rm(x)

ls()

rm(list=ls())


#### Aide et ressource ----

?sqrt


help(abs)


??square


example(sqrt)

example(exp)


# Aide sur donnée

data()

View(cars)
plot(cars)

library(MASS)
data("Cars93")

summary(Cars93)

head(Cars93, 10)



## Exercice ----- 

# 🟢 Exercice 1 — Calculs et assignation
# 
# A) Calcule les opérations suivantes dans R :
#   
#   - (3+2)×4
#   - 10/2+3
#   - 2 exposant 3 
# 
# B) Assigne le résultat de  (3+2)×4 à une variable a.
# 
# C) Assigne le résultat de 10/2+3 à une variable b.
# 
# D) Affiche la somme de a et b.
# 
# E) Supprime la variable b.


# 🟡 Exercice 2 — Types de variables et conversions
# 
# A) Crée une variable 'age' contenant la valeur 25.
# 
# B) Vérifie le type de 'age'.
# 
# C) Convertis age en caractère et stocke le résultat dans 'age_char'.
# 
# D) Vérifie le type de 'age_char'.
# 
# E) Convertis 'age_char' en numérique.
# 
# F) Crée une variable 'is_student' égale à TRUE.
# 
# G) Convertis 'is_student' en numérique.


# 🔵 Exercice 3 — Comparaisons et booléens
# 
# A) Crée deux variables :
#   
#   x <- 10
# 
#   y <- 20
# 
# B) Teste si x est inférieur à y.
# 
# C) Teste si x est égal à y.
# 
# D) Teste si x est différent de y.
# 
# E) Crée deux variables :
#   
#   mot1 <- "bonjour"
# 
#   mot2 <- "bonjour"
# 
# F) Vérifie si mot1 est égal à mot2.
# 
# G) Modifie mot2 pour qu’il devienne "Bonsoir" et refais le test.
