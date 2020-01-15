setwd("~/Desktop/Cour3")
# df <- read.csv("1000_HF.csv")
df_git <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/1000_HF.csv")[c(1:50),c(1,2)]
df_git

head(df_git)
tail(df, 20)

m <- matrix(1:12, nrow = 3)
m
rowSums(m)
rowMeans(m)
log_m <- apply(m,c(1,2), log)
m
log_m

liste <- list(vecteur_1=1, vecteur_2=1:17, vecteur_3=55:97 )
liste
lapply(liste, length)


set.seed(123)
lapply(5:8, sample, x=1:10)


sapply(liste,length)

# install.packages("dplyr")
library(dplyr)


df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/exemple_2.txt")
df
df[order(df$vitesseMoyenne, decreasing = T),]


df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/assurance.csv")
head(df)
?var
head(df[order(df$nbsin, decreasing = T), ])

head(df$nbsin, 20)


head(order(df$nbsin, decreasing = T))


df[order(df$nbsin, decreasing = T), ]


?arrange
head(arrange(df, nbsin, cout1))


head(select(df, nbsin, cout1))


library(MASS)

filter(Cars93, Cylinders==8)[c("Horsepower", "Passengers")]

filter(df, nbsin==2, type_prof=="Médecin")


df <- mutate(df, nbsin5=nbsin*5)
df


select(df, numeropol, langue, nbsin)

df2 <- select(df, nbsin)
df2$nbsin5 <- df$nbsin*5

df2 <- select(df, nbsin)
df2 <- mutate(df, nbsin5=nbsin*5)
df2 <- mutate(df, nbsin10v1=nbsin*10)
df2 <- mutate(df2, nbsin10v2=nbsin5*2)

df2 <- df%>%
  select(nbsin, cout1) %>%
  mutate(nbsin5=nbsin*5) %>% 
  mutate(nbsin10v1=nbsin*10) %>%
  mutate(nbsin10v2=nbsin5*2) %>%
  mutate(cout_inflation=cout1*1.02) %>%
  select(nbsin10v2, cout_inflation)


df%>%
  group_by(type_territoire, sexe, myopie) %>%
  summarise(TotalNbSin=sum(nbsin), CoutTotal_1=sum(cout1, na.rm = T))


head(df)

head(df2, 20)


df_demo<- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/donnes_demo.csv")
df_cars <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/cars_info.csv")

head(df_demo)
head(df_cars)

colnames(df_demo)











