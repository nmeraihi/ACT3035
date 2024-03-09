m10 <- matrix(1:4, nrow = 2)
m10
?solve
solve(m10)
m10%*%solve(m10)
diag(4)
s1<- diag(c(2,4,6,8))
s2 <- c(1,2,3,4)
solve(s1, s2)

mat1 <- cbind(c(1,-1/2), c(-1/3, 1))
mat1
mat1.inv <- solve(mat1)
mat1.inv
mat1.inv %*% mat1

data <- read.table("https://raw.githubusercontent.com/nmeraihi/data/master/01a_data.txt", header = T)
head(data)
x <- data$Height
y <- data$Weight

ajustement <- lm(y~x)
ajustement$coefficients
ajustement

reg <- function(y,x){
  x <- as.matrix(x)
  x <- cbind(Intercept=1, x)
  b <- solve(t(x)%*%x)%*%t(x)%*%y
  colnames(b) <- "beta_chapeau"
  print(b)
}
ajustement

reg(y=data$Weight,data$Height)

# regression lin multiple

insurance <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/insurance.csv")

View(insurance)

summary(insurance$charges)

hist(insurance$charges)

mat_corr <- cor(insurance[c("age","bmi" ,"children","charges")])
mat_corr

library(psych)
pairs.panels(insurance[c("age","bmi" ,"children","charges")])

ins_model <- lm(charges~age+children+bmi+sex+smoker+region,
                data=insurance)
summary(ins_model)

ins_model <- lm(charges~.,
                data=insurance)
insurance$age2 <- insurance$age**2

pairs.panels(insurance[c("age", "age2","bmi" ,"children","charges")])

insurance$bmi30 <- ifelse(insurance$bmi >=30, 1, 0)

ins_model2 <- lm(charges~age+age2+children+bmi+sex+bmi30*smoker+region,
                 data=insurance)
summary(ins_model2)


insurance$pred <- predict(ins_model2, insurance)

plot(insurance$pred, insurance$charges)
abline(a=0, b=1, col="red", lwd=3, lty=2)

# Quelle la prime d'assurance d'un homme, 30 ans, bmi >30, non-fumeur,
# deux enfants habitant dan sle nord-est


predict(ins_model2, data.frame(age=30, 
                               age2=30**2, 
                               children=2, 
                               bmi=30, 
                               sex="male",
                               bmi30=1, 
                               smoker="no",
                               region="northeast"))


predict(ins_model, data.frame(age=30, 
                               children=2, 
                               bmi=30, 
                               sex="male",
                               smoker="no",
                               region="northeast"))




smarket <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/islr/Smarket.csv")

View(smarket)

glm.fit=glm(Direction~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
            data = smarket,
            family = binomial)

smarket$Direction2 <- ifelse(smarket$Direction =="Up", 1, 0)


glm.fit=glm(Direction2~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
            data = smarket,
            family = binomial)

summary(glm.fit)

glm_pred_vec <- predict(glm.fit, type = "response")
glm_pred_vec


smarket$pred <-glm_pred_vec 

pred_up_down <- ifelse(smarket$pred >.5, "Up", "Down")

smarket$pred_up_down <-pred_up_down 

table(smarket$pred_up_down, smarket$Direction)








