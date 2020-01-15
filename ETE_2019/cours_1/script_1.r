library(DAAG)
library(ggplot2)
houseprices
write.csv(houseprices,"~/Downloads/houseprices.csv", row.names = F)
ggplot(data = houseprices) + geom_point(aes(x = area, y = sale.price, shape=as.factor(bedrooms)))+
  labs(color = "nb de chambres")+xlab("Superficie habitable") + ylab("Prix")
ggplot(houseprices, aes(sale.price)) +
  geom_histogram(binwidth = 50)

prix<-560000                 
ifelse(prix<=50900, p1=50900*.005, 
       ifelse(prix<=254400, p2= 203500 *.01, 
              ifelse(prix<=508700, p3= 254300 *.015,
                     ifelse(prix<=1017400, 51300 *.02,(prix-1017400) *.025))))

taxe_Mutation<-function(prix){
  ifelse(prix<=50900, p1<-50900*.005, 
         ifelse(prix<=254400, p2<- 203500*.01, 
                ifelse(prix<=508700, p3<- 254300*.015,
                       ifelse(prix<=1017400, p4<-51300*.02,p5<-(prix-1017400) *.025))))
  return(p1+p1+p3+p4+p5)
}
taxe_Mutation(prix = 560000)
