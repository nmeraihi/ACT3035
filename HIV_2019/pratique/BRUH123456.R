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

# ====================
# ======== a) ========
# ====================
# Complétez le code ci-dessous afin d'obtnir le tableau ...
Sys.setlocale(locale="fr_FR.UTF-8")
lien <- "http://donnees.ville.montreal.qc.ca/dataset/5829b5b0-ea6f-476f-be94-bc2b8797769a/resource/c6f482bf-bf0f-4960-8b2f-9982c211addd/download/interventionscitoyendo.csv"
df <- read.csv(lien,stringsAsFactors = FALSE)
# df <- read.csv(lien)
head(df)
df$CATEGORIE[df$CATEGORIE %in% "Infractions entrainant la mort"] <- "InfractionsEntrainantLaMort"
df$CATEGORIE[df$CATEGORIE %in% "M\xe9fait"] <- "Mefait"
df$CATEGORIE[df$CATEGORIE %in% "Vol dans / sur v\xe9hicule \xe0 moteur"] <- "VolDansSurVehiculeMoteur"
df$CATEGORIE[df$CATEGORIE %in% "Vol de v\xe9hicule \xe0 moteur"] <- "VolDeVehiculeAMoteur"
df$CATEGORIE[df$CATEGORIE %in% "Vols qualifi\xe9s"] <- "VolQualifie"
data.frame(table(df$CATEGORIE))


Sys.setlocale(locale="fr_FR.UTF-8")
lien <- "http://donnees.ville.montreal.qc.ca/dataset/5829b5b0-ea6f-476f-be94-bc2b8797769a/resource/c6f482bf-bf0f-4960-8b2f-9982c211addd/download/interventionscitoyendo.csv"
df <- read.csv(...,stringsAsFactors = FALSE)
df$CATEGORIE[df$... %in% "Infractions entrainant la mort"] <- "InfractionsEntrainantLaMort"
df$CATEGORIE[df$... %in% "M\xe9fait"] <- "Mefait"
df$CATEGORIE[df$... %in% "Vol dans / sur v\xe9hicule \xe0 moteur"] <- "VolDansSurVehiculeMoteur"
df$CATEGORIE[df$... %in% "Vol de v\xe9hicule \xe0 moteur"] <- "VolDeVehiculeAMoteur"
df$CATEGORIE[df$... %in% "Vols qualifi\xe9s"] <- "VolQualifie"
... #fonction qui compte le nombre d'occurance dans une variable



# ====================
# ======== b) ========
# ====================
# Complétez le code ci-dessous afin d'avoir le graphique dans la figure:

library(leaflet)
df %>% 
  dplyr::select(LONGITUDE,LATITUDE)%>% 
  dplyr::sample_n(1000) %>%
  leaflet() %>% 
  addTiles() %>% 
  setView(-73.7,45.54, zoom = 10) %>% 
  addCircleMarkers(radius = 1)%>% 
  addCircleMarkers(stroke=FALSE)


df %>% 
  dplyr::sample_n(2000) %>% 
  dplyr::select(CATEGORIE,LONGITUDE,LATITUDE)%>% 
  leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers(lng = df$LONGITUDE, lat = df$LATITUDE)%>% 
  addCircleMarkers(stroke=FALSE) %>% 
  addRectangles(-118.5,33.8,-118.25,34.15) %>%
  addMiniMap()


... %>% 
  dplyr::sample_n(...) %>% #Un échantillonage de 2000 observations à partir des données
  ...%>% # Considération des variables d'intérêt seulement
  leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers(lng = ..., lat = ...)%>% # Les variable longétude et latitude
  addCircleMarkers(stroke=FALSE) %>% 
  addRectangles(-118.5,33.8,-118.25,34.15) %>%
  addMiniMap()


# ============================ NUméro 02 ================================
# =======================================================================
# soit les données: 
df <- read.csv("https://raw.githubusercontent.com/npow/centris/master/scraper/data/all_data.csv")
# Le code ci-dessous vous permet de tracer le graphique à la figure...
# Ce graphique vous permet d'avoir le prix moyen des maisons BuyPrice 
# par année de construction ConstructionYear pour la ville d'Outremont
write.csv(df, "~/Downloads/maison_montreal.csv",row.names = F)
ggplot(data=...,aes(x=ConstructionYear,y=moyenne_price))+
  geom_smooth(color="grey40")+
  geom_point(color="red", size=.5)

# Reproduisez ce graohique en travaillant bien evidement les données
# qui vous permettent d'obtenir ce graohique

df %>%
  select(BuyPrice, Outremont, Montreal.Nord,ConstructionYear) %>%
  filter(!is.na(BuyPrice))%>%
  filter(!is.na(ConstructionYear))%>%
  filter(Outremont==1)%>%
  group_by(ConstructionYear) %>% 
  summarize(moyenne_price = mean(abs(BuyPrice))) %>% 
  ggplot(aes(x=ConstructionYear,y=moyenne_price))+
  geom_smooth(color="grey40")+
  geom_point(color="red", size=.5)











# ============================ NUméro 02 ================================
# =======================================================================




df_life_insurance <- read.csv("~/Downloads/insurance.csv")
library(dplyr)
ins.bp <- df_life_insurance %>%
  select(c(1, 3)) %>%
  tidyr::gather()

library(ggplot2)
summary.boxplot <- ggplot(ins.bp, aes(x = key, y = value)) +
  labs(x = "variable", title = "Insurance Data Boxplot") +
  geom_boxplot(outlier.colour = "red", outlier.shape = 1)

summary.boxplot


ins.h <- df_life_insurance %>%
  select(c(1, 3, 7)) %>%
  tidyr::gather() 


ins.hist <- ggplot(data = ins.h, mapping = aes(x = value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~key, scales = 'free_x')

ins.hist

# ============================ NUméro 03 ================================
# =======================================================================
# Construire une fonction avec une seule ligne de code 
# Étant donné une liste de nombres et un nombre k, retourner si deux nombres de la liste totalisent k.
# Par exemple, étant donné[10, 15, 3, 7] et k sur 17, le résultat est vrai puisque 10 + 7 est 17.
# Bonus : Pouvez-vous le faire en une seule passe ?
v
17-v
intersect(v,17-v)

verif <- function(v,p){
  length(intersect(v,p-v))>=2
}

verif(v=c(10,15,3,7),p=22)
verif(v=c(1,6,19,20),p=17)

# ============================ NUméro 04 ================================
# =======================================================================

a <- c(1, 11, 17, 20)
b <- c(3, 8, 9, 19)
df <- data.frame(expand.grid(a,b)[1]+expand.grid(a,b)[2])
X <- matrix(df$Var1,nrow = 4,byrow = T)
X





# ============================ NUméro 05 ================================
# =======================================================================
# What is difference between matrix and dataframes?

# What is the function used for adding datasets in R?
# Quelle particularité doit avoir ces dataFrame

# what is the function which is used for merging of data frames vertically in R?
# rbind(data frame1,data frame 2)







# ============================ NUméro 06 ================================
# =======================================================================
# ====================
# ======== a) ========
# ====================

c (1, 3, 5, 7, 10) [! c (1, 3, 5, 7, 10) %in% c (1, 5, 10, 11, 13)]

# f you want to know all the values in c (1, 3, 5, 7, 10) that are not in c (1, 5, 10, 12, 14). Which in-built function in R can be used to do this? Also, how this can be achieved without using the in-built function.



# ====================
# ======== b) ========
# ====================

# il existe plusieurs façons de savoir si un élément est présent dans un vecteur
# écriver un code qui permet de vérifier si un élément est dans un vecteur

# How will you check if an element 25 is present in a vector?

# It can be done using the match () function- match () function returns the first appearance of a particular element.
# The other is to use %in% which returns a Boolean value either true or false.
# Is.element () function also returns a Boolean value either true or false based on whether it is present in a vector or not.


# ggplot(..., ..., ...)) + geom_...() +
#   geom_text(aes(label = nombre), vjust = -0.1) +
#   ... + 
#   ... +
#   theme(axis.text.x = element_text(angle = 45)) 








# ============================ NUméro 07 ================================
# =======================================================================









# ============================ NUméro 08 ================================
# =======================================================================







# ======================Déposez l'examen ===================================
# Exécutez la ligne suivante afin d'ouvrir le lien où vous déposer l'examen |
# ==========================================================================
browseURL("https://www.dropbox.com/request/zSTfrR9Xw8mN1s5boKIC")             









