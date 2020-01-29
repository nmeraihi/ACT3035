m <- matrix(1:12, 3)
log(m)
apply(m, c(1,2), log)
?apply
# fonction est une fonction qu'on a créé
apply(m, c(1,2), fonction)
# lapply
# sapply

# les tableaux

x <- array(1:24, dim = c(3,4,2))
x
# Les listes
maliste <- list(
  vecteur=c(1,5,9),
  conducteur=c("driver1", "driver2", "driver3"),
  UnTrucBool=c(T,T,F)
)
maliste
# extraction de mon conducteur2 de ma liste
maliste$conducteur[2]


# Data frame
vecteur=c(1,5,9)
conducteur=c("driver1", "driver2", "driver3")
UnTrucBool=c(T,T,F)
df1 <- data.frame(vecteur, conducteur, UnTrucBool)
colnames(df1)
df2 <- data.frame(maliste$vecteur, maliste$conducteur, maliste$UnTrucBool)
colnames(df2)

attributes(df1)

df1[,2]
df1[2,]
df1
df1$vecteur
summary(df1)

summary(cars)
head(cars)
max(cars$speed)
max(cars$dist)

?which
which(max(cars$dist)==cars$dist)
cars$speed[max(cars$speed)]
max(cars$speed)
View(cars)


df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/500_femmes.csv")
df <- df[,-1]
View(df)
summary(df)

lien="https://raw.githubusercontent.com/nmeraihi/data/master/islr/"

df2 <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/islr/Wage.csv")
View(df2)



df3 <- read.csv(paste(lien, "Credit.csv", sep = ""))[,c(1,4)]


df3 <- df3[-1]
df3 <- df3[,c(1,4)]
View(df3)

df_credit <- read.csv(paste(lien, "Credit.csv", sep = ""))[-1]
View(df_credit)

lien0="https://raw.githubusercontent.com/nmeraihi/data/master/"
df_exe <- read.csv(paste(lien0, "exemple_2_2.txt", sep = ""))
df_exe
is.na(df_exe)
mean(df_exe$km, na.rm = T)
df_exe$km[is.na(df_exe$km)] <- mean(df_exe$km, na.rm = T)
df_exe


# apply(df_exe,c(1,2), fonctionEnleveNa)

install.packages("dplyr")
library(dplyr)
head(df_credit)
head(df_credit[order(df_credit$Income, decreasing = T),])

head(arrange(df_credit, desc(Income)))

df_credit %>%
  arrange(Income) %>%
  head()

df_credit %>%
  select(Income, Married) %>%
  head(5)

df_credit %>%
  select(Income, Married) %>%
  filter(Income>=100)%>%
  head(5)


df_credit %>%
  select(Income, Married) %>%
  arrange(desc(Income)) %>%
  filter(Income>=100)%>%
  head(5)


df_credit_arr <- mutate(df_credit, IncomArrondi=round(df_credit$Income))
head(df_credit_arr)

head(df_credit)
 
df_credit %>%
  select(Income, Ethnicity) %>%
  group_by(Ethnicity) %>%
  summarise(IncomeMean=mean(Income))



df_credit %>%
  select(Income, Ethnicity, Gender) %>%
  group_by(Ethnicity, Gender) %>%
  summarise(IncomeMean=mean(Income))


colnames(df_credit)

df_ddemo <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/donnes_demo.csv")
df_cars <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/cars_info.csv")

df_joint <- left_join(df_ddemo, df_cars, "numeropol")
head(df_joint)

df_joint %>%
  select(agee, marque_voiture) %>%
  group_by(marque_voiture) %>%
  summarise(age_moyen=mean(agee))

colnames(df_joint)










