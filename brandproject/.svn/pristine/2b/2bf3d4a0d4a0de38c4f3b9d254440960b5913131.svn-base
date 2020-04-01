<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
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
.panel-heading {
	background: #bcf6ea;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$('#loading').hide();

		

	});
	</script>	
<script>
	$(function() {
		//날짜
		var today = new Date();
	var dd = today.getDate();
	var ddd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var mmm = today.getMonth(); 
	var yyyy = today.getFullYear();
	
	if(dd<10) {
    dd='0'+dd
	} 

	if(mm<10) {
    	mm='0'+mm
	} 
	if(mmm<10) {
    	mmm='0'+mmm
	} 
	if(ddd>28) {
    	ddd=ddd-3
	} 
	
	today = yyyy+'-'+mm+'-'+dd;
	today1 = yyyy+'-'+mmm+'-'+ddd;
	$('#datepicker').val(today1)
	$('#datepicker1').val(today)
	
		 $("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		}); 
		$("#datepicker1").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#test").submit(function(){
		if($("input:checkbox[name='ages']").is(":checked") == false){
			alert('연령대를 체크해 주세요!');
			return false;
			
		}else{
				$('#loading').show();

			return true;

				}
		});
		//버튼체크
		$("#allCheck").click(function(){
			if($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked",true);
			} else {
				$("input[type=checkbox]").prop("checked",false); }

		})
				


		
		
		});
</script>
</head>
<body>
	<div class="container" style="background: #1abc9c">
	<div id="loading" style="display: none;">
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<h3 style="color: #1abc9c">데이터를 수집하는 중입니다...</h3>
		<img id="loading-image" src="/resources/image/loading.gif"
			alt="Loading.."/>
	</div>
		<form action="view.do" method="get" id="test">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<h3>트렌드 검색</h3>
					<h5>특정 검색어가 얼마나 많이 검색되었는지 확인해보세요.</h5>
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
												placeholder="주제어를 입력해주세요" name="title" value="음식"
												readonly="readonly">
										</div>
										<div class="col-xs-9">
											<input type="text" class="form-control"
												placeholder="관련어를 ,(콤마)로 이어서 입력해주세요 ex) 치킨,순대" 
												name="food" required="required">
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
									type="text" id="datepicker" name="startDate" autocomplete="off" /><br>
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
								name="ages" value="1" checked="checked"
								> ~12
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="2" checked="checked"
								> 13~18
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="3" checked="checked"
								> 19~24
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="4" checked="checked"
								> 25~29
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="5" checked="checked"
								> 30~34
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="6" checked="checked"
								> 35~39
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="7" checked="checked"
								> 40~44
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="8" checked="checked"
								>45~49
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="9" checked="checked"
								> 50~54
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="10" checked="checked"
								> 55~60
							</label>
							<label class="checkbox-inline"> <input type="checkbox" class="ages"
								name="ages" value="11" checked="checked"
								> 60~
							</label>
							<input type="checkbox" id="allCheck" checked="checked" /> all


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