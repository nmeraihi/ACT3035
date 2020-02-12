adv <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/islr/Advertising.csv")
head(adv)
head(adv[-1])
adv <- adv[-1]
library(ggplot2)

ggplot(data=adv, aes(Radio, Sales))+
  geom_point()

ggplot(data=adv, aes(Newspaper, Sales))+
  geom_point()

ggplot(data=adv, aes(TV, Sales))+
  geom_point()+
  geom_smooth(method = "lm", se=F)




# J'essaie d'estimer les ventes comme suit:
# J'ajuste (fit) un modèle linéaire (lm)
# Ventes ~ B_0 + B_1*TV

fit.lm <- lm(Sales~TV, data=adv)
summary(fit.lm)

fit.lm$coefficients


fit.lm_m <- lm(Sales~TV+Radio+Newspaper, data=adv)
summary(fit.lm_m)

fit.lm_m$coefficients

library(plotly)
plot_ly(showscale=F) %>% 
  add_markers(
    x=adv$Radio,
    y=adv$TV,
    z=adv$Sales,
    hoverinfo="text"
  ) %>% 
  layout(
    scene=list(
      xaxis=list(title="x1 Radio"),
      yaxis=list(title="x2 TV"),
      zaxis=list(title="y Ventes")
    )
  )







