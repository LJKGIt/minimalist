<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<c:forEach var="recent" items="${cookieList}">
			<div style="position: relative;" class="cookie">
				<button name="${ recent.product_code }" class="glyphicon glyphicon-remove delCookie"
					style="display: none; position: absolute; top: 0; right: 10px;"></button>
				<a href="productDetail.do?product_code=${ recent.product_code }">
					<img src="${ pageContext.request.contextPath }/resources/img_product/${ recent.product_code }_1.jpg"
					alt="${ recent.product_name }" style="width: 100px;"><br> ${ recent.product_name }
				</a>
			</div>
		</c:forEach>
	</c:if>
	<!-- COOKIE TEST END -->

	
	<script>
	<!-- COOKIE SCRIPT -->
		$(function() {
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