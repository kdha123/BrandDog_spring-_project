<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="org.springframework.web.bind.annotation.SessionAttribute"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%
	session.getAttribute("login");
%>
<html>
<head>
<style>
body {
	font: 20px Montserrat, sans-serif;
	line-height: 1.8;
	color: #f5f6f7;
}

p {
	font-size: 16px;
}

.margin {
	margin-bottom: 45px;
}

.bg-1 {
	background-color: #1abc9c; /* Green */
	color: #ffffff;
}

.bg-2 {
	background-color: #474e5d; /* Dark Blue */
	color: #ffffff;
}

.bg-3 {
	background-color: #ffffff; /* White */
	color: #555555;
}

.container-fluid {
	padding-top: 70px;
	padding-bottom: 70px;
}
</style>
<title>Home</title>
</head>
<body>
	<div class="container-fluid bg-1 text-center">
  <h3 class="margin">Who Am I?</h3>
  <img src="/resources/image/brand.jpg" class="img-responsive img-circle margin" style="display:inline" alt="brand" width="350" height="350">
  <h3>We are BrandDog!</h3>
</div>

<!-- Second Container -->
<div class="container-fluid bg-2 text-center">
  <h3 class="margin">사람들은 지금 어떤 생각을 하고 있을까요??</h3>
  <p>궁금한 키워드를 검색하여 빅데이터 분석 결과를 확인할 수 있습니다. 또한, 분석된 결과를 저장하거나 공유하여 정보의
		활용성을 높일 수 있습니다. </p>
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center">    
  <h3 class="margin">어떻게 활용할 수 있나요?</h3><br>
  <div class="row">
    <div class="col-sm-3">
    <h4>여행</h4>
      <p>여행에 대한 사람들의 트렌드를 빅데이터 분석을 통한 시각화 자료로 알아볼 수 있습니다.</p>
      <a href="/travel/search.do"><img src="/resources/image/travel.jpg" class="img-responsive margin" style="width:100%; height: 300px" alt="Image"></a>
    </div>
    <div class="col-sm-3">
     <h4>요리</h4> 
      <p>요리에 대한 사람들의 트렌드를 빅데이터 분석을 통한 시각화 자료로 알아볼 수 있습니다.</p>
      <a href="/food/list.do"><img src="/resources/image/cook.jpg" class="img-responsive margin" style="width:100%; height: 300px" alt="Image"></a>
    </div>
    <div class="col-sm-3">
     <h4>문화</h4> 
      <p>영화, 공연 등 다양한 문화에 대한 트렌드를 빅데이터 분석을 통한 시각화 자료로 알아볼 수 있습니다.</p>
      <a href="/culture/search.do"><img src="/resources/image/culture.jpg" class="img-responsive margin" style="width:100%; height: 300px" alt="Image"></a>
    </div>
    <div class="col-sm-3">
     <h4>뉴스</h4> 
      <p>최근 뉴스에 대한 사람들의 트렌드를 빅데이터 분석을 통한 시각화 자료로 알아볼 수 있습니다.</p>
      <a href="/news/search.do"><img src="/resources/image/news.png" class="img-responsive margin" style="width:100%; height: 300px" alt="Image"></a>
    </div>
  </div>
</div>
<%-- 	<p>${login.id } -- ${login.name } --%>
</body>
</html>
