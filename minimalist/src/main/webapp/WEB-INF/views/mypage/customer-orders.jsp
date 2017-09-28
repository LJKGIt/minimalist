<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<!-- integrity, crossorigin가 오류나고 중요하지 않은 코드이므로 주석으로 처리했습니다.
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 	 -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

   
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
				<c:import url="mypageAside.jsp"/>
				<div class="col-md-8" id="customer-orders">
					<div class="box">
						<h2>My Minimalist</h2>

						<div class="panel panel-default">
							<div class="panel-heading">
								${ member.member_name } 님의 기본 정보
							</div>
							<div class="panel-body" style="height: 50px;">
								<ul>
									<li style="float: left; margin-right: 40%; ">포인트 : ${ member.point } P</li>
									<li>
										등급 : 
									<c:if test="${ member.grade eq 0 }">
										일반회원
									</c:if>
									<c:if test="${ member.grade eq 1 }">
										찌꺼기
									</c:if>
									<c:if test="${ member.grade eq 2 }">
										VIP
									</c:if>
									</li>
								</ul>
							</div>
							
						</div>

						<hr>

						<!-- RECENT ORDERS -->
						<c:if test="${ empty myOrder }">
							주문내역이 존재하지 않습니다.
						</c:if>
						<c:if test="${ !empty myOrder }">
						<c:forEach var="myOrder" items="${ myOrder }" varStatus="status">
						<div class="well">
							<div class="row" style="margin: 0;">
								${ myOrder.orderinfo_date } <a href="#" style="float: right;" data-toggle="modal" data-target="#detailModal${ status.index }">주문상세</a>
							</div>
							<hr style="margin: 5px;">
							<div class="row" style="margin: 0;">
								<a href="productDetail.do?product_code=${ myOrder.product_code }"> <img
									src="${ pageContext.request.contextPath }/resources/img_product/${ myOrder.productJoin.product_code }_1.jpg"
									style="margin: 0 10px 10px 0; width: 100px; float: left;" />
								</a>
								<ul style="list-style-type: none; margin-left: 65px;">
									<li><strong>${ myOrder.productJoin.product_brand }</strong></li>
									<li><h4><a href="productDetail.do?product_code=${ myOrder.product_code }" style="color: black;">${ myOrder.productJoin.product_name }</a></h4></li>
									<% //TODO [yjP] SIZE COLUMN 추가 후 INSERT %>
									<li>size : 55</li>
								</ul>
							</div>
							<div class="row" style="margin: 0;">
								<strong><fmt:formatNumber value="${ myOrder.productJoin.rent_price }" type="currency" currencySymbol="&#65510; " groupingUsed="true"/></strong> 
								<a id="delivery" class="label label-info" style="float: right;"><input type="hidden" id="deliveryNo" value="6069503660528">배송조회</a>
							</div>
						</div>
						<!-- RECENT ORDERS END-->


						<!-- DETAIL MODAL -->
								<div class="modal fade" id="detailModal${ status.index }" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">주문상세</h4>
											</div>
											<div class="modal-body">
												<div class="row" style="margin: 0;">
													<div class="table-responsive">
													<table class="table table-bordered table-hover" style="float: right;">
														<tr>
															<td>주문일자</td>
															<td>${ myOrder.orderinfo_date }</td>
														</tr>
														<tr>
															<td>주문번호</td>
															<td>${ myOrder.orderinfo_code }</td>
														</tr>
														<tr>
															<td>제품코드</td>
															<td>${ myOrder.productJoin.product_code }</td>
														</tr>
														<tr>
															<td>상호명</td>
															<td>${ myOrder.productJoin.product_brand }</td>
														</tr>
														<tr>
															<td>제품명</td>
															<td><a href="productDetail.do?product_code=${ myOrder.product_code }"
																style="color: black;">${ myOrder.productJoin.product_name }</a></td>
														</tr>
														<tr>
															<td>카테고리</td>
															<td>${ myOrder.productJoin.product_category }</td>
														</tr>
														<tr>
															<td>사이즈</td>
															<td>55</td>
														</tr>
														<tr>
															<td>색상</td>
															<td>${ myOrder.productJoin.product_color }</td>
														</tr>
														<tr>
															<td>배송상태</td>
															<td>배송 준비중</td>
														</tr>
														<tr>
															<td>송장번호</td>
															<td>6069503660528</td>
														</tr>
														<tr>
															<td>주문금액</td>
															<td><fmt:formatNumber value="${ myOrder.productJoin.rent_price }" type="currency" currencySymbol="&#65510; " groupingUsed="true"/></td>
														</tr>
														<tr>
															<td>할인금액( - )</td>
															<td><c:set var="discount" value="0" />
																<fmt:formatNumber value="${ discount }" type="currency"
																	currencySymbol="&#65510; " groupingUsed="true" /></td>
														</tr>
														<tr>
															<td>총 결제금액</td>
															<td><fmt:formatNumber value="${ myOrder.productJoin.rent_price - discount }" type="currency" currencySymbol="&#65510; " groupingUsed="true"/></td>
														</tr>
													</table>
													</div>
												</div>


											</div>
										</div>
									</div>
								</div>
								<!-- DETAIL MODAL END -->

						</c:forEach>
						</c:if>
					</div>
					<!-- BOX END -->
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

	<script>
		$(function() {
			
			$( "#delivery" ).click(function() {
			   window.open("http://nexs.cjgls.com/web/info.jsp?slipno="+$("#deliveryNo").val(), "a", "width=700 height=500, left=100, top=100");
			}); 
			
			
			
			// GO TOP
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