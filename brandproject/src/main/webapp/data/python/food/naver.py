#-*- coding: utf-8 -*-
import os
import cx_Oracle
import io
import sys
import json
sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding="utf-8")

def setAges(age):
    ages = "["
    for i in age:
        if i == '1':
            i = '\"1\", '
            ages += i
        elif i == '2':
            i = '\"2\", '
            ages += i
        elif i == '3':
            i = '\"3\", '
            ages += i
        elif i is '4':
            i = '\"4\", '
            ages += i
        elif i is '5':
            i = '\"5\", '
            ages += i
        elif i is '6':
            i = '\"6\", '
            ages += i
        elif i is '7':
            i = '\"7\", '
            ages += i
        elif i is '8':
            i = '\"8\", '
            ages += i
        elif i is '9':
            i = '\"9\", '
            ages += i
        elif i == '10':
            i = '\"10\", '
            ages += i
        elif i == '11':
            i = '\"11\", '
            ages += i
    pos = ages.rindex(",")
    ages = ages[:pos]
    ages += "]"
    # print("ages :", ages)

    return ages

f = sys.argv[1]
f2 = sys.argv[2]
f3 = sys.argv[3]
f4 = sys.argv[4]
f5 = sys.argv[5]
f6 = sys.argv[6]
f6=f6.split(',')
f6=setAges(f6)

print('-----')
print(f)
print(f2)
print(f3)
print(f4)
print(f5)
print(f6)
print('-----')




import urllib.request
client_id = "BUj8OdhkJaPYxdYqdBVG"
client_secret = "fBfWN5yEfA"
url = "https://openapi.naver.com/v1/datalab/search";

body1 = "{\"startDate\":\""+f2+"\"," \
       "\"endDate\":\""+f3+"\"," \
       "\"timeUnit\":\""+f4+"\"," \
       "\"keywordGroups\":[{\"groupName\":\"음식\"," \
       "\"keywords\":[\""+f+"\"]}]," \
        "\"ages\":"+f6+"," \
        "\"gender\":\""+f5+"\"" "}"

if(f5=='t'):
    body1 = "{\"startDate\":\""+f2+"\"," \
       "\"endDate\":\""+f3+"\"," \
       "\"timeUnit\":\""+f4+"\"," \
       "\"keywordGroups\":[{\"groupName\":\"음식\"," \
       "\"keywords\":[\""+f+"\"]}]," \
        "\"ages\":"+f6+ "}"






print(body1)


request = urllib.request.Request(url)
request.add_header("X-Naver-Client-Id",client_id)
request.add_header("X-Naver-Client-Secret",client_secret)
request.add_header("Content-Type","application/json")
response = urllib.request.urlopen(request, data=body1.encode("utf-8"))
rescode = response.getcode()
if(rescode==200):
    response_body = response.read()
    data=response_body.decode('utf-8')
else:
    print("Error Code:" + rescode)
data=json.loads(data)
startDate=data['startDate']
endDate=data['endDate']
timeUnit=data['timeUnit']
keywordGroups=data.items()
qqq=data['results'][0]

aa=qqq['data']


t=[]
for b in aa:
    e=[]
    c=b['period']

    d=b['ratio']
    e.append(c)
    e.append(d)
    t.append(e)
t=str(t)
print(f)
print(t)



print(endDate)
print(timeUnit)

conn = cx_Oracle.connect("c##branddog/12345@402-oracle:1521/orcl")

cur = conn.cursor()



query1 = "insert into foodsearchtrend(no, startdate, enddate, timeunit,title, keywords, data) VALUES (foodSearchTrend_seq.nextval,:2,:3,:4,:5,:6,:7)"
food='음식'
cur.execute(query1,(startDate,endDate,timeUnit,f,food,t))


cur.close()
conn.commit()
conn.close()
print('저장 완료')


print(startDate,endDate,timeUnit,keywordGroups)
