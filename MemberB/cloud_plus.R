library(rvest)
library(jiebaRD)
library(jiebaR)
library(NLP)
library(tm)
library(tmcn)
library(RColorBrewer)
library(wordcloud)
library(dplyr)
library(ggplot2)
library(knitr)

dcard_news<-read.csv("c:/users/chris/Documents/GitHub/Final-Topic__RICH/MemberB/dcard_change.csv")
View(dcard_news)
class(dcard_news)
class(dcard_news$Comment)
head(dcard_news$Comment)
tit<-dcard_news$Title<-as.character(dcard_news$Title)
tex<-dcard_news$Text<-as.character(dcard_news$Text)
com<-dcard_news$Comment<-as.character(dcard_news$Comment)
head(dcard_news$Title)

cutter=worker()
Tit<-cutter[(tit)]
Tex<-cutter[(tex)]
Com<-cutter[(com)]
head(Tit)

Tit<-gsub("[A-Za-z0-9]","",Tit)
not<-which(Tit=="")
Tit<-Tit[-not]
head(Tit)

Tit_cl<-table(Tit)
head(sort(Tit_cl, decreasing=T))
wordcloud(names(Tit_cl),Tit_cl,min.Tit_cl=5,max.words=50,
          colors=rainbow(length(row.names(Tit_cl))))


Tex<-gsub("[A-Za-z0-9]","",Tex)
not<-which(Tex=="")
Tex<-Tex[-not]
head(Tex)

Tex_cl<-table(Tex)
head(sort(Tex_cl, decreasing=T))
wordcloud(names(Tex_cl),Tex_cl,min.Tex_cl=5,max.words=50)


Com<-gsub("[A-Za-z0-9]","",Com)
not<-which(Com=="")
Com<-Com[-not]
head(Com)

Com_cl<-table(Com)
head(sort(Com_cl, decreasing=T))
wordcloud(names(Com_cl),Com_cl,min.Com_cl=5,max.words=50)