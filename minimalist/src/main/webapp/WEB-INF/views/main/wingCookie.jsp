<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Collections, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cookieList" value="${ cookieList }"/>
<%
//@SuppressWarnings("unchecked")
List<String> reverseList = (List<String>)request.getAttribute("cookieList");
Collections.reverse(reverseList); request.setAttribute("cookieList", reverseList);%>
<!-- COOKIE HOVER STYLE -->
<style type="text/css">
	.cookie:hover .delCookie {
		display: block !important;
	}
</style>

<script src="resources/js/jquery-1.11.0.min.js"></script>

<body>
	<!-- COOKIE ENTITY -->
	<c:if test="${ !empty cookieList }">
		<c:forEach var="recent" items="${cookieList}" begin="" end="" varStatus="status">
			<div style="position: relative;" class="cookie">
				<button name="${ recent.product_code }" class="btn btn-default btn-xs delCookie"
					style="display: none; position: absolute; top: 0; right: 10px;"><span class="glyphicon glyphicon-remove "></span></button>
				<a href="productDetail.do?product_code=${ recent.product_code }">
					<img src="${ pageContext.request.contextPath }/resources/img_product/${ recent.product_code }_1.jpg"
					alt="${ recent.product_name }" style="width: 100px;"><br> ${ recent.product_name }
				</a>
			</div>
		</c:forEach>
	</c:if>
	<div style="display:block; margin: 10px 0;">
		<button type="button" class="btn btn-default btn-xs" id="left"><span class="glyphicon glyphicon-menu-left"></span></button>
		<button type="button" class="btn btn-default btn-xs" id="right"><span class="glyphicon glyphicon-menu-right"></span></button>
	</div>
	<!-- COOKIE TEST END -->



	
	<script>
		$(function() {
			/* COOKIE PAGING */
			var start = 1;
			var end = ${ cookieList.size() };
			
			var currentPage = 1;
			
			// 보여줄 물품 개수
			var countList = 2;
			
			$(function(){
				
			})
	
	
			/* COOKIE DELETE */
			$('.delCookie').click(function() {
				var product_code = $(this).attr("name");
				$.ajax({
					url : "deleteCookie.do",
					type : "POST",
					data : {
						"del_cookie" : product_code
					},
					dataType : "text",
					success : function(value) {
						if (value === "yes") {
							location.reload();
						} else {
							alert("최근본 상품 삭제 실패 다시 시도해 주세요.");
						}
					},
					error : function() {
						alert("최근본 상품 삭제 실패 다시 시도해 주세요.");
					}
				});
			});

		});
	</script>
</body>
</html>