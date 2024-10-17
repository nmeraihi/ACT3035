data <- read.table("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/01a_data.txt", 
                   as.is = T, header = T)
View(data)
# prédire le poids en fonction de la taille du joeur<
# y est le poids et x ce serait la taille
reg <- function(y, x){
  x <- as.matrix(x)
  x <- cbind(intercept=1, x)
  beta_chap <- solve(t(x) %*% x) %*% t(x) %*%y
  colnames(beta_chap) <- "betas estimés"
  return(beta_chap)
}

x <- data$Height
y <- data$Weight

reg(y,x)
?lm

lm(y~x)


# Exemple des voles en retard

data1 <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/refs/heads/master/AUT_2024/flight_delay.csv",
                  header = T, 
                  sep = ",")

View(data1)
str(data1)
sum(is.na(data1))

summary(data1$Arr_Delay)

plot(data1$Arr_Delay, data1$Number_of_flights)

corr <- cor.test(data1$Arr_Delay, 
                 data1$Number_of_flights,
                 method = "pearson")
?cor.test
corr

plot(data1$Arr_Delay, data1$Security_o)
cor.test(data1$Arr_Delay, 
         data1$Security_o,
         method = "pearson")

# Pour les deux variables ci-dessous répéter le plot et la corr
# 3)Suuport_...
# 4) Airport_distance


plot(data1$Arr_Delay, data1$Support_Crew_Available)
cor.test(data1$Arr_Delay, 
         data1$Support_Crew_Available,
         method = "pearson")


plot(data1$Arr_Delay, data1$Airport_Distance)
cor.test(data1$Arr_Delay, 
         data1$Airport_Distance,
         method = "pearson")

View(data1)

data1 <- data1[-c(1)]

# 1)
# On va diviser les données en deux parties 
# 70% train_data_set
# 30% test_data_set

library(caTools)
set.seed(3035)
sample <- sample.split(data1$Arr_Delay, SplitRatio = .7)
train_data <- subset(data1, sample==T)
test_data <- subset(data1, sample==F)

# 2)
# Faire un modèle lm ave toutes les variables

model_rl <- lm(Arr_Delay~., data = train_data)
summary(model_rl)

# Refaire un modèle avec 
# uniquement les variable significatives

colnames(data1)
t <- colnames(data1)
model_rl <- lm(Arr_Delay~Airport_Distance+Number_of_flights+Weather+Support_Crew_Available+Baggage_loading_time+Late_Arrival_o, data = train_data)
summary(model_rl)

# Prédire les retards en utilisant le nouveau
# modèle sur les data_train

predicted_train_values <- model_rl$fitted.values
predicted_train_values


residuals_train <- model_rl$residuals
residuals_train

# Prédire les retards sur les données test

predicted_test <- predict(model_rl, newdata = test_data)
predicted_test

# Tracer les deux courbes de données 
# illustant test_data vs predicted_test
test_data <- data.frame(test_data)
View(test_data)
colnames(test_data) <- "y"

predicted_test <- data.frame(predicted_test)
View(predicted_test)
colnames(predicted_test) <- "y_hat"


# ???
# library(ggplot2)
# str(test_data)
# ggplot()+
#   geom_line(data = test_data, aes(x=index,y=test_data$y))



plot(test_data$y, col="red", type="l")
lines(predicted_test$y_hat, col="blue", type="l")





