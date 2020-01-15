
# install.packages("dplyr")
library(dplyr)
df <- read.csv("N:/ACT3035/data/accidents_2012_2018.csv")
head(df)
head(arrange(select(df, 
                    AN, 
                    NB_BLESSES_GRAVES
                    )
             , desc(NB_BLESSES_GRAVES)
             )
     )

df %>%
  select(AN, NB_BLESSES_GRAVES) %>%
  group_by(AN) %>%
  summarise(NBG=sum(NB_BLESSES_GRAVES))


df %>%
  select(AN, 
         NB_BLESSES_GRAVES,
         NB_BLESS_LEGERS,
         NB_VICTIMES_VELO) %>%
  group_by(AN) %>%
  summarise(NBG=sum(NB_BLESSES_GRAVES),
            NBL=sum(NB_BLESS_LEGERS),
            NBV=sum(NB_VICTIMES_VELO))


df_demo <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/master/data/bdSQL/DONNES_DEMO.csv")
colnames(df_demo)

df_auto <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/master/data/bdSQL/CARS_INFO.csv")
colnames(df_auto) <- c("numeropol", "m", "c", "p", "l")

df_merge <- left_join(df_demo, df_auto,"numeropol")

df_merge %>%
  select(agee, p) %>%
  group_by(agee)%>%
  summarise(nombre=sum(p))














