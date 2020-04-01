<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<!-- Modal content-->
		<div class="modal-content"
			style="background: #bcf6ea; margin-top: 100px">
			<div class="modal-header" style="padding: 35px;">
				<h4 style="color: #474e5d">
					<span class="glyphicon glyphicon-user"></span> <span
						id="loginHeader">회원가입</span>
				</h4>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<form role="form" method="post" id="modal_form"
					action="join.do">
					<div class="form-group" style="color: #474e5d">
						<label for="modal_content"> <span
							class="glyphicon glyphicon-user"></span> 아이디
						</label> <input class="form-control" id="modal_id" name="id" type="text"
							required="required">
					</div>
					<div class="form-group" style="color: #474e5d">
						<label for="name"><span class="glyphicon glyphicon-tag"></span>이름</label> <input type="text"
							class="form-control" id="name" name="name" />
					</div>
					<div class="form-group">
						<label for="modal_content" style="color: #474e5d"> <span
							class="fa fa-key"></span> 비밀번호
						</label> <input class="form-control" type="password" id="modal_pw"
							name="pw" required="required">
					</div>
					<div class="btn-group">
						<button type="submit" class="btn btn-block" id="loginBtn"
							style="background: #1abc9c">회원가입</button>
					</div>
				</form>
			</div>
		</div>
</body>
</html>