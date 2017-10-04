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

                <c:import url="mypageAside.jsp"/>

                <div class="col-md-9">
                    <div class="box">
                        <form action="member.memberUpdate.do" method="post">
								<div class="form-group">
									<label for="id">ID</label><br>
									<input type="text" 
										class="form-control" value="${ updateMember.member_id }" readonly id="member_id" name="member_id" style="width: 60%; display: inline; margin-right: 20px;">
									<div id="checkID"></div> 
								</div>
								
								<div class="form-group" style="margin-bottom: 0;">
									<label for="pwd">Password</label>
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
									<label for="phone">Phone${ tel_first }</label><br>
									
									<select class="form-control" id="tel_first" name="tel_first" style="width: 20%; display: inline; margin: 0 20px 10px 0;">
										<c:forEach var="tel" items="${ telList }">
										
											<c:if test="${ fn:substringBefore(updateMember.phone, '-') eq tel }">
												<option selected>${ tel }</option>	
											</c:if>
											
											<c:if test="${ tel_first ne tel }">
												<option>${ tel }</option>	
											</c:if>
										</c:forEach>
									</select>
									<input type="tel"
										class="form-control" value="${ fn:substringBefore(fn:substringAfter(updateMember.phone, '-'), '-') }" id="phone1" name="phone1" maxlength="4" style="width: 20%; display: inline; margin: 0 20px 10px 0">
									<input type="tel"
										class="form-control" value="${ fn:substringAfter(fn:substringAfter(updateMember.phone, '-'), '-') }" id="phone2" name="phone2" maxlength="4" style="width: 20%; display: inline; margin: 0 20px 10px 0">
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
								
								<div class="form-group" style="margin-bottom: 0;">
									<label for="pwd">회원 탈퇴</label>
								</div> 
								<button type="button" onclick="deleteConfirm();" class="btn btn-primary" style="margin-bottom: 20px;"> 회원 탈퇴</button>


								<div class="text-center">
									<button type="submit" class="btn btn-primary" onclick="return confirm(&quot;수정하시겠습니까?&quot;);">
										 수정
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

function deleteConfirm(){
	if(confirm("정말 탈퇴하시겠습니까?") == true){
		location.href = "member.dormant.do?member_id=${ updateMember.member_id }";
	}
}

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
    
    
    
    // PASSWORD CHANGE POPUP
    var openPop;
	function passChange(){
    	openPop = window.open("member.passwordView.do", "a", "width=470 height=410, left=100, top=100");
	}
	
</script>
</body>
</html>