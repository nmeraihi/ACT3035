# install.packages("tidyverse")
library(tidyverse)
setwd("C:/Users/meraihi_n/Desktop/ACT3035H25")
# Ctrl+L clear la console

set.seed(123)
n_assures <- 1000
ages <- round(runif(n_assures, min = 18, max = 85))
# ?runif
bonus_malus <- round(runif(n_assures, min = 50, max = 150))
aciennete <- round(runif(n_assures, min = 0, max = 20))
nb_Sin <- rpois(n_assures, lambda=.2)
cout_sin <- rlnorm(nb_Sin, meanlog = 7, sdlog = 1) # ça ne marche pas

# Exercice #1
# Créer un fonction qui permet de générer les coût de sinistre
# en condiotionnant sur la nb de sinistre =>
# Si 0 sinistre, 0 couts
gener_couts <- function(nb_Sin){
  if (nb_Sin==0) return(0)
  return(sum(rlnorm(nb_Sin, meanlog = 7, sdlog = 1)))
  # La somme sert à éviter la liste (somme le cout pour chaque
  # valeur générées pat log-norm)
}

# sapply(nb_Sin, gener_couts)
cout_sin <- sapply(nb_Sin, gener_couts)
# cout_sin


# Exercice #2
# Insérer toutes les variables précédentes dans un df
# La première variable est un id d'assurés débutant par 1

portefeuille <- data.frame(
  id=1:n_assures,
  age=ages,
  bonus_malus= bonus_malus,
  anciennete=aciennete,
  nb_sinistres=nb_Sin,
  cout_sin=cout_sin
)
head(portefeuille)
# Exercice #3
# Catégoriser les assurés par âge (0 <jenues<=25, 
# 25 <Adultes <=50, 50< Seniors <=70, 70 < Ainé <= +)

categorie_age <- cut(ages,
                     breaks = c(0,25,50,70,85+1),
                     labels = c("jeunes", "adultes", "senior", "aines"),
                     right = F)
# ?cut

# 3.1
# Insérer cette nouvelle variable dans le df portefeuille
# façon 1
portefeuille$categorie_age <- categorie_age
# façon 2
portefeuille <- portefeuille %>% 
  mutate(
    categorie_age = cut(ages,
                         breaks = c(0,25,50,70,85+1),
                         labels = c("jeunes", "adultes", "senior", "aines"),
                         right = F)
  )


# Exercice #4
# Calculer les statistiques par catégorie d'âge
#  Catégorie, nb_ssurés, nb_sin_moyen, cout_sin_moyen, Bonus_malus_moyen
# Avec dplyr

stats_portefeuille <- portefeuille %>% 
  group_by(categorie_age) %>% 
  summarise(
    nb_assures=n(),
    nb_sin_moyen=mean(nb_sinistres),
    cout_sin_moyen=mean(cout_sin),
    Bonus_malus_moyen=mean(bonus_malus)
  )


# Exercice #5 
# Identifier TOUS les assurés à risque (nb_sin >=2 et cout>10000)
# par odre décroissants

assures_a_risque <- portefeuille %>% 
  filter(nb_sinistres>=2 & cout_sin>10000) %>% 
  arrange(desc(cout_sin))

# Ou cette fois

assures_a_risque <- portefeuille %>% 
  filter(nb_sinistres>=2 | cout_sin>10000) %>% 
  arrange(desc(cout_sin))

# Créer un graphique moustache de la distribution des âges
#  par catégorie d'age en utilisant ggplot

ggplot(portefeuille, aes(x=categorie_age, y=age))+
  geom_boxplot(fill="lightblue")+
  labs(title = "Distribution des âges par catégorie",
       x="Catégorie d'âge",
       y="Âge")+
  theme_minimal()

# Nombre de sinistre moyen par catégorie d'age

ggplot(stats_portefeuille, 
       aes(x=categorie_age, y=nb_sin_moyen))+
  geom_bar(stat = "identity", fill="lightblue")+
  theme_minimal()+
  labs(title = "Nombre moyen de sinistre par catégorie d'âge",
       x="Catégorie d'âge",
       y="Nombre moyen de sinistres")


# Créer une fonction qui permet de donner une annalyse complète
# sur toutes mes variables de portefeuille en sélectionnant 
# un catégorie d'age en particulier.
# Donc, j'ai juste `préciser la catégorie et j'obtiens:
# Le nb_assurés, age+moyen, cout_total, cout_moyen, freq_sinistres,
# bonus_malus_moyen`


analyse_segment <- function(data, categorie){
  segment <- data %>% 
    filter(categorie_age==categorie)
  list(
    nb_assures=nrow(segment),
    age_moyen=mean(segment$age),
    cout_total=sum(segment$cout_sin),
    cout_moyen=mean(segment$cout_sin),
    freq_sinistres=mean(segment$nb_sinistres >0),
    bonus_malus_moyen=mean(segment$bonus_malus)
  )
  }

analyse_segment(portefeuille, categorie = "aines")








