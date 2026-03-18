## Cours #6 partie 2 -----

### Graphique ggplot ---- 

#### C) Diagramme avec des ligne  ----

dat4 <- data.frame(
  session = factor(c("Aut17","Aut17","Aut17","Hiv18","Hiv18","Hiv18", "ETE18", "ETE18", "ETE18")),
  examen = c("Examen_1","Examen_2", "Examen_3","Examen_1","Examen_2", "Examen_3", "Examen_1","Examen_2", "Examen_3"),
  moyenne = c(20, 24, 26, 21, 22, 23,18, 20, 19), 
  ordre=c(c(rep(1,3), rep(2,3), rep(3,3)))
)

dat4$se<-c(.33, .27, .5, .25, .7, .5, .7, .4, .7)

View(dat4)

library(ggplot2)

ggplot( dat4, mapping = aes(x = examen, y = moyenne))+
  geom_line(mapping = aes(group = session, colour = session))+
  geom_point(mapping = aes(colour = session))+
  geom_errorbar(mapping = aes(ymin = moyenne - se, ymax = moyenne + se, colour = session), width = 0.1 )



#### D) Histogram -----

set.seed(1234)

data_simu <- data.frame(group = factor(c(rep("A", 200), rep("B", 200))),
                        rating = c(rnorm(200), rnorm(200, mean = 0.8, sd = 0.1)))

table(data_simu$group)

ggplot(data = data_simu, mapping = aes(x=rating))+
  geom_histogram(binwidth = 0.5)

ggplot(data = data_simu, mapping = aes(x=rating, fill = group))+
  geom_histogram(binwidth = 0.5)



ggplot(data = data_simu, mapping = aes(x=rating, fill = group))+
  geom_histogram(binwidth = 0.5, alpha = 0.5)

ggplot(data = data_simu, mapping = aes(x=rating, fill = group))+
  geom_histogram(binwidth = 0.5, alpha = 0.5, position = "identity")


#### E) Densité ----

data_simu_moyenne <- data_simu %>% 
  group_by(group) %>% 
  summarise(rating_mean = mean(rating))

ggplot(data = data_simu, mapping = aes(x=rating, colour = group))+
  geom_density()+
  geom_vline(data = data_simu_moyenne, mapping = aes(xintercept = rating_mean, colour = group), linetype = "dashed", size = 1)




#### F) BoxPlot ---- 



ggplot(data = data_simu, mapping = aes(x= group, y = rating, fill = group))+
  geom_boxplot()+
  guides(fill = FALSE) +
  coord_flip()


#### G) Titre en ggplot ----

ggplot(data = data_simu, mapping = aes(x=rating, fill = group))+
  geom_histogram(binwidth = 0.5, alpha = 0.5, position = "identity")+
  labs( 
    title = "Distribution du rating selon le groupe",
    x = "Fréquence",
    y = "Rating des groupes")


#### H) Corrélation 

df_app<-read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/stocks_correlation.csv",
                 header = T)[ ,2:9]
head(df_app)

mat_corr <- cor(df_app)

install.packages("ggcorrplot")
library(ggcorrplot)


ggcorrplot(mat_corr, lab = TRUE, type = "lower")







