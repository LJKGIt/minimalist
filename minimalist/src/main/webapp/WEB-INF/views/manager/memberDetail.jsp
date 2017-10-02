<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.doBtn').click(function(){
		var arr=$(this).val().split(',');
		var id=arr[0];
		var yn=arr[1];
		$.ajax({
			url : "member.updateDormant.do",
			type : "get",
			data : {id : id, yn : yn},
			dataType : "text",
			success : function(value){
				if(value=='yes'){
					alert("적용되었습니다.");
					location.reload();
				}else {
					alert('실패');
				}
			
		}
	});
	});
	
	$('#gradeBtn').click(function(){
		var grade=$('#gradeInput').val();
		var id=$(this).val();
		if(grade == 0){
			alert('변경하려는 등급을 입력해주세요.');
			return;
			}else if(grade < 0 ){
				alert('음수는 입력할 수 없습니다.');
				return;
			} else {
			$.ajax({
				url : "member.updateGrade.do",
				type : "get",
				data : {id : id, grade : grade},
				dataType : "text",
				success : function(value){
					if(value=='yes'){
						alert("적용되었습니다.");
						location.reload();
					}else {
						alert('실패');
					}
				
			}
		});
		}
	});
});

</script>

<style type="text/css">
#memberDetail {
	font-size:20px;
}

</style>





<body>
	<c:import url="../main/header.jsp" /> 
<div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>관리자페이지</li>
                    </ul>

                </div>

                <c:import url="../main/aside_admin.jsp" />

                <div class="col-md-9">


                    <div class="box" id="contact">
                      <h1 align="center">회원 상세정보</h1>
						
						<div id="memberDetail" align="center">
						<p>아이디 : ${member.member_id}</p>
						<p>이름 : ${member.member_name}</p>
						<p>가입일 : ${member.regist_date}</p>
						<p>등급 : ${member.grade}
						<input type="number" style="width:50px" id="gradeInput"><button type="button" id="gradeBtn" value="${member.member_id}">
						등급조정
						</button>
						</p>
						<p>연락처 : ${member.phone}</p>
						<p>주소 : ${member.address1} ${member.address2}</p>
						<p>이메일 : ${member.email}</p>
						<p>휴면 여부 : ${member.dormant_yn}
						
						<c:if test="${yn eq 'y'}">
						<button type="button" class="doBtn" value="${member.member_id},n">계정활성화</button>
						</c:if>
						<c:if test="${yn eq 'n'}">
						<button type="button"  class="doBtn" value="${member.member_id},y">계정정지</button>
						</c:if>
						</p>
						
						</div>
					
					

                    </div>


                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

		<c:import url="../main/footer.jsp" />


    </div>
    <!-- /#all -->

    




    

	<c:import url="../main/footer.jsp" /> 
</body>
</html>