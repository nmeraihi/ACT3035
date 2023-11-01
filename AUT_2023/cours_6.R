mat1 <- cbind(c(1, -1/5), c(-1/3,1))
mat1
mat1.inv <- solve(mat1)
mat.id <- mat1.inv %*% mat1
mat.id

b <- c(1,2)
x <- solve(mat1, b)
x


insurance <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/insurance.csv")
str(insurance)
hist(insurance$charges)

mat_cor <- cor(insurance[c("age", 
                           "bmi", 
                           "children", 
                           "charges")])

library(ggcorrplot)

ggcorrplot(mat_cor, 
           type="lower", lab=T)

library(psych)

pairs.panels(insurance[c("age", 
                           "bmi", 
                           "children", 
                           "charges")])


ins_model <- lm(charges~age+children+bmi+sex+smoker+region, 
   data = insurance)
ins_model <- lm(charges~., 
                data = insurance)


str(insurance)

summary(ins_model)

insurance$age2 <- insurance$age**2
head(insurance)

insurance$bmi30 <- ifelse(insurance$bmi >=30, 1, 0)

ins_model2 <- lm(charges~age+age2+children+bmi+sex+bmi30*smoker+region, 
                 data=insurance)

summary(ins_model2)

insurance$pred <- predict(ins_model2, insurance)
cor(insurance$pred, insurance$charges)
plot(insurance$pred, insurance$charges)
abline(a=0, b=1, col="red", lwd=3, lty=2)

# Quelle est la prime d'assurance d'un homme de 30 ans
# en surpoids, non fumeur, et père de deux enfants 
# habitant dans la région du nord-est
# Y_chapeau_Model ~ 6762.33
df_homme <- data.frame(age=30,
                       age2=30**2,
                       children=2,
                       bmi=30,
                       sex="male",
                       bmi30=1,
                       smoker="no",
                       region="northeast")
colnames(insurance)
predict(ins_model2, df_homme)
# Y_chapeau_Model2 ~ 5973

# Quelle est la prime d'assurance d'une femme de 30 ans
# en surpoids, non fumeur, et père de deux enfants 
# habitant dans la région du nord-est
# Y_chapeau_Model2 ~ 6470.54


df_femme <- data.frame(age=30,
                       age2=30**2,
                       children=2,
                       bmi=30,
                       sex="female",
                       bmi30=1,
                       smoker="no",
                       region="northeast")

predict(ins_model2, df_femme)
6450



insurance$pred

install.packages("ISLR")
library(ISLR)

pairs(Smarket, col=Smarket$Direction)
head(Smarket)
glm.fit <- glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
               data=Smarket,
               family = binomial)
summary(glm.fit)

glm.prob=predict(glm.fit, 
                 type = "response")


glm.prob[1:5]

max(glm.prob)
min(glm.prob)

glm.pred=ifelse(glm.prob>.5, "Up", "Down")

table(glm.pred, Smarket$Direction)
