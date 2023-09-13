setwd("C:/Users/meraihi_n/Desktop/ACT3035/A2023")
1+3
# pour commenter une ligne on tape Ctrl+shift+C
# library(dplyr)
getwd()
ls()
?ls
help(ls)
?sqrt
example(sqrt)

data()

plot(cars)
?cars

require(MASS)

data(Cars93)
?Cars93
summary(Cars93)

# x=2023
x <- 2021
x

print(x)
y <- 09
z <- "Septembre"

x+y

# var_bool_vrai <- TRUE
# var_bool_fausse <- FALSE

var_bool_vrai <- T
var_bool_fausse <- F

y <- "09"
y/2
as.numeric(y)
y <- as.numeric(y)
y/2


x>2000
x<2000

x>=2000
x<=2000

x==2000
x!=2000

x <- c(1,2,3,4,5)
x

x*2
x2 <- x*2

x2==x*2

class(x)

mois_nume <- c(1:12)
mois_nume
c(1.5:12.5)

?seq
seq(2024,2100,4)
annee_olymp <- seq(2024,2100,4)
seq(from=2024,to=2100,by=4)
seq(by=4,from=2024,to=2100)

annee_olymp[3]

length(annee_olymp)

annee_olymp[11]

# tout le vecteur sauf la 19eme valeur
annee_olymp[-19]

annee_olymp[-c(1,2)]

vect_char <- c("rouge", "vert", "blanc")

vect_bool <- c(T,T,F,T, F, F, F)
vect_bool


vect_cocktail <- c(vect_bool, vect_char, annee_olymp)
vect_cocktail

x5 <- c(1:5)
x6 <- c(1:6)
x5
x6
x5+x6






length(x5)==length(x6)

rep("Je t'aime", 25)
replicate(25,"Je t'aime")



