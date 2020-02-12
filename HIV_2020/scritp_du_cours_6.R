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
  tbl_df() %>%
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









