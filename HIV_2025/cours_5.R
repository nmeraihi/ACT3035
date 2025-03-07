data <- read.table("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/01a_data.txt",header = T)
View(data)
estime_beta <- function(y,x){
  x <- as.matrix(x)
  y <- as.matrix(y)
  x=cbind(intercept=1, x)
  beta_chapeau <- solve(t(x) %*% x) %*% t(x) %*%y
  print(beta_chapeau)
}

x=data$Height
y=data$Weight
estime_beta(y=y, x=x)

# qqun avec une grandeur de 72
y=-154.224210+ 4.829768*72
y

x=data$Height
y=data$Weight
modele_lineaire <- lm(y~x)
modele_lineaire

# SI jevous demande comme question facile
# Quelle est l'estimation du poids d'un joueur
# mesurant 72"

y_hat=modele_lineaire$coefficients[1]+modele_lineaire$coefficients[2]*72
y_hat

# Exemple insurance:
insurance <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/insurance.csv")
View(insurance)

library(tidyverse)

ggplot(insurance, aes(x=smoker, y=charges, fill = smoker))+
  geom_boxplot()


ggplot(insurance, aes(x=bmi, y=charges, colour = smoker))+
  geom_point()+
  geom_smooth(method = "lm")


calculate_moyenne_cout <- function(data, group){
  data %>% 
    group_by({{group}}) %>% 
    summarise(moyenne_cout=mean(charges)) %>% 
    arrange(desc(moyenne_cout))
}
calculate_moyenne_cout(insurance, smoker)
calculate_moyenne_cout(insurance, sex)

model_lm <- lm(charges~smoker+age+children+sex+region,
               data = insurance)

summary(model_lm)

install.packages("caTools")
library(caTools)
set.seed(3035)
split <- sample.split(insurance$charges, SplitRatio = .7)
training_set <- subset(insurance, split==T)
test_set <- subset(insurance, split==F)
dim(training_set)
dim(test_set)
402+936
dim(insurance)

train_model <- lm(charges~smoker+age+children+sex+region,
                  data = training_set)
summary(train_model)

y_chapeau <- predict(train_model, test_set)
test_set$y_chapeau <- y_chapeau


View(test_set)












