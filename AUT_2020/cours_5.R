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
                   rating=c(rnorm(200), rnorm(200, mean=.8)))





