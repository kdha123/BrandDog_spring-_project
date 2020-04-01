-- BrandDog.com Table
-- DataBase는 프로젝트 진행 상황에 따라 유연하게 변경하도록 한다.
-- 각 Module의 이름이 정해지지 않았으므로 Module의 이름이 정해지면 테이블과 시퀀스 명을 바꿔준다.

-- **** 시퀀스 ****
-- **** 선그래프 관련 시퀀스 ****
-- 시퀀스 삭제
DROP SEQUENCE travelSearchTrend_seq;
DROP SEQUENCE foodSearchTrend_seq;
DROP SEQUENCE cultureSearchTrend_seq;
DROP SEQUENCE newsSearchTrend_seq;

DROP SEQUENCE travelReWord_seq;
DROP SEQUENCE cultureReWord_seq;
DROP SEQUENCE foodReWord_seq;
DROP SEQUENCE newsReWord_seq;
-- 시퀀스 생성
CREATE SEQUENCE travelSearchTrend_seq;
CREATE SEQUENCE foodSearchTrend_seq;
CREATE SEQUENCE cultureSearchTrend_seq;
CREATE SEQUENCE newsSearchTrend_seq;

CREATE SEQUENCE travelReWord_seq;
CREATE SEQUENCE cultureReWord_seq;
CREATE SEQUENCE foodReWord_seq;
CREATE SEQUENCE newsReWord_seq;

-- **** 테이블 ****
-- 테이블 삭제
Drop table travelSearchTrend;
Drop table foodSearchTrend;
Drop table cultureSearchTrend;
Drop table newsSearchTrend;

Drop table travelReWord;
Drop table foodReWord;
Drop table cultureReWord;
Drop table newsReWord;
-- **** 선그래프 관련 테이블 ****
-- 선그래프 -> 검색어 추이
-- startDate             string   조회 기간 시작 날짜(yyyy-mm-dd 형식).
-- endDate               string   조회 기간 종료 날짜(yyyy-mm-dd 형식)
-- timeUnit              string   구간 단위
-- results.title         string   주제어
-- results.data.period   string   구간별 시작 날짜(yyyy-mm-dd 형식)
-- results.data.ratio    string   구간별 검색량의 상대적 비율. 구간별 결과에서 가장 큰 값을 100으로 설정한 상댓값입니다.

-- Travel - SearchTrend 분석
CREATE TABLE travelSearchTrend(
  no NUMBER CONSTRAINT travelSearchTrend_no_pk PRIMARY KEY,
  startDate VARCHAR2(100) NOT NULL, -- 조회 기간 시작 날짜(yyyy-mm-dd 형식) -> API에서는 String으로 되어 있음. 처리 후 varchar로 해야 한다면 다시 테이블을 다시 만듬
  endDate VARCHAR2(100) NOT NULL, -- 조회 기간 종료 날짜(yyyy-mm-dd 형식)
  timeUnit VARCHAR2(100) NOT NULL, -- 구간 단위
  title VARCHAR2(300) NOT NULL, -- 주제어
  keywords VARCHAR2(300) NOT NULL,
  data varchar2(4000 byte) NOT NULL
  --period DATE NOT NULL, -- 구간별 시작 날짜(yyyy-mm-dd 형식)
  --ratio VARCHAR2(20) NOT NULL -- 구간별 검색량의 상대적 비율. 구간별 결과에서 가장 큰 값을 100으로 설정한 상댓값입니다. 
);

