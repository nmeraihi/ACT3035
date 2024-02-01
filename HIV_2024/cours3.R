install.packages("tidyverse")
# Ce qui contient particulièrement c'est dplyr

# Créer un df qui contient les données du fichier "NY-House-Dataset.csv"
# Optinnellement on écrit le path au complet si on ne fait pas le setwd
# comme dans la ligne de code ci-dessous
# Setwd sert à être mieux organisé et évite d'écrire le path au complet
setwd("C:/Users/meraihi_n/Desktop/ACT3035")
df <- read.csv("NY-House-Dataset.csv")
head(df)
View(df)
colnames(df)

colnames(df)[1:5] <- c("br", "type", "prix", "chambres", "sdb")
# colnames(df) <- c("br", "type", "prix", "chambres", "sdb")


is.na(df)

mean(df$PRICE)
# SI jamais des valeurs manquantes, ça les enlève
mean(df$PRICE, na.rm = T)

df_aus <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/ausprivauto0405.csv")
library(tidyverse)

colnames(df_aus)
arrange(df_aus, desc(ClaimNb))
head()


head(arrange(df_aus, desc(ClaimNb)))

# ctrl+shit+m pour %>%
 
arrange(df_aus, desc(ClaimNb)) %>% 
  head()

# arrange(df_aus, ClaimNb) %>% 
#   desc() %>% 
#   head()
colnames(df_aus)

arrange(df_aus, desc(ClaimNb)) %>% 
  select(ClaimNb, ClaimAmount) %>% 
  head()


arrange(df_aus, desc(ClaimNb)) %>% 
  select(ClaimNb, ClaimAmount) %>% 
  filter(ClaimNb >=4) %>% 
  mutate(ClaimAmountInfl=ClaimAmount*1.039) %>% 
  head(20)


df_aus %>%
  select(ClaimNb, ClaimAmount) %>%
  filter(ClaimNb >0) %>% 
  group_by(ClaimNb) %>%
  summarise(nbAssures=n(),
    avgClaimAmount = mean(ClaimAmount )) %>%
  arrange(desc(ClaimNb))
?count
  


df_aus %>%
  select(ClaimNb, ClaimAmount) %>%
  filter(ClaimNb >0) %>% 
  summary()

# 
# "https://raw.githubusercontent.com/nmeraihi/data/master/donnes_demo.csv"
# "https://raw.githubusercontent.com/nmeraihi/data/master/pmt_details.csv"
# "https://raw.githubusercontent.com/nmeraihi/data/master/cars_info.csv"


df_donnes_demo <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/donnes_demo.csv")
df_pmt_details <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/pmt_details.csv")
df_cars_info <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/cars_info.csv")

?left_join()
df_combin <- left_join(df_donnes_demo, 
                       df_cars_info, 
                       by="numeropol") %>% 
  select() %>% 
  filter()

# langue+age+marquevoioture
# seulement parlant français


?paste()
example("paste")
paste("ACT", "3035")
paste("ACT", "3035", sep = "_______")

Sys.Date()
time1 <- Sys.time()
time1
time1+1
as.numeric(time1)+1
weekdays(time1)
difftime(time1, Sys.time())


getwd()

?file.exists()
file.exists("NY-House-Dataset.csv")
df <- read.csv("NY-House-Dataset.csv")
write.csv(df, "NY-prix-maison.csv")
file.rename("NY-prix-maison.csv", "NY-prix-maisons.csv")

save(df_combin, file="df_combin.RData")
# après avoir supprimé l'environnement, on peut lire les fichier
# RData avec les même charc du fichier exporté original
load("df_combin.RData")


