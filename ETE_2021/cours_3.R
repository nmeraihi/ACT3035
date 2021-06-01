head(df_coll)
library(dplyr)
df_vélo <- select(df_coll, NB_DECES_VELO, NB_BLESSES_VELO)
?select
colnames(df_coll)
df_coll %>% 
  group_by(AN) %>% 
  summarise(tot_nb_dece_velo=sum(NB_DECES_VELO),
                           tot_nb_bless_velo=sum(NB_BLESSES_VELO))

CARS_INFO <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/bdSQL/CARS_INFO.csv", encoding = "UTF-8")
DONNES_DEMO <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/bdSQL/DONNES_DEMO.csv")
PMT <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/bdSQL/PMT.csv")
POLICE_ASSURANCE <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/bdSQL/POLICE_ASSURANCE.csv")



df_join <- left_join(x=DONNES_DEMO, y=CARS_INFO, by="numeropol")

phrase <- "mon vehicule est une BMW"

substr(phrase, 5,12)

nchar(phrase)

nom <- "Tremblay"
paste( "Bonjour", "madame", nom)

grep("v", phrase)

vecteur <- strsplit(phrase, " ")

grep("v", vecteur)

sub("BMW", "TESLA", phrase)



sub("vehicule", "véhicule", phrase)

phrase_2 <- "mon vehicule vehicule est une BMW"

sub("vehicule", "véhicule", phrase_2)

gsub("vehicule", "véhicule", phrase_2)

?read.csv()

Sys.Date()
Sys.time()

Sys.Date()+1

Sys.Date()-81

weekdays(Sys.Date())

months(Sys.Date()+1)

file.exists("csv_test.csv")

file.exists("csv_test.txt")

file.rename("csv_test.csv", "csv_prod.csv")
file.create("code_python.py")

list.files()

file.info("csv_prod.csv")

file.info("csv_prod.csv")$size

setwd("~/Downloads")

file.path("csv_prod.csv" )

5>1

if (5>11) { print("C'est vrai")
} else {
  print("C'est faux")    
  }

# syntaxe
if (condition) {
  vrai
}
argument_1 <- 11
argument_2 <- 11
ifelse(argument_1>argument_2, print("argument_1 > argument_2"), 
       ifelse(argument_1<argument_2, 
              print("argument_1 < argument_2"), 
              print("egal"))
       )

for (j in 1:100) {print("bonjour")
}

for (i in 1:15) {
  print(i**2)
}


for (i in 1:7) {
  if(i==5){next}
  print(i)
}

for (i in 1:7) {
  if(i==5){break}
  print(i)
}




# moyennes <- c(mu_1, mu_2, ...., mu_1000)
# chaque mu est une moyenne de 100 vpa rnorm centrée réduite

moyennes <- NULL
for(i in 1:1000){
  mu <- mean(rnorm(100))
  moyennes <- rbind(moyennes, mu)
}
plot(moyennes)



moyennes <- NULL
temps_vect_NULL <- system.time(
for(i in 1:15000){
  mu <- mean(rnorm(100))
  moyennes <- rbind(moyennes, mu)
})

temps_vect_NULL

moyennes <- numeric(length = 15000)
temps_vect_preci <- system.time(
  for(i in 1:15000){
    mu <- mean(rnorm(100))
    moyennes[i] <- mu
  })

temps_vect_preci


# nomDeLaFonction <- function(arguments de la fincation){
#   ce que la fonction fait
# }


multiplication2Trucs <- function(truc_1, truc_2){
  resultat=truc_1*truc_2
  return(resultat)
}

multiplication2Trucs(3,3)


divise2Trucs <- function(truc_1, truc_2){
  if (truc_2!=0) {return(truc_1/truc_2)
  }else {print("truc_2 doit être différent de 0")}
}

divise2Trucs(2,1)

divise2Trucs(2,0)

divise2Trucs("2",1)




diviseEtMultiplie2Trucs <- function(truc_1, truc_2){
  if (truc_2!=0) {list(truc_1/truc_2, truc_1*truc_2)
  }else {print("truc_2 doit être différent de 0")}
}

diviseEtMultiplie2Trucs(2,2)[2]

?select

# ce qu'une fonction doit inclure dans le sommaire de documentation:
# 1- résumé de ce que la fonction fait
# 2- arguments qye ça prend
# 3- ce que la fonction retourne comme résultats







