<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<!-- integrity, crossorigin가 오류나고 중요하지 않은 코드이므로 주석으로 처리했습니다.
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 	 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <title>
       Minimalist
    </title>
     <link rel="shortcut icon" href="resources/favicon6.ico" type="image/x-icon">
</head>
<body style="min-width: 360px;">

	<c:import url="../main/header.jsp" />
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="col-md-11">
					<ul class="breadcrumb">
						<li><a href="index.do">Home</a></li>
						<li>주문내역</li>
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
								<li class="active"><a href="member.mypage.do"><i
										class="fa fa-list"></i> 주문내역</a></li>
								<li><a href="wish.wishlist.do"><i class="fa fa-heart"></i> 찜
										목록</a></li>
								<li><a href="passwordCheck.do"><i class="fa fa-user"></i>
										내 정보보기</a></li>
								<li><a href="#"><i class="fa fa-sign-out"></i> 내가 쓴 후기</a>
								</li>
								<li><a href="qna.selectList.do"><i
										class="fa fa-sign-out"></i> 내 상품문의(다른 곳으로 이동)</a></li>
								<li><a href="auction.selectMemberAuction.do"><i
										class="fa fa-sign-out"></i> 내 경매</a></li>
							</ul>
						</div>
					</div>
					<!-- /.col-md-3 -->
					<!-- *** CUSTOMER MENU END *** -->


				</div>
				<div class="col-md-8" id="customer-orders">
					<div class="box">
						<h1>My M</h1>
						(minimalist라는 뜻ㅎ)

						<p class="lead">최근 구매내역</p>
						<p class="text-muted">
							If you have any questions, please feel free to <a
								href="contact.jsp">contact us</a>, our customer service center
							is working for you 24/7.
						</p>

						<hr>

						<!-- SAMPLE ORDERS -->
						<c:if test="${ empty myOrder }">
							주문내역이 존재하지 않습니다.
						</c:if>
						<c:if test="${ !empty myOrder }">
						<c:forEach var="myOrder" items="${ myOrder }">
						<div class="well">
							<div class="row" style="margin: 0;">
								${ myOrder.orderinfo_date } <a href="#" style="float: right;">주문상세</a>
							</div>
							<hr style="margin: 5px;">
							<div class="row" style="margin: 0;">
								<a href="productDetail.do?product_code=${ myOrder.product_code }"> <img
									src="${ pageContext.request.contextPath }/resources/img_product/1500000001_1.jpg"
									style="margin: 0 10px 10px 0; width: 100px; float: left;" />
								</a>
								<ul style="list-style-type: none; margin-left: 65px;">
									<li><strong>JUUN.J</strong></li>
									<li>${ myOrder.product_code }</li>
									<li>price : $1,605,000</li>
									<li>size : 55</li>
								</ul>
							</div>
							<div class="row" style="margin: 0;">
								<strong>72,500원</strong> <span class="label label-info"
									style="float: right;">Being prepared</span>
							</div>
						</div>
						</c:forEach>
						</c:if>
					</div>
				</div>


				<!-- RECENT VIEW (모바일 구현 X) -->
				<div class="col-md-1 visible-lg-block visible-md-block"
					style="position: absolute; margin-left: 480px; left: 50%;">
					<!-- 893px ~ 1080px 까지는 달라짐 -->
					<div class="box" style="width: 150px; padding: 10px;">
						<div class="box"
							style="padding: 0; text-align: center; margin-bottom: 10px;">
							최근 본 상품<br>
							<a href="#">${ cookieList.size() }</a>
							<br>
							<c:import url="../main/wingCookie.jsp"></c:import>

						</div>
						<div class="box goTop"
							style="padding: 10px; text-align: center; margin: 0">
							<i class="fa fa-chevron-up"></i> <strong>TOP</strong>
						</div>
					</div>
				</div>
				<!-- 모바일 구현 X RECENT VIEW END -->

			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
		<c:import url="../main/footer.jsp" />


	</div>
	<!-- /#all -->



	<!-- NAV MENU ACTIVE -->
	<!-- <script>
		$('#list > li:eq(0)').removeClass('active');
		$('#list > li:eq(4)').addClass('active');
	</script> -->

	<!-- GO TOP -->
	<script>
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
						//TODO [yjP] 원래 0이었음
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

<script src="resources/js/slick.js"></script>
</body>
</html>