# install.packages("ggplot2")
library(ggplot2)
head(mpg)
?mpg
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))+
  geom_smooth(mapping = aes(x=displ, y=hwy))

ggplot(data=mpg, mapping = aes(x=displ, y=hwy))+
  geom_point()+
  geom_smooth()

ggplot(data=mpg, mapping = aes(x=displ, y=hwy))+
  geom_point(aes(color=class))+
  geom_smooth()

?aes

set.seed(123)
data <- data.frame(cond=factor(rep(c("A", "B"), each=200)), 
                   rating=c(rnorm(200), rnorm(200, mean=2)))

# ggplot(data=data)+
#   geom_histogram(aes(x=rating), binwidth = .5)

moyenne_A <- mean(data$rating[data$cond=="A"])
moyenne_B <- mean(data$rating[data$cond=="B"])


ggplot(data=data, aes(x=rating, fill=cond))+
  geom_histogram(aes(y=..density..),binwidth = .5, position = "identity", alpha=.5)+
  geom_vline(aes(xintercept=moyenne_A))+
  geom_vline(aes(xintercept=moyenne_B))+
  geom_density(aes(colour=cond, alpha=.2))

ggplot(data=data, aes(x=cond, y=rating, fill=cond))+
  geom_boxplot()

ggplot(data=data, aes(x=cond, y=rating, fill=cond))+
  geom_boxplot() +coord_flip()

donnees <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/stocks_correlation.csv")[,2:9]
mat_corr <- cor(donnees)

library(ggcorrplot)
ggcorrplot(mat_corr, type="lower")

# install.packages("tidyverse")

ggcorrplot(mat_corr, type="lower", lab=T)

adv <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/islr/Advertising.csv")
head(adv)

fit.lm <- lm(Sales~TV, data=adv)
fit.lm

# vente=7.003+.04754xTV

summary(fit.lm)

ggplot(adv, aes(TV, Sales))+
  geom_point()+
  geom_smooth(method="lm")

fit.lm3 <- lm(Sales~TV+Radio+Newspaper, data=adv)
summary(fit.lm3)


# install.packages("plotly")
library(plotly)
plot_ly(showscale=FALSE) %>%
  add_markers(
    x = adv$Radio,
    y = adv$TV,
    z = adv$Sales,
    hoverinfo = 'text',
    text = ~paste("x1 - Radio: ", adv$Radio, 
                  "</br> x2 - TV: ", adv$TV, 
                  "</br> y - Ventes: ", adv$Sales)
  ) %>% 
  layout(
    scene = list(
      xaxis = list(title = "x1 - Radio"),
      yaxis = list(title = "x2 - TV ($)"),
      zaxis = list(title = "y - Vente ($)")
    )
  )


library(dplyr)
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

