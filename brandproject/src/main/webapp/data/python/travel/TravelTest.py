# 1. 트립어드바이저 크롤링 - graph.do에서 결과에 같이 보여 줄 용도
# 2. 하나투어와 비슷한 여행사 크롤링 - search.do에서 사용
#
# selenium 또는 scrapy를 이용
# 2번이 beatifulsoup으로 가능하면 beatifulsoup 이용 => java단에서 처리
#
# table 하나에서 두개정도 추가해서 완성
from bs4 import BeautifulSoup as bs
import requests

baseURL = 'http://minfo.hanatour.com/'
req = requests.get(baseURL)

soup = bs(req.text, 'lxml')
# print(soup)

data = soup.find('div', {'class': 'rankingArea'}).find('ul')
# print(data)
link = data.find_all('a')
# print(link)
href = []
for l in link:
    href.append(l.attrs['href'])
print(href)
print(len(href))
