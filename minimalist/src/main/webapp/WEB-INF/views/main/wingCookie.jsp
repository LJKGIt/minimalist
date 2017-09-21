<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- COOKIE HOVER STYLE -->
<style type="text/css">
	.cookie:hover .delCookie{
		display: block !important;
	}
</style>

	
<meta charset="UTF-8">
<title>COOKIE</title>
</head>
<body id="cookie">
	
	
	<!-- COOKIE TEST -->
	<c:forEach var="recent" items="${cookieList}">
		
	<div style="position: relative;" class="cookie">
	<c:url var="delCookie" value="deleteCookie.do">
		<c:param name="del_cookie" value="${ recent.product_code }"/>
	</c:url>
		<a href="${ delCookie }">
			<span class="glyphicon glyphicon-remove delCookie" style="display: none; position: absolute; top: 0; right: 10px;"></span>
		</a>
		<a href="productDetail.do?product_code=${ recent.product_code }">
			<img src="${ pageContext.request.contextPath }/resources/img_product/${ recent.product_code }_1.jpg" alt="" style="width:100px;"><br>
			${ recent.product_name }
		</a>
	</div>
	</c:forEach>
	<!-- COOKIE TEST END -->
	
	
	
	<!-- DELETE AJAX -->
	<!-- <script>
		$.ajax({
			url : "deleteCookie.do",
			data : {
				del_cookie : value
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
	</script> -->
	
	<!-- 11번가 cheating -->
	<script>
		function deleteRecentViewProduct(prdNo) {
			var domain = document.domain;
			var WWW_URL = window.document.location.protocol + "//"+domain;
/* 			var member_id = '${ sessionScope.member.member_id }'; */
			$.ajax({
				url: "deleteCookie.do",
				type: "POST",
				data: {"del_cookie" : prdNo
					
				},
				success : function() {
					$('#cookie').load('wingCookie.jsp').fadeIn("slow");

				},
				error: function() {
					alert("최근본 상품 삭제 실패 다시 시도해 주세요.");
				}
			})
		}
	</script>
	
	
</body>
</html>