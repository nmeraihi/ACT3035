# install.packages("tidyverse")
library(tidyverse)

set.seed(3035)
# ctrl+L ça nettoie la console a droite

?sprintf()

police_ID <- sprintf("PL-%03d", 1:8)

assures <- tibble(
  police_ID=police_ID,
  age=c(22,20,35,41,47,53,60,38),
  prime=c(180,220,310,400,430,470,520,360)
                  )
assures

# array: tableau multi-dimensions qui HOMOGÈne
# (tous les élément du même type)

facteur <- array(
  data=runif(3*2*2, 0, .2),
  dim = c(3, 2,2),
  dimnames = list(
    mois=c("Jan", "Fév", "Mar"),
    prov=c("Qc", "On"),
    scenario=c("haut", "bas")
  )
)
# List: boite à compartiments HÉTÉROGÈNE 
# (On peut mixer tout type; 
# vecteur (tout type), nombre. tibble, graphique)


conteneur <- list(
  table_assures=assures,
  province = c("Qc", "On", "AB", "BC", "NS"),
  nom_de_Object = "portefeuille asssuramce IARD"
)
conteneur$province
conteneur$nom_de_Object

?read.csv()
read.csv("businesses.csv")
getwd()
setwd("C:/Users/meraihi_n/Desktop/ACT3035A25")

read.csv("businesses.csv")
resto_mtl <- read.csv("businesses.csv")
View(resto_mtl)
violation <- read.csv("violations.csv")

# est-ce que toutes les informations
# de resto_mtl se retrouvent dans
# les données violations?


library(dplyr)

head(select(violation,
       business_id, 
       date_jugement,
       montant,
       etablissement))

# appliquer le piping
# avec ctrl+shift+M

violation %>% select(business_id, 
                     date_jugement,
                     montant,
                     etablissement)

violation %>% select(business_id, 
       date_jugement,
       montant,
       etablissement,
       ville) %>%
  filter(montant>1000)
# Question combien de condanation par villes avec
# des montant >1000$

violation %>% select(business_id, 
                     date_jugement,
                     montant,
                     etablissement,
                     ville,
                     categorie) %>%
  filter(montant>1000) %>% 
  group_by(categorie) %>% 
  summarise(nombre=n()) %>% 
  arrange(desc(nombre))

# une autre version plus propre
# dans un nouveau data frame appelé 
# violation_categ_1000_pl

violation_categ_1000_pl <- violation %>% select(montant,
                     categorie) %>%
  filter(montant>1000) %>% 
  group_by(categorie) %>% 
  summarise(nombre=n()) %>% 
  arrange(desc(nombre))

?arrange

left_join(x=violation, 
          y=resto_mtl, 
          by="business_id") %>% 
  select(business_id, 
         date_jugement,
         montant,
         etablissement,
         ville,
         categorie,
         latitude, 
         longitude)
  







