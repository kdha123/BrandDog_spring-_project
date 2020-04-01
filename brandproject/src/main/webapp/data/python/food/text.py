from urllib.parse import quote_plus
from bs4 import BeautifulSoup
import urllib.request as req
from konlpy.tag import Okt
import nltk
from wordcloud import WordCloud
import matplotlib.pyplot as plt

baseurl='https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso=&post_blogurl=&post_blogurl_without=&query='
baseurl1='&sm=tab_pge&srchby=all&st=sim&where=post&start='
plusurl= input('입력')
main=[]
for i in range(10,1000,10):
    url = baseurl + quote_plus(plusurl)+baseurl1+str(i)
    # print(url)
    res=req.urlopen(url)
    soup=BeautifulSoup(res,"html.parser")
    text1=soup.find_all(class_="sh_blog_title _sp_each_url _sp_each_title")
    text2=soup.find_all(class_="sh_blog_passage")
    # print(text1)

    # print(111)
    # print(text2)
    # print(2)


    for a,b in zip(text1,text2):
        title=a.get('title')
        text=b.text
        str1 = '{} {}'.format(title, text)
        main.append(str1)
# print(main)
s= ''.join(main)
# print(s)
o=Okt()
nouns=o.nouns(s)
print(nouns)
text3=nltk.Text(nouns)
data=text3.vocab()
data30=data.most_common(300)
print(data30)
dic =dict(data30)
wc=WordCloud(font_path='malgun.ttf')
w=wc.generate_from_frequencies(dic)
plt.imshow(w)
plt.axis('off')
plt.show()


# print(nouns)