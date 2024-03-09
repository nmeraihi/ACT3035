install.packages("rchallenge")
library(rchallenge)
data("german")
?german
View(german)
dim(german)
colnames(german)
table(german$credit_risk)
sum(is.na(german))

library(tidyverse)
# library(dplyr)
german %>% 
  select(duration,
         amount,
         installment_rate,
         present_residence,
         age,
         number_credits,
         other_debtors) %>% 
  str()

german %>% 
  select(credit_risk,
         telephone,
         foreign_worker) %>% 
  str()

table(german$credit_risk)

class.prop <- german %>% 
  count(credit_risk) %>% 
  mutate(perc=n/nrow(german))

class.prop

# Variable réponse: c'est ce qu'on va essayer de prédire

class.prop %>% 
  ggplot(aes(x=credit_risk, y=perc,fill=credit_risk))+
  geom_bar(stat = "identity")+
  labs(title = "Solvabilité des clients")

# Variables numérique

summary(german$age)
german %>% 
  select(credit_risk, age) %>% 
  head()

# Avec reshape2::melt(), ça remplace library(reshape2) 
# ensuite utiliser la fonction melt 


german %>% 
  select(credit_risk, age) %>% 
  reshape2::melt() %>% 
  head()

german %>% 
  select(credit_risk, age) %>% 
  reshape2::melt() %>% 
  ggplot(aes(x=variable, y=value, fill=credit_risk))+
  geom_boxplot()+
  xlab("Credit Risk")+
  ylab("Age")
 
avg.duration <- german %>% 
  select(duration, credit_risk) %>% 
  group_by(credit_risk) %>% 
  summarise(m=mean(duration))

avg.amount <- german %>% 
  select(amount, credit_risk) %>% 
  group_by(credit_risk) %>% 
  summarise(m=mean(amount))

graph_duree <- german %>% 
  ggplot(aes(duration))+
  geom_density(aes(fill=credit_risk),alpha=.7)+
  geom_vline(data = avg.duration, 
             aes(xintercept=m, colour=credit_risk), 
             lty=4, size=2)+
  labs(Title="Durée en mois par groupe de solvabilité",
       x="Durée en mois",
       y="Densité",
       fill="Risque de crédit (Solvabilité)")

graph_montant <- german %>% 
  ggplot(aes(amount))+
  geom_density(aes(fill=credit_risk),alpha=.7)+
  geom_vline(data = avg.amount, 
             aes(xintercept=m, colour=credit_risk), 
             lty=4, size=2)+
  labs(Title="Montant d'emprunt par groupe de solvabilité",
       x="Montant en $",
       y="Densité",
       fill="Risque de crédit (Solvabilité)")

library(gridExtra)

grid.arrange(graph_duree, graph_montant)

# Créer 3 graphiques de type box_plot combinés dans un seul graphique 
# Où l'on illustre axe de y en montant, l'axe des x sont les 3
# variables ci-dessous. On doit distinger les credit_risk (Bad vs good)
# par couleur



german$number_credits
german$present_residence
german$other_debtors


graph_number_credits <- german %>% 
  select(number_credits, credit_risk, amount) %>% 
  ggplot(aes(x=number_credits, y=amount, fill=credit_risk))+
  geom_boxplot()

graph_present_residence <- german %>% 
  select(present_residence, credit_risk, amount) %>% 
  ggplot(aes(x=present_residence, y=amount, fill=credit_risk))+
  geom_boxplot()

graph_other_debtors <- german %>% 
  select(other_debtors, credit_risk, amount) %>% 
  ggplot(aes(x=other_debtors, y=amount, fill=credit_risk))+
  geom_boxplot()

grid.arrange(graph_number_credits,
             graph_present_residence,
             graph_other_debtors)



german %>% 
  ggplot(aes(credit_history, ..count..))+
  geom_bar(aes(fill=credit_risk), position = "dodge")+
  theme(axis.text.x = element_text(angle = 65, vjust = .6))



german %>% 
  ggplot(aes(x=amount))+
  geom_histogram(aes(y=..density..), 
                 binwidth = 1000, 
                 colour="Black", 
                 fill="White")+
  geom_density(alpha=.5, fill)







