install.packages("ISLR")
library(ISLR)
?ISLR::Smarket
View(Smarket)
pairs(Smarket, col=Smarket$Direction)
model_1=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5, data=Smarket,
            family=binomial)
?glm
summary(model_1)


glm.pred=predict(model_1, type="response")
glm.pred[1:5]
table(Smarket$Direction)

glm.pred_up_down=ifelse(glm.pred>.5, "Up", "Down")
# Direction$glm.pred_up_down = glm.pred_up_down

table(glm.pred_up_down, Smarket$Direction)

# Exemple 

library(tidyverse)
library(caret)
library(pROC)
# Créer 1000 ovservations 
# - age entre 20 et 70
# - imc 25 +-5
# - tension art 20 +-15
# - Cholest 200 +- 30
# - Fumeur oui ou non (prob 20% fumeurs)
# - antécedents familiaux oui non 
# - activité sport "faible", "moyen", "elevée"

# hint: runif, rnorm , sample

n <- 1000
données <- tibble(
  age=runif(n, 20, 70),
  imc=rnorm(n, 25, 5),
  tension_art= rnorm(n,120, 15),
  cholesterol=rnorm(n ,200, 30),
  fumeur=sample(c("oui", "non"), n, replace=T, prob=c(.2, .8)),
  antcedent_familiaux=sample(c("oui", "non"), n, replace=T),
  frequence_exercices=sample(c("faible", "moyenne", "elevee"), n, replace=T)
)

données <- données %>% 
  mutate(
    prob_reclamation=.01+
      .001*(age-20)+
      .02*(imc-25)+
      .002*(tension_art-120)+
      .001*(cholesterol-200)+
      .1*(fumeur=="oui")+
      .05*(antcedent_familiaux=="oui")+
      .05*(frequence_exercices=="faible"),
    reclamation=rbinom(n,1,prob_reclamation)
  ) %>% 
  select(-prob_reclamation)

head(données)

dim(données)

summary(données)

table(données$fumeur)
table(données$antcedent_familiaux)
table(données$frequence_exercices)

View(données)

factor(données$reclamation)
# ggplot(data=données, aes(x=factor(reclamation)))+
#   geom_bar()

données_encodée <- données %>% 
  mutate(across(is.character, as.factor))

View(données_encodée)
X <- données_encodée %>% select(-reclamation)
y <- données_encodée$reclamation

indice_partition <- sample(1:length(y), size = floor(.8*length(y)))
X_train <- X[indice_partition,]
X_test <- X[-indice_partition,]

y_train <- y[indice_partition]
y_test <- y[-indice_partition]


modele_rl <- glm(reclamation~., 
                 data=cbind(X_train, reclamation=y_train),
                 family = binomial())


y_predict <- predict(modele_rl, newdata = X_test, type = "response")
y_predict_class <- ifelse(y_predict>.5, 1. ,0)


conf_matrice <- confusionMatrix(factor(y_predict_class), factor(y_test))

conf_matrice

coube_roc <- roc(y_test, y_predict)
# plot(coube_roc)
auc(coube_roc)
y_test
y_predict