-- Culture - SearchTrend 분석
CREATE TABLE cultureSearchTrend(
  no NUMBER CONSTRAINT cultureSearchTrend_no_pk PRIMARY KEY,
  startDate VARCHAR2(100) NOT NULL, -- 조회 기간 시작 날짜(yyyy-mm-dd 형식) -> API에서는 String으로 되어 있음. 처리 후 varchar로 해야 한다면 다시 테이블을 다시 만듬
  endDate VARCHAR2(100) NOT NULL, -- 조회 기간 종료 날짜(yyyy-mm-dd 형식)
  timeUnit VARCHAR2(100) NOT NULL, -- 구간 단위
  title VARCHAR2(300) NOT NULL, -- 주제어
  keywords VARCHAR2(300) NOT NULL,
  data varchar2(4000 byte) NOT NULL
  --period DATE NOT NULL, -- 구간별 시작 날짜(yyyy-mm-dd 형식)
  --ratio VARCHAR2(20) NOT NULL -- 구간별 검색량의 상대적 비율. 구간별 결과에서 가장 큰 값을 100으로 설정한 상댓값입니다. 
);

-- Food - SearchTrend 분석
CREATE TABLE foodSearchTrend(
  no NUMBER CONSTRAINT foodSearchTrend_no_pk PRIMARY KEY,
  startDate VARCHAR2(100) NOT NULL, -- 조회 기간 시작 날짜(yyyy-mm-dd 형식) -> API에서는 String으로 되어 있음. 처리 후 varchar로 해야 한다면 다시 테이블을 다시 만듬
  endDate VARCHAR2(100) NOT NULL, -- 조회 기간 종료 날짜(yyyy-mm-dd 형식)
  timeUnit VARCHAR2(100) NOT NULL, -- 구간 단위
  title VARCHAR2(300) NOT NULL, -- 주제어
  keywords VARCHAR2(300) NOT NULL,
  data varchar2(4000 byte) NOT NULL
  --period DATE NOT NULL, -- 구간별 시작 날짜(yyyy-mm-dd 형식)
  --ratio VARCHAR2(20) NOT NULL -- 구간별 검색량의 상대적 비율. 구간별 결과에서 가장 큰 값을 100으로 설정한 상댓값입니다. 
);

-- News - SearchTrend 분석
CREATE TABLE newsSearchTrend(
  no NUMBER CONSTRAINT newsSearchTrend_no_pk PRIMARY KEY,
  startDate VARCHAR2(100) NOT NULL, -- 조회 기간 시작 날짜(yyyy-mm-dd 형식) -> API에서는 String으로 되어 있음. 처리 후 varchar로 해야 한다면 다시 테이블을 다시 만듬
  endDate VARCHAR2(100) NOT NULL, -- 조회 기간 종료 날짜(yyyy-mm-dd 형식)
  timeUnit VARCHAR2(100) NOT NULL, -- 구간 단위
  title VARCHAR2(300) NOT NULL, -- 주제어
  keywords VARCHAR2(300) NOT NULL,
  data varchar2(4000 byte) NOT NULL
  --period DATE NOT NULL, -- 구간별 시작 날짜(yyyy-mm-dd 형식)
  --ratio VARCHAR2(20) NOT NULL -- 구간별 검색량의 상대적 비율. 구간별 결과에서 가장 큰 값을 100으로 설정한 상댓값입니다. 
);

CREATE TABLE travelReWord(
 no NUMBER CONSTRAINT travelReWord_no_pk PRIMARY KEY,
 title VARCHAR2(300) NOT NULL,
 word1 VARCHAR2(300) NOT NULL,
 word2 VARCHAR2(300) NOT NULL,
 word3 VARCHAR2(300) NOT NULL,
 word4 VARCHAR2(300) NOT NULL,
 word5 VARCHAR2(300) NOT NULL,
 word6 VARCHAR2(300) NOT NULL,
 word7 VARCHAR2(300) NOT NULL,
 word8 VARCHAR2(300) NOT NULL,
 word9 VARCHAR2(300) NOT NULL,
 word10 VARCHAR2(300) NOT NULL,
 word11 VARCHAR2(300) NOT NULL,
 word12 VARCHAR2(300) NOT NULL,
 word13 VARCHAR2(300) NOT NULL,
 word14 VARCHAR2(300) NOT NULL,
 word15 VARCHAR2(300) NOT NULL,
 word16 VARCHAR2(300) NOT NULL,
 word17 VARCHAR2(300) NOT NULL,
 word18 VARCHAR2(300) NOT NULL,
 word19 VARCHAR2(300) NOT NULL,
 word20 VARCHAR2(300) NOT NULL,
 word21 VARCHAR2(300) NOT NULL,
 word22 VARCHAR2(300) NOT NULL,
 word23 VARCHAR2(300) NOT NULL,
 word24 VARCHAR2(300) NOT NULL,
 word25 VARCHAR2(300) NOT NULL,
 word26 VARCHAR2(300) NOT NULL,
 word27 VARCHAR2(300) NOT NULL,
 word28 VARCHAR2(300) NOT NULL,
 word29 VARCHAR2(300) NOT NULL,
 word30 VARCHAR2(300) NOT NULL
);

