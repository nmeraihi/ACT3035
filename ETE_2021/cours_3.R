head(df_coll)
library(dplyr)
df_vélo <- select(df_coll, NB_DECES_VELO, NB_BLESSES_VELO)
?select
colnames(df_coll)
df_coll %>% 
  group_by(AN) %>% 
  summarise(tot_nb_dece_velo=sum(NB_DECES_VELO),
                           tot_nb_bless_velo=sum(NB_BLESSES_VELO))

CARS_INFO <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/bdSQL/CARS_INFO.csv", encoding = "UTF-8")
DONNES_DEMO <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/bdSQL/DONNES_DEMO.csv")
PMT <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/bdSQL/PMT.csv")
POLICE_ASSURANCE <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/bdSQL/POLICE_ASSURANCE.csv")



df_join <- left_join(x=DONNES_DEMO, y=CARS_INFO, by="numeropol")

phrase <- "mon vehicule est une BMW"

substr(phrase, 5,12)

nchar(phrase)

nom <- "Tremblay"
paste( "Bonjour", "madame", nom)

grep("v", phrase)

vecteur <- strsplit(phrase, " ")

grep("v", vecteur)

sub("BMW", "TESLA", phrase)



sub("vehicule", "véhicule", phrase)

phrase_2 <- "mon vehicule vehicule est une BMW"

sub("vehicule", "véhicule", phrase_2)

gsub("vehicule", "véhicule", phrase_2)

?read.csv()




