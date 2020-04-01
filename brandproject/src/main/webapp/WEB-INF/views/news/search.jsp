<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<style>
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
#square{
width:100px;
height:100px;
background:#fff;
}
</style>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd',
			changeMonth: true,
		    changeYear: true,
		    minDate: "-4Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            maxDate: "today"
		});
		$("#datepicker1").datepicker({
			dateFormat : 'yy-mm-dd',
			changeMonth: true,
		    changeYear: true,
		    minDate: "-4Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            maxDate: "today"
		});
		$('#datepicker').datepicker('setDate', 'today');
		$('#datepicker1').datepicker('setDate', 'today');
		$('#loading').hide();
		$("#test").submit(function() {
			if ($("input:checkbox[name='ages']").is(":checked") == false) {
				alert('연령대를 체크해 주세요!');
				return false;
			} else {
				$('#loading').show();
				return true;
			}
			;
		});
	});
</script>
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
			<img id="loading-image" src="/resources/image/loading.gif"
				alt="Loading.." />
		</div>	
		<form action="/news/list.do" method="post" id="test">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<h3>트렌드 검색</h3>
					<h5>특정 검색어가 얼마나 많이 검색되었는지 확인해보세요.</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							<i class="icon-calendar"></i>
							<h3 class="panel-title">뉴스 토픽</h3>
						</div>

						<div class="panel-body">
							<div class="form-group has-success">
								<label class="col-md-6 control-label"><div style="height:30px;"><img alt="Image" src="/resources/image/num1.png" style="width:25px; height:25px"> ${dailysch[0] }</div>
								<div style="height:30px;"><img alt="Image" src="/resources/image/num2.png" style="width:25px; height:25px"> ${dailysch[1] }</div>
								<div style="height:30px;"><img alt="Image" src="/resources/image/num3.png" style="width:25px; height:25px"> ${dailysch[2] }</div>
								<div style="height:30px;"><img alt="Image" src="/resources/image/num4.png" style="width:20px; height:20px"> ${dailysch[3] }</div>
								<div style="height:30px;"><img alt="Image" src="/resources/image/num5.png" style="width:20px; height:20px"> ${dailysch[4] }</div></label>
								<label class="col-md-6 control-label"><div style="height:30px;"><img alt="Image" src="/resources/image/num6.png" style="width:20px; height:20px"> ${dailysch[5] }</div>
								<div style="height:30px;"><img alt="Image" src="/resources/image/num7.png" style="width:20px; height:20px"> ${dailysch[6] }</div>
								<div style="height:30px;"><img alt="Image" src="/resources/image/num8.png" style="width:20px; height:20px"> ${dailysch[7] }</div>
								<div style="height:30px;"><img alt="Image" src="/resources/image/num9.png" style="width:20px; height:20px"> ${dailysch[8] }</div>
								<div style="height:30px;"><img alt="Image" src="/resources/image/num10.png" style="width:20px; height:20px"> ${dailysch[9] }</div></label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Row start -->
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
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
												placeholder="주제어를 입력해주세요" name="title" value="뉴스"
												readonly="readonly">
										</div>
										<div class="col-xs-9">
											<input type="text" class="form-control"
												placeholder="관련어를 ,(콤마)로 이어서 입력해주세요 ex) 코로나, 피해"
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
								name="gender" checked="checked"> 전체
							</label>
							<label class="radio-inline"> <input type="radio"
								name="gender" value="f"> 여성
							</label>
							<label class="radio-inline"> <input type="radio"
								name="gender" value="m"> 남성
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
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="1"
								> ~12
							</label>
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="2"
								> 13~18
							</label>
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="3"
								> 19~24
							</label>
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="4"
								> 25~29
							</label>
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="5"
								> 30~34
							</label>
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="6"
								> 35~39
							</label>
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="7"
								> 40~44
							</label>
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="8"
								>45~49
							</label>
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="9"
								> 50~54
							</label>
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="10"
								> 55~60
							</label>
							<label class="checkbox-inline"> <input type="checkbox"
								name="ages" value="11"
								> 60~
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- Row end -->
			<div class="row text-center" style="width: 100%">
				<button type="submit" class="btn btn-default btn-lg btn-round"
					style="margin: 10px">
					<span class="glyphicon glyphicon-search"></span> Brand<span
						style="color: #1abc9c">Dog</span>검색 조회
				</button>
			</div>
		</form>
	</div>
</body>
</html>