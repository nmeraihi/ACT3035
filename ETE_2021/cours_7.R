require(ISLR)
?Smarket
glm.fit <- glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume, 
               family = binomial, data=Smarket)
?glm
summary(glm.fit)

glm.fit.predic <- predict(glm.fit, type = "response")
glm.fit.predic[1:5]
?predict  
glm.pred_up_down <- ifelse(glm.fit.predic>.5, "up", "down")
glm.pred_up_down[1:5]
?attach
attach(Smarket)
table(glm.pred_up_down, Direction)
