setwd("~/gd/00_propre/ACT3035/git/ACT3035/AUT_2020")

?substr

question <- "Quel est le language de programmation préféré des actuaires?"
substr(question, 13, 20)

nchar(question)

substr(question, nchar(question)-9, nchar(question))

paste("Bonjour", "mon amie", sep="@@@@@@")

grep("l", question)

?grep


ex <- strsplit(question, " ")
ex
class(ex)
unlist(ex)


grep("l", ex[[1]])

sub("actuaires", "prof", question)

sub(" ", "*", question)
gsub(" ", "*", question)

Sys.time()
Sys.Date()

Sys.Date()+365
as.numeric(Sys.Date())
as.numeric(Sys.Date()+365)

weekdays(Sys.Date())

weekdays(Sys.Date()+365)


months(Sys.Date())

seq(from = as.Date("06/09/17", "%d/%m/%y"), to = as.Date("13/12/17","%d/%m/%y"), by = "day")

time_1 <- Sys.time()

time_2 <- Sys.time()

difftime(time_1, time_2)

as.numeric(difftime(time_1, time_2, units = "sec"))

file.create("vide.txt")

file.exists("vide.txt")

file.exists("vide_2.txt")

file.create("df_sommaire.csv")

file.rename("df_sommaire.csv", "df_nm.csv")
?file.rename

list.files()

write.csv(df_sommaire, "df_sommaire.csv", row.names = F)
?write.csv()

write.csv(df_sommaire, "df_sommaire.txt", row.names = F)

read.csv("df_sommaire.csv")

read.csv("df_sommaire.txt")

# Syntaxe if elese

if(18>36){"vrai"} else {"faux"}

villes <- c("Montreal", "Vancover", "Toronto")

province <- ifelse(villes=="Toronto", "Ontario", ifelse(villes=="Montreal", "Quebec", "autre"))
province

for (i in 1:135){
  print(paste("le cfiffre est", i , "ème dans la boucle"))
  }

for (i in 1:10){
  i_2 <- i**2
  print(paste("le cfiffre est", i , "est son carré est ", i_2))
  if(i==10){
    print("fin de la boucle")
  }
}

for (i in 1:10){
  if (i==5){break}
  print(paste("le cfiffre est", i , "ème dans la boucle"))
}


i=0
while(i<5){
  i <- i+1
  print(paste("le cfiffre est", i , "ème dans la boucle"))
}

# Faire une boucle de 1000 élélement dont chaque élément est 
# la moyenne de 100 va tirées d'une distribution normale cr

v_moyennes <- NULL
for (i in 1:1000) {
  mu <- mean(rnorm(100))
  v_moyennes <- rbind(v_moyennes, mu)
}

plot(v_moyennes)





nb_variable <- 30000

v_moyennes <- NULL
cmb_1 <- system.time(
            for (i in 1:nb_variable) {
              mu <- mean(rnorm(100))
              v_moyennes <- rbind(v_moyennes, mu)
            })

v_moyennes <- numeric(length = nb_variable)
cmb_2 <- system.time(
                     for(i in 1:nb_variable){
                       mu <- mean(rnorm(100))
                       v_moyennes[i] <- mu
                     })

cmb_1

cmb_2

cmb_1[1]/cmb_2[1]


somme <- function(x, y){
  return(x+y)
}

somme(3,3)

somme("3",3)


somme <- function(x, y){
  if(is.numeric(x) & is.numeric(y)){
    return(x+y)
  }else{
    print("veuiller verifier que vos arguments sont numérique")
  }
}
somme("3",3)

somme_mul_div <- function(x, y){
  if(is.numeric(x) & is.numeric(y)){
    list(x+y, abs(x-y), x*y)
  }else{
    print("veuiller verifier que vos arguments sont numérique")
  }
}

somme_mul_div(3,3)

somme_mul_div <- function(x=1, y=1){
  if(is.numeric(x) & is.numeric(y)){
    list(x+y, abs(x-y), x*y)
  }else{
    print("veuiller verifier que vos arguments sont numérique")
  }
}


somme_mul_div()


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

# Question il nous reste à trouver la position de la première 
# occurance de " " à partir de la droite
droite <- function(question){
  substr(question, nchar(question)-9, nchar(question))
}

save(df, file="df.RData")
# 
rm(df)
load("df.RData")