CREATE TABLE foodReWord(
 no NUMBER CONSTRAINT foodReWord_no_pk PRIMARY KEY,
 title VARCHAR2(300) NOT NULL,
 word1 VARCHAR2(300) NOT NULL,
 word2 VARCHAR2(300) NOT NULL,
 word3 VARCHAR2(300) NOT NULL,
 word4 VARCHAR2(300) NOT NULL,
 word5 VARCHAR2(300) NOT NULL,
 word6 VARCHAR2(300) NOT NULL,
 word7 VARCHAR2(300) NOT NULL,
 word8 VARCHAR2(300) NOT NULL,
 word9 VARCHAR2(300) NOT NULL,
 word10 VARCHAR2(300) NOT NULL
);

CREATE TABLE cultureReWord(
 no NUMBER CONSTRAINT cultureReWord_no_pk PRIMARY KEY,
 title VARCHAR2(300) NOT NULL,
 word1 VARCHAR2(300) NOT NULL,
 word2 VARCHAR2(300) NOT NULL,
 word3 VARCHAR2(300) NOT NULL,
 word4 VARCHAR2(300) NOT NULL,
 word5 VARCHAR2(300) NOT NULL,
 word6 VARCHAR2(300) NOT NULL,
 word7 VARCHAR2(300) NOT NULL,
 word8 VARCHAR2(300) NOT NULL,
 word9 VARCHAR2(300) NOT NULL,
 word10 VARCHAR2(300) NOT NULL,
 word11 VARCHAR2(300) NOT NULL,
 word12 VARCHAR2(300) NOT NULL,
 word13 VARCHAR2(300) NOT NULL,
 word14 VARCHAR2(300) NOT NULL,
 word15 VARCHAR2(300) NOT NULL,
 word16 VARCHAR2(300) NOT NULL,
 word17 VARCHAR2(300) NOT NULL,
 word18 VARCHAR2(300) NOT NULL,
 word19 VARCHAR2(300) NOT NULL,
 word20 VARCHAR2(300) NOT NULL,
 word21 VARCHAR2(300) NOT NULL,
 word22 VARCHAR2(300) NOT NULL,
 word23 VARCHAR2(300) NOT NULL,
 word24 VARCHAR2(300) NOT NULL,
 word25 VARCHAR2(300) NOT NULL,
 word26 VARCHAR2(300) NOT NULL,
 word27 VARCHAR2(300) NOT NULL,
 word28 VARCHAR2(300) NOT NULL,
 word29 VARCHAR2(300) NOT NULL,
 word30 VARCHAR2(300) NOT NULL
);

CREATE TABLE newsReWord(
 no NUMBER CONSTRAINT newsReWord_no_pk PRIMARY KEY,
 title VARCHAR2(300) NOT NULL,
 word1 VARCHAR2(300) NOT NULL,
 word2 VARCHAR2(300) NOT NULL,
 word3 VARCHAR2(300) NOT NULL,
 word4 VARCHAR2(300) NOT NULL,
 word5 VARCHAR2(300) NOT NULL,
 word6 VARCHAR2(300) NOT NULL,
 word7 VARCHAR2(300) NOT NULL,
 word8 VARCHAR2(300) NOT NULL,
 word9 VARCHAR2(300) NOT NULL,
 word10 VARCHAR2(300) NOT NULL
);

commit;
