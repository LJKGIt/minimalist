<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>
        Obaju : e-commerce template
    </title>
</head>

<body>
   	<c:import url="../main/header.jsp" />

    <div id="all">

        <div id="content">
            <div class="container">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="index.jsp">Home</a>
                        </li>
                        <li>찜 목록</li>
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
                                <li>
                                    <a href="customer-orders.jsp"><i class="fa fa-list"></i> 주문내역</a>
                                </li>
                                <li class="active">
                                    <a href="customer-wishlist.jsp"><i class="fa fa-heart"></i> 찜 목록</a>
                                </li>
                                <li>
                                    <a href="customer-account.jsp"><i class="fa fa-user"></i> 내 정보보기</a>
                                </li>
                                <li>
                                    <a href="index.jsp"><i class="fa fa-sign-out"></i> Logout</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** CUSTOMER MENU END *** -->
                </div>

                <div class="col-md-9" id="wishlist">

                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Ladies</li>
                    </ul>

                    <div class="box">
                        <h1>Wish List</h1>
                        <p class="lead">찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록찜목록</p>
                    </div>

                    <div class="row products">
                    <c:if test="${ empty wishList }">
						찜 목록이 없습니다.
					</c:if>
                    <c:if test="${ !empty wishList }">
					<c:forEach var="wish" items="${ wishList }">
						<div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="productDetail.do?product_code=${ wish.product_code }">
                                                <img src="${ pageContext.request.contextPath }/resources/img_product/${ wish.productImageJoin[0].product_image_path }" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="productDetail.do?product_code=${ wish.product_code }">
                                                <img src="${ pageContext.request.contextPath }/resources/img_product/${ wish.productImageJoin[1].product_image_path }" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="productDetail.do?product_code=${ wish.product_code }" class="invisible">
                                    <img src="resources/img/product1.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                	<h3><a href="productDetail.do?product_code=${ wish.product_code }">${ wish.product.product_brand }</a></h3>
	                                <h3><a href="productDetail.do?product_code=${ wish.product_code }">${ wish.product.product_name }</a></h3>
                                   
                                    <p class="price"><fmt:formatNumber value="${ wish.product.rent_price }" type="currency" currencySymbol="&#65510; " groupingUsed="true"/></p>
                                </div>
                                <!-- /.text -->
                            </div>
                            <!-- /.product -->
                        </div>
					</c:forEach>
					</c:if>
                        

                    </div>
                    <!-- /.products -->

                </div>
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

		<c:import url="../main/footer.jsp" />


    </div>
    <!-- /#all -->





</body>
</html>