import requests
import json
import datetime
import csv
import time
from fake_useragent import UserAgent 

'''
看板資訊(meta)	https://www.dcard.tw/_api/forums
文章資訊(meta)	https://www.dcard.tw/_api/forums/{看板名稱}/posts
文章內文	https://www.dcard.tw/_api/posts/{文章編號}
文章內引用連結	https://www.dcard.tw/_api/{文章編號}/links
文章內留言	https://www.dcard.tw/_api/posts/{文章編號}/comments
'''
dcardRootUrl = 'https://www.dcard.tw/_api/'#dcard的API root URL
forumsMode = 'forums/'#看板資訊
alias = 'trending/'#時事版
postsMode = 'posts/'#文章資訊
commentsMode = 'comments'#留言資訊

firstArticleID = 228016514#2018年1月的第一篇文章
lastArticleID = 231403545#2019年5月的最後一篇文章

articleID = 231285499
ForumUrl = dcardRootUrl + forumsMode + alias + 'posts?popular=false&before='
PostsUrl = dcardRootUrl + postsMode

def getForums():
    return json.loads(requests.get(ForumUrl + str(articleID)).text)

def getArticleContent():
    return json.loads(requests.get(PostsUrl + str(articleID)).text)['content']

def getComments():
    resDict = json.loads(requests.get(PostsUrl + str(articleID) + '/' + commentsMode).text)
    return [(resDict[index]['content'] if 'content' in resDict[index] else '') for index in range(0, len(resDict))]


with open('output.csv', 'w', newline='', encoding='utf-8-sig') as csvfile:
    writer = csv.writer(csvfile, delimiter=',')
    writer.writerow(['文章建立時間', '標題', '內文', '留言'])
    while articleID > firstArticleID:
        for article in getForums():
            createTime = article['createdAt']
            title = article['title']
            articleID = article['id']
            print(str(articleID) + ' ' + str(createTime) + ':' + title)
            writer.writerow([createTime, title, getArticleContent(), getComments()])
    csvfile.close()
