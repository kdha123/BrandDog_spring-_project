<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 박현태 -->
<!-- 작성일 : 2020-02-24 -->
<!-- 최종수정일 : 2020-02-24 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!-- JSTL : JSP별로 따로 설정해야 한다. -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BrandDog::<decorator:title /></title>
<!-- web 라이브러리 : 공통으로 사용 - 여기서만 선언해주면 된다. -->
<!-- BootStrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- jQuery UI : datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Icons Awesome5,4 Bootstrap, google -->
<!-- <script src="https://kit.fontawesome.com/yourcode.js"></script> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- goole chart -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
/* header, footer { */
/* 	background: AntiqueWhite; */
/* } */
pre {
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	padding-top: 15px;
	padding-bottom: 15px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 14px;
	letter-spacing: 5px;
	font-weight: bold;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #474e5d;
	color: #ffffff;
	font-size: 14px;
	padding-top: 70px;
	padding-bottom: 70px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

article {
	min-height: 800px;
	background: #1abc9c;
}

#welcome {
	color: grey;
	margin: 0 auto;
}

.navbar-nav  li a:hover {
	color: #1abc9c !important;
}
</style>
<!-- <script type="text/javascript" src="../js/jquery.js"></script> -->
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<decorator:head />
</head>
<body>
	<header>
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">Brand<span
						style="color: #1abc9c">Dog</span></a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="${absUri }/culture/search.do">문화</a></li>
						<li><a href="${absUri }/news/search.do">뉴스</a></li>
						<li><a href="${absUri }/food/list.do">음식</a></li>
						<li><a href="${absUri }/travel/search.do">여행</a></li>

						<c:if test="${!empty login }">
							<c:if test="${logi2.gradeNo==9 }">
								<li><a href="${absUri }/member/list.do">회원관리</a></li>
								<li><a href="${absUri }/schedule/view.do">스케줄 관리</a></li>
							</c:if>
						</c:if>
						<%-- 							<c:if test="${login2.gradeNo==9 }"> --%>
						<%-- 							</c:if> --%>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${empty login }">
							<li><a class="btn" href="${absUri }/member/join.do">회원가입</a></li>
							<li><a class="btn" href="${absUri }/member/login.do"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:if>
						<c:if test="${!empty login }">
							<%-- 							<li id="welcome">${login.name}[${login.gradeName }]님,환영합니다</li> --%>
<%-- 							<li><a href="${absUri }/member/view.do?id=${login.id}">MyPage</a></li> --%>
							<li><a href="${absUri }/member/logout.do"><span
									class="glyphicon glyphicon-log-in"></span> Logout</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<article>
		<decorator:body />
	</article>
	<footer class="container-fluid text-left">
		<div>
			<a href="/">홈</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="/">이용약관</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/">개인정보 처리 방침</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div>
			<span>(주)브랜드독</span><br /> <span>서울특별시 구로구 경영기술개발원</span><br /> <span>대표
				: 언더독</span><br /> <span>가입 문의 : branddog@branddog.com</span><br /> <span>
				Copyright 2020-2020 by BrandDog. All Rights Reserved.<a href="/">www.branddog.com</a>
			</span><br />
		</div>
	</footer>
</body>
</html>