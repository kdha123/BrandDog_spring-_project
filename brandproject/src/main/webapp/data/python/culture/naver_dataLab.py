# -*- coding: utf-8 -*-
import os
import sys
import urllib.request
import json
import sys
import codecs
import db_connect
import time


def setAges(age):
    ages = "["
    for i in age:
        if i is '1':
            i = '\"1\", '
            ages += i
        elif i is '2':
            i = '\"2\", '
            ages += i
        elif i is '3':
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
        elif i is '10':
            i = '\"10\", '
            ages += i
        elif i is '11':
            i = '\"11\", '
            ages += i
    pos = ages.rindex(",")
    ages = ages[:pos]
    ages += "]"
    # print("ages :", ages)

    return ages


def setTime(startDate, endDate, timeUnit, gender):
    startDate = '\"' + startDate + '\"'
    endDate = '\"' + endDate + '\"'
    timeUnit = '\"' + timeUnit + '\"'
    gender = '\"' + gender + '\"'
    # print("startDate :", startDate)
    return startDate, endDate, timeUnit, gender


def test(keywords, startDate, endDate, timeUnit, ages, gender):
    client_id = "qqQo4r_ThafPGUKfUGW3"
    client_secret = "j6H5dvQ7qa"
    url = "https://openapi.naver.com/v1/datalab/search";
    body = "{\"startDate\":"+startDate+"," \
           "\"endDate\":"+endDate+"," \
           "\"timeUnit\":"+timeUnit+"," \
           "\"keywordGroups\":[{\"groupName\":\"문화\",\"keywords\":["+keywords+"]}]" \
           ",\"device\":\"pc\"" \
           ",\"ages\":"+ages
    if not gender == "\"t\"":
        body += ",\"gender\":" + gender
    body += "}"
    print(body)
    request = urllib.request.Request(url)
    request.add_header("X-Naver-Client-Id", client_id)
    request.add_header("X-Naver-Client-Secret", client_secret)
    request.add_header("Content-Type", "application/json")
    response = urllib.request.urlopen(request, data=body.encode("utf-8"))
    rescode = response.getcode()
    if rescode is 200:
        response_body = response.read()
        result = response_body.decode('utf-8')
        # print(response_body.decode('utf-8'))
    else:
        print("Error Code:" + rescode)

    # print(result)
    # print(type(result))

    toJson = json.loads(result)
    return toJson


def setKeyWords(data):
    keywords = ""
    for key in data:
        keywords += '\"' + key + '\", '
    pos = keywords.rindex(",")
    keywords = keywords[:pos]
    # keywords += "]"
    print("keywords :", keywords)
    keywords = keywords.replace(" ","")
    return keywords

start = time.time()
sys.stdout = codecs.getwriter('utf8')(sys.stdout.buffer)
startDate = sys.argv[1]
endDate = sys.argv[2]
timeUnit = sys.argv[3]
gender = sys.argv[4]
keyage = sys.argv[5:]
keywords = keyage[1:]
age = keyage[0]
keywords = setKeyWords(keywords)
# keywords = ["연극", "영화"]
# ----------------------------------------------------------
print(age)
print(keywords, type(keywords))
# keywords = "\",\"".join(keywords)
# print(keywords)
# "\"keywordGroups\":[{\"groupName\":\""+key+"\",\"keywords\":[\"연극\",\"영화\"]}]" \
startDate, endDate, timeUnit, gender = setTime(startDate, endDate, timeUnit, gender)
ages = setAges(age)
print(startDate, endDate, timeUnit, gender)

# ---------------------------------------------------
json = test(keywords, startDate, endDate, timeUnit, ages, gender)
print(json)
dic = str(json['results'][0])
dic = dic.replace("'", '"')
dic = eval(dic)
title = dic["title"]
keywords = dic["keywords"]
data = dic["data"]
dt = []
for d in data:
    print(d)
    print(d['period'])
    print(d['ratio'])
    dt.append([d['period'], d['ratio']])
print(title)
print(keywords)
print(dt)
db_connect.DBConnect.saveData(json, title, keywords, dt)
print("DB 저장 성공")
print(time.time() - start)
