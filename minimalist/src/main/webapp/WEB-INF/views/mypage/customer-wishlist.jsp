<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script>
	var menuNum = 1;
</script>
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
                <c:import url="mypageAside.jsp"/>

                <div class="col-md-9" id="wishlist">

                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Ladies</li>
                    </ul>

                    <div class="box">
                        <h3>Wish List</h3>
                        <h4>마음에 드는 상품을 찜하시면 My Page에서 편리하게 관리하실 수 있습니다.</h4>
                    </div>

                    <div class="row products">
                    <c:if test="${ empty wishList }">
                    <br>
                    <br>
                    <div style="text-align: center;">
						찜 목록이 존재하지 아니합니다.
					</div>
					<br> 
					<br>
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
                                	<h3 style="margin:0px; height:20px; font-weight: normal;"><a href="productDetail.do?product_code=${ wish.product_code }">${ wish.product.product_brand }</a></h3>
	                                <h3 style="margin:0px;"><a href="productDetail.do?product_code=${ wish.product_code }">${ wish.product.product_name }</a></h3>
                                   
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