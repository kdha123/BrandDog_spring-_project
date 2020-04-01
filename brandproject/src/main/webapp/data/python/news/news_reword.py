from konlpy.tag import Okt
import os
import sys
import urllib.request
import json
import codecs
import platform
import os
import cx_Oracle
# 네이버 블로그에서 '봄'을 검색하여 1000개의 자료를 spring.csv를 만들어서 넣어라
sys.stdout = codecs.getwriter('utf8')(sys.stdout.buffer)
word = sys.argv[1]
count = 1
list = []
o = Okt()
temp = {}
wordcount = 10
for i in range(1, 6):
    client_id = "hVv8LeNTyyMyn87KIYOL"
    client_secret = "ih0TigXoyF"
    encText = urllib.parse.quote(word)
    url = "https://openapi.naver.com/v1/search/news?start=" + str(count) + "&display=100&query=" + encText  # json 결과
    # url = "https://openapi.naver.com/v1/search/blog.xml?query=" + encText # xml 결과
    # print(url)
    request = urllib.request.Request(url)
    request.add_header("X-Naver-Client-Id", client_id)
    request.add_header("X-Naver-Client-Secret", client_secret)
    response = urllib.request.urlopen(request)
    rescode = response.getcode()
    if (rescode == 200):
        response_body = response.read()
        result = response_body.decode('utf-8')
    else:
        print("Error Code:" + rescode)
    result = json.loads(result)
    print(i, '번째')

    count = count + 100

    for dic in result['items']:
        title = dic['title']
        description = dic['description']
        retitle = "<b>"+str(word)+"</b>"
        redescription = "<b>"+str(word)+"</b>"
        title = title.replace(retitle, word)
        description = description.replace(redescription, word)
        # print(title)
        # print(description)
        str1 = '{},{}\n'.format(title, description)
        list.append(str1)
# print(list)

for t in list:
    malist = o.pos(t)  # [('단어','품사'),('단어','품사')....]
    # print(malist)
    # print(len(malist))
    for mal in malist:
        if (mal[1] == 'Noun') & (len(mal[0]) != 1):
            if not (mal[0] in temp):
                temp[mal[0]] = 0
            temp[mal[0]] = temp[mal[0]] + 1
# print(temp)
temp2 = sorted(temp.items(), key=lambda x:x[1], reverse=True)
# print(toplist[0])
# 검색어 정리
word2 = word.split(',')
temp3 = []
for w in word2:
    w = w.strip()
    temp3.append(w)
print('search : ',temp3)
temp4 = []
for t in temp2:
    if t[0] not in temp3:
        temp4.append(t)
print(temp4)

toplist = []
for t2 in temp4[:wordcount]:
    t2 = str(t2).replace("'", '"')
    t2 = t2.replace('(', '').replace(')', '')
    toplist.append(t2)
print("toplist : ", toplist)
os.environ["NLS_LANG"] = ".UTF8"
connection = cx_Oracle.connect("c##branddog/12345@402-oracle:1521/orcl")
cur = connection.cursor()
query = "insert into newsreword values(newsreword_seq.nextval, '"+ word +"'"
for i in range(wordcount):
    query += ", '" + toplist[i] + "'"
query += ")"
# print(query)

cur.execute(query)
connection.commit()
connection.close()



