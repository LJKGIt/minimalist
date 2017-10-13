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
<script>
	var menuNum = 0;
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
						<li>주문내역</li>
					</ul>
				</div>
				<c:import url="mypageAside.jsp"/>
				<div class="col-md-9" id="customer-orders">
					<div class="box">
						<h3>주문 / 배송 조회</h3>

						<div class="panel panel-default">
							<div class="panel-heading">
								${ member.member_name } 님의 기본 정보
							</div>
							<div class="panel-body" style="height: 70px;">
								<div class="col-md-6">·포인트 : ${ member.point } P</div>
								<div class="col-md-6">·등급 : 
									<c:if test="${ member.grade eq 0 }">
										Bronze
									</c:if>
									<c:if test="${ member.grade > 0 && member.grade <= 2 }">
										Silver
									</c:if>
									<c:if test="${ member.grade >= 3 && member.grade <= 5 }">
										Gold
									</c:if>
									<c:if test="${ member.grade >= 6 }">
										VIP
									</c:if>
									</div>
							</div>
							
						</div>

						<hr>

						<!-- RECENT ORDERS -->
						<div class="panel panel-default">
						<div class="panel-heading">
						<div class="row" style="margin: 10px;">
							<a href="member.mypage.do?orderDay=1" class="btn btn-primary btn-xs">오늘</a>
							<a href="member.mypage.do?orderDay=7" class="btn btn-primary btn-xs">1주일</a>
							<a href="member.mypage.do?orderDay=30" class="btn btn-primary btn-xs">1개월</a>
							<a href="member.mypage.do?orderDay=180" class="btn btn-primary btn-xs">6개월</a>
							<!-- <a href="member.mypage.do?orderDay=365" class="btn btn-primary btn-xs">1년</a> -->
							<a href="member.mypage.do?orderDay=-1" class="btn btn-primary btn-xs">전체</a>
						</div>
						<div class="row" style="margin: 10px;">
							<form action="member.mypage.do" class="">
								<div class="input-group">
									<input type="text" name="orderKeyword" class="form-control input-sm" placeholder="상품명을 검색하세요" value="${orderKeyword}">
									<div class="input-group-btn">
										<button type="submit" class="btn btn-default btn-sm">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</form>						
						</div>
						</div>
						</div>
						
						<c:if test="${ empty myOrder }">
							<br>
							<br>
							<p style="text-align: center;">주문내역이 존재하지 않습니다.</p>
							<br>
							<br>
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
										<li>size : ${ myOrder.order_size }</li>
										<li><strong><fmt:formatNumber value="${ myOrder.productJoin.rent_price }" type="currency" currencySymbol="&#65510; " groupingUsed="true"/></strong> 
										<a id="delivery" class="label label-info" style="float: right;"><input type="hidden" id="deliveryNo" value="6069503660528">배송조회</a></li>
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
														<td>${ myOrder.productJoin.product_name }</td>
													</tr>
													<tr>
														<td>카테고리</td>
														<td>${ myOrder.productJoin.product_category }</td>
													</tr>
													<tr>
														<td>사이즈</td>
														<td>${ myOrder.order_size }</td>
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
						
						<!-- PAGING -->
						<c:if test="${ totalPage ne 0 }">
						<div class="pages">
	                        <ul class="pagination">
	                        	<c:if test="${currentPage ne 1}">
	                        		<li><a href="member.mypage.do?page=${currentPage - 1}&orderDay=${orderDay}&orderKeyword=${orderKeyword}">&laquo;</a></li>
	                        	</c:if>
	                        	<c:forEach var="page" begin="${startPage}" end="${endPage}">      
	                        		<c:if test="${page eq currentPage}">                        	
	                        			<li class="active"><a>${page}</a>
	                        		</c:if>
	                        		<c:if test="${page ne currentPage}">
	                        			<li><a href="member.mypage.do?page=${page}&orderDay=${orderDay}&orderKeyword=${orderKeyword}">${page}</a></li>
	                        		</c:if>
	                        	</c:forEach>
	                        	<c:if test="${currentPage ne totalPage}">
	                        		<li><a href="member.mypage.do?page=${currentPage + 1}&orderDay=${orderDay}&orderKeyword=${orderKeyword}">&raquo;</a></li>
	                        	</c:if>
	                        </ul>
	                    </div>
						</c:if>
					</div>
					<!-- BOX END -->
				</div>
				<!-- COOKIE -->
				<%-- <c:import url="../main/wingCookie.jsp"/> --%>
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
		<c:import url="../main/footer.jsp" />
	</div>
	<!-- /#all -->

	<script>
		$(function() {
			$( "#delivery" ).click(function() {
			   window.open("http://nexs.cjgls.com/web/info.jsp?slipno="+$("#deliveryNo").val(), "a", "width=700 height=500, left=100, top=100");
			}); 
		})
	</script>
</body>
</html>