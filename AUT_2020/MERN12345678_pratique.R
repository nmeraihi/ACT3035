# =======================================================================
# CodePerma         : MERN12345678
# =======================================================================
# Dépôt de l'examen : Éxecutez la dernière ligne de ce script browseURL()
# DATE              : 2020-03-04 09:00
# COURS             : ACT3035
# SUJET             : Examen Intra
# =======================================================================

# 1) Dans la section ci-haut, veuillez saisir code permanent à la place 
      # des (***********)
# 2) Renomer ce script avec votre code permanent

# ============================ NUméro 01 ================================
# =======================================================================
# ====================
# ======== a) ========
# ====================
x <- rnorm(100)
eps <- rnorm(100)




# ====================
# ======== b) ========
# ====================
b0=3
b1=2
b2=-3
b3=.3

Y <- b0+b1*x+b2*x**2+b3*x**3+eps








# ============================ NUméro 02 ================================
# =======================================================================
library(dplyr)
# ====================
# ======== a) ========
# ====================

df_corona <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/master/AUT_2020/covid_19_data.csv")
setwd("~/gd/00_propre/ACT3035/prof/08_H_2020/intra/trousse_intra")
# df_corona <- read.csv("covid_19_data.csv")

# ====================
# ======== b) ========
# ====================
df_location <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/master/AUT_2020/time_series_covid_19_confirmed.csv") %>% select(1:4)
# df_location <- read.csv("time_series_covid_19_confirmed.csv")







# ====================
# ======== c) ========
# ====================
colnames(df_location)
head(df_location)

df_location_reg_country <- df_location %>% 
  group_by(Country.Region) %>% 
  summarise(lat=mean(Lat), 
            long=mean(Long))




# ====================
# ======== d) ========
# ====================

df_location_reg_country <- df_location_reg_country %>% 
  na.omit()















# ====================
# ======== e) ========
# ====================

df_corona$date <- as.Date(df_corona$ObservationDate, format='%m/%d/%y')
head(df_corona)


# ====================
# ======== f) ========
# ====================

df_stat_by_countryy <- df_corona %>% 
  group_by(Country.Region) %>% 
  summarise(max_confirmed=max(Confirmed),
            max_Deaths=max(Deaths),
            max_Recovered=max(Recovered)) %>% 
  mutate(death_rate=
           round(max_Deaths/(max_Deaths+max_confirmed+max_Recovered),3)) %>% 
  left_join(df_location_reg_country) %>% 
  unique() %>% na.omit()





# ====================
# ======== g) ========
# ====================
library(dplyr)
library(ggplot2)
df_stat_by_countryy %>% 
  arrange(-death_rate) %>% 
  head(10) %>% 
  ggplot(aes(y = reorder(Country.Region, death_rate), x=death_rate))+
  geom_bar(stat="identity", 
           position=position_dodge(), 
           colour="red",
           fill="red")+
  ggtitle("Taux de décès")+
  xlab("")+
  ylab("")
  










# ============================ NUméro 03 ================================
# =======================================================================
# ====================
# ======== a) ========
# ====================

donne_heyp <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/master/AUT_2020/marche_hypothecaire.csv")
model_lin <- lm(price~sqft_living+bedrooms, data=donne_heyp)
summary(model_lin)





# ====================
# ======== b) ========
# ====================
Rsquared <- function(y, yhat){
  rss <- sum((y-yhat)**2)
  tss <- sum((y-mean(y))**2)
  return(1-rss/tss)
}

Rsquared(y=donne_heyp$price, 
         yhat=model_lin$fitted.values)







# ======================Déposez l'examen ===================================
# Exécutez la ligne suivante afin d'ouvrir le lien du dépôt de votre examen |
# ==========================================================================
browseURL("https://www.dropbox.com/request/QeFnzraywG69iFDB8rJU")         









