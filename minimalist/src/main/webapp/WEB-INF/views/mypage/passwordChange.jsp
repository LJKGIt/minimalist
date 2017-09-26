<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js/jquery-1.11.0.min.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<style type="text/css">
body {
	background: #f0f0f0;
}

#top {
	background: red;
	color : white;
	padding: 0 20px;
}

hr {
	border-top: 1px solid #bbb;
	border-bottom: 1px solid #fff;
}
</style>
<title>비밀번호 변경</title>
</head>
<body>
	<div class="container">
		<div class="row" id="top">
			<h4>
				<strong>비밀번호 변경</strong>
			</h4>
		</div>
		<div class="row" style="text-align: center; margin-top: 20px;">띄어쓰기 없는 영문 소문자,
			숫자포함 6~20자 사용가능</div>

		<hr style="background: black;">

		<div class="form-group">
			<form action="">
				<div class="form-group">
					<label>기존 비밀번호 입력</label> <input type="password"
						class="form-control">
				</div>

				<div class="form-group">
					<label>새 비밀번호 입력</label> <input type="password"
						class="form-control">
				</div>

				<div class="form-group">
					<label>새 비밀번호 확인</label> <input type="password"
						class="form-control">
				</div>
				
				<div style="text-align: center;">
					<button type="submit" class="btn btn-default">확인</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		//TODO [yjP] 비밀번호 확인 후 UPDATE하는 스크립트
	</script>
	
</body>
</html>