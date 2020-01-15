x <- 1:25
y <- runif(25)
arr <-array(1:24, dim = c(3,4,2)) 
maliste <- list(marqueVoi=c("Tesla"), 
                model=c("X", "Y", "S"),
                prix=c(120000, 90000, 100000),
                VE=T)
maliste$prix[2]
maliste

# ca c pour

fn <- c("Hall", "Ash", "Lorettalorna")
ln <- c("Ovens", "Farquarson", "Calleja")
cy <- c(1993, 1997, 2008)

df <- data.frame(fn, ln, cy)
df
View(df)

attributes(df)


# install.packages("dplyr")
# library(dplyr)

str(df)

df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/VEE_2016.csv")
View(df)

dfRemorq <- read.csv("http://donnees.ville.montreal.qc.ca/dataset/1d785ef8-f883-47b5-bac5-dce1cdddb1b0/resource/e62322fb-3e14-4ee0-b724-a77190dac8e7/download/remorquages.csv")
head(dfRemorq)

df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/exemple_2_2.txt")

is.na(df)

mean(df$km,na.rm = T)

mean(df$vitesseMoyenne)

df$km[is.na(df$km)] <- mean(df$km, na.rm = T)

library(dplyr)




