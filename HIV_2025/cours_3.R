
# on aura besoin de générer des données 
# afin les utiliser dans l'exemple

set.seed(123)
# avec les distribution uniforme je génère des ages de mes assurés
ages <- round(runif(100, 18, 85))
# Je veux catégoriser ces ages comme suit:
# Jeune < 25; Adulte < 50; Senior < 70; Ainé > 70

# On va commencer par la méthode de la boucle
# Qu'on veut éviter d'utiliser

if (age<25) {
  return("Jeunes") 
} else if (age<50) {
  return("Adulte")
} else if (age<70) {
  return("Senior")
} else if (age<85) {
  return("Ainé")
} 

# On veut maintenant réutiliser ce if souvent, 
# donc il serait utile de l'insérer dans une fonction

categoriser_age <- function(age){
  if (age<25) {
    return("Jeunes") 
  } else if (age<50) {
    return("Adulte")
  } else if (age<70) {
    return("Senior")
  } else if (age<85) {
    return("Ainé")
  } 
}
# 1.1 Les boucles
# Utilisons cette fonction dans un boucle (théoriquement)
# age: élément dans le veteur tout simplement
for (age in ages[1:100]) {
  # print(categoriser_age(age))
  cat("ages: ", age, "-->", categoriser_age(age), "\n")
}

# 1.2 Vectoriser pour simplifier et accélérer le calcul
catego_age_vecteur <- cut(ages,
                          breaks = c(0,25,50,70,Inf),
                          labels = c("jeunes", "Adultes", "Senior", "Ainé"),
                          right=F
                          )
?cut
df_age <- data.frame(ages=ages, categrie_age=catego_age_vecteur)

# Exercice: créer une fonction `calcul_tarif` qui prend l'age en 
# paramètre et retourne un coeficient multiplicateur:
# # 1.5 < 25; 1.0 < 50; 1.2 < 70; 1.8 > 70

calcul_tarif <- function(ages) {
  cut(ages,
      breaks = c(0,25,50,70,Inf),
      labels = c(1.5,1,1.2,1.8),
      right=F
  )
}

calcul_tarif(ages = ages)
set.seed(456)
ages_comjoint <- round(runif(100, 18, 85))
calcul_tarif(ages = ages_comjoint)

# Eexercice: Tracer un graphique qui illustre le nombre d'assurés 
# par catégorie d'age

# install.packages("ggplot2")
library(ggplot2)

ggplot(df_age,aes(x=categrie_age, fill = categrie_age))+
  geom_bar()+
  labs(title="Distribution des assurés par catégorie d'âge",
       x="Catégorie d'âge",
       y="Nombre d'assurés")
  

ggplot(XXXXXXX,aes(x=XXXXXXX, fill = XXXXXXX))+
  XXXXXXX+
  labs(title=XXXXXXX,
       x=XXXXXXX,
       y=XXXXXXX)

set.seed(456)
sinistres <- matrix(rbinom(50,1,.2), nrow = 10)
primes_base <- rep(1000,10)

# On veut calculer la prime finale avec un malus de 20%
# si assuré[0,1,0,1,0] --> 1000$*1.2*1.2=1440

# Première facon a éviter (boucle)

calcule_prime <- function(historique, primes_base){
  prime_fianle <- primes_base
  for (annee in 1:length(historique)) {
    if (historique[annee]==1) {
      prime_fianle <- prime_fianle*1.2
    }
  }
  return(prime_fianle)
}
# Si on continue, il faudrait faire deux boucles
# et la c'est indice qu'on va dans la mauvaise direction
calcule_prime(sinistres)
# ...
#  il faut donc arrêter ce raisonnement
# Et si on continue...
primes_Finales_boucle=sapply(1:10, 
                             function(i) calcule_prime(sinistres[i,], primes_base[i])
                             )

primes_Finales_boucle

# Facon simple (vectoriser)
primes_Finales_vect <- primes_base*(1.2)^rowSums(sinistres)

primes_Finales_vect

setwd("C:/Users/meraihi_n/Desktop/ACT3035H25")
insurance <- read.csv("insurance.csv")

# Avec la variable `Charges`
 # crééer des catégorie 
# # Basse < 5000; Moyenne < 15 000; Élevée < 30 000; Très élevée > 30 000
insurance$cat_charges <- cut(
  insurance$charges,
  breaks = c(0,5000,15000, 30000, max(insurance$charges)),
  labels = c("Basse", "Moyenne", "Élevée", "Très élevée"),
  right = F
)
?cut
dim(insurance)


# Illustrer la distribustion des frais d'assurance sur un graphique
# de type histogram, sur y Fréquence et x les charges avec une division de 2000

ggplot(insurance, aes(x=charges))+
  geom_histogram(binwidth = 2000,
                 fill="pink",
                 color="black")+
  labs(title = "Distribution des primes d'assurance",
       x="Montant des primes par tranche de 2000$",
       y="Fréquence")








