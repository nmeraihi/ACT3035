vecteur <- c(T,F,T,F,F,F)
as.numeric(vecteur)

vect <- 1:10
vect
vect[3]<5
vect[3]>5
vect[3]!=5

if(vect[3]<5){print("la 3e valeur est plus petit")}else
{print("la 3e valeur est plus grand")}

# if(condition){si vrai}eles{si faux}
age <- c(29,55,79)
if(age>18 && age<=35){
  cateAge <- "jeune"
} else if(age>35 && age<=55)
{cateAge <- "moyen"}else {cateAge <- "autre"}
  
cateAge

for (i in 1:15){
  print(paste("le chiffre: ", i, "est dans la boucle"))
}


for (i in 1:15){
  i_carr <- i**2
  print(paste("le carré de", i, "est ", i_carr))
}

for (i in 1:5){
  if (i==2){next}
  print(paste("le chiffre: ", i, "est dans la boucle")) 
}

for (i in 1:5){
  if (i==3){break}
  print(paste("le chiffre: ", i, "est dans la boucle")) 
}

i=0
while (i<5){
  i <- i+1=
  print(paste("le chiffre", i , "dans la boucle"))
}

set.seed(3035)
vecteurVide <- NULL
for (i in 1:1000){
  mu_i <- mean(rnorm(100))
  vecteurVide <- rbind(vecteurVide, mu_i)
}

plot(vecteurVide)

# mesure le tremps:

set.seed(3035)
vecteurVide <- NULL
a <- system.time(
  for (i in 1:20000){
    mu_i <- mean(rnorm(100))
    vecteurVide <- rbind(vecteurVide, mu_i)
  }
)
a

set.seed(3035)
vectDefini <- numeric(length = 20000)
b <- system.time(
  for (i in 1:20000){
    mu_i <- mean(rnorm(100))
    vectDefini[i] <- mu_i}
)

a
b

round(a[1]/b[1],2)

# Fonction:
somme <- function(x, y){
  return(x+y)
}

somme(1,3)

somme <- function(x, y){
  if(is.numeric(x)&is.numeric(y)){
    return(x+y)
  } else{
    print("veuillez vous assurer que vos arguments sont numériques")
  }
}
somme(1,"3")


genererNrnorm <- function(seed, nbritter, nbrVarRnorm){
  set.seed(seed)
  vectDefini <- numeric(length = nbritter)
  for (i in 1:nbritter){
    mu_i <- mean(rnorm(nbrVarRnorm))
    vectDefini[i] <- mu_i}
  return(vectDefini)
}

vectDefini

genererNrnorm(123, 500, 1000)

operation <- function(x,y){
  if(is.numeric(x) & is.numeric(y)){
    list(x+y, abs(x-y), x*y, x/y)
  }else{
    print("veuillez vous assurer que vos arguments sont numériques")
  }
}

operation(1,3)

operation

somme <- function(x=1, y=1){
  return(x+y)
}

somme()


operation_l<-function(x=1,y=1){
  # Cette fonction calcule l'adition, soustraction, multiplication
  # ainsi que la division de deux vecteurs
  # Args:
  #   x: La valeur du premier vecteur, la valeur par défaut étant =1
  #   y: La valeur du deuxième vecteur, la valeur par défaut étant =1
  #
  # retourne:
  #   une liste du résultat des opérations ....      
  
  if(is.numeric(x) & is.numeric(y)){
    list(x+y, x-y, x*y, x/y)
  }
  # Gestion d'erreurs
  else {
    print("veuillez vérifier vos arguments")
  }        
} 


x <- matrix(rnorm(100), 10)
setwd("~/gd/00_propre/ACT3035/git/ACT3035/ETE_2020")
write.csv(x, "matrice_x.csv")
save(x, file="matrice_x.RData")

load("matrice_x.RData")

x**2


# Les graphiques:

# install.packages("tidyverse")
# install.packages("ggplot2")
library(ggplot2)

?mpg


ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, hwy))


ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, cty))+
  geom_smooth(mapping = aes(x=displ, cty))


ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y=cty,color=class))+
  geom_smooth(mapping = aes(x=displ, cty))
 

a <- ggplot(data=mpg)
a+
  geom_point(mapping = aes(x=displ, y=cty,color=class))+
  geom_smooth(mapping = aes(x=displ, cty)) 



















