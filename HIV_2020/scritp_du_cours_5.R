library(dplyr)
# library(ggplot2)

library(tidyverse)

head(mpg)
?mpg
# ggplot2::ggplot()
# package::fonction
ggplot()
view(mpg)
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))+
  geom_smooth(mapping = aes(x=displ, y=hwy))

table(mpg$class)

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y=hwy, color=class))

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y=hwy, color=class))+
  geom_smooth(mapping = aes(x=displ, y=hwy))

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y=hwy, alpha=class))

# https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf


set.seed(1234)
nombre <- 400
data <- data.frame(cond=factor(rep(c("A", "B"),each=nombre)), 
                   rating=c(rnorm(nombre), rnorm(nombre, mean=2)))

head(data)
ggplot(data=data)+
  geom_histogram(aes(x=rating), binwidth = .5)

ggplot(data=data)+
  geom_histogram(aes(x=rating, fill=cond), binwidth = .5, alpha=.5)

data %>% group_by(cond) %>% filter(cond=="A") %>% summarise(moyenne=mean(rating))
data %>% group_by(cond) %>% filter(cond=="B") %>% summarise(moyenne=mean(rating))

a <- subset(data$rating, data$cond=="A")
moyenne_A <- mean(a)

b <- subset(data$rating, data$cond=="B")
moyenne_B <- mean(b)

moyenne_A
moyenne_B

df_ab <- data.frame(cond=c("A", "B"),moyenne_AB= c(moyenne_A, moyenne_B))
df_ab


ggplot(data=data)+
  geom_histogram(aes(x=rating, fill=cond), binwidth = .5, alpha=.5)+
  geom_vline(data=df_ab, aes(xintercept=df_ab$moyenne_AB, colour=cond))

ggplot(data=data)+
  geom_boxplot(aes(x=cond, y=rating, fill=cond))


ggplot(data=data)+
  geom_boxplot(aes(x=cond, y=rating, fill=cond))+
  coord_flip()

# stocks_correlation.csv
df_app <- read_csv("https://raw.githubusercontent.com/nmeraihi/data/master/stocks_correlation.csv")
df_app <- df_app[,2:9]
mat_corr <- cor(df_app)
mat_corr

install.packages("ggcorrplot")
library(ggcorrplot)

ggcorrplot(mat_corr, lab = T, type = "lower")


coron <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/2019_nCoV_data.csv")

head(coron)
# combien de pays sont touchés?
nbpays <- coron %>% 
  group_by(Country) %>% 
  summarise(toatl_conf=sum(Confirmed))
nbpays
dim(nbpays)[1]
nrow(nbpays)
df_count <- data.frame(table(coron$Country))
df_count
dim(df_count)[1]


# Combien de cas détectés au total?



# Combien de cas confirmés par pays?


# Combien de cas confirmés par pays en enlevant les cas guéris?



# Combien de cas confirmés par province en Chine?

# Faites un bar plot cumulatif de nombre de cas par date depuis le début?

# Faite un graphique de type bulles qui représente le nb de cas sur la
# carte mondiale, dont le centre est en Chine


view(coron)

