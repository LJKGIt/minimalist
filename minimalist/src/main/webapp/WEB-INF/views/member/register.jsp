<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>


<body>
	<c:import url="../main/header.jsp" />


	<div id="all">

		<div id="w3-content">
			<div class="container">
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
										class="form-control" id="member_pwd" name="member_pwd" onkeypress="caps_lock(event)">
										<p id="capslock" style="position:relative; border:2px solid #003b83; width:300px; bottom:0px; display:none"> 
    	&nbsp;<b>CapsLock</b> 키가 눌려있습니다.&nbsp;</p>
								</div>
								<div class="form-group">
									<label for="pwd2">Password Check</label> <input type="password"
										class="form-control" id="member_pwd2">
										<div id="checkPwd"></div>
								</div>
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="member_name" name="member_name" style="width: 50%;">
										<div id="checkName"></div>
								</div>
								<div class="form-group">
									<label for="birth">Birth</label> <input type="date"
										class="form-control" id="birth" name="birth" style="width: 50%" max="2016-12-31">
										<div id="checkBirth"></div>
								</div>
								<div class="form-group">
									<label for="phone">Phone</label><br>
									<select class="form-control" id="tel_first" style="width: 20%; display: inline; margin: 0 20px 10px 0;">
											<option>010</option>
											<option>016</option>
											<option>017</option>
											<option>018</option>
											<option>019</option>
										</select>
									<input type="tel"
										class="form-control" id="phone1" name="phone1" maxlength="4" style="width: 20%; display: inline; margin: 0 20px 10px 0">
									<input type="tel"
										class="form-control" id="phone2" name="phone2" maxlength="4" style="width: 20%; display: inline; margin: 0 20px 10px 0">
										<div id="checkPhone"></div>
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
										<div id="checkEmail"></div>
								</div>
								
								<script src='https://www.google.com/recaptcha/api.js'></script>
								<div class="g-recaptcha" data-sitekey="6LfPMzQUAAAAAG4rEYDb5A8mAjANV9ss31ER-e62" style="margin-bottom:20px;"></div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary" onclick="return checkAll();">
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
	$('#tel_first').change(function() {
    		$('#phone1').focus();
    })
    
	
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
				dataType : "json",
				success : function(data){
					if(data.flag == 1){
						$('#checkID').text(data.mchk).css("color", "red");
					} else {
						$('#checkID').text(data.mchk).css("color", "black");
					}
				} 				   
			})
		}
	});
 	// PASSWORD CHECK
		$('#member_pwd').focusout(function(){
			var password1 = $('#member_pwd').val();
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
			
			var password1 = $('#member_pwd').val();
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
    
    function checkAll(){
    	var regex = /^[A-Za-z0-9+]{6,16}$/;
    	var password1 = $('#member_pwd').val();
    	var password2 = $('#member_pwd2').val();
    	
		// ID CHECK
		if(!$('#member_id').val()){
			$('#checkID').html('아이디를 입력하세요');
			$('#member_id').focus();
			return false;
		}else{
			$('#checkID').html('');
		}
		// PASSWORD CHECK
		if(!password1){
			$('#checkPwd').html('비밀번호를 입력하세요');
			$('#member_pwd').focus();
			return false;
		}else if(!regex.test(password1)){
			$('#checkPwd').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
			return false;
		}else {
			$('#checkPwd').html('');
		}
		
		if(!password2){
			$('#checkPwd').html('비밀번호 확인란을 입력하세요');
			$('#member_pwd2').focus();
			return false;
		}else {
			$('#checkPwd').html('');
		}
		
		if(password1 != password2){
			$('#checkPwd').html('비밀번호가 일치하지 않습니다.');
			$('#member_pwd').focus();
			return false;
		}
		
		
		// NAME CHECK
		if(!$('#member_name').val()){
			$('#checkName').html('이름을 입력하세요');
			$('#member_name').focus(); //여기서부터함
			return false;
			
		}else{
			$('#checkName').html('');
		}
		
		// SERIAL CHECK
		if(!$('#birth').val()){
			$('#checkBirth').html('생년월일을 입력하세요');
			$('#birth').focus();
			return false;
		}else{
			$('#checkBirth').html('');
		}
		
		// PHONE CHECK
		if(!$('#tel_first').val() && $('#phone1').val() && $('#phone2').val()) {
			$('#checkPhone').html('전화번호를 입력하세요');
			$('#phone').focus();
			//return false;
		}else{
			$('#checkPhone').html('');
		}
		
		// ADDRESS CHECK
		if(!$('#postcode').val()){
			$('#checkAddress').html('주소를 정확히 입력하세요');
			$('#postcode').focus();
			return false;
		}else{
			$('#checkAddress').html('');
		}
		
		if(!$('#address').val()){
			$('#checkAddress').html('주소를 정확히 입력하세요');
			$('#address').focus();
			return false;
		}else{
			$('#checkAddress').html('');
		}
		
	}// checkAll() close
    
	
	
	function caps_lock(e) {
        var keyCode = 0;
        var shiftKey = false;
        keyCode = e.keyCode;
        shiftKey = e.shiftKey;
        if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
                || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
            show_caps_lock();
            setTimeout("hide_caps_lock()", 3500);
        } else {
            hide_caps_lock();
        }
    }// caps_lock(e) close
	function show_caps_lock() {
	     $("#capslock").show();
	}
	
	function hide_caps_lock() {
	     $("#capslock").hide();
	}
		
	
</script>






</body>
</html>