m <- matrix(1:4, nrow=2)
m
solve(m)
m%*%solve(m)

reg <- function(y,x){
  x <- as.matrix(x)
  x <- cbind(Intercept=1, x)
  b <- solve(t(x)%*%x) %*% t(x) %*% y
  colnames(b) <- "estime"
  print(b)
}
data <- read.table("https://raw.githubusercontent.com/nmeraihi/ACT3035/master/AUT_2021/01a_data.txt",
                   header = T)
head(data)

x <- data$Height
y <- data$Weight
X <- cbind(1,x)
head(X)

b <- solve(t(X)%*%X) %*% t(X) %*% y
b

reg(y,x)

ajust <- lm(y~x)
ajust

insurance <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/master/AUT_2021/insurance.csv",
                      stringsAsFactors = T)
str(insurance)

summary(insurance$expenses)

library(ggplot2)

ggplot(insurance, aes(x=expenses))+
  geom_histogram(alpha=.5)
table(insurance$region)


colnames(insurance)

mat_cor <- cor(insurance[c("age","bmi","children","expenses")])
mat_cor
# install.packages("ggcorrplot")
library(ggcorrplot)
ggcorrplot(mat_cor,
           type="lower",
           lab=T)

# install.packages("psych")
library(psych)
pairs.panels(insurance[c("age",
                         "bmi",
                         "children",
                         "expenses")])

model_reg_1 <- lm(expenses ~ age+children+bmi+smoker+region, data=insurance)
model_reg_1 <- lm(expenses ~ ., data=insurance)
summary(model_reg_1)

insurance$age2 <- insurance$age**2
head(insurance)
insurance$bmi30 <- ifelse(insurance$bmi>=30, 1,0) 


model_reg_2 <- lm(expenses ~ age+children+bmi+smoker+sex+region+age2+bmi30*smoker, data=insurance)
summary(model_reg_2)

insurance$pred <- predict(model_reg_2, insurance)
library(ggplot2)


ggplot(data=insurance, mapping=aes(x=pred, y=expenses))+
  geom_point()+
  geom_smooth(method = "lm", colour="green", se=F)

head(insurance)


predict(model_reg_2, data.frame(age=30,
                                sex="male",
                                bmi=30,
                                smoker="no",
                                bmi30=1,
                                children=2,
                                age2=30**2,
                                region="northeast"))

predict(model_reg_2, data.frame(age=30,
                                sex="female",
                                bmi=30,
                                smoker="no",
                                bmi30=1,
                                children=2,
                                age2=30**2,
                                region="northeast"))







