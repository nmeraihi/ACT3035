###############################################################
# Nom :
# Prénom :
# Code permanent :
# Cours : ACT3035 – Laboratoire d’actuariat
# Date : 29/10/2025
# Instructions :
#  - Répondez directement dans ce script.
#  - Sauvegardez votre fichier au format : Code_permanent.R
#  - Commentez votre code au besoin (# explication courte)
###############################################################


###############################################################################
# NETTOYAGE / PRÉPARATION
###############################################################################


# Question 1 – Chargement des données (5 points)
# Tâche : Charger un fichier CSV nommé donnees_actu.csv depuis votre répertoire de travail, 
# et en afficher les 6 premières lignes.


# Réponse Q1
# ------------------------------------------
# [Complétez le code ci-dessous]

# Charger les données
donnees <- read.csv("____", header = TRUE, sep = ",")

# Aperçu des 6 premières lignes
tete <- ___
print(___)



# Question 2 – Nettoyage des données (10 points)
# Tâche : Supprimez les valeurs manquantes et renommez correctement les colonnes. 
# Affichez la structure du jeu de données.

# Réponse Q2
# ------------------------------------------
library(___)

# Nettoyage
# donnees_net <- donnees %>% [Complétez ici]

print(___)




###############################################################################
# STATISTIQUES DESCRIPTIVES 
###############################################################################

# Question 3 – Statistiques descriptives (10 points)
# Tâche : Calculez les _____ 
# pour deux variables numériques principales (ex : prime et sinistre).

# Réponse Q3
# ------------------------------------------
summary(select(donnees_net, prime, sinistre))




# Question 4 – Visualisation (10 points)
# Tâche : Utilisez ggplot2 pour produire un graphique montrant 
# la relation entre prime et sinistre, en ajoutant une droite de tendance linéaire.

# Réponse Q4
# ------------------------------------------
library(ggplot2)

ggplot(___, aes(x = __, y = __)) +
  geom_point(color = "___") +
  geom_smooth(method = "__", se = FALSE, color = "__") +
  labs(title = "___",
       x = "___",
       y = "___")



# Question 5 – Sélection et filtrage (5 points)
# Tâche : Sélectionnez les observations dont prime est supérieure à la moyenne.

# Réponse Q5
# ------------------------------------------
avg <- __(donnees_net$__, __ = TRUE)
donnees_filtre <- donnees_net %>% ___(__ > avg)

print(___)


# Question 6-a – Transformation et regroupement (10 points)
# Tâche : Regroupez les données par region, puis affichez la moyenne de sinistre.

# Réponse Q6
# ------------------------------------------
res_region <- donnees_net %>% group_by(___) %>% ___
print(res_region)

# Question 6-b
# Diviser les données en deux groupes : un groupe d'entraînement et un groupe de test (70% et 30%)

# Réponse Q6-b
# ------------------------------------------
# Faites en sorte que le code soit reproductible
# et que les données soient divisées de la même manière à chaque fois.

donnees_train <- 
donnees_test <- 

print(dim(donnees_train))
print(dim(donnees_test))

###############################################################################
# MODÉLISATION — RÉGRESSION (GLM-LM)
###############################################################################


# Question 7 – Modélisation linéaire (20 points)
# Tâche : Modélisez le sinistre en fonction de la prime et de la région à l’aide de lm.

# Réponse Q7
# ------------------------------------------
___
summary(mod_lin)

# Question 8 – Prédictions (5 points)
# Tâche : À partir du modèle précédent, prédisez les valeurs de sinistre 
# pour les 10 premières observations.

# Réponse Q8
# ------------------------------------------
pred <- predict(___, )
print(pred)


# Question 9 – Prédiction un assuré (5 points)
# Tâche : Calculer la probabilité de sinistre pour un assuré avec les caractéristiques suivantes :
# - prime = 1000
# - region = "Montréal-nord"
# - age = 30
# - sexe = "M"
# - type_voiture = "promenade"
# - batterie = 16.5 kWh
# - marque = "Tesla"
# - modele = "Y"
# - annee = 2020
# - cout_reparation = 10000
# - cout_materiaux = 5000
# - cout_main_oeuvre = 1000
# - cout_autres = 500
# - cout_total = 16500
# - cout_materiaux = 5000
# - cout_main_oeuvre = 1000

# Réponse Q9
# ------------------------------------------