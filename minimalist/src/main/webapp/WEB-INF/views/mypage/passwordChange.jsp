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
	background: #4fbfa8;
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
			숫자포함 6~16자 사용가능</div>

		<hr style="background: black;">

		<div class="form-group">
			<form action="member.passwordUpdate.do">

				<div class="form-group">
					<label>새 비밀번호 입력</label> <input type="password"
						class="form-control" name="member_pwd" id="member_pwd">
					<div id="checkPwd"></div>
				</div>

				<div class="form-group">
					<label>새 비밀번호 확인</label> <input type="password"
						class="form-control" name="member_pwd2" id="member_pwd2">
				</div>
				
				<div style="text-align: center;">
					<button type="submit" class="btn btn-default" id="submit">확인</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	var regex = /^[A-Za-z0-9+]{6,16}$/;
	$(function(){
		
			$('#member_pwd').focusout(function() {
				var password1 = $('#member_pwd').val();
				var password2 = $('#member_pwd2').val();

				if (password1 == "" || password1 == null) {
					$('#checkPwd').text('필수입력');
				} else if (!password2) {
					$('#checkPwd').text('비밀번호 확인란을 입력해주세요.');
				} else if (password1 != password2) {
					$('#checkPwd').text('비밀번호가 맞지 않습니다.');
				} else if (!regex.test(password1)) {
					$('#checkPwd').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
				} else if (password1 == password2) {
					$('#checkPwd').text('일치');
				}
			});
			$('#member_pwd2').focusout(function() {
				var password1 = $('#member_pwd').val();
				var password2 = $('#member_pwd2').val();
				
				if (password1 == "" || password1 == null) {
					$('#checkPwd').text('필수입력');
				} else if (!password2) {
					$('#checkPwd').text('비밀번호 확인란을 입력해주세요.');
				} else if (password1 != password2) {
					$('#checkPwd').text('비밀번호가 맞지 않습니다.');
				} else if (!regex.test(password1)) {
					$('#checkPwd').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
				} else if (password1 == password2) {
					$('#checkPwd').text('일치');
				}
			});

		})
		
	$('#submit').click(function(){
		var password1 = $('#member_pwd').val();
		var password2 = $('#member_pwd2').val();
		
		if (!password1) {
			$('#checkPwd').html('비밀번호를 입력하세요');
			$('#member_pwd').focus();
			return false;
		} else if (!regex.test(password1)) {
			$('#checkPwd').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
			return false;
		} else if (password1 != password2) {
			$('#checkPwd').html('비밀번호가 맞지 않습니다.');
			return false;
		}
	});
	</script>
	
</body>
</html>