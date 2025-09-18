library(tidyverse)
# sinon on aurait simplement appelé les 2 pack 
# plus bas

# library(dplyr)
# library(ggplot2)

set.seed(6100)
n_assures <- 1000
age_min <- 18
age_max <- 85


# créer une variable des ages de MES assurés
# se situant entre 18 et 85 ans
ages <- runif(n_assures, 18, 85)
ages <- round(runif(n_assures, age_min, age_max))
# Créer une variable bonus_malus entre 50 et 150
bonus_malus <- round(runif(n_assures, 50, 150))
# Créer une variable ancienté entre 0 et 20
anciente <- round(runif(n_assures, 0, 20))

# On va inventer que le nb_sinistre suit une Poisson
nb_sinistres <- rpois(n_assures, .2)

# On va dire que les coûts de sinistres suivent une
# lognormale
?rlnorm()
# moyenne= 7
# ecart-type=1

cout_sinis <-rlnorm(n_assures, 7,1) 

# plus bas est plus préférable
head(cout_sinis*nb_sinistres)

# mais on vas essayer d'introduire IF

# Ce quon veut est une fonction qui permet de
# metrre 0$ a 0 sinistres  et bcp de $$ a plus
# qu'un sinistre (donc juste sum les couts par nombre)

nb_sinistres

generer_couts <- function(nb_sinistres){
  if (nb_sinistres==0) return(0)
  sum(rlnorm(nb_sinistres, meanlog = 7,sdlog = 1))
}

# au lieu decrire nb_sin=0 =1,=2 ...etc
?sapply
cout_totaux <- sapply(nb_sinistres, generer_couts)

portefeuille <- data.frame(
  id =1:n_assures,
  Age_Assure=ages,
  bonus_malus=bonus_malus,
  anciente=anciente,
  nb_sinistres=nb_sinistres,
  cout_total=cout_totaux
)

# Petit problème. incohérence entre age et anciente
# à revoir 

?cut()


categorie_age <- cut(
  portefeuille$Age_Assure,
  breaks = c(0,25,50,70, Inf),
  labels = c("Jeunes", "Adulte", "Senior", "Aine"), 
  right = F 
)

# portefeuille$Cat_age <- categorie_age

# Avec Dplyr:

portefeuille <- portefeuille %>% 
  mutate(
       =cut(
      Age_Assure,
      breaks = c(0,25,50,70, Inf),
      labels = c("Jeunes", "Adulte", "Senior", "Aine"), 
      right = F 
    )
  )

# Par cat_age je veux savoir le nb_assurés, nb_sinistre moyen,
# Moyenne des couts, et finalement la moyenne bonus malus
# je veux le utiliser piping

stats_cat_age <- portefeuille %>% 
  group_by(categorie_age) %>% 
  summarise(
    nb_assures=n(),
    nb_sinistres_moyen=mean(nb_sinistres),
    cout_moyen=mean(cout_total),
    bonus_malus_moyen=mean(bonus_malus)
  )

# denier exemple, détecter les cas lourds pour 
# antiselection ou tarif individuelle

# Trouver les cas qui ont plus que 2 sinistres OU
# reclamation plyus que 1000
# afficher en triant en ordre décroissant
# On vas les appeler assurés à risque

assures_arisque <- portefeuille %>% 
  filter(nb_sinistres>2 | cout_total>1000) %>% 
  arrange(desc(cout_total))


setwd("C:/Users/meraihi_n/Desktop/ACT3035A25")
save(assures_arisque, file = "assures_arisque.RData")

getwd()
load("assures_arisque.RData")

# pour le OU on utilise | et pour le ET C,est &






























