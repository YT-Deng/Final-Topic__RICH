library(tidyverse)
library(rvest)
library(stringr)
library(jiebaR)
library(tmcn)
library(jiebaRD)
library(wordcloud)
library(rvest)
library(dplyr)

gossiping.session <- html_session(url = "https://www.ptt.cc/bbs/Gossiping")
gossiping.form <- gossiping.session %>%
  html_node("form") %>%
  html_form()
gossiping.form
gossiping <- submit_form(
  session = gossiping.session,
  form = gossiping.form,
  submit = "yes"
)
gossiping

links <- c()
titles <- c()


for(page_id in 206:210){
  target_url <- paste0("https://www.ptt.cc/bbs/Gossiping/search?page=", page_id,"&q=%E9%9F%93%E5%9C%8B%E7%91%9C")
  gossiping <- gossiping %>%
    jump_to(target_url)
  new_links <-  gossiping %>%
    html_nodes(".title a") %>%
    html_attr("href")
  links <- c(links, new_links)
  new_titles <- gossiping %>%
    html_nodes(".title a") %>%
    html_text
  titles <- c(titles, new_titles)
}


contents <- c()

for(link in links){
  new_content <- gossiping %>%
    jump_to(link) %>%
    html_nodes(
      xpath = '//div[@id="main-content"]/node()[not(self::div)]'
    ) %>%
    html_text %>%
    paste0(collapse="")
  contents <- c(contents, new_content)
  print(link)
}

data <- data.frame(titles, links, contents)
View(data)

con<-as.character(data$contents)
cutter=worker()
CON<-cutter[(con)]

CON<-gsub("[A-Za-z0-9]","",CON)
not<-which(CON=="")
CON<-CON[-not]

CON_2<-table(CON)
wordcloud(names(CON_2),CON_2,min.CON_2=5,max.words=50,
          colors=rainbow(length(row.names(CON_2))))


tit<-as.character(data$titles)
TIT<-cutter[(tit)]

TIT<-gsub("[A-Za-z0-9]","",TIT)
not<-which(TIT=="")
TIT<-TIT[-not]

TIT_2<-table(TIT)
wordcloud(names(TIT_2),TIT_2,min.TIT_2=5,max.words=30,
          colors=rainbow(length(row.names(TIT_2))))
