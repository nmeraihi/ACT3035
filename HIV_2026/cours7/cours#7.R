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





















