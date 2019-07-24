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


#按日期、地點分類火車站進出人次
Tr18 <- Tr18 %>%
  rename(In="進站", Out="出站") %>%
  mutate(year=BOARD_DATE%/%10000, month=(BOARD_DATE%/%100)%%100, day=BOARD_DATE%%100)
head(Tr18)
Tr18_KS<-filter(Tr18,177<TKT_BEG & TKT_BEG<189)
head(Tr18_KS)
head(filter(Tr18_KS,month==1))

Tr19 <- Tr19 %>%
  rename(In="進站", Out="出站") %>%
  mutate(year=BOARD_DATE%/%10000, month=(BOARD_DATE%/%100)%%100, day=BOARD_DATE%%100)
Tr19_KS<-filter(Tr19,177<TKT_BEG & TKT_BEG<189)

#加總高雄地區各月份火車站出、入站總人次
Tr_Pass<-c()
for (i in 1:12){
  Mon<-filter(Tr18_KS,month==i)
  Tr_Pass[i]<-(sum(select(Mon,In))+sum(select(Mon,Out)))
}
for (i in 1:3){
  Mon<-filter(Tr19_KS,month==i)
  Tr_Pass[12+i]<-(sum(select(Mon,In))+sum(select(Mon,Out)))
}
print(Tr_Pass)



#加總高雄地區各月份高鐵站出、入站總人次
hsr<- hsr %>%
  rename(In.Out="車站.進.出站", DATE="年度.月份") 

hsr$DATE<-gsub("年","-",hsr$DATE)
hsr$DATE<-gsub("月","",hsr$DATE)
hsr$DATE<-(str_split(hsr$DATE,"-"))
Count<-length(hsr$DATE)

for (i in 1:Count){
  Vec<-hsr$DATE[[i]]
  hsr$year[i]<-Vec[1]
  hsr$month[i]<-Vec[2]
}
head(hsr)
head(hsr$year)

hsr_Pass<-c()
for (i in 1:12){
  y2018<-filter(hsr,year==2018)
  month<-filter(y2018,month==i)
  hsr_Pass[i]<-(sum(select(month,"左營")))
  if (i<=6){
    y2019<-filter(hsr,year==2019)
    Month<-filter(y2019,month==i)
    hsr_Pass[12+i]<-(sum(select(Month,"左營")))
  }
}
print(hsr_Pass)


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
head(country)
print(country[[1]])



#高雄旅客人數變化折線圖(按台鐵、高鐵進出站人次和旅館住房數)
table1<-data.frame(Category=rep(c("train","high_speed_rail*1.5",
                                  "hotel*37.5"),each=15),
                   Month=rep(c("18.1","18.2","18.3","18.4",
                               "18.5","18.6","18.7","18.8",
                               "18.9","18.10","18.11",
                               "18.12","19.1","19.2","19.3"
                               ),3),
                   Number=c(Tr_Pass[1:15],hsr_Pass[1:15]*1.5,NRO*37.5))
print(table1)

table1$Category<-factor(table1$Category,
                        levels=c("train","high_speed_rail*1.5",
                                   "hotel*37.5"),ordered=TRUE)
table1$Month<-factor(table1$Month,
                     levels=c("18.1","18.2","18.3","18.4",
                              "18.5","18.6","18.7","18.8",
                              "18.9","18.10","18.11",
                              "18.12","19.1","19.2","19.3"),
                     ordered=TRUE)
Line1<-ggplot(data=table1,aes(x=Month,y=Number,group=Category))+
  geom_line(aes(color=Category))+
  geom_point(aes(color=Category))
print(Line1)


#旅館住房數圓餅圖(按旅客國籍)(以2018/1為例)
Country<-data.frame(country[[1]])
RN<-row.names(Country)
L<-length(RN)
COUNTRY=c(country[[1]])

table2<-data.frame(Category=RN,
                   COUNTRY=c(country[[1]]),
                   row.names=c(1:L))
print(table2)

COU=cumsum(COUNTRY)
midpoint=COU-COUNTRY/2
per<-round(COUNTRY/sum(COUNTRY)*100,2)
paste_num<-length(per)
print(paste_num)

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
class(Lab)
print(Lab)
class(lab)
print(lab)
Pie<-ggplot(table2,aes(x="",y=COUNTRY,fill=Category))+
  geom_bar(stat="identity")+
  coord_polar("y",start=0)+
  geom_text(aes(x=1,y=midpoint,label=lab))
print(Pie)


#交通工具搭乘人次長條圖
table3<-data.frame(Month=rep(c("18.1","18.2","18.3","18.4",
                               "18.5","18.6","18.7","18.8","18.9","18.10",
                               "18.11","18.12","19.1","19.2","19.3"),2),
                   Number=c(Tr_Pass,hsr_Pass[1:15]),
                   Category=factor(rep(c("train","high_speed_rail"),each=15)))
print(table3)

table3$Month<-factor(table3$Month,
                     levels=c("18.1","18.2","18.3","18.4",
                              "18.5","18.6","18.7","18.8","18.9","18.10",
                              "18.11","18.12","19.1","19.2","19.3"),
                     ordered=T)
Bar1<-ggplot(data=table3,aes(x=Month,y=Number,fill=Category)) +
  geom_bar(stat="identity")
print(Bar1)

Bar2<-ggplot(data=table3,aes(x=Month,y=Number,fill=Category)) +
  geom_bar(stat="identity",position="dodge")
print(Bar2)


#火車每日進出站總人次面積圖
Tr_KS<-rbind(Tr18_KS,Tr19_KS)
Tr_KS<-Tr_KS %>%
  mutate(Num.=In+Out,Date=ymd(BOARD_DATE))
head(Tr_KS)
tail(Tr_KS)
class(Tr_KS)
table4<-data.frame(Date=Tr_KS$Date,
                Num=Tr_KS$Num.,
                station=Tr_KS$STOP_NAME)
head(table4)
tail(table4)
class(table4$Date)
Area<-ggplot(table4,aes(x=Date,y=Num,fill=station))+
  geom_area(position="stack")+
  scale_x_date(date_breaks = "2 month")
print(Area)