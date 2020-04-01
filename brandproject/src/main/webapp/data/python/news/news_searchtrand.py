import os
import sys
import urllib.request
import codecs
import json
import cx_Oracle
sys.stdout = codecs.getwriter('utf8')(sys.stdout.buffer)

word = sys.argv[1]
word2 = word.split(",")
word3 = []
for w in word2:
    w = w.strip()
    word3.append(w)
word3 = str(word3).replace("'", "\"")

startDate = sys.argv[2]
endDate = sys.argv[3]
timeUnit = sys.argv[4]

ages = sys.argv[5]
ages2 = ages.split(",")
ages3 = []
for a in ages2:
    a = a.strip()
    ages3.append(a)
ages3 = str(ages3).replace("'", "\"")

gender = sys.argv[6]
groupName = '뉴스'

client_id = "GBRUrcJIYVensBeXmG_E"
client_secret = "YDVWuTKJXp"
url = "https://openapi.naver.com/v1/datalab/search";
body = "{\"startDate\":\""+startDate+"\",\"endDate\":\""+endDate+"\",\"timeUnit\":\""+timeUnit+"\",\"keywordGroups\":[{\"groupName\":\""+groupName+"\",\"keywords\":"+word3+"}]";
if ages is not None:
    body += ",\"ages\":"+ ages3
if gender in ['f', 'm']:
    body += ",\"gender\":\""+ gender + "\""
body += "}";
print(body)
request = urllib.request.Request(url)
request.add_header("X-Naver-Client-Id",client_id)
request.add_header("X-Naver-Client-Secret",client_secret)
request.add_header("Content-Type","application/json")
response = urllib.request.urlopen(request, data=body.encode("utf-8"))
rescode = response.getcode()
if(rescode==200):
    response_body = response.read()
    result = response_body.decode('utf-8')
else:
    print("Error Code:" + rescode)

trandlist = []
searchdata = json.loads(result)
# 구글 차트에 맞게 result를 data로 가공
data2 = searchdata['results']
print(data2)
print(data2[0]['data'][0]['period'])
print(len(data2[0]['data']))
for i in range(len(data2[0]['data'])):
    temp = []
    # print(data2[0]['data'][i]['period'])
    # print(data2[0]['data'][i]['ratio'])
    dateform = "new Date("+str(data2[0]['data'][i]['period'])+")"
    # print(dateform)
    dateform = dateform.replace('-', ',')
    temp.append(dateform)
    temp.append(data2[0]['data'][i]['ratio'])
    # print(temp)
    trandlist.append(temp)

data = str(trandlist).replace("'", "")
print(data)
# startDate
startDate = searchdata['startDate']
print(startDate)
# endDate
endDate = searchdata['endDate']
print(endDate)
# timeUnit
timeUnit = searchdata['timeUnit']
print(timeUnit)
# keywords
keywords = searchdata['results'][0]['keywords']
keywords = str(keywords).replace("'", "").replace('[', '').replace(']', '')
print(keywords)

os.environ["NLS_LANG"] = ".UTF8"
connection = cx_Oracle.connect("c##branddog/12345@402-oracle:1521/orcl")
cur = connection.cursor()
query = "insert into newssearchtrend values(newssearchtrend_seq.nextval, '" + startDate + "'" \
    ", '" + endDate + "', '" + timeUnit + "', '뉴스', '" + keywords + "', '"+ data + "')"
print(query)

cur.execute(query)
connection.commit()
connection.close()