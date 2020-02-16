?substr
substr("Bonjour",start = 3, stop = 5)
a <- "_Bonjour"
nchar(a)
b <- substr("_Bonjour",start = 2, stop = nchar(a))


paste("_", b, sep = "")

grep("o", x = c("Bonjour", "alo", "salut", "ola"))

phrase <- "Mon nom est Noureddine"
sub("Noureddine", "Meraihi", phrase )

phrase2 <- "Vous trouvez le plan du cours dans le cours ACT3035"
sub("cours", "COURS", phrase2 )
# Pour généraliser
gsub("cours", "COURS", phrase2 )

# Les dates et heures

Sys.Date()
date_0 <- Sys.Date()
temps_0 <- Sys.time()
temps_0
Sys.time()
temps_0+3600
temps_0-(3600*5)
date_0+1
as.numeric(date_0)
?as.Date
as.Date(as.numeric(date_0), origin = "1970-01-01")
as.numeric(date_0-20)
date_0-1:5
weekdays(date_0-1:5)

months(date_0)

temps_1 <- Sys.time()
difftime(temps_1, temps_0)
as.numeric(difftime(temps_1, temps_0,units = "sec"))

# Manipulation des fichiers
# setwd("C:/Users/ec291358/Desktop/ACT3035")
setwd("~/Desktop")

?file.exists

?file.rename

file.create()

list.files()

file.info()


vect_boo <- c(T,T,F,F,F,F,T) 
as.numeric(vect_boo)
vec <- 1:10
vec
vec[1]>1
vec[1]>=1

age <- 25

if(age>18 && age <=35){cat_age="jeune"}else
{cat_age="vieux"}

cat_age

age <- 45

if(age>18 && age <=35){cat_age="jeune"}else
{cat_age="vieux"}

cat_age


age <- 70
if(age>18 && age <=35){
  cat_age="jeune"}else if (age>35 && age<=55){
    cat_age="un peu jeune"}else{cat_age="vieux"}
cat_age

# On y revient:
age <- c(25,40,70)
cat_age <- ifelse(age>18 && age <=35, "jeune",
                  ifelse(age>35 && age<=55,"un peu jeune",
                         "vieux")
                  )
cat_age

for(i in 1:17){
  print(paste("ce chiffre est ", i, "dans la boucle"))
  }

for (i in 1:5){
  if(i==3){next} 
  print(paste("ce chiffre est ", i, "dans la boucle"))
}

for (i in 1:5){
  if(i==3){break} 
  print(paste("ce chiffre est ", i, "dans la boucle"))
}

rnorm(10)

# c(mu_1, mu_2, ...., mu_10)

set.seed(3035)
taille <- 20000
nb_va <- 1000
moyenne <- NULL
temps_v1 <- system.time(
  for (i in 1:taille){
    mu <- mean(rnorm(nb_va))
    moyenne <- rbind(moyenne, mu)
  }
)

set.seed(3035)
moyenne <- numeric(length = taille)
temps_v2 <- system.time(
  for (i in 1:taille){
    mu <- mean(rnorm(nb_va))
    moyenne[i] <- mu
  }
)
plot(moyenne)
temps_v1
temps_v2

mafonc_somme <- function(x=0,y=0) {
  if(is.numeric(x) && is.numeric(y)){
    return(x+y)
  }else{
    print("ça doit etre des chiffres")
  }
}



mafonc_somme(1,3)
mafonc_somme()





mafonc_va_nor <- function(taille, nb_va){
  # taille: le nombre n dans ma boucle
  # nb_va: le nombre de va alea tirées normale CR
  moyenne <- numeric(length = taille)
    for (i in 1:taille){
      moyenne[i] <- mean(rnorm(nb_va))
    }
  graph <- plot(moyenne)
  return(list(mampy=moyenne, mongraph=graph))
}

toto <- mafonc_va_nor(15, 1000)
toto$mongraph
toto






























































