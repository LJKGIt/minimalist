<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
						<li>내 경매내역</li>
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
								<li><a href="mypage.do"><i
										class="fa fa-list"></i> 주문내역</a></li>
								<li><a href="wishlist.do"><i class="fa fa-heart"></i> 찜
										목록</a></li>
								<li><a href="infomation.do"><i class="fa fa-user"></i>
										내 정보보기</a></li>
								<li><a href="#"><i class="fa fa-sign-out"></i> 내가 쓴 후기</a>
								</li>
								<li><a href="#"><i class="fa fa-sign-out"></i> 내 상품문의</a></li>
								<li class="active"><a href="auction.selectMemberAuction.do"><i
										class="fa fa-sign-out"></i> 내 경매내역</a></li>
							</ul>
						</div>
					</div>
					<!-- /.col-md-3 -->
					<!-- *** CUSTOMER MENU END *** -->


				</div>
				<div class="col-md-8">
						<!-- 경매 -->
						<c:if test="${!empty list}">
							<c:forEach var="au" items="${list}">
								<div class="col-md-4 col-sm-6">
									<div class="product">
										<div class="flip-container">
											<div class="flipper">
												<div class="front">
													<a href=""> <c:forTokens var="img"
															items="${au.image_path}" delims="," varStatus="index">
															<c:if test="${index.count eq 1}">
																<c:set var="img1" value="${img}" />
															</c:if>
															<c:if test="${index.count eq 2}">
																<c:set var="img2" value="${img}" />
															</c:if>
														</c:forTokens> <img src="/minimalist/resources/img_auction/${img1}"
														alt="" class="img-responsive">
													</a>
												</div>
												<div class="back">
													<a
														href="auction.selectOne.do?auction_code=${au.auction_code}">
														<img src="/minimalist/resources/img_auction/${img1}"
														alt="" class="img-responsive">
													</a>
												</div>
											</div>
										</div>
										<a href="auction.selectOne.do?auction_code=${au.auction_code}"
											class="invisible"> <img
											src="/minimalist/resources/img_auction/${img1}" alt=""
											class="img-responsive">

										</a>
										<div class="text">
											<h3>
												<a
													href="auction.selectOne.do?auction_code=${au.auction_code}">${au.auction_brand}
													- ${au.auction_name }</a>
											</h3>
											<p class="price">
												<font size=3px>현재 입찰가 : <fmt:formatNumber
														value="${au.bid_price}" type="currency" /></font>
											</p>
											<p>
												<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경매
													종료 :<fmt:formatDate value="${au.end_date}" type="date"
														pattern="MM월dd일" />
												</font>
											</p>
											<p class="buttons">
												<a
													href="auction.selectOne.do?auction_code=${au.auction_code}"
													class="btn btn-default">View detail</a>

											</p>
										</div>
										<!-- /.text -->
									</div>
									<!-- /.product -->
								</div>
							</c:forEach>
						</c:if>
						<!-- 현재 경매중인 상품이 없는 경우. -->
						<c:if test="${empty list}">
							<p align="center">현재 경매중인 상품이 없습니다.</p>
						</c:if>
				</div>
				<!-- 모바일 구현 X RECENT VIEW END -->

			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
		<c:import url="../main/footer.jsp" />


	</div>
	<!-- /#all -->
</body>
</html>