<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="index.do">Home</a></li>
						<li>내 경매</li>
					</ul>
				</div>
				<c:import url="mypageAside.jsp" />
				<div class="col-md-9">
					<!-- 경매 낙찰 물품 -->
					<div class="box">
						<c:if test="${ empty incomeList }">
							<br>
							<br>
							<p style="text-align: center;">낙찰된 물품 내역이 존재하지 않습니다.</p>
							<br>
							<br>
						</c:if>
						<c:if test="${ !empty incomeList }">
						<h3>낙찰된 경매 상품</h3>
						<br>
							<c:forEach var="income" items="${ incomeList }" varStatus="status">
							
							<div class="well">
								<div class="row" style="margin: 0;">
									${ income.income_date } <a href="#" style="float: right;" data-toggle="modal" data-target="#detailModal${ status.index }">주문상세</a>
								</div>
								<hr style="margin: 5px;">
								<div class="row" style="margin: 0;">
									<a href="auction.selectOne.do?auction_code=${ fn:substringBefore(income.auctionJoin.image_path, ',') }"> <img
										src="${ pageContext.request.contextPath }/resources/img_auction/${ fn:substringBefore(income.auctionJoin.image_path, ',') }"
										style="margin: 0 10px 10px 0; width: 100px; float: left;" />
									</a>
									<ul style="list-style-type: none; margin-left: 65px;">
										<li><strong>${ income.auctionJoin.auction_brand }</strong></li>
										<li><h4><a href="productDetail.do?product_code=${ income.auction_code }" style="color: black;">${ income.auctionJoin.auction_name }</a></h4></li>
										<li>size : ${ income.auctionJoin.auction_size }</li>
										<li>
											<strong><fmt:formatNumber value="${ income.income }" type="currency" currencySymbol="&#65510; " groupingUsed="true"/></strong>
											<%-- ${income.order_invoice_number} --%> 
											<a id="delivery" class="label label-info" style="float: right;"><input type="hidden" id="deliveryNo" value="6069503660528">배송조회</a>
										</li>
									</ul>
								</div>
								<div class="row" style="margin: 0;">
									
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
														<td>${ income.income_date }</td>
													</tr>
													<tr>
														<td>주문번호</td>
														<td>${ income.income_number }</td>
													</tr>
													<tr>
														<td>제품코드</td>
														<td>${ income.auction_code }</td>
													</tr>
													<tr>
														<td>상호명</td>
														<td>${ income.auctionJoin.auction_brand }</td>
													</tr>
													<tr>
														<td>제품명</td>
														<td>${ income.auctionJoin.auction_name }</td>
													</tr>
													<tr>
														<td>카테고리</td>
														<td>${ income.auctionJoin.auction_category }</td>
													</tr>
													<tr>
														<td>사이즈</td>
														<td>${ income.auctionJoin.auction_size }</td>
													</tr>
													<tr>
														<td>색상</td>
														<td>${ income.auctionJoin.auction_color }</td>
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
														<td><fmt:formatNumber value="${ income.income }" type="currency" currencySymbol="&#65510; " groupingUsed="true"/></td>
													</tr>
													<tr>
														<td>할인금액( - )</td>
														<td><c:set var="discount" value="0" />
															<fmt:formatNumber value="${ discount }" type="currency"
																currencySymbol="&#65510; " groupingUsed="true" /></td>
													</tr>
													<tr>
														<td>총 결제금액</td>
														<td><fmt:formatNumber value="${ income.income - discount }" type="currency" currencySymbol="&#65510; " groupingUsed="true"/></td>
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
					
					<!-- 경매 -->
					<c:if test="${!empty auctionList}">
						<c:forEach var="au" items="${auctionList}">
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
													<img src="/minimalist/resources/img_auction/${img1}" alt=""
													class="img-responsive">
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
										<h3 style="margin: 0;">
											<a
												href="auction.selectOne.do?auction_code=${au.auction_code}">${au.auction_brand}
												- ${au.auction_name }</a>
										</h3>
										<p class="price" style="font-weight: bold;">
											<font size=3px>
											<c:if test="${ au.bidInfo[0].max_bid == au.bidInfo[0].bid_price }">
												현재 최고 입찰자입니다.
											</c:if>
											<c:if test="${ au.bidInfo[0].max_bid > au.bidInfo[0].bid_price }">
												현재 입찰가 : <fmt:formatNumber value="${au.bidInfo[0].max_bid}" type="currency" />
											</c:if>
											</font>
										</p>
										<p class="price">
											<font size=3px>내 입찰가 : <fmt:formatNumber
													value="${au.bidInfo[0].bid_price}" type="currency" /></font>
										</p>
										<p style="text-align : center;">
											<font color="red">경매
												종료 :<fmt:formatDate value="${au.end_date}" type="date"
													pattern="MM월dd일" />
											</font>
										</p>
									</div>
									<!-- /.text -->
								</div>
								<!-- /.product -->
							</div>
						</c:forEach>
					</c:if>
					<!-- 현재 경매중인 상품이 없는 경우. -->
					<c:if test="${empty auctionList}">
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