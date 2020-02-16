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


# tracer le plan: 

model_lm <- lm(Sales ~ Radio + TV, data=adv)
x_grid <- seq(from=min(adv$Radio), to=max(adv$Radio), length=100)
y_grid <- seq(from=min(adv$TV), to=max(adv$TV), length=200)
z_grid <- expand.grid(x_grid, y_grid) %>%
  tibble::as_tibble() %>%
  rename(
    x_grid = Var1,
    y_grid = Var2
  ) %>%
  mutate(z = coef(model_lm)[1] + coef(model_lm)[2]*x_grid + coef(model_lm)[3]*y_grid) %>%
  .[["z"]] %>%
  matrix(nrow=length(x_grid)) %>%
  t()

plot_ly(showscale=FALSE) %>%
  add_markers(
    x = adv$Radio,
    y = adv$TV,
    z = adv$Sales,
    hoverinfo = 'text',
    text = ~paste("x1 - Radio: ", adv$Radio, "</br> x2 - TV: ", 
                  adv$TV, "</br> y - Vente: ", adv$Sales)
  ) %>% 
  layout(
    scene = list(
      xaxis = list(title = "x1 - Radio"),
      yaxis = list(title = "x2 - TV ($)"),
      zaxis = list(title = "y - Vente ($)")
    )
  ) %>% 
  add_surface(
    x = x_grid,
    y = y_grid,
    z = z_grid
  )


# sélection de variables
library(leaps)
forward <- regsubsets(Sales~., adv, nvmax=7, method = "forward")
backward <- regsubsets(Sales~., adv, nvmax=7, method = "backward")

which.min(summary(forward)$cp)
coef(forward, 2)

which.min(summary(backward)$cp)
coef(backward, 2)

Credit <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/islr/Credit.csv")
Credit <- Credit[-1]
head(Credit)

Credit$Gender <- as.factor(Credit$Gender)
Credit$Student <- as.factor(Credit$Student)
Credit$Married <- as.factor(Credit$Married)
Credit$Ethnicity <- as.factor(Credit$Ethnicity)

library(GGally)
ggpairs(Credit, 1:5)

fit.lm_gender <- lm(Balance~Gender, data=Credit)
summary(fit.lm_gender)


fit.lm_eth <- lm(Balance~Ethnicity, data=Credit)
summary(fit.lm_eth)





