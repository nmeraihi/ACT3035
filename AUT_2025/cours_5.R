# Classification des réclamation assurance-vie
# setwd("C:/Users/meraihi_n/Desktop/ACT3035A25")
# library(tidyverse)
# install.packages("caret")
# library(caret)

# 1) créer le jeu de données
set.seed(3035)

n <- 1000
donnees <- tibble(
  age = runif(n, 20, 70),
  imc = rnorm(n=n, mean = 25,sd = 5),
  tension_arterielle=rnorm(n, 120, 15),
  cholesterol=rnorm(n, 200, 30), 
  fumeur=sample(c("oui", "non"), n, replace=T,prob=c(.2, .8)),
  antecedent_familiaux=sample(c("oui", "non"), n, replace=T),
  frequence_exercices=sample(c("faible", "moyenne", "elevee"), n, replace=T)
)
# Avec les donnees plus haut, nous avons 1000 polices d'assurance-vie 

donnees <- donnees %>% 
  mutate(
    proba_reclamation=0.01+
      .001*(age-20)+
      .02*(imc-25)+
      .002*(tension_arterielle-120)+
      .001*(cholesterol-200)+
      .1*(fumeur=="oui")+
      .05*(antecedent_familiaux=="oui")+
      -.05*(frequence_exercices=="elevee"),
    reclamation=rbinom(n, 1, proba_reclamation)
    ) %>% select(-proba_reclamation)

?rbinom

dim(donnees)
# On remarque que nous avons 7 variables explicatives
# et une variable réponse qu'on essaie de prédire
# On remarque aussi que la variable proba_reclamation contient
# des valeurs en dehors des bornes [0,1], on va laisser
# cette question en dehors du cours ACT3035

# 2) Analyse exploratoire des données

# donnees %>% 
#   select(where(is.numeric)) %>% 
#   cor() %>% 
#   heatmap(Rowv = NA, Colv = NA)


# ça nous montre une corrélation entre IMC-AGE-tension art
# Continuons l'analyse exploratoire

# Regardons la variable réponse (celle que nous allons estimer)

ggplot(donnees, aes(x=factor(reclamation)))+geom_bar()

ggplot(donnees, aes(x=age, y=imc, color=factor(reclamation)))+
  geom_point()

ggplot(donnees, aes(x=cholesterol, y=imc, color=factor(reclamation)))+
  geom_point()

ggplot(donnees, aes(x=age, y=cholesterol, color=factor(reclamation)))+
  geom_point()

# Depuis les nuages de points précédents, il n'est pas possible
# de tirer des conclusions sur les tendances entre variables

# 3) on va faire un prétraitement des données (préaparation
# à construire un modèle de régression logistique)

donnees <- donnees %>% 
  mutate(across(where(is.character), as.factor))

X <- donnees %>% select(-reclamation)
y <- donnees$reclamation

indice_repartition <- sample(1:n, size=floor(.8*n))
indice_repartition
X_train <- X[indice_repartition,]
# length(indice_repartition)
# dim(X)
# dim(X_train)
X_test <- X[-indice_repartition,]
y_train <- y[indice_repartition]
y_test <- y[-indice_repartition]

print(paste("Dimension des données train: ", 
            paste(dim(X_train), collapse = " x ")))
print(paste("Dimension des données train: ", 
            paste(dim(X_test), collapse = " x ")))

# 4) Ajsutement du modèle de regression logistique

modele_regLog <- glm(reclamation ~ .,
                     data = cbind(X_train, 
                                  reclamation=y_train),
                     family = binomial()
                     )

summary(modele_regLog)
y_pred <- predict(modele_regLog, newdata = X_test, 
                  type = "response")
y_pred_class <- ifelse(y_pred, 1, 0)
y_pred_class
?glm


pr <- function(age,
               imc,
               tension_arterielle,
               cholesterol,
               fumeur,
               antecedent_familiaux,
               frequence_exercices){
  nouvelles_donnes <- tibble(
    age=age,
    imc=imc,
    tension_arterielle=tension_arterielle,
    cholesterol=cholesterol,
    fumeur=factor(fumeur, levels = levels(X_train$fumeur)),
    antecedent_familiaux=factor(antecedent_familiaux, levels = levels(X_train$antecedent_familiaux)),
    frequence_exercices=factor(frequence_exercices, levels = levels(X_train$frequence_exercices))
  )
  predict(modele_regLog, newdata = nouvelles_donnes, type="response")
}
prob <- pr(age = 35, 25, 130, 220, "non", "oui", "moyenne")
prob











