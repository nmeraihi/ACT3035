?dplyr
install.packages("dplyr")
library(dplyr)
# ctrl+L pour clear la console
?dplyr::left_join()
?nchar
nchar("ACT3035")
sigle <- nchar("ACT 3035")
# left(sigle, 3)
sigle <- "ACT 3035"
?gsub()
substr(sigle, 1, 3)
substr(sigle, 1, 4)
?grep
sigle <- c("ACT 3035", "30 degres", "ACT6100")
grep("3",sigle)
grepl("3",sigle)

?paste

sigle <- "ACT 3035"
strsplit(x = sigle,split = " ")
strsplit(x = sigle,split = " ")[[1]]
programme <- strsplit(x = sigle,split = " ")[[1]][1]
numCours <- strsplit(x = sigle,split = " ") [[1]][2]

paste(programme, numCours)
gsub(" ", "_", paste(programme, numCours))

setwd("C:/Users/meraihi_n/Desktop/ACT3035")
file.exists("declarations-exterminations-punaises-de-lit.csv")
df <- read.csv("declarations-exterminations-punaises-de-lit.csv")
head(df)
View(df)
file.rename("declarations-exterminations-punaises-de-lit.csv", "punaise_lit_mtl_sept_24")
file.create("test.txt")
# Le nombre de déclaration par nom d'arrondissement

nbr_decl_arr <- df %>% 
  select(NBR_EXTERMIN,NOM_ARROND) %>% 
  group_by(NOM_ARROND) %>% 
  summarise(nbr_dec=sum(NBR_EXTERMIN,na.rm = T)) %>% 
  arrange(desc(nbr_dec))

write.csv(nbr_decl_arr,
          file = "nbr_decl_arr.csv",
          row.names = F)

save(nbr_decl_arr, file = "nbr_decl_arr.RData")
load("nbr_decl_arr.RData")

# Prime de base par année
prime_base <- 1000
# Si personne < 25 ans age, surcharge de 15%
# si personne > 60., rabais de 10 %


age <- 33

if (age<25) {
  prime_ajuste <- prime_base*1.15
  message <- "Une surcharge de 15% est appliqué"
} else if (age>60){
  prime_ajuste <- prime_base*.90
  message <- "Un rabais de 10% est appliqué"
} else {
  prime_ajuste=prime_base
  message <- "aucun changement"
}

print(paste("L'âge de l'assuré est: ", age))
print(message)
print(paste("La prime ajustée est de l'ordre de: ",
            prime_ajuste, sep=" "))

# Calculer la valeur future d'un investissement
ivest_initial <- 5000
contribu_annuelle <- 2000
taux_intéret <- .06 
nb_annees <- 25

# length(numeric(nb_annees+1))
valeur_portfolio <- numeric(nb_annees+1)
valeur_portfolio[1] <- 5000
for (nb_annees in 1:nb_annees) {
  interet_gagne <- valeur_portfolio[nb_annees]*taux_intéret
  valeur_portfolio[nb_annees+1] <- valeur_portfolio[nb_annees]+interet_gagne+contribu_annuelle
}

portfolio_gagne <- data.frame(annee=0:nb_annees,
                              Valeur_invest=valeur_portfolio)


i=0
while (i<5) {
  i <- i+1
  print(paste("Le chiffre: ", i, " est dans la boucle"))
}


calcule_invest <- function(ivest_initial= 1000,
                           contribu_annuelle=1000,
                           taux_intéret=.05,
                           nb_annees=10){

  valeur_portfolio <- numeric(nb_annees+1)
  valeur_portfolio[1] <- ivest_initial
  for (nb_annees in 1:nb_annees) {
    interet_gagne <- valeur_portfolio[nb_annees]*taux_intéret
    valeur_portfolio[nb_annees+1] <- valeur_portfolio[nb_annees]+interet_gagne+contribu_annuelle
  }
  portfolio_gagne <- data.frame(annee=0:nb_annees,
                                Valeur_invest=valeur_portfolio)
  View(portfolio_gagne)
}

calcule_invest(21500,2000, .05, 25)











