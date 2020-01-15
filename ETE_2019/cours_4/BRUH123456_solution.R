# =======================================================================
# CodePerma         : ***********
# =======================================================================
# Dépôt de l'examen : Éxecutez la dernière ligne de ce script browseURL()
# DATE              : 2019-02-20 09:00
# COURS             : ACT3035
# SUJET             : Examen Intra
# =======================================================================

# 1) Dans la section ci-haut , veuillez saisir code perman à la place des (*****)
# 2) Renomer ce fichier avec votre code perman

# ============================ NUméro 01 ================================
# =======================================================================

setwd("~/MEGA/Studies/00_ACT3035/05_H_2019")

Sys.setlocale(locale="fr_FR.UTF-8")
lien <- "http://donnees.ville.montreal.qc.ca/dataset/5829b5b0-ea6f-476f-be94-bc2b8797769a/resource/c6f482bf-bf0f-4960-8b2f-9982c211addd/download/interventionscitoyendo.csv"
df <- read.csv(lien,stringsAsFactors = FALSE)
head(df)
df$CATEGORIE[df$CATEGORIE %in% "Infractions entrainant la mort"] <- "InfractionsEntrainantLaMort"
df$CATEGORIE[df$CATEGORIE %in% "M\xe9fait"] <- "Mefait"
df$CATEGORIE[df$CATEGORIE %in% "Vol dans / sur v\xe9hicule \xe0 moteur"] <- "VolDansSurVehiculeMoteur"
df$CATEGORIE[df$CATEGORIE %in% "Vol de v\xe9hicule \xe0 moteur"] <- "VolDeVehiculeAMoteur"
df$CATEGORIE[df$CATEGORIE %in% "Vols qualifi\xe9s"] <- "VolQualifie"
data.frame(table(df$CATEGORIE))




# ============================ NUméro 02 ================================
# =======================================================================
# library(dplyr)
library(leaflet)
df %>% 
  dplyr::select(LONGITUDE,LATITUDE)%>% 
  dplyr::sample_n(1000) %>%
  leaflet() %>% 
  addTiles() %>% 
  setView(-73.7,45.54, zoom = 10) %>% 
  addCircleMarkers(radius = 1)%>% 
  addCircleMarkers(stroke=FALSE)



# ============================ NUméro 03 ================================
# =======================================================================
df <- read.csv("https://raw.githubusercontent.com/npow/centris/master/scraper/data/all_data.csv")
library(ggplot2)
df %>%
  select(BuyPrice, Outremont, Montreal.Nord,ConstructionYear) %>%
  filter(!is.na(BuyPrice))%>%
  filter(!is.na(ConstructionYear))%>%
  filter(Outremont==1)%>%
  group_by(ConstructionYear) %>% 
  summarize(moyenne_price = mean(abs(BuyPrice))) %>% 
  ggplot(aes(x=ConstructionYear,y=moyenne_price))+
  geom_smooth(color="grey40")+
  geom_point(color="red", size=.5)+
  ylab("Prix moyen d'achat") + 
  xlab("Année de construction")






# ============================ NUméro 04 ================================
# =======================================================================


CompInterSection <- function(a,b){
  a [! a %in% b]
}
a <- c (1, 3, 5, 7, 10)
b <- c (1, 5, 10, 11, 13)
CompInterSection(a,b)
setdiff(c (1, 3, 5, 7, 10), c (1, 5, 10, 11, 13))

#   return(a[-c(which(a %in% b))])



# ============================ NUméro 05 ================================
# =======================================================================



Manhatan <- function(A,B) {
  return(sum(abs(A-B)))
}

B <- c(0,0)
A <- c(6,6)
Manhatan(A,B)



# ======================Déposez l'examen ===================================
# Exécutez la ligne suivante afin d'ouvrir le lien où vous déposer l'examen |
# ==========================================================================
browseURL("https://www.dropbox.com/request/zSTfrR9Xw8mN1s5boKIC")             










