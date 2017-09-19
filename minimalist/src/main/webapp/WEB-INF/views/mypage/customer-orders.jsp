<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<title>Obaju : e-commerce template</title>
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
								<li class="active"><a href="mypage.do"><i
										class="fa fa-list"></i> 주문내역</a></li>
								<li><a href="wishlist.do"><i class="fa fa-heart"></i> 찜
										목록</a></li>
								<li><a href="infomation.do"><i class="fa fa-user"></i>
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
						<div class="well">
							<div class="row" style="margin: 0;">
								2017/09/01 <a href="#" style="float: right;">주문상세</a>
							</div>
							<hr style="margin: 5px;">
							<div class="row" style="margin: 0;">
								<a href="customer-order.jsp"> <img
									src="resources/img/sample.gif"
									style="margin: 10px; width: 60px; height: 60px; float: left;" />
								</a>
								<ul style="list-style-type: none; margin-left: 65px;">
									<li><strong>JUUN.J</strong></li>
									<li>Juun.J Wolf T-shirt</li>
									<li>price : $1,605,000</li>
									<li>size : 55</li>
								</ul>
							</div>
							<div class="row" style="margin: 0;">
								<strong>72,500원</strong> <span class="label label-info"
									style="float: right;">Being prepared</span>
							</div>
						</div>
						<!-- SAMPLE ORDERS END -->

						<div class="well" style="min-width: 250px;">
							<div class="row" style="margin: 0;">
								2017/09/01 <a href="#" style="float: right;">주문상세</a>
							</div>
							<hr style="margin: 5px;">
							<div class="row" style="margin: 0;">
								<a href="customer-order.jsp"> <img
									src="resources/img/sample.gif"
									style="margin: 10px; width: 60px; height: 60px; float: left;" />
								</a>
								<ul style="list-style-type: none; margin-left: 65px;">
									<li><strong>JUUN.J</strong></li>
									<li>Juun.J Wolf T-shirt</li>
									<li>price : $1,605,000</li>
									<li>size : 55</li>
								</ul>
							</div>
							<div class="row" style="margin: 0;">
								<strong>72,500원</strong> <span class="label label-warning"
									style="float: right;">On hold</span>
							</div>
						</div>

						<div class="well" style="min-width: 250px;">
							<div class="row" style="margin: 0;">
								2017/09/01 <a href="#" style="float: right;">주문상세</a>
							</div>
							<hr style="margin: 5px;">
							<div class="row" style="margin: 0;">
								<a href="customer-order.jsp"> <img
									src="resources/img/sample.gif"
									style="margin: 10px; width: 60px; height: 60px; float: left;" />
								</a>
								<ul style="list-style-type: none; margin-left: 65px;">
									<li><strong>JUUN.J</strong></li>
									<li>Juun.J Wolf T-shirt</li>
									<li>price : $1,605,000</li>
									<li>size : 55</li>
								</ul>
							</div>
							<div class="row" style="margin: 0;">
								<strong>72,500원</strong> <span class="label label-success"
									style="float: right;">Received</span>
							</div>
						</div>

						<div class="well" style="min-width: 250px;">
							<div class="row" style="margin: 0;">
								2017/09/01 <a href="#" style="float: right;">주문상세</a>
							</div>
							<hr style="margin: 5px;">
							<div class="row" style="margin: 0;">
								<a href="customer-order.jsp"> <img
									src="resources/img/sample.gif"
									style="margin: 10px; width: 60px; height: 60px; float: left;" />
								</a>
								<ul style="list-style-type: none; margin-left: 65px;">
									<li><strong>JUUN.J</strong></li>
									<li>Juun.J Wolf T-shirt</li>
									<li>price : $1,605,000</li>
									<li>size : 55</li>
								</ul>
							</div>
							<div class="row" style="margin: 0;">
								<strong>72,500원</strong> <span class="label label-danger"
									style="float: right;">Cancelled</span>
							</div>
						</div>

						<!-- <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>주문번호</th>
                                        <th>상품정보</th>
                                        <th>결제금액</th>
                                        <th>주문일</th>
                                        <th>주문상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th># 1735</th>
                                        <td><a href="customer-order.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        <td>$ 150.00</td>
                                        <td>2/06/2013
                                        </td>
                                        <td><span class="label label-info">Being prepared</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th># 1735</th>
                                        <td>22/06/2013</td>
                                        <td>$ 150.00</td>
                                        <td><span class="label label-info">Being prepared</span>
                                        </td>
                                        <td><a href="customer-order.jsp" class="btn btn-primary btn-sm">View</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th># 1735</th>
                                        <td>22/06/2013</td>
                                        <td>$ 150.00</td>
                                        <td><span class="label label-success">Received</span>
                                        </td>
                                        <td><a href="customer-order.jsp" class="btn btn-primary btn-sm">View</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th># 1735</th>
                                        <td>22/06/2013</td>
                                        <td>$ 150.00</td>
                                        <td>
                                        </td>
                                        <td><a href="customer-order.jsp" class="btn btn-primary btn-sm">View</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th># 1735</th>
                                        <td>22/06/2013</td>
                                        <td>$ 150.00</td>
                                        <td><span class="label label-warning">On hold</span>
                                        </td>
                                        <td><a href="customer-order.jsp" class="btn btn-primary btn-sm">View</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div> -->
					</div>
				</div>


				<!-- RECENT VIEW (모바일 구현 X) -->
				<div class="col-md-1 visible-lg-block visible-md-block"
					style="position: fixed; margin-left: 480px; left: 50%; bottom: 165px;">
					<!-- 893px ~ 1080px 까지는 달라짐 -->
					<div class="box" style="width: 150px; padding: 10px;">
						<div class="box"
							style="padding: 0; text-align: center; margin-bottom: 10px;">
							최근 본 상품<br>
							<!-- COOKIE TEST -->
							<c:forEach var="recent" items="${cookieList}">
								<a href="productDetail.do?product_code=${ recent.product_code }">
								<img src="${ pageContext.request.contextPath }/resources/img_product/${ recent.product_code }_1.jpg" alt="" style="width:100px;"><br>
								${ recent.product_name }
								</a>
							</c:forEach>
							<!-- COOKIE TEST END -->

						</div>
						<div class="box goTop"
							style="padding: 10px; text-align: center; margin: 0">
							<i class="glyphicon glyphicon-menu-up"></i> <strong>TOP</strong>
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
	<script>
		$('#list > li:eq(0)').removeClass('active');
		$('#list > li:eq(4)').addClass('active');
	</script>

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
					bg(sct)
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
						'opacity' : '0'

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