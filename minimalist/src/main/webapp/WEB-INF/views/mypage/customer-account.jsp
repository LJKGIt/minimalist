<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>


<body>
	<c:import url="../main/header.jsp" />


    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>My account</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="panel-title">Customer section</h3>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="customer-orders.jsp"><i class="fa fa-list"></i> 주문내역</a>
                                </li>
                                <li>
                                    <a href="customer-wishlist.jsp"><i class="fa fa-heart"></i> 찜 목록</a>
                                </li>
                                <li class="active">
                                    <a href="customer-account.jsp"><i class="fa fa-user"></i> 내 정보보기</a>
                                </li>
                                <li>
                                    <a href="index.jsp"><i class="fa fa-sign-out"></i> Logout</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** CUSTOMER MENU END *** -->
                </div>

                <div class="col-md-9">
                    <div class="box">
                        <form action="member.memberUpdate.do" method="post">
								<div class="form-group">
									<label for="id">ID</label><br>
									<input type="text"
										class="form-control" value="${ member.member_id }" disabled id="member_id" name="member_id" style="width: 60%; display: inline; margin-right: 20px;">
										<div id="checkID"></div>
								</div>
								
								<div class="form-group" style="margin-bottom: 0;">
									<label for="pwd">Password</label>
								<!-- PASSWORD FORM 
								 <input type="password"
										class="form-control" id="member_pwd" name="member_pwd">
								</div> 
								<div class="form-group">
									<label for="pwd2">Password Check</label> <input type="password"
										class="form-control" id="member_pwd2">
										<div id="checkPwd"></div>
										-->
								</div> 
								<a href="javascript:passChange()" class="btn btn-primary" style="margin-bottom: 20px;"> 비밀번호 변경하기</a>
								<div class="form-group">
									<label for="name">Name</label> <input type="text" value="${ updateMember.member_name }"
										class="form-control" id="member_name" name="member_name" style="width: 50%;">
								</div>
								<div class="form-group">
									<label for="birth">Birth</label> <input type="date" value="${ updateMember.birth }"
										class="form-control" id="birth" name="birth" style="width: 50%">
								</div>
								<div class="form-group">
									<label for="phone">Phone</label> <input type="tel" value="${ updateMember.phone }"
										class="form-control" id="phone" name="phone">
								</div>
								<!-- ADDRESS -->
								<div class="form-group">
									<label for="address">Address</label><br>
								<input type="text" id="postcode" name="post"  value="${ updateMember.post }"
									placeholder="우편번호" class="form-control" style="width: 30%; display: inline; margin: 0 20px 10px 0"> <input type="button"
									onclick="execDaumPostcode()" value="Post Search" class="btn btn-primary">
								<input type="text" id="address" name="address1" placeholder="주소" class="form-control" value="${ updateMember.address1 }" style="margin-bottom: 10px;">
								<input type="text" id="address2" name="address2" value="${ updateMember.address2 }"
									placeholder="상세주소" class="form-control" ><br>
								<div id="checkAddress"></div>
								</div>
								
								<div class="form-group">
									<label for="email">Email</label><br> <input type="text" value="${ fn:substringBefore(updateMember.email, '@') }"
										class="form-control" id="email_id" name="email1" style="width: 20%; display:inline;">@
										<input type="text" value="${ fn:substringAfter(updateMember.email, '@') }" 
										class="form-control" id="email_id2" name="email2" style="width: 20%; display:inline;">
										<select class="form-control" id="email_sel" style="width: 20%; display:inline;">
											<option>직접입력</option>
											<option>naver.com</option>
											<option>gmail.com</option>
											<option>nate.com</option>
											<option>iei.or.kr</option>
										</select>
								</div>


								<div class="text-center">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-user-md"></i> 수정
										<% //TODO [yjP] 아이콘 수정 %>
									</button>
								</div>
							</form>
                    </div>
                </div>

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->
		<c:import url="../main/footer.jsp" />
    </div>
    <!-- /#all -->
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
				dataType : "text",
				success : function(data){
					if(data == 1){
						$('#checkID').text("사용가능한 아이디입니다.");
						$('#member_pwd').focus();
					} else {
						$('#checkID').text("이미 사용중입니다.").css("color", "red");
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
    
    // PASSWORD CHANGE POPUP
    var openPop;
	function passChange(){
    	openPop = window.open("member.passwordView.do", "a", "width=470 height=410, left=100, top=100");
	}
	
</script>
</body>
</html>