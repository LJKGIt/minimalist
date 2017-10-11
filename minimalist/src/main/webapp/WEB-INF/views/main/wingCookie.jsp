<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Collections, java.util.List, com.kh.minimalist.product.model.vo.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cookieList" value="${ cookieList }" />
<%
@SuppressWarnings("unchecked")
List<Product> reverseList = (List<Product>)request.getAttribute("cookieList");
Collections.reverse(reverseList); request.setAttribute("cookieList", reverseList);
/* for( Product co : reverseList )
	System.out.println(co); */
%>
<!DOCTYPE html>
<html>
<head>
<!-- COOKIE HOVER STYLE -->
<link href="resources/css/slick.css" rel="stylesheet">
<link href="resources/css/slick-theme.css" rel="stylesheet">
<script src="resources/js/slick.js"></script>
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

.slick-prev:before, .slick-next:before {
	color: black;
}

@MEDIA only screen and (min-width: 1200px) {
	.cookieDiv{
		margin-left: 580px;
		left: 50%;
	}
}
@MEDIA only screen and (max-width: 1199px) {
	.cookieDiv{
		margin-left: 480px;
		left: 50%;
	}
}
</style>
</head>

<body>
<div class="cookieDiv" class="col-md-1 visible-lg-block visible-md-block" data-spy="affix" data-offset-top="0">
	<div class="box" style="width: 150px; padding: 10px;">
		<div class="box"
			style="padding: 0; text-align: center; margin-bottom: 10px;">
			최근 본 상품<br> <a href="#">${ cookieList.size() }</a> <br>
			<!-- COOKIE ENTITY -->
			<section class="vertical slider">
				<c:if test="${ !empty cookieList }">
					<c:forEach var="recent" items="${cookieList}" varStatus="status">
						<div style="position: relative;" class="cookie">
							<button name="${ recent.product_code }"
								class="btn btn-link btn-xs delCookie"
								style="display: none; color: black; position: absolute; top: 0; right: 0px; text-decoration: none;">
								<span class="fa fa-remove "></span>
							</button>
							<a href="productDetail.do?product_code=${ recent.product_code }">
								<img
								src="${ pageContext.request.contextPath }/resources/img_product/${ recent.productImageList[0].product_image_path }"
								alt="${ recent.product_name }" style="width: 100px;"><br>
							<%--  ${ recent.product_name } --%>
							</a>
						</div>
					</c:forEach>
				</c:if>

			</section>
		</div>
		<div class="box goTop"
			style="padding: 10px; text-align: center; margin: 0">
			<i class="fa fa-chevron-up"></i> <strong>TOP</strong>
		</div>
	</div>
</div>
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
		
		// GO TOP
		$(function() {
			
			$('.goTop').click(function() {

				$('body,html').animate({
					'scrollTop' : 0
				}, 500)
			})

			var spotarr = [];

			$('body section').each(function(i, e) {
				spotarr.push($(e).offset().top)
			})

			$(window).scroll(function() {
				var sct = $(window).scrollTop()

				$('body section').each(function(i, e) {
					bg(sct);
				})

			})

			$(window).trigger('scroll')

			function bg(x) {
				if (x > 200) {
					$('.goTop').css({
						'opacity' : '1'
					})

				} else {
					$('.goTop').css({
						//yjP - 원래 0이었음
						'opacity' : '1'

					})

				}

			}

			$('.goTop').on({

				mouseenter : function() {

					$(this).css({
						'background-color' : '#f0f0f0'
					})
				},

				mouseleave : function() {

					$(this).css({
						'background-color' : '#fff'
					})
				}
			})

		})
	</script>

</body>
</html>