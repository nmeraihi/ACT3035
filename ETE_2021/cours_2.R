setwd("~/Desktop/ACT3035E21/")

vecteur <- c(1,2,3)

vecteur <- 1:5
runif(25, 100, 115)

A <- matrix(runif(100, 55,59), nrow = 10 )
B <- matrix(runif(100, 1000,2000), nrow = 10 )

?cbind
cbin <- cbind(A, B)

dim(cbin)

rbin <- rbind(B, A)

rowMeans(cbin)
colMeans(cbin)

matCor <- cor(A)

tA <- t(A)

summary(cbin)

données <- runif(100)
array(données, dim = c(5,4,5))

probAccident <- c(0.001, 0.0005, 0.95)

liste <- list(probAccident, c("VW", "BMW", "Lexus"), c(F,F, T))
liste[2]
liste <- list(probAccident=c(0.001, 0.0005, 0.95),
              marVehicule=c("VW", "BMW", "Lexus"), 
              fummeur=c(F,F, T))

liste$marVehicule

marVehicule <- c("VW", "BMW", "Lexus")
fummeur <- c(F,F, T)

df <- data.frame(probAccident, marVehicule,fummeur)

df$probAccident

summary(df)

df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/1000_HF.csv", 
               encoding = "UTF-8")

df2 <- read.csv("csv_test.csv")

?read.csv

# install.packages("dplyr")
# shift+ctrl+c
# shift+cmd+c

library(dplyr)


head(df)


df_coll <- read.csv("~/Downloads/collisions_routieres_2.csv")
dim(df_coll)
head(df_coll)
tail(df_coll)

colnames(df_coll)


head(arrange(df_coll, NB_BLESSES_GRAVES))
head(arrange(select(df_coll,NB_BLESSES_GRAVES, NB_VICTIMES_TOTAL, DT_ACCDN), desc(NB_BLESSES_GRAVES)))

df_coll %>% 
  select(NB_BLESSES_GRAVES, NB_VICTIMES_TOTAL, DT_ACCDN) %>% 
  arrange(desc(NB_BLESSES_GRAVES)) %>% 
  head()


df_coll %>% 
  select(NB_BLESSES_GRAVES, NB_VICTIMES_TOTAL, DT_ACCDN) %>% 
  filter(NB_VICTIMES_TOTAL>=20) %>%
  arrange(desc(NB_BLESSES_GRAVES))

colnames(df_coll)

df_coll %>% 
  select(NB_VICTIMES_VELO, NB_VICTIMES_TOTAL) %>% 
  filter(NB_VICTIMES_VELO>=1)
  # mutate(fre_victine_velo=NB_VICTIMES_VELO/NB_VICTIMES_TOTAL) %>% 
  # filter(fre_victine_velo>0)
  


df_coll %>% 
  mutate(fre_victime_moto=NB_VICTIMES_MOTO/NB_VICTIMES_TOTAL) %>%
  filter(fre_victime_moto>0)


colnames(df_coll)


df_coll %>% 
  summarise(total_NB_DECES_PIETON=sum(NB_DECES_PIETON),
            total_NB_DECES_MOTO=sum(NB_DECES_MOTO))

summary(df_coll)
total_NB_DECES_MOTO <- as.numeric(total_NB_DECES_MOTO)
