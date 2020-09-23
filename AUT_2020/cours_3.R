m <- matrix(1:12, nrow = 3)
m
rowSums(m)
colSums(m)

?apply
apply(m, c(1,2), log)

apply(m, 1, log)


m[2,] <- log(m[2,])
m

ve_df <- read.csv("~/Downloads/roulez-electrique-2017-juillet.csv")
head(ve_df)
colnames(ve_df)

View(ve_df)

df_gh <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/1000_cartes.csv")

install.packages("dplyr") 
library(dplyr)


summary(ve_df)

class(ve_df)
class(ve_df$Date)
class(ve_df$Annee_modele)

df_xx <- ve_df[order(ve_df$Annee_modele, decreasing = T), ]

df_yy <- arrange(ve_df, desc(Annee_modele))
?arrange


colnames(ve_df)
dim(ve_df)

df_ve_1 <- select(ve_df, Marque, Annee_modele, Aide_financiere)
colnames(df_ve_1)
dim(df_ve_1)

df_ve__2 <- filter(df_ve_1, Marque %in% c("Tesla","Toyota"))

# Mutate

mutate(df_ve_1, Aide_financiere_taxes=round(as.numeric(Aide_financiere)*1.095,0))

dim(df_ve__2)


summarise(df_ve__2, )



df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/insurance.csv")
head(df)

# Quel est le bmi moyen des femmes (F ou NF)

df_1 <- select(df, sex, smoker, bmi)
df_2 <- filter(df_1, sex=="female")
head(df_2)

summarise(df, bmi_moy=mean(df_2$bmi))

df %>%
  select(sex, smoker, bmi) %>%
  filter(sex=="female") %>%
  head()


df %>%
  select(sex, smoker, bmi) %>%
  filter(sex=="female") %>%
  group_by(smoker) %>%
  summarise(bmi_moy=mean(bmi))


# let join:

df_demo <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/donnes_demo.csv")
colnames(df_demo)
df_auto <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/cars_info.csv")
colnames(df_auto)
df_somm <- left_join(df_demo, df_auto, by='numeropol')
head(df_somm)
colnames(df_somm)


df_somm <- left_join(df_demo, df_auto, by.x='numeropol', by.y='id')
