from urllib.request import urlopen
from urllib.parse import quote_plus
from bs4 import BeautifulSoup
import urllib.request as req
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

baseurl='https://search.naver.com/search.naver?where=image&sm=tab_jum&query='
plusurl= input('입력')

url = baseurl + quote_plus(plusurl) #한글처리
# print(url)
res=req.urlopen(url)
soup=BeautifulSoup(res,"html.parser")
image=soup.find_all("img")


c=[]
for a in image:
    b=a.get('data-source')
    c.append(b)
d=c[1]
e=c[2]
f=c[3]
print(d)
print(e)
print(f)
