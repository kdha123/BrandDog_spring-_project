<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#loading {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	position: fixed;
	display: block;
	opacity: 0.7;
	background-color: #fff;
	z-index: 99;
	text-align: center;
}

#loading-image {
	position: absolute;
	top: 40%;
	left: 40%;
	z-index: 100;
	text-align: center;
}
</style>
<script type="text/javascript">
$(function() {
	$("#loading").hide();
	$("#datepicker").datepicker({
		dateFormat : 'yy-mm-dd'
	});
	$("#datepicker1").datepicker({
		dateFormat : 'yy-mm-dd'
	});

	$("#searchForm").on('submit', function(){
		if($("input:radio[name='gender']").is(":checked") == false){
			alert('성별을 체크해 주세요!');
			return false;
		} else {
			if($("input:checkbox[name='ages']").is(":checked") == false){
				$("input:checkbox[id='totalAge']").attr("checked", true);
				$("#loading").show();
				return true;
			} else {
				$("#loading").show();
				return true;
			}
		}
	});
	
});
</script>
<title>검색</title>
</head>
<body>
	<div class="container" style="background: #1abc9c">
		<div id="loading">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<h3 style="color: #1abc9c">데이터를 수집하는 중입니다...</h3>
			<img id="loading-image" src="/resources/image/loading.gif" alt="Loading.." />
		</div>
		<form action="graph.do" method="post" id="searchForm">
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<h3>트렌드 검색</h3>
					<h5>특정 검색어가 얼마나 많이 검색되었는지 확인해보세요.</h5>
				</div>
			</div>
			<!-- Row start -->
			<div class="row">
				<div class="col-md-12 col-sm-6 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							<i class="icon-calendar"></i>
							<h3 class="panel-title">검색</h3>
						</div>

						<div class="panel-body">
							<div class="form-group has-success">
								<label class="col-md-1 control-label">주제어</label>
								<div class="col-md-11">
									<div class="row">
										<div class="col-xs-3">
											<input type="text" class="form-control"
												placeholder="주제어를 입력해주세요" name="title" value="여행"
												readonly="readonly">
										</div>
										<div class="col-xs-9">
											<input type="text" class="form-control"
												placeholder="관련어를 ,(콤마)로 이어서 입력해주세요 ex) 속초, 강릉"
												name="keywords" required="required">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Row end -->
			<!-- Row start -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							<i class="icon-calendar"></i>
							<h3 class="panel-title">기간</h3>
						</div>

						<div class="panel-body">
							<div class='col-sm-4'>
								<label class="control-label">시작일</label><br> <input
									type="text" id="datepicker" name="startDate" autocomplete="off"/><br>
							</div>
							<div class='col-sm-4'>
								<label class="control-label">종료일</label><br> <input
									type="text" id="datepicker1" name="endDate" autocomplete="off"/>
							</div>
							<div class='col-sm-4'>
								<label class="control-label">월/주/일</label> <select
									class="form-control" id="sel1" name="timeUnit">
									<option value="date">일간</option>
									<option value="week">주간</option>
									<option value="month">월간</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Row end -->
			<!-- Row start -->
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							<i class="icon-calendar"></i>
							<h3 class="panel-title">성별</h3>
						</div>

						<div class="panel-body">
							<div class="panel-body">
							<label class="radio-inline"> <input type="radio" 
								name="gender" value="t" checked="checked"
								> 전체
							</label>
							<label class="radio-inline"> <input type="radio"
								name="gender" value="f"
								> 여성
							</label>
							<label class="radio-inline"> <input type="radio"
								name="gender" value="m"
								> 남성
							</label>
						</div>
					</div>
				</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							<i class="icon-calendar"></i>
							<h3 class="panel-title">나이</h3>
						</div>

						<div class="panel-body">
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="1"
								> ~12
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="2"
								> 13~18
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="3"
								> 19~24
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="4"
								> 25~29
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="5"
								> 30~34
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="6"
								> 35~39
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="7"
								> 40~44
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="8"
								>45~49
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="9"
								> 50~54
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="10"
								> 55~60
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="11"
								> 60~
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages" style="display: none;" id="totalAge"
								name="ages" value="t"
								>
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- Row end -->
			<div class="row text-center" style="width: 100%">
				<button type="submit" class="btn btn-default btn-lg btn-round" id="searchBtn"
					style="margin: 10px">
					<span class="glyphicon glyphicon-search"></span> Brand<span
						style="color: #1abc9c">Dog</span>검색 조회
				</button>
			</div>
		</form>
	</div>
</body>
</html>