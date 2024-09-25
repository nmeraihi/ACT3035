# Lecture sur Github
insurance_data <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/refs/heads/master/AUT_2024/insurance.csv")
# Deuxième facon ou lire les données localement
setwd("C:/Users/meraihi_n/Desktop/ACT3035")
insurance_data <- read.csv("insurance.csv")
# charger les biblio nécessaires

library(dplyr)
# si pas installé: install.package("dplyr")
View(insurance_data)
# afficher la structure des données,
# Je veux juste voir la nature des données, 
str(insurance_data)
# Analyste statistique des données
summary(insurance_data)
# la variable charges sont les frais médicaux facturé
# par l'assureur a l'assuré
colSums(is.na(insurance_data))

# On veut catégoriser les valeurs de Charges 
# en 4 catégories:
# si <5000 Basse
# si >=5000 et <15000 --> moyenne
# si >=15000 et <30000 --> Élevée
# si >=30000 Très Élevée

?vector

cartegorise_charges <- function(data){
  charge_categorie <- vector(mode = "character",
                             length = nrow(data))
  for (i in 1:nrow(data)) {
    charges <- data$charges[i]
    if(charges<5000){
      charge_categorie[i] <- "Basse"
    } else if (charges>=5000 & charges<15000){
      charge_categorie[i] <- "Moyenne"
    } else if (charges >= 15000 & charges <30000){
      charge_categorie[i] <- "Élevée"
    } else {
      charge_categorie[i] <- "Très Élevée"
    }
  }
  data$charge_categorie <- charge_categorie
  return(data)
}


donnees_assurance <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/refs/heads/master/AUT_2024/insurance.csv")
cartegorise_charges(donnees_assurance)
donnees_assurance <- cartegorise_charges(donnees_assurance)

cartegorise_charges(insurance_data)

library(dplyr)
cartegorise_charges_vect <- function(data){
  data %>% 
    mutate(charge_categorie=case_when(
      charges<5000 ~ "Basse",
      charges>=5000 & charges<15000 ~ "Moyenne",
      charges >= 15000 & charges <30000 ~ "Élevée",
      charges>=30000 ~ "Très élevée"
    ))
  return(data)
}

cartegorise_charges_vect(donnees_assurance)
# Si je veux sauvegarder dans un objet j'éxecute la ligne ci-dessous
donnees_assurance <- cartegorise_charges_vect(donnees_assurance)
# 
# <18.5 -> poid insuffisant
# 18.5 et 25 <- poid normal
# 25 et 30 <- < surpoid
# >30 obesité
donnees_assurance <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/refs/heads/master/AUT_2024/insurance.csv")

categorise_bmi <- function(data){
  data <- data %>% 
    mutate(bmi_categorie=case_when(
      bmi<18.5 ~"insuf",
      bmi>=18.5 & bmi <25 ~"normal",
      bmi>=25 & bmi <30 ~"surpoids",
      bmi>=30 ~ "Obes"
    ))
  return(data)
}
categorise_bmi(donnees_assurance)


donnees_assurance %>% 
  mutate(bmi_categorie=case_when(
    bmi<18.5 ~"insuf",
    bmi>=18.5 & bmi <25 ~"normal",
    bmi>=25 & bmi <30 ~"surpoids",
    bmi>=30 ~ "Obes"
  ))

library("ggplot2")
install.packages("ggplot2") #si pas installée

ggplot(donnees_assurance, aes(x=charges))+
  geom_histogram(binwidth = 2000, 
                 fill="skyblue",
                 color="black")+
  labs(title = "Distribustion des frais d'assurance",
       x="Charges",
       y="Fréquence")

?geom_histogram






