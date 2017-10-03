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

<script>
	var menuNum = 5;
</script>
</head>
<body style="min-width: 360px;">

	<c:import url="../main/header.jsp" />
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="col-md-11">
					<ul class="breadcrumb">
						<li><a href="index.do">Home</a></li>
						<li>내 경매</li>
					</ul>
				</div>
				<c:import url="mypageAside.jsp"/>
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