from konlpy.tag import Okt
import os
import sys
import urllib.request
import json
import codecs
import platform
import os
import cx_Oracle
sys.stdout = codecs.getwriter('utf8')(sys.stdout.buffer)
keyword = sys.argv[2:]
# keyword = ['연극', '영화', '공연']
word = ""
for key in keyword:
    word += key+" "
word = word.replace(" ", ",")[:-1]
print(word)

count = 1
list = []
o = Okt()
temp = {}
wordcount = 30
for i in range(1, 6):
    client_id = "9eYRtkGNmEzbrUhDYxym"
    client_secret = "QFU3tG14u2"
    encText = urllib.parse.quote(word)
    url = "https://openapi.naver.com/v1/search/blog?start=" + str(count) + "&display=100&query=" + encText  # json 결과
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
toplist = []
for t2 in temp2[:wordcount]:
    t2 = str(t2).replace("'", '"')
    t2 = t2.replace('(', '').replace(')', '')
    toplist.append(t2)
print(toplist)

os.environ["NLS_LANG"] = ".UTF8"
connection = cx_Oracle.connect("c##branddog/12345@402-oracle:1521/orcl")
cur = connection.cursor()
query = "insert into culturereword values(culturereword_seq.nextval, '"+ word +"'"
for i in range(wordcount):
    query += ", '" + toplist[i] + "'"
query += ")"
print(query)

cur.execute(query)
connection.commit()
connection.close()



