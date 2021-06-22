adv <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/islr/Advertising.csv")
head(adv)

fit.lm <- lm(Sales ~ TV , data=adv)
# regression.gbm
fit.lm

7.03259+ 0.04754 *150

library(ggplot2)
ggplot(adv, aes(TV, Sales)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

summary(fit.lm)
fit.lm$coefficients
head(adv)

fit.lm[[2]]

fit.lm <- lm(Sales ~ TV + Radio + Newspaper, data=adv)
fit.lm$coefficients

?concat

?is.nan
c("a", 2, 3 )



if (condition) {
  
}






?matrix
