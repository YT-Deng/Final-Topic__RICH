library(ggplot2)
library(dplyr)
library(lubridate)
#-----------------------(и琌だ筳絬暗瓜玡竚穨)
sum<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/MemberA/sum.csv")
head(sum)
sum.1<- sum %>% 
  mutate(date = (paste(year,mon,day,sep="-") %>% ymd()))
head(sum.1,3)
Graph_sum<-ggplot(data=sum.1,aes(x=date,y=Number,group=Category))+
  geom_line(aes(color=Category))+
  geom_point(size = 4, shape = 22, colour = "darkred", fill = "lightblue")+
  scale_x_date(date_labels="%b %y",date_breaks  ="1 month")
print(Graph_sum)
#-----------------------(и琌だ筳絬蔼动芠笴计2018-2019参璸瓜祘Α絏)
sum2<-read.csv('C:/users/chris/Documents/GitHub/Final-Topic__RICH/MemberA/sum2017-2018.csv')
head(sum2)
sum2.1<- sum2 %>% 
  mutate(date = (paste(year,mon,day,sep="-") %>% ymd()))
head(sum2.1,3)
Graph_sum2<-ggplot(data=sum2.1,aes(x=date,y=Number,group=Category))+
  geom_line(aes(color=Category))+
  geom_point(size = 4, shape = 22, colour = "darkred", fill = "blue")+
  scale_x_date(date_labels="%b %y",date_breaks  ="1 month")
print(Graph_sum2)
#-----------------------(и琌だ筳絬蔼动芠笴计2017-2018参璸瓜祘Α絏)
sum3<-read.csv('C:/users/chris/Documents/GitHub/Final-Topic__RICH/MemberA/sum2016-2017.csv')
head(sum3)
sum3.1<-sum3 %>%
  mutate(date = (paste(year,mon,day,sep="-") %>% ymd()))
head(sum3.1,3)
Graph_sum3<-ggplot(data=sum3.1,aes(x=date,y=Number,group=Category))+
  geom_line(aes(color=Category))+
  geom_point(size = 4, shape = 22, colour = "darkred", fill = "green")+
  scale_x_date(date_labels="%b %y",date_breaks  ="1 month")
print(Graph_sum3)
#-----------------------(и琌だ筳絬蔼动芠笴计2016-2017参璸瓜祘Α絏)
sum4<-read.csv('C:/users/chris/Documents/GitHub/Final-Topic__RICH/MemberA/sum2015-2016.csv')
head(sum4)
sum4.1<- sum4 %>% 
  mutate(date = (paste(year,mon,day,sep="-") %>% ymd()))
head(sum4.1,3)
Graph_sum4<-ggplot(data=sum4.1,aes(x=date,y=Number,group=Category))+
  geom_line(aes(color=Category))+
  geom_point(size = 4, shape = 22, colour = "darkred", fill = "orange")+
  scale_x_date(date_labels="%b %y",date_breaks  ="1 month")
print(Graph_sum4)
#-----------------------(и琌だ筳絬蔼动芠笴计2015-2016参璸瓜祘Α絏)

