install.packages("tidyverse")
install.packages("rchallenge")
library(rchallenge)
data("german")
?german
head(german)
dim(german)
sum(is.na(german))

library(dplyr)

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
         foreign_worker,
         status,
         credit_history,
         purpose,
         savings,
         employment_duration,
         personal_status_sex,
         people_liable,
         property,
         other_installment_plans,
         housing,
         job) %>% str()

# Variable réponse
table(german$credit_risk)

write.csv(german, "german.csv")


class.prop <- german %>% 
  count(credit_risk) %>% 
  mutate(perc=n/nrow(german))

library(ggplot2)

class.prop %>% ggplot(
  aes(x=credit_risk, 
      perc,
      fill=credit_risk)
)+geom_bar(stat = "identity")+
  labs(title = "Solvabilité des clients")

summary(german$age)

german %>% 
  select(credit_risk, age) %>% 
  reshape2::melt() %>% 
  ggplot(aes(x=variable, y=value, fill=credit_risk))+
  geom_boxplot()


avg.duration <- german %>% 
  select(duration, credit_risk) %>% 
  group_by(credit_risk) %>% 
  summarise(n=mean(duration))
avg.duration

avg.amount <- german %>% 
  select(amount, credit_risk) %>% 
  group_by(credit_risk) %>% 
  summarise(n=mean(amount))
avg.amount


duration_p <- german %>% 
  ggplot(aes(duration))+
  geom_density(aes(fill=credit_risk), alpha=.7)+
  labs(title="Durée en mois groupée par solvabilité",
       x="Durée",
       fill="Solvabilité")+
  geom_vline(data=avg.duration, 
             aes(xintercept=n,
                 colour=credit_risk))
duration_p

amount_p<- german %>% 

  table()
  
  
  ggplot(aes(amount))+
  geom_density(aes(fill=credit_risk), alpha=.7)+
  labs(title="Montant de crédit groupée par solvabilité",
       x="Montant",
       fill="Solvabilité")+
  geom_vline(data=avg.amount, 
             aes(xintercept=n,
                 colour=credit_risk))
amount_p

table(german$installment_rate)

graph_1 <- german %>% 
  ggplot(aes(installment_rate, ..count..))+
  geom_bar(aes(fill=credit_risk),
           position="dodge")+
  labs(title="pourcentage du taux de remboursement
       groupé par solvabilité")


# Faire avec boxplot
graph_2 <- german %>% 
  select(credit_risk, installment_rate, amount) %>% 
  ggplot(aes(x=installment_rate, 
             y=amount, 
             fill=credit_risk))+
  geom_boxplot()


library(gridExtra)
grid.arrange(graph_1, graph_2)


graph_3 <- german %>% 
  ggplot(aes(number_credits, ..count..))+
  geom_bar(aes(fill=credit_risk),
           position = "Dodge")+
  labs(title="crédits existants groupé par solvabilité")
graph_4 <- german %>% 
  ggplot(aes(present_residence, ..count..))+
  geom_bar(aes(fill=credit_risk),
           position = "Dodge")+
  labs(title="résidence actuelle groupé par solvabilité")
graph_5 <- german %>% 
  ggplot(aes(other_debtors, ..count..))+
  geom_bar(aes(fill=credit_risk),
           position = "Dodge")+
  labs(title="Autres débiteurs groupé par solvabilité")
graph_5

# present_residence
# other_debtors


grid.arrange(graph_3, graph_4, graph_5)

german.copy <- german
german.copy %>% 
  ggplot(aes(x=amount))+
  geom_histogram(aes(y=..density..),
                 bandwith=1000,
                colour="black",
                fill="white")+
  geom_density(alpha=.5, fill="blue")

install.packages("caret")

mySkew <- caret::preProcess(german.copy, method=c("BoxCox"))
mySkew

donnes_transform <- predict(mySkew, german.copy)
  
donnes_transform %>% 
  ggplot(aes(x=amount))+
  geom_histogram(aes(y=..density..),
                 bandwith=1000,
                 colour="black",
                 fill="white")+
  geom_density(alpha=.5, fill="blue")

  
  
  
  
  
  
  
  
