from powernad.API import RelKwdStat

BASE_URL = 'https://api.naver.com'
API_KEY = '0100000000e6f08192a7eb775b12c1752efd08e0ee80d0e16ec2a63fb60874b416f52258eb'
SECRET_KEY = 'AQAAAADm8IGSp+t3WxLBdS79CODuK1rfQQEVFXOT4vC3H0yPWA=='
CUSTOMER_ID = '1888672'


def naverKwdApi(keyword):
    relKwdStat = RelKwdStat.RelKwdStat(BASE_URL,
                                       API_KEY,
                                       SECRET_KEY,
                                       CUSTOMER_ID)
    kwdDataList = relKwdStat.get_rel_kwd_stat_list(None,
                                                   hintKeywords=keyword,
                                                   showDetail='1')
    relKeyList = []
    monthPc = []
    monthMobile = []
    for outdata in kwdDataList:
        relKeyword = outdata.relKeyword  # 연관 키워드
        # print(relKeyword)
        relKeyList.append(relKeyword)
        monthlyPcQcCnt = outdata.monthlyPcQcCnt  # 30일간 PC 조회수
        monthPc.append(monthlyPcQcCnt)
        monthlyMobileQcCnt = outdata.monthlyMobileQcCnt  # 30일간 모바일 조회수
        monthMobile.append(monthlyMobileQcCnt)
        monthlyAvePcClkCnt = outdata.monthlyAvePcClkCnt  # 4주간 평균 PC 클릭수
        monthlyAveMobileClkCnt = outdata.monthlyAveMobileClkCnt  # 4주간 평균 모바일 클릭수
        monthlyAvePcCtr = outdata.monthlyAvePcCtr  # 4주간 평균 PC 클릭율
        monthlyAveMobileCtr = outdata.monthlyAveMobileCtr  # 4주간 평균 모바일 클릭율
        plAvgDepth = outdata.plAvgDepth  # 4주간 평균 PC 광고수
        compIdx = outdata.compIdx  # PC 광고 기반 경쟁력

    return relKeyList, monthPc, monthMobile


keyList, pcList, mobileList = naverKwdApi('')
print(keyList)
print(len(keyList))
print(pcList)
print(len(pcList))
print(mobileList)
print(len(mobileList))
