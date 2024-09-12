x <- 1:15
# x <- c(1,2,3,4)

A <- matrix(1:15,nrow = 3, ncol = 5, byrow = T)
A <- matrix(x,nrow = 3, ncol = 5, byrow = T)
?matrix
A <- matrix(x,3,5,T)
View(A)
t(A)
mean(A)
sd(A)

dim(A)

A[2,2]
A[2,2:4]


A <- matrix(x,3,5,T)
B <- matrix(101:115,3,5,T)
?cbind
C <- cbind(A, B)
D <- rbind(A, B)
min(C)
max(C)

range(C)
rowMeans(C)
colMeans(C)

?runif()
runif(100)

set.seed(3035)
E <- matrix(runif(100), 10)
mean(E)

?sample

x <- runif(100)
sample(x,10)
# Avec remise:
sample(x,10, replace = T)
# Avec remise où la taille du sample > vecteur
sample(x,199, replace = T)

mean(runif(10000))
rnorm(1000)
mean(rnorm(100000))
# tableaux
x <- array(1:24, dim = c(3,4,2))
#Liste
x <- list(memory=c(128,256,512), model=("iPhone"), fonctionne=T)
x

memory <- c(128,256,512)
model <- c("iPphne 14 pro", "iPhone 15 Pro", "iPhone 16 pro max")
prix <- c(500, 800, 1800)

df <- data.frame(memory, model, prix)

summary(df)


df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/exemple_1.csv")

df <- df[,c(1,3)]
View(df)

df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/exemple_1.csv")[,c(1,3)]
is.na(df)

# remplacer les NA par 0 par exmple
df[is.na(df)] <- 0

df_demo <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/demograph_data.csv")
install.packages("dplyr")
library(dplyr)

?dplyr

# première fonction: select

?select(df_demo)
colnames(df_demo)
select(df_demo, gender, car_year, car_color)
# Filter

filter(select(df_demo, gender, car_year, car_color), gender =="Female", car_color=="Pink")
filter(select(df_demo, gender, car_year, car_color), gender =="Male", car_color=="Pink")

# %>% Ctrl+shif+m
df_demo_M <- df_demo %>% 
  select(gender, car_year, car_color) %>% 
  filter(gender =="Male", car_color=="Pink")

df_demo_F <- df_demo %>% 
  select(gender, car_year, car_color) %>% 
  filter(gender =="Female", car_color=="Pink") 
  
dim(df_demo_M)
dim(df_demo_F) 

colnames(df_demo)

df_demo %>% 
  select(gender, car_year, car_color) %>% 
  filter(car_color=="Pink") %>% 
  group_by(gender) %>% 
  summarise(count=n())
  
df_demo %>% 
  select(gender, car_year) %>% 
  filter(car_year>=2010) %>% 
  group_by(gender, car_year) %>% 
  summarise(count=n())

max(df_demo$car_year, na.rm = T)

df_donnes_demo <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/bdSQL/DONNES_DEMO.csv")
df_donnes_cars <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/bdSQL/CARS_INFO.csv")

left_join(df_donnes_demo, df_donnes_cars, by='numeropol')






