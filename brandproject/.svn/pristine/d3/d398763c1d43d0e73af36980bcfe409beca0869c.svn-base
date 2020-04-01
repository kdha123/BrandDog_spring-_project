# -*- coding: utf-8 -*-
import urllib.request
import json
import sys
import codecs
import db_connect
import time

# 한글 처리
sys.stdout = codecs.getwriter('utf8')(sys.stdout.buffer)


class SearchTrend:
    def setAges(age):
        ages = []
        age2 = age.split(",")
        for i in age2:
            i = i.strip()
            ages.append(i)
        ages = str(ages).replace("'", "")
        # print("ages :", ages)

        return ages

    def setStartDate(startDate):
        startDate = '\"' + startDate + '\"'
        # print("startDate :", startDate)

        return startDate

    def setEndDate(endDate):
        endDate = '\"' + endDate + '\"'
        # print("endDate :", endDate)

        return endDate

    def setTimeUnit(timeUnit):
        timeUnit = '\"' + timeUnit + '\"'
        # print("timeUnit :", timeUnit)

        return timeUnit

    def setGender(gender):
        gender = '\"' + gender + '\"'
        # print("timeUnit :", timeUnit)

        return gender

    def startSearchTrend(startDate, endDate, timeUnit, initGender, age, keyword):
        client_id = "YxCc2x4uqYQc2Y1yYZD6"
        client_secret = "tTouSLmV1q"
        url = "https://openapi.naver.com/v1/datalab/search";

        startDate = startDate
        startDate = SearchTrend.setStartDate(startDate)

        endDate = endDate
        endDate = SearchTrend.setEndDate(endDate)

        timeUnit = timeUnit
        timeUnit = SearchTrend.setTimeUnit(timeUnit)

        gender = initGender
        gender = SearchTrend.setGender(gender)

        ages = age
        if ages is not 't':
            ages = SearchTrend.setAges(ages)

        body = "{\"startDate\":" + startDate + ", \"endDate\":" + endDate + ", \"timeUnit\":" + timeUnit + "" \
                ",\"keywordGroups\":[{\"groupName\":\"여행\",\"keywords\":[" + keyword + "]}] "
        if initGender is not 't':
            body += ",\"gender\":" + gender
        if ages is not 't':
            body += ", \"ages\":" + str(ages)
        body += "}";

        print("body :", body)

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
        # print(toJson)
        # print(type(toJson))

        return toJson

    def start(startDate, endDate, timeUnit, gender, keywords, age):
        # 시간 체크
        start = time.time()

        # 넘어오는 데이터
        keyword = keywords
        print("넘어오는 데이터 :", keyword)

        json = SearchTrend.startSearchTrend(startDate, endDate, timeUnit, gender, age, keyword)
        print("원본 결과 값", json)

        # sDate = json['startDate']
        # # print("startDate :", sDate)
        #
        # eDate = json['endDate']
        # # print("endDate :", eDate)
        #
        # timeU = json['timeUnit']
        # # print("timeUnit :", timeU)

        # 타이틀
        title = json['results'][0]['title']
        # print("title :", title)

        # keywords
        key = str(json['results'][0]['keywords'])
        key = key.replace("'", '"')
        # print("key :", key)

        listData = []
        for i in json['results'][0]['data']:
            l = [i['period'], i['ratio']]
            # print(l)
            listData.append(l)
            # print(listData)

        listData = str(listData)
        listData = listData.replace("'", '"')
        # print("listData :", listData)

        no = db_connect.DBConnect.searchTrend(json, title, key, listData)
        print("DB 저장 성공")

        print("걸린 시간(초) :", time.time() - start)
        print("no :", no)

        return no