from bs4 import BeautifulSoup as bs
from urllib.parse import quote_plus
import requests as request
from konlpy.tag import Okt
import db_connect


class ReWord:
    def blogCrawl(data, titleList, descriptList):
        for i in range(0, 30):
            i = i * 10 + 1
            # 기본 네이버 블로그 주소
            baseURL = "https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso" \
                      "=&post_blogurl=&post_blogurl_without=&query=" + quote_plus(data) + \
                      "&sm=tab_pge&srchby=all&st=sim&where=post&start=" + str(i)

            # res = urlopen(total_url)
            # print(res)

            connect = request.get(baseURL)
            # print(connect)

            soup = bs(connect.text, 'lxml')
            # print(soup)

            # 블로그 페이지 가져오기
            blog = soup.find('div', {'class': 'blog'})
            # print(blog)

            # 블로그의 title 가져오기
            blogTitle = blog.select('li > dl > dt > a')
            # print(blogTitle)

            for h in blogTitle:
                # 블로그 title을 리스트에 append
                titleList.append(h.attrs['title'])
            # print(titleList)
            # print(len(titleList))

            # 블로그의 내용 가져오기
            for j in range(1, 11):
                descriptList.append(blog.select_one('li#sp_blog_' + str(j) + ' > dl > dd.sh_blog_passage').text)
            # print(descriptList)
            # print(len(descriptList))

        return titleList, descriptList

    def start(keywords):
        # 검색어
        key = keywords
        print(key)  # "속초","강릉"
        print(type(key))

        titleList = []
        descriptList = []
        # 네이버 블로그에서 데이터 크롤링
        titleList, descriptList = ReWord.blogCrawl(key, titleList, descriptList)

        totalList = titleList + descriptList

        # 형태소 분석
        totalDict = {}
        o = Okt()
        for t in totalList:
            malist = o.pos(t, norm=True, stem=True)  # [(단어, 품사),(단어, 품사),...(단어, 품사)]
            # print(malist)
            # print(len(malist))
            for mal in malist:  # (단어, 품사)
                if mal[1] == 'Noun':
                    if len(mal[0]) is not 1:
                        if not mal[0] in totalDict:
                            totalDict[mal[0]] = 0
                        totalDict[mal[0]] = totalDict[mal[0]] + 1
        totalDict2 = sorted(totalDict.items(), key=lambda x: x[-1], reverse=True)
        topList = []
        for c in totalDict2[:32]:
            c = list(c)
            topList.append(c)
        # print(topList)
        # print(len(dataList))
        cnt = int(key.count("\"") / 2)
        topList = topList[cnt:30 + cnt]
        print("===========topList :", topList)

        key = key.replace('"', "")
        key = "'" + key + "'"
        # print(data)
        db_connect.DBConnect.relatedWord(key, topList)
