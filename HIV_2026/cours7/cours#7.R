## Cours #7 ----

### Exemple #1 Assurance médicales ----

insurance_data <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/insurance.csv")
head(insurance_data, 20)


#### Analyse exploratoire ----

dim(insurance_data)

str(insurance_data)

# valeur manquante? 
sum(is.na(insurance_data))==0


# Variable dépendant Y 
summary(insurance_data$charges)

quantile(insurance_data$charges, seq(0,1,0.05))

hist(insurance_data$charges)


# Variable indépendante/explicative 

table(insurance_data$region)
table(insurance_data$sex)
table(insurance_data$children)

summary(insurance_data$age)
summary(insurance_data$bmi)

table(insurance_data$smoker)

# Corrélation entre variable  


mat_corr <- cor(insurance_data[c("age", "bmi", "children", "charges")])

ggcorrplot(mat_corr, lab = TRUE, type = "lower")


# Graphique Nuage de points 

plot(insurance_data$age, insurance_data$charges)

plot(insurance_data$bmi, insurance_data$charges)

plot(insurance_data$children, insurance_data$charges)

insurance_data_mean_children <- insurance_data %>% 
  group_by(children) %>% 
  summarise(mean_charge = mean(charges))


ggplot(insurance_data_mean_children, mapping = aes(x =children,  y = mean_charge))+
  geom_bar(stat = "identity")


#### Modélisation ----

insurance_model <- lm(charges~ age + children + bmi + sex + smoker + region, data = insurance_data)

#Meme chose , . pour toutes les variables
insurance_model <- lm(charges~., data = insurance_data)

class(insurance_model)

summary(insurance_model)


# Regarder en profondeur l'age vs les charges 

insurance_data_mean_age <- insurance_data %>% 
  group_by(age) %>% 
  summarise(mean_charge = mean(charges))



ggplot(insurance_data_mean_age, mapping = aes(x =age,  y = mean_charge))+
  geom_histogram(stat = "identity")


#Signal non linéaire 

insurance_data$age2 <- insurance_data$age**2

str(insurance_data)


#Nouveau model 

ins_model_2 <- lm(charges~., data=insurance_data)

summary(ins_model_2)

ins_model_3 <- lm(charges~.-age, data = insurance_data)

summary(ins_model_3)

# Jeu d'entrainement 
ins_model_3$model %>% View()

#Coefficient sous forme de vecteur 
ins_model_3$coefficients

#Erreur du model (prediction - observation)
ins_model_3$residuals

#Prediction sur notre jeu de donnée 
ins_model_3$fitted.values

#Niveaux variables explicatives catégorielles
ins_model_3$xlevels$region
ins_model_3$xlevels$sex


#Ajout de variable dans le modele 

plot(insurance_data$bmi, insurance_data$charges)


insurance_data$bmi30 <- ifelse(insurance_data$bmi>=30, 1, 0)

View(insurance_data)

ins_model_4 <- lm(charges~.-age, data = insurance_data)
summary(ins_model_4)


#Interaction 


ggplot(data = insurance_data, mapping = aes(x=bmi, y = charges))+
  geom_point(aes(colour = smoker))


plot(insurance_data$bmi, insurance_data$charges, col = factor(insurance_data$smoker))
legend("topright", legend = levels(factor(insurance_data$smoker)), col = c(1,2), pch = 1)


ins_model5 <- lm(charges~.-age-bmi30+bmi30*smoker, data = insurance_data)
summary(ins_model5)



#### Prediction ---- 

predict(ins_model_2, 
        data.frame(age = 30, 
                   age2 = 30^2, 
                   children =2, 
                   bmi = 30, 
                   sex = "male", 
                   bmi30=1, 
                   smoker = "no", 
                   region = "northeast"))

predict(ins_model5, 
        data.frame(age = 30, 
                   age2 = 30^2, 
                   children = 2, 
                   bmi = 30, 
                   sex = "male", 
                   bmi30=1, 
                   smoker = "no", 
                   region = "northeast"))


predict(ins_model5, 
        data.frame(age = 30, 
                   age2 = 30^2, 
                   children =2, 
                   bmi = 30, 
                   sex = "female", 
                   bmi30=1, 
                   smoker = "no", 
                   region = "northeast"))


cor(insurance_data$prediction, insurance_data$charges)


plot(insurance_data$prediction, insurance_data$charges, col = factor(insurance_data$region))
plot(insurance_data$prediction, insurance_data$charges, col = factor(insurance_data$smoker))


abline(a=0, b=1, col="red", lwd = 2)



#Erreur

insurance_data$erreur <- insurance_data$charges -insurance_data$prediction 

mean(insurance_data$erreur)

summary(insurance_data$erreur)

### Exemple #2 Retard d'avion ----

data_flight <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/refs/heads/master/AUT_2024/flight_delay.csv")
head(data_flight)
tail(data_flight)


dim(data_flight)


str(data_flight)

names(data_flight)

#### Analyse Exploratoire ---- 


summary(data_flight$Arr_Delay)
hist(data_flight$Arr_Delay)

sum(is.na(data_flight))==0


#correlation entre variable, Test person

corr <- cor.test(data_flight$Arr_Delay, data_flight$Number_of_flights, method = "pearson")
corr


# Output Plusieurs graphiques

par(mfrow = c(2,2))

plot(data_flight$Number_of_flights, data_flight$Arr_Delay)

plot(data_flight$Security_o, data_flight$Arr_Delay)

plot(data_flight$Support_Crew_Available, data_flight$Arr_Delay)

plot(data_flight$Airport_Distance, data_flight$Arr_Delay)


#Variable charactere 

table(data_flight$Carrier)
length(unique(data_flight$Carrier))

data_flight_clean <- data_flight %>% select(-Carrier)


### Split jeu de données

set.seed(3035)


sample <- sample(1:nrow(data_flight_clean), nrow(data_flight_clean) * 0.8, replace = FALSE)
length(sample)

train_data <- data_flight_clean[sample,]
test_data <- data_flight_clean[-sample,]

### Modélisation ---- 


model <- lm(Arr_Delay~., data = train_data)

summary(model)

model_2 <- lm(Arr_Delay~.-Cleaning_o-Security_o, data = train_data)
summary(model_2)

### Prediction ---- 

train_data$prediction_1 <- predict(model, train_data)
test_data$prediction_1 <- predict(model, test_data)

train_data$prediction_2 <- predict(model_2, train_data)
test_data$prediction_2 <- predict(model_2, test_data)

#Erreur
train_data$erreur_1 <- train_data$Arr_Delay - train_data$prediction_1
test_data$erreur_1 <- test_data$Arr_Delay - test_data$prediction_1

train_data$erreur_2 <- train_data$Arr_Delay - train_data$prediction_2
test_data$erreur_2 <- test_data$Arr_Delay - test_data$prediction_2


summary(train_data$erreur_1)

#MSE 

sum(train_data$erreur_1^2)/nrow(train_data)
sum(test_data$erreur_1^2)/nrow(test_data)


sum(train_data$erreur_2^2)/nrow(train_data)
sum(test_data$erreur_2^2)/nrow(test_data)


ggplot(test_data, mapping = aes(x=erreur_2))+
  geom_density()


ggplot(test_data, mapping = aes(x=Support_Crew_Available, y=erreur_2))+
  geom_point()

ggplot(test_data, mapping = aes(x=Cleaning_o, y=erreur_2))+
  geom_point()

ggplot(test_data, mapping = aes(x=prediction_2, y=Arr_Delay))+
  geom_point()


ggplot(test_data, mapping = aes(x=prediction_2, y=erreur_2))+
  geom_point()






















