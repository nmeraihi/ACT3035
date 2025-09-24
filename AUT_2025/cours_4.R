library(dplyr)
library(ggplot2)

load("C:/Users/meraihi_n/Desktop/ACT3035A25/portefeuille.RData")

colnames(portefeuille)
portefeuille <- portefeuille %>% 
  rename(age=Age_Assure, anciennete=anciente)
  
colnames(portefeuille)


# *****************
# ***** Il ne faut faire ça, c'est juste un exemple de boucle
# Regarder les assurés qui ont >2 sinistres OU cout total >1000


seuil_nb <- 2         # seuil sur le le nb de sinistres
seuil_cout <- 1000    # seuil sur le cout en $
a_risque <- logical(n)

n <- nrow(portefeuille)    #nb d'assurés (ou observation dans le portefeuille)
a_risque <- logical(n)  # un vecteur pré-aloué (vide) logique de longueur 
                        # n avec valeur FALSE par défau

for (i in 1:n) {
  freq_ok <- portefeuille$nb_sinistres[i]>seuil_nb
  cout_ok <- portefeuille$cout_total[i]>seuil_cout
  a_risque[i] <- (freq_ok || cout_ok) # au moins une des condition est VRAI
}

# essaye d'appliquer une franchise de 200$ et un plafond de 20 000$
# Pour chaque assuré ligne par ligne en calculant le cout net
# Encore une fois juste un exemple, il ne faut pas le faire avec les boucles
# mais plutot avec les vecteurs

franchise <- 200
plafond <- 20000
cout_net_for <- numeric(n)

for (i in 1:n) {
  x <- max(portefeuille$cout_total[i]-franchise,0)
  cout_net_for[i] <- min(x, plafond) 
}
portefeuille$cout_net_for <- cout_net_for
mean(portefeuille$cout_net_for)

# Ce qui précède ça fait ce qu'on cherche à faire
# mais on peut faire 100000000000000000000 mieux en vectorisant

?pmax

# creer une fonction "applique_franchise" qui permet 
# d'appliquer la franchise avec la fonction pmax en 
# sur les deux vecteur en parallel

applique_franchise <- function(cout, franchise=0){
  pmax(cout-franchise, 0)
}

# applique_franchise(xxxx, 5000)

applique_plafond <- function(cout, plafond=1000000){
  pmin(cout, plafond)
}

prime_commercial <- function(prime_pure, frais=.25, taxes=.09){
  prime_pure*(1+frais)*(1+taxes)
}


# Dans les données portefeuille appliquer: franchise, plafond 
# pour obtenir la prime pure et calculer la primes commercial


portefeuille <- portefeuille %>% 
  mutate(
    couts_apres_franchise=applique_franchise(cout_total,200),
    cout_net=applique_plafond(couts_apres_franchise, 12000),
    prime_pure=cout_net,
    prime_com =prime_commercial(prime_pure, .25, .09)
  )

portefeuille %>% 
  summarise(
    prime_pure_moy=mean(prime_pure),
    prime_comm_moy=mean(prime_com)
  )

portefeuille %>% 
  filter(cout_total>0) %>% 
  ggplot(aes(x=cout_total))+
  geom_histogram(bins = 30)+
  labs(title = "Distribution des sinistres",
       x="Coût total", y="Effectif")+
  theme_light()


# voir si certaines catégories d'âge coutent plus en moyenne

portefeuille %>% 
  group_by(categorie_age) %>% 
  summarise(cout_net_moy=mean(cout_net)) %>% 
  ggplot(aes(x=categorie_age, y=cout_net_moy))+
  geom_col()+
  labs(title = "Coût net moyen par catégorie d'âge",
       x=NULL,
       y="Coût net moyen")

# Essayer de visualiser la tendance des coûts en fonction
# de l'âge (on utilisera un fonction de lissage)

portefeuille %>% 
  select(cout_total, age) %>% 
  filter(cout_total>0) %>% 
  ggplot(aes(x=age, y=cout_total))+
  geom_point(alpha=.35)+
  geom_smooth(method = "loess")+
  scale_y_log10()+
  labs(title = "Relation âge-coût (echelle log)",
       x="âge",
       y="coût")




















