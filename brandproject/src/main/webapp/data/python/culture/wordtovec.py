# -*- encoding: utf-8 -*-
import pandas as pd
import seaborn as sns
import sys
import urllib.request
import json
import io
from konlpy.tag import Okt
import nltk

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding="utf-8")
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding="utf-8")
# print(sys.stdin.encoding)
# print(sys.stdout.encoding)    # f = sys.argv[1].encode('utf-8')
f = sys.argv[1]
# f = f.decode('utf-8')
# print(f, type(f))
# search = str(sys.argv[1])
client_id = "9eYRtkGNmEzbrUhDYxym"
client_secret = "QFU3tG14u2"
encText = urllib.parse.quote(f)
url = "https://openapi.naver.com/v1/search/blog.json?display=100&query=" + encText # json 결과
request = urllib.request.Request(url)
request.add_header("X-Naver-Client-Id",client_id)
request.add_header("X-Naver-Client-Secret",client_secret)
response = urllib.request.urlopen(request)
rescode = response.getcode()
if(rescode==200):
    response_body = response.read()
    result = response_body.decode('utf-8')
else:
    print("Error Code:" + rescode)
tojson = json.loads(result)
# print(tojson)
str1 = []
for dic in tojson['items']:
    description = dic['description']
    description = description.replace('<b>'+f+'</b>', f)
    description = description.replace(',', ' ')
    str2 = '{}'.format(description)
    str1.append(str2)
# print(str1)
source = ""
for i in str1:
    source += i
o = Okt()
nouns = o.nouns(source)
nouns = [n for n in nouns if len(n) != 1]
text = nltk.Text(nouns)
data = text.vocab()
data30 = data.most_common(30)
dic = dict(data30)
print(dic)