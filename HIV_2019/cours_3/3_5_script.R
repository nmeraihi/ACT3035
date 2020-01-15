# LES TABLEAUX
x <- array(1:24, dim = c(3,4,2))

?list
xliste <- list(taille=c(1,5,2), user="Mike", new=T)
xliste$taille
xliste$user

rep(xliste$user,5)

mean(xliste$taille)

xliste[1]
xliste[[1]][2]


villes <- c("Montreal","Quebec" )
Population <- c(1942044, 585485, 430077)
rural <- c(F,T,F)

df_donnees_villes <- data.frame(villes, Population,rural)
df_donnees_villes

df_donnees_villes <- read.csv("donnees_villes.csv")
df_donnees_villes

class(df_donnees_villes)

library(MASS)

data("Cars93")
Cars93
?Cars93
library(actuar)
data("dental")
dental
class(dental)

df_auto <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/CARS_1000.csv")
?read.csv

df_radar <- read.csv("https://ws.mapserver.transports.gouv.qc.ca/swtq?service=wfs&version=2.0.0&request=getfeature&typename=ms:radars_photos&outputformat=csv")
head(df_radar)



m <- matrix(1:12, 3)
m


rowSums(m)
colSums(m)

apply(m, c(1,2), log)

xliste2 <- list(vecteur_1=1, vecteur_2=1:17, vecteur_3=55:97)

length(xliste2)

lapply(xliste2, FUN=length)

?lapply


x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
x
lapply(x, FUN=mean)
lapply(x, quantile, probs = 1:3/4)



install.packages("dplyr")


read.csv(donnees_villes
         )



