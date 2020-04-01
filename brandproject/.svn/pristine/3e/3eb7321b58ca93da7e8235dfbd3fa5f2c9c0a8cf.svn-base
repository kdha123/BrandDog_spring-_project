import naver_dataLab
import RelatedWord
import sys
import time

start = time.time()
# {"python ", execute[0], check[1], title[2], sDate[3], eDate[4], timeUnit[5], gender[6], keyword[7], age[8]};
check = sys.argv[1]
title = sys.argv[2]
startDate = sys.argv[3]
endDate = sys.argv[4]
timeUnit = sys.argv[5]
gender = sys.argv[6]
keyAndage = sys.argv[7:]
keywords = ""
age = ""
ageCheck = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11']
for ka in keyAndage:
    if ka is 't':
        age = ka
    else:
        if ka in ageCheck:
            age += '"' + ka + '",'
        else:
            keywords += '"' + ka + '",'
keywords = keywords[:keywords.rindex(",")]
if age is not 't':
    age = age[:age.rindex(",")]

print("python - check :", check)
print("python - title :", title)
print("python - startDate :", startDate)
print("python - endDate :", endDate)
print("python - timeUnit :", timeUnit)
print("python - gender :", gender)
print("python - keyAndage :", keyAndage)
print("python - keywords :", keywords)
print("python - age :", age)

no = naver_dataLab.SearchTrend.start(startDate, endDate, timeUnit, gender, keywords, age)

if check is "1":
    RelatedWord.ReWord.start(keywords)

print("걸린 시간(초) :", time.time() - start)
print("no :", no)
