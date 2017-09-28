<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Collections, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cookieList" value="${ cookieList }"/>
<%
// TODO [lintogi] □ 형변환을 해결하기.
@SuppressWarnings("unchecked")
List<String> reverseList = (List<String>)request.getAttribute("cookieList");
Collections.reverse(reverseList); request.setAttribute("cookieList", reverseList);%>
<!-- COOKIE HOVER STYLE -->
<link href="resources/css/slick.css" rel="stylesheet">
<link href="resources/css/slick-theme.css" rel="stylesheet">
<style type="text/css">
	.cookie:hover .delCookie {
		display: block !important;
	}
	
	.slider {
        width: 80%;
        margin: auto;
    }

    .slick-slide {
      margin: 0;
    }

    .slick-slide a img {
      width: 100%;
    }

    .slick-prev:before,
    .slick-next:before {
      color: black;
    }
</style>


<body>
	<!-- COOKIE ENTITY -->
	<section class="vertical slider">
	<c:if test="${ !empty cookieList }">
		<c:forEach var="recent" items="${cookieList}" varStatus="status">
			<div style="position: relative;" class="cookie">
				<button name="${ recent.product_code }" class="btn btn-link btn-xs delCookie"
					style="display: none; color: black; position: absolute; top: 0; right: 0px; text-decoration: none;"><span class="fa fa-remove "></span></button>
				<a href="productDetail.do?product_code=${ recent.product_code }">
					<img src="${ pageContext.request.contextPath }/resources/img_product/${ recent.product_code }_1.jpg"
					alt="${ recent.product_name }" style="width: 100px;"><br><%--  ${ recent.product_name } --%>
				</a>
			</div>
		</c:forEach>
	</c:if>
	</section>
	
	<!-- COOKIE TEST END -->


  
  <script type="text/javascript">
    $(document).on('ready', function() {
           $(".vertical").slick({
        vertical: true,
        slidesToShow: 2,
        slidesToScroll: 2
      });
    });
</script>



	
	<script>
		$(function() {
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