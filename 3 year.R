#導入套件
library(tidyverse)
library(dplyr)
library(ggplot2)
library(lubridate)

H16_1<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10501.csv")
H16_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10502.csv")
H16_3<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10503.csv")
H16_4<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10504.csv")
H16_5<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10505.csv")
H16_6<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10506.csv")
H16_7<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10507.csv")
H16_8<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10508.csv")
H16_9<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10509.csv")
H16_10<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10510.csv")
H16_11<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10511.csv")
H16_12<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10512.csv")

H16_1_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10501_2.csv")
H16_2_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10502_2.csv")
H16_3_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10503_2.csv")
H16_4_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10504_2.csv")
H16_5_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10505_2.csv")
H16_6_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10506_2.csv")
H16_7_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10507_2.csv")
H16_8_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10508_2.csv")
H16_9_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10509_2.csv")
H16_10_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10510_2.csv")
H16_11_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10511_2.csv")
H16_12_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10512_2.csv")

H17_1<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10601.csv")
H17_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10602.csv")
H17_3<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10603.csv")
H17_4<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10604.csv")
H17_5<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10605.csv")
H17_6<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10606.csv")
H17_7<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10607.csv")
H17_8<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10608.csv")
H17_9<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10609.csv")
H17_10<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10610.csv")
H17_11<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10611.csv")
H17_12<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10612.csv")

H17_1_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10601_2.csv")
H17_2_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10602_2.csv")
H17_3_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10603_2.csv")
H17_4_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10604_2.csv")
H17_5_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10605_2.csv")
H17_6_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10606_2.csv")
H17_7_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10607_2.csv")
H17_8_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10608_2.csv")
H17_9_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10609_2.csv")
H17_10_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10610_2.csv")
H17_11_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10611_2.csv")
H17_12_2<-read.csv("C:/users/chris/Documents/GitHub/Final-Topic__RICH/hotel16-17/file/10612_2.csv")

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
hotel<-list(H16_1,H16_2,H16_3,H16_4,H16_5,H16_6,H16_7,H16_8,H16_9,H16_10,H16_11,H16_12,
            H17_1,H17_2,H17_3,H17_4,H17_5,H17_6,H17_7,H17_8,H17_9,H17_10,H17_11,H17_12,
            H18_1,H18_2,H18_3,H18_4,H18_5,H18_6,H18_7,H18_8,H18_9,H18_10,H18_11,H18_12,
            H19_1,H19_2,H19_3)
guest<-list(H16_1_2,H16_2_2,H16_3_2,H16_4_2,H16_5_2,H16_6_2,H16_7_2,H16_8_2,H16_9_2,H16_10_2,H16_11_2,H16_12_2,
            H17_1_2,H17_2_2,H17_3_2,H17_4_2,H17_5_2,H17_6_2,H17_7_2,H17_8_2,H17_9_2,H17_10_2,H17_11_2,H17_12_2,
            H18_1_2,H18_2_2,H18_3_2,H18_4_2,H18_5_2,H18_6_2,H18_7_2,H18_8_2,H18_9_2,H18_10_2,H18_11_2,H18_12_2,
            H19_1_2,H19_2_2,H19_3_2)

#加總各月份房租收入
RR<-c()
for (i in 1:39){
  H<-as.data.frame(hotel[i])
  RR[i]<-sum(select(H,Room.Revenue))
}
print(RR)


#加總各月份陸客住房次數
china<-c()
for (i in 1:39){
  G<-as.data.frame(guest[i])
  china[i]<-sum(select(G,China))
}
print(china)


YEAR<-c("Jan","Feb","Mar","Apr","May","Jun",
        "Jul","Aug","Sep","Oct","Nov","Dec")
thrYear<-rep(YEAR,3)
Month<-c(thrYear,"Jan","Feb","Mar")
print(Month)
Year<-c(rep(c("2016","2017","2018"),each=12),rep(c("2019"),3))
print(Year)


#旅館近三年陸客住房數折線圖
table5<-data.frame(Month=Month,
                   Year=Year,
                   Number=china)
print(table5)
table5$Month<-factor(table5$Month,
                     levels=c("Jan","Feb","Mar","Apr","May","Jun",
                              "Jul","Aug","Sep","Oct","Nov","Dec"),
                     ordered=TRUE)
Line2<-ggplot(data=table5,aes(x=Month,y=Number,group=Year))+
  geom_line(aes(color=Year))+
  geom_point(aes(color=Year))
print(Line2)


#旅館近三年總收益長條圖
table6<-data.frame(Month=Month,
                   Year=Year,
                   Revenue=RR)
table6$Month<-factor(table6$Month,
                     levels=c("Jan","Feb","Mar","Apr","May","Jun",
                              "Jul","Aug","Sep","Oct","Nov","Dec"),
                     ordered=TRUE)
Bar3<-ggplot(data=table6,aes(x=Month,y=RR,fill=Year)) +
  geom_bar(stat="identity",position="dodge")
print(Bar3)