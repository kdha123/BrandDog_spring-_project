import cx_Oracle
# 파이참에서 파이썬 버전 확인
import platform
import os
import datetime

print(platform.architecture())
# 출력내용 : ('32bit', 'WindowsPE')


class DBConnect:
    def saveData(json, title, keywords, dt):
        # 한글처리 구글링!!
        os.environ["NLS_LANG"] = ".UTF8"

        # 1. cx-oracle 다운로드 - pip 업데이트
        # 2. instantclient 다운로드 (https://www.oracle.com/database/technologies/instant-client/winx64-64-downloads.html)
        # 3. 다운로드 후 압축을 풀고 경로를 환경변수에 지정

        # PATH = instantclient 다운 받은 폴더 경로

        # ORACLE_HOME = instantclient 다운 받은 폴더 경로

        # TNS_ADMIN = D:\app\hong\virtual\product\12.2.0\dbhome_1\network\admin

        # NLS_LANG = KOREAN_KOREA.KO16MSWIN949

        dt = str(dt)
        dt = dt.replace("'",'"')
        keywords = str(keywords)
        keywords = keywords.replace("'",'"')

        # 4. 연결
        connection = cx_Oracle.connect("c##branddog/12345@402-oracle:1521/orcl")
        cur = connection.cursor()

        query = "insert into culturesearchtrend values(culturesearchtrend_seq.nextval," + "'" + json['startDate'] + "', '" + json['endDate'] \
                + "' , '" + json['timeUnit'] + "' ," + "'" + title + "' ,"+ "'" + keywords + "' ,"+ "'" + dt + "')"

        print(query)
        cur.execute(query)

        # for x in cur:
        #     print(x)

        # 파이썬은 commit을 해줘야 commit이 된다.
        connection.commit()

        connection.close()