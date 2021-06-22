# install.packages("ggplot2")
library(ggplot2)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y=hwy))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y=hwy)) +
  geom_smooth(mapping = aes(x=displ, y=hwy))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y=hwy, color=class ))

?ggcorrplot
library(ggcorrplot)

set.seed(1234)
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)), 
                  rating = c(rnorm(200),rnorm(200, mean=.8)))




