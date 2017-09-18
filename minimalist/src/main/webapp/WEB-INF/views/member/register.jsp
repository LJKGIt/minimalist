<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>Obaju : e-commerce template</title>

</head>

<body>
	<c:import url="../main/header.jsp" />


	<div id="all">

		<div id="w3-content">
			<div class="container"">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">

						<ul class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li>New account</li>
						</ul>

					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>


					<div class="col-md-8">
						<div class="box">
							<h1>New account</h1>

							<p class="lead">Not our registered customer yet?</p>
							<p>With registration with us new world of fashion, fantastic
								discounts and much more opens to you! The whole process will not
								take you more than a minute!</p>
							<p class="text-muted">
								If you have any questions, please feel free to <a
									href="resources/contact.html">contact us</a>, our customer
								service center is working for you 24/7.
							</p>

							<hr>

							<form action="minsert.do" method="post">
								<div class="form-group">
									<label for="id">ID</label><br>
									<input type="text"
										class="form-control" id="member_id" name="member_id" style="width: 60%; display: inline; margin-right: 20px;">
										<div id="checkID"></div>
								</div>
								<div class="form-group">
									<label for="pwd">Password</label> <input type="password"
										class="form-control" id="member_pwd1" name="member_pwd1">
								</div>
								<div class="form-group">
									<label for="pwd2">Password Check</label> <input type="password"
										class="form-control" id="member_pwd2">
										<div id="checkPwd"></div>
								</div>
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="member_name" style="width: 50%;">
								</div>
								<div class="form-group">
									<label for="birth">Birth</label> <input type="date"
										class="form-control" id="birth" name="birth" style="width: 50%">
								</div>
								<div class="form-group">
									<label for="phone">Phone</label> <input type="tel"
										class="form-control" id="phone" name="phone">
								</div>
								<!-- ADDRESS -->
								<div class="form-group">
									<label for="address">Address</label><br>
								<input type="text" id="postcode" name="post"
									placeholder="우편번호" class="form-control" style="width: 30%; display: inline; margin: 0 20px 10px 0"> <input type="button"
									onclick="execDaumPostcode()" value="Post Search" class="btn btn-primary">
								<input type="text" id="address" name="address1" placeholder="주소" class="form-control" style="margin-bottom: 10px;">
								<input type="text" id="address2" name="address2"
									placeholder="상세주소" class="form-control" ><br>
								<div id="checkAddress"></div>
								</div>
								
								<div class="form-group">
									<label for="email">Email</label><br> <input type="text"
										class="form-control" id="email_id" name="email1" style="width: 20%; display:inline;">@
										<input type="text"
										class="form-control" id="email_id2" name="email2" style="width: 20%; display:inline;">
										<select class="form-control" id="email_sel" style="width: 20%; display:inline;">
											<option>직접입력</option>
											<option>naver.com</option>
											<option>gmail.com</option>
											<option>nate.com</option>
											<option>iei.or.kr</option>
										</select>
										<a href="emailAuth.do" class="btn btn-primary">ㅇㅈ</a>
								</div>


								<div class="text-center">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-user-md"></i> Register
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>

			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
		<c:import url="../main/footer.jsp" />



	</div>
	<!-- /#all -->
	
	<!-- ADDRESS SCRIPT -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    } // ADDRESS API Close
    
    
    // ID Check
    	$('#member_id').focusout(function() {
		var value = $('#member_id').val();
		var regex = /^[A-Za-z0-9_]{4,16}$/;
		
		if(value == "" || value == null){
			$('#member_id').text("필수 입력");
		} else if(!regex.test(value)) {
			// 4자리 이상 16자리 이하, 영문과 숫자만
			$('#checkID').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
		} else {
			// 중복확인
			$.ajax({
				url : "memberidchk.do",
				data : {
					member_id : value
				},
				type : "post",
				dataType : "text",
				success : function(data){
					if(data == 1){
						$('#checkID').text("사용가능한 아이디입니다.");
						$('#member_pwd').focus();
					} else {
						$('#checkID').text("이미 사용중입니다.").css("color", "red");
					}
				} // TODO
				   //피피티에 파크용쥰 써주
			})
		}
	});
 	// PASSWORD CHECK
		$('#member_pwd1').focusout(function(){
			var password1 = $('#member_pwd1').val();
			var password2 = $('#member_pwd2').val();
			var regex = /^[A-Za-z0-9+]{6,16}$/;
			
			if(password1 == "" || password1 == null){
				$('#checkPwd').text('필수입력');
			}else if(!password2 && password1 != password2){
				$('#checkPwd').text('필수입력');
			}else if(password1 != password2){
				$('#checkPwd').text('안 맞음');
			}else if(!regex.test(password1)){
				$('#checkPwd').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
			}else if(password1 == password2){
				$('#checkPwd').text('일치');
			}
		});
		
		$('#member_pwd2').focusout(function(){
			
			var password1 = $('#member_pwd1').val();
			var password2 = $('#member_pwd2').val();
			var regex = /^[A-Za-z0-9+]{6,16}$/;
			
			if(password2 == "" || password2 == null){
				$('#checkPwd').text('필수입력');
			}else if(password1 != password2){
				$('#checkPwd').text('안 맞음');
			}else if(!regex.test(password1)){
				$('#checkPwd').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
			}else if(password1 == password2){
				$('#checkPwd').text('일치');
			}
		}); // PASSWORD CHECK close
    $('#email_sel').change(function() {
    		var emailAdr = $('#email_sel').val();
    		
    		if (emailAdr != "직접입력") {
    			$('#email_id2').val(emailAdr);
    		}
    })
		
	
</script>






</body>
</html>