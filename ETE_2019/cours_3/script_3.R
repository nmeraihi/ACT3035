vect <- c(T, F, T, F, F, F, T)
as.numeric(vect)

vec <- 1:10
vec[5]<1

# if(respect ou pas de la condition){
#   action a predre
# }


for(i in 1:10){
  print("Bonjour")  
}

rep("Bonjour", 10)


for(i in 1:5){
  if(i==2){
    next
    }
  print(paste("Bonjour le chiffre ", i ))
}


for(i in 1:5){
  if(i==2){
    break
  }
  print(paste("Bonjour le chiffre ", i ))
}

i=0
while(i<5){
  i <- i+1
  print(paste("Bonjour le chiffre ", i ))
}

i=1
t_0 <- Sys.time()
while(i<2){
  if(Sys.time()-t_0>3){
    break
  }
  print(paste(i, Sys.time()))
}


n=1
repeat{
  n=n+1
  print(mean(rnorm(100)))
  if(n>50){break}
}

moyennes <- NULL
temps_1 <- system.time(
for(i in 1:100000){
  mu <- mean(rnorm(100))
  moyennes <- rbind(moyennes, mu)
}
)
temps_1


n <- 100000
moyennes <- numeric(length = n)
temps_2 <- system.time(
  for(i in 1:n){
    mu <- mean(rnorm(100))
    moyennes[i] <- mu
  }
)
temps_2

# ?append
# example(append)
# append(1:5, 0:1)

maFonctionSomme <- function(x,y){
  return(x+y)
}

maFonctionSomme(13,15)

maFonctionSomme(T,"Bonjour")


maFonctionSomme <- function(x,y){
  if(is.numeric(x) & is.numeric(y)){
    return(x+y)
  }else
  {print("Assurez-vous que vos 
         arguments sont numériques")}
}


maFonctionOperation <- function(x,y){
  if(is.numeric(x) & is.numeric(y)){
    return(list("Somme"=x+y, 
                "Difference"=x-y, 
                "Multiplication"=x*y, 
                "Division"=x/y))
  }else
  {print("Assurez-vous que vos 
         arguments sont numériques")}
  }


maFonctionOperation <- function(x=1,y=1){
  if(is.numeric(x) & is.numeric(y)){
    return(list("Somme"=x+y, 
                "Difference"=x-y, 
                "Multiplication"=x*y, 
                "Division"=x/y))
  }else
  {print("Assurez-vous que vos 
         arguments sont numériques")}
  }

maFonctionOperation()


maFonctionOperation <- function(x=1,y=1){
  # Cette fonction fait 4 calculs
  # somme, diff, multiplication et division
  # Arg:
    # x: la valeur du premier élément
    # y: la valeur du 2e élément
  # retourne: somme, diff, multiplication et division
  if(is.numeric(x) & is.numeric(y)){
    return(list("Somme"=x+y, 
                "Difference"=x-y, 
                "Multiplication"=x*y, 
                "Division"=x/y))
  }else
  {print("Assurez-vous que vos 
         arguments sont numériques")}
}
maFonctionOperation
formals(maFonctionOperation)


mamat <- matrix(rnorm(100), 10)
save(mamat, file="mamat.RData")

rm(mamat)

load("mamat.RData")
write.csv(mamat,"mamat.csv")

# install.packages("leaflet")
install.packages("tidyverse")
library(tidyverse)
view(mpg)

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))

session <- c()

A <- rnorm(200)
B <- rnorm(200, .8)

dat <- data.frame(type=factor(rep(c("A", "B"),each=200)),
                  taux=c(rnorm(200), rnorm(200, .8)))
View(dat)

library(ggplot2)
ggplot(data = dat, aes(x=taux))+
  geom_histogram(binwidth = .5)

graph <- ggplot(data = dat, aes(x=taux, fill=type))
graph+geom_histogram(aes(y=..density..), binwidth = .5, 
                 position = "identity",
                 alpha=.5)+
  geom_density(aes(colour=type))



