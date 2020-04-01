from builtins import set

import cx_Oracle
import os


class DBConnect:
    def searchTrend(json, title, key, data):
        # 한글처리 구글링!!
        os.environ["NLS_LANG"] = ".UTF8"

        # 연결
        # connection = cx_Oracle.connect("c##branddog/12345@402-oracle:1521/orcl")
        connection = cx_Oracle.connect("c##branddog/12345@106.243.249.72:4521/orcl")
        cur = connection.cursor()

        getSequence = "select TRAVELSEARCHTREND_SEQ.nextval from dual"
        cur.execute(getSequence)
        no = ""
        for result in cur:
            no = result
        no = no[0]
        print('=' * 50)
        print("no :", no)
        print("no :", type(no))

        query = "INSERT INTO TRAVELSEARCHTREND VALUES(" + str(no) + ", '" + json['startDate'] + "', '" + json['endDate'] \
                + "', '" + json['timeUnit'] + "', '" + title + "', '" + str(key) + "', '" + data + "')"

        print(query)

        cur.execute(query)

        # 파이썬은 commit을 해줘야 commit이 된다.
        connection.commit()

        connection.close()

        return no

    def getWord(list):
        wordList = []
        for i in range(0, 30):
            list[i] = str(list[i]).replace("'", '"')
            word = "'" + list[i] + "'"
            wordList.append(word)

        return wordList

    def relatedWord(title, list):
        # 한글처리 구글링!!
        os.environ["NLS_LANG"] = ".UTF8"

        word = DBConnect.getWord(list)

        # 연결
        # connection = cx_Oracle.connect("c##branddog/12345@402-oracle:1521/orcl")
        connection = cx_Oracle.connect("c##branddog/12345@106.243.249.72:4521/orcl")
        cur = connection.cursor()

        query = "INSERT INTO TRAVELREWORD VALUES(TRAVELREWORD_seq.nextval, " + title
        for w in word:
            query += ", " + w
        query += ")"

        print(query)

        cur.execute(query)

        # 파이썬은 commit을 해줘야 commit이 된다.
        connection.commit()

        connection.close()
