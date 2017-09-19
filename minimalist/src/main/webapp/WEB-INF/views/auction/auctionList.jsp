<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

    <title>
        Obaju : e-commerce template
    </title>
<link href="/minimalist/resources/css/style.default.css" rel="stylesheet" id="theme-stylesheet">


</head>

<body>
	<c:import url="../main/header.jsp" />

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>경매</li>
                        
                    </ul>
                </div>

                <div class="col-md-3">
                    <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Auction</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked category-menu">
                   
                                <li class="active">
                                    <a href="auction.selectList.do">경매중인 상품</a>
                                    <ul>
                                        <li class="active"><a href="auction.selectList.do?category=의류">의류</a>
                                        </li>
                                        <li class="active"><a href="auction.selectList.do?category=잡화">잡화</a>
                                        </li>
                                        <li class="active"><a href="auction.selectList.do?category=악세사리">악세사리</a>
                                        </li>  
                                    </ul>
                               </li>
                            
                            </ul>

                        </div>
                    </div>

                   

                   

                    <!-- *** MENUS AND FILTERS END *** -->

                    
                </div>

                <div class="col-md-9">
                    <div class="box">
                    <h3>Auction</h3>
                     <p>※로그인한 사용자만 입찰할 수 있습니다.</p>
                     <p>※입찰종료시 최고 입찰가를 제시한 회원에게 낙찰됩니다.</p>
                     <p>※낙찰자는 입찰 종료일로부터 3일 이내로 결제 부탁드립니다.</p>
                        
                    </div>

                 
					
                    <div class="row products">
                    <c:if test="${!empty list}">
						<c:forEach var="au" items="${list}">
                        <div class="col-md-4 col-sm-6">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="">
                                           <c:forTokens var="img" items="${au.image_path}" delims="," varStatus="index">
                                          <c:if test="${index.count eq 1}">
                                          <c:set var="img1" value="${img}"/>
                                          </c:if>
                                           <c:if test="${index.count eq 2}">
                                          <c:set var="img2" value="${img}"/>
                                          </c:if>
                                           </c:forTokens>
                                                <img src="/minimalist/resources/img_auction/${img1}" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="auction.selectOne.do?auction_code=${au.auction_code}">
                                                <img src="/minimalist/resources/img_auction/${img1}" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="auction.selectOne.do?auction_code=${au.auction_code}" class="invisible">
                                    <img src="/minimalist/resources/img_auction/${img1}" alt="" class="img-responsive">
                                    
                                </a>
                                <div class="text">
                                    <h3><a href="auction.selectOne.do?auction_code=${au.auction_code}">${au.product_brand} <br> ${au.product_name }</a></h3>
                                    <p class="price"><font size=3px>현재 입찰가 : <fmt:formatNumber value="${au.bid_price}" type="currency"/></font> </p>
                                    <p align="center"><font color="red">경매 종료 :<fmt:formatDate value="${au.end_date}" type="date" pattern="MM월dd일"/></font> </p>
                                    <p class="buttons">
                                        <a href="auction.selectOne.do?auction_code=${au.auction_code}" class="btn btn-default">View detail</a>
                                     
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
                    <!-- /.products -->
					<!-- 전체상품의 경우 -->
					<c:if test="${empty category}">
                    <div class="pages">

                       

                        <ul class="pagination">
                        	<c:if test="${currentPage ne 1}">
                        		<li><a href="auction.selectList.do?page=${currentPage-1}">&laquo;</a></li>
                        	</c:if>
                        	<c:forEach var="page" begin="${startPage}" end="${endPage}">      
                        		<c:if test="${page eq currentPage}">                        	
                        			<li class="active"><a href="#">${page}</a>
                        		</c:if>
                        		<c:if test="${page ne currentPage}">
                        			<li><a href="auction.selectList.do?page=${page}">${page}</a></li>
                        		</c:if>
                        	</c:forEach>
                        	<c:if test="${currentPage ne maxPage}">
                        		<li><a href="auction.selectList.do?page=${currentPage+1}">&raquo;</a></li>
                        	</c:if>
                        </ul>
                    </div>
                    
                    </c:if>
                    <!-- 카테고리가 있는 경우 -->
                    <c:if test="${!empty category}">
                    <div class="pages">

                       

                        <ul class="pagination">
                        	<c:if test="${currentPage ne 1}">
                        		<li><a href="auction.selectList.do?page=${currentPage-1}&category=${category}">&laquo;</a></li>
                        	</c:if>
                        	<c:forEach var="page" begin="${startPage}" end="${endPage}">      
                        		<c:if test="${page eq currentPage}">                        	
                        			<li class="active"><a href="#">${page}</a>
                        		</c:if>
                        		<c:if test="${page ne currentPage}">
                        			<li><a href="auction.selectList.do?page=${page}&category=${category}">${page}</a></li>
                        		</c:if>
                        	</c:forEach>
                        	<c:if test="${currentPage ne maxPage}">
                        		<li><a href="auction.selectList.do?page=${currentPage+1}&category=${category}">&raquo;</a></li>
                        	</c:if>
                        </ul>
                    </div>
                    
                    </c:if>
                    


                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->


		<c:import url="../main/footer.jsp" />

    </div>
    <!-- /#all -->

</body>
</html>