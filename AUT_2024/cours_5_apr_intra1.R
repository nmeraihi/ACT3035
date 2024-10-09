
?lm

# Ce qu.on veut c'est de inférer les couts (charges) en fct
# de : age+bmi+children+sex+smoker+region
donnees_assurance <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/refs/heads/master/AUT_2024/insurance.csv")

ggplot(donnees_assurance, aes(x=smoker,
                              y=charges, 
                              fill = smoker))+
  geom_boxplot()+
  labs(title="Coût assurance par statut fumeur ou non",
       x="Fumeurs",
       y="Coûts")

ggplot(donnees_assurance, aes(x=bmi, 
                              y=charges,
                              color = smoker))+
  geom_point()+
  geom_smooth(method="lm")

library(dplyr)
# dplyr::arrange()
calculate_mean_charges <- function( data, group_var){
  data %>% 
    group_by({{group_var}}) %>% 
    summarize(mean_charges=mean(charges)) %>% 
    arrange(desc(mean_charges))
}

calculate_mean_charges(donnees_assurance, smoker)
calculate_mean_charges(donnees_assurance, sex)

model_lm <- lm(charges~age+bmi+children+sex+smoker+region,
               data=donnees_assurance)
summary(model_lm)

# quelle est le coût pour une personne agée de 34 ayant 
# un bmi de 30 et 2 enfants, femme ne fumme pas et habite
# regionsouthwest   


cout=-11938.5+256.9*(34)+339.2*(30)+475.5*(2)-131.3*(0)+23848.5*(0)-960.0*(1)
cout

install.packages("caTools")
library(caTools)
set.seed(3035)
split <- sample.split(donnees_assurance$charges, SplitRatio=.7)
training_set <- subset(donnees_assurance, split==T)
test_set <- subset(donnees_assurance, split==F)
dim(donnees_assurance)
dim(training_set)
dim(test_set)


# construire un model sur les données entaînement
train_model <- lm(charges~age+bmi+children+sex+smoker+region, 
                  data=training_set)
summary(train_model)
?predict
prediction <- predict(train_model, test_set)

new_test_compare <- test_set
new_test_compare$predits <- prediction

install.packages("Metrics")
library(Metrics)

rmse_value <- rmse(test_set$charges, prediction)
print(rmse_value)

# Céer une fonction qui vous permet de voir l'impact 
# du changement que vous apportez au model. 
# En utilisant le RMSE, juste voir si cette valeur
# augmente ou diminue.

train_model_2 <- lm(charges~age+bmi+children+smoker, data=training_set)
prediction_2 <- predict(train_model_2, test_set)
rmse_value <- rmse(test_set$charges, prediction_2)
print(rmse_value)

# En uilisant la fonction predict
# Prédire la valeur "Charges" pour une homme de 30 ans, en surpods (bmi=35)
# non fumeur et père de deux enfants dans le nord-est avec les deux
#  modèles

predict(train_model, data.frame(age=30, 
                                sex="male",
                                bmi=35,
                                smoker="no", 
                                children=2,
                                region="northeast"))

predict(train_model_2, data.frame(age=30, 
                                  bmi=35,
                                  smoker="no", 
                                  children=2))



new_train_set <- training_set
new_train_set$age2=new_train_set$age**2


train_model_3 <- lm(charges~age+bmi+children+smoker+age2, data=new_train_set)

# predict(train_model_3, data.frame(age=30, 
#                                   bmi=35,
#                                   age2=age**2,
#                                   smoker="no", 
#                                   children=2))









