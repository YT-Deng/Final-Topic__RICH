#導入套件
library(tidyverse)
library(dplyr)
library(ggplot2)
library(lubridate)

#導入檔案
Tr18<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/Train2018.csv")
Tr19<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/Train2019.csv")

hsr<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/Taiwan High Speed Rail.csv")

H18_1<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10701.csv")
H18_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10702.csv")
H18_3<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10703.csv")
H18_4<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10704.csv")
H18_5<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10705.csv")
H18_6<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10706.csv")
H18_7<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10707.csv")
H18_8<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10708.csv")
H18_9<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10709.csv")
H18_10<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10710.csv")
H18_11<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10711.csv")
H18_12<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10712.csv")
H19_1<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10801.csv")
H19_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10802.csv")
H19_3<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10803.csv")

H18_1_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10701-2.csv")
H18_2_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10702-2.csv")
H18_3_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10703-2.csv")
H18_4_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10704-2.csv")
H18_5_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10705-2.csv")
H18_6_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10706-2.csv")
H18_7_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10707-2.csv")
H18_8_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10708-2.csv")
H18_9_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10709-2.csv")
H18_10_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10710-2.csv")
H18_11_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10711-2.csv")
H18_12_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10712-2.csv")
H19_1_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10801-2.csv")
H19_2_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10802-2.csv")
H19_3_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel/file/10803-2.csv")

#整理H為高雄地區旅館收益資料、H1為旅客分類資料
hotel<-list(H18_1,H18_2,H18_3,H18_4,H18_5,H18_6,H18_7,H18_8,H18_9,
     H18_10,H18_11,H18_12,H19_1,H19_2,H19_3)
guest<-list(H18_1_2,H18_2_2,H18_3_2,H18_4_2,H18_5_2,H18_6_2,
      H18_7_2,H18_8_2,H18_9_2,H18_10_2,H18_11_2,H18_12_2,
      H19_1_2,H19_2_2,H19_3_2)

#加總各月份住房次數
NRO<-c()
for (i in 1:15){
  H<-as.data.frame(hotel[i])
  NRO[i]<-sum(select(H,No..of.Rooms.Occupied))
}
print(NRO)


#加總各月份陸客住房次數
china<-c()
for (i in 1:15){
  G<-as.data.frame(guest[i])
  china[i]<-sum(select(G,China))
}
print(china)

#加總各月份各國住房次數
country<-list()

for (i in 1:15){
  G<-as.data.frame(guest[i])
  G<-select(G,-Hotel.Name,-Total.1,-Total)
  colSums(G)
  country[[i]]<-colSums(G)
}
class(country)
print(country[[1]])


#旅館住房數圓餅圖(按旅客國籍)(以2018/1為例)
for (j in 10:15){
  VEC<-c(1:15)
  Country<-data.frame(country[[j]])
  RN<-row.names(Country)
  L<-length(RN)
  COUNTRY=c(country[[j]])
  
  table2<-data.frame(Category=RN,
                     COUNTRY=c(country[[j]]),
                     row.names=c(1:L))
  
  COU=cumsum(COUNTRY)
  midpoint=COU-COUNTRY/2
  per<-round(COUNTRY/sum(COUNTRY)*100,2)
  paste_num<-length(per)
  
  Lab<-list()
  lab<-c()
  for (i in 1:paste_num){
    if (per[i]<=5){
      Lab[[i]]<-paste0(" ")
    }
    else {
      Lab[[i]]<-paste0(per[i],"%")
    }
    lab[i]<-Lab[[i]]
  }
  Pie<-ggplot(table2,aes(x="",y=COUNTRY,fill=Category))+
    geom_bar(stat="identity")+
    coord_polar("y",start=0)+
    geom_text(aes(x=1,y=midpoint,label=lab))+
    ggtitle(paste0("No.",VEC[j]))
  print(Pie)
}
