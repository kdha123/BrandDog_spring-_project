# -*- encoding: utf-8 -*-
from urllib.parse import quote_plus
import cx_Oracle
from bs4 import BeautifulSoup
import urllib.request as req
from konlpy.tag import Okt
import nltk

import io
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding="utf-8")
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding="utf-8")

f = sys.argv[1]
baseurl = 'https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso=&post_blogurl=&post_blogurl_without=&query='
baseurl1 = '&sm=tab_pge&srchby=all&st=sim&where=post&start='
plusurl = f
main = []
for i in range(10, 100, 10):
    url = baseurl + quote_plus(plusurl) + baseurl1 + str(i)
    # print(url)
    res = req.urlopen(url)
    soup = BeautifulSoup(res, "html.parser")
    text1 = soup.find_all(class_="sh_blog_title _sp_each_url _sp_each_title")
    text2 = soup.find_all(class_="sh_blog_passage")

    for a, b in zip(text1, text2):
        title = a.get('title')
        text = b.text
        str1 = '{} {}'.format(title, text)
        main.append(str1)
    # print(main)
s = ''.join(main)
# print(s)
o = Okt()
nouns = o.nouns(s)
nouns=[n for n in nouns if (len(n)!=1)]
#print(nouns)
text3 = nltk.Text(nouns)
data = text3.vocab()
data30 = data.most_common(20)


a1=data30[0]
a2=data30[1]
a3=data30[2]
a4=data30[3]
a5=data30[4]
a6=data30[5]
a7=data30[6]
a8=data30[7]
a9=data30[8]
a10=data30[9]
a11=data30[10]

a2=str(a2)
a3=str(a3)
a4=str(a4)
a5=str(a5)
a6=str(a6)
a7=str(a7)
a8=str(a8)
a9=str(a9)
a10=str(a10)
a11=str(a11)

a11=a11.replace('(','')
a11=a11.replace(')','')
a2=a2.replace('(','')
a2=a2.replace(')','')
a3=a3.replace('(','')
a3=a3.replace(')','')
a4=a4.replace('(','')
a4=a4.replace(')','')
a5=a5.replace('(','')
a5=a5.replace(')','')
a6=a6.replace('(','')
a6=a6.replace(')','')
a7=a7.replace('(','')
a7=a7.replace(')','')
a8=a8.replace('(','')
a8=a8.replace(')','')
a9=a9.replace('(','')
a9=a9.replace(')','')
a10=a10.replace('(','')
a10=a10.replace(')','')



conn = cx_Oracle.connect("c##branddog/12345@402-oracle:1521/orcl")

cur = conn.cursor()


query1 = "insert into foodreword(no, TITLE, word1, word2, word3, word4,word5, word6, word7, word8,word9, word10) VALUES (foodReWord_seq.nextval,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12)"
# query = "select * from test"
cur.execute(query1,(plusurl,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11))
# cur.execute(query)

# for x in cur:
#     print(x)

cur.close()
conn.commit()
conn.close()
print('저장 완료')