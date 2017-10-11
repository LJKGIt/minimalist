<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:import url="../main/header.jsp" />

    <div id="all" style="background:white;">

        <div id="content" >
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Ladies</li>
                    </ul>
                </div>
                
                <div class="col-md-11">
                    <div class="row products" id="i_div_products">
 						<c:forEach var="product" items="${ productList }">
	                        <div class="col-md-3 col-sm-6">
	                            <div class="product" style="border:none;">
	                                <div class="flip-container">
	                                    <div class="flipper">
	                                        <div class="front">
	                                            <a href="productDetail.do?product_code=${ product.product_code }">
	                                                <img src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[0].product_image_path }" alt="" class="img-responsive">
	                                            </a>
	                                        </div>
	                                        <div class="back">
	                                            <a href="productDetail.do?product_code=${ product.product_code }">
	                                                <img src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[5].product_image_path }" alt="" class="img-responsive">
	                                            </a>
	                                        </div>
	                                    </div>
	                                </div>
	                                <a href="productDetail.do?product_code=${ product.product_code }" class="invisible">
	                                    <img src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[0].product_image_path }" alt="" class="img-responsive">
	                                </a>
	                                <div class="text">
	                                    <h3 style="margin:0px; height:20px; font-weight: normal;"><a href="productDetail.do?product_code=${ product.product_code }">${ product.product_brand }</a></h3>
	                                    <h3 style="margin:0px;"><a href="productDetail.do?product_code=${ product.product_code }">${ product.product_name }</a></h3>
	                                    <p class="price" style="margin:0px 0px 5px 0px;"><fmt:formatNumber value="${ product.rent_price }" type="currency" currencySymbol="&#65510; " groupingUsed="true"/></p>
	                                </div>
	                                <!-- /.text -->
	                            </div>
	                            <!-- /.product -->
	                        </div>
						</c:forEach>
                    </div>
                    <!-- /.products --> 

                    <div class="pages">

                        <p class="loadMore">
                            <a id="i_a_load_more" class="btn btn-primary btn-lg"><i class="fa fa-chevron-down"></i> Load more</a>
                        </p>
                        
						<script type="text/javascript">
							var productPage = 1;
							var runningBoolean = false;
							$('#i_a_load_more').on('click', function(){
								var temp = "";
								if(productPage == 1){
									$(this).remove();
									$.ajax({
	                                    url: "productList2.do", 
	                                    type: "GET",
	                                    data: { product_category : '${ product.product_category }', productPage : productPage + 1, n_text_search : $('#i_text_search').val() }, 
	                                    success: function (data) {
	                                    	var temp = setDivProduct(data);
	                                    	$('#i_div_products').html($('#i_div_products').html() + temp);
	                                    	window.setTimeout(function(){
	    	                                	++productPage;
	    	                                }, 1000);
	                                    }, error: function (data) {
	                                    	alert("error");
	                                    }
	                                }); //ajax
								}
								
							}); //click

							$(document).bind('scroll', '#content', function(){
								var elem = $('#content');
								if($(window).scrollTop() >= $('#content').offset().top + $('#content').outerHeight() - window.innerHeight){
									if(runningBoolean == false && productPage > 1){
										runningBoolean = true;
										$.ajax({
		                                    url: "productList2.do", 
		                                    type: "GET",
		                                    data: { product_category : '${ product.product_category }', productPage : productPage + 1, n_text_search : $('#i_text_search').val() }, 
		                                    success: function (data) {
		                                    	var temp = setDivProduct(data);
		                                    	$('#i_div_products').html($('#i_div_products').html() + temp);
		                                    	window.setTimeout(function(){
		    	                                	++productPage;
		    	                                	runningBoolean = false;
		    	                                }, 500);
		                                    }, error: function (data) {
		                                    	alert("error");
		                                    }
		                                }); //ajax
									}
								}
							}); 
							
							function setDivProduct(data){
								var temp = "";
								for(var i = 0; i < data.length; i++){
                            		temp += "<div class='col-md-3 col-sm-6'>" + 
    	                            "<div class='product' style='border:none;'>" + 
    	                                "<div class='flip-container'>" + 
    	                                    "<div class='flipper'>" + 
    	                                        "<div class='front'>" + 
    	                                            "<a href='productDetail.do?product_code=" +
    	                                            	data[i].product_code +
                                						"'>" + 
    	                                                "<img src='${ pageContext.request.contextPath }/resources/img_product/" + 
    	                                                data[i].productImageList[0].product_image_path + 
    	                                                "' alt='' class='img-responsive'>" + 
    	                                            "</a>" + 
    	                                        "</div>" + 
    	                                        "<div class='back'>" + 
    	                                            "<a href='productDetail.do?product_code=" +
    	                                            	data[i].product_code +
    	                                            	"'>" + 
    	                                                "<img src='${ pageContext.request.contextPath }/resources/img_product/" +
    	                                                data[i].productImageList[5].product_image_path + 
    	                                                "' alt='' class='img-responsive'>" + 
    	                                            "</a>" + 
    	                                        "</div>" + 
    	                                    "</div>" + 
    	                                "</div>" + 
    	                                "<a href='productDetail.do?product_code=" +
    	                                	data[i].product_code +
    	                                	"' class='invisible'>" + 
    	                                    "<img src='${ pageContext.request.contextPath }/resources/img_product/" +
    	                                    data[i].productImageList[0].product_image_path +
    	                                    "' alt='' class='img-responsive'>" + 
    	                                "</a>" + 
    	                                "<div class='text'>" + 
    	                                    "<h3 style='margin:0px; height:20px; font-weight: normal;'><a href='productDetail.do?product_code=" +
    	                                    	data[i].product_code +
    	                                    "'>" + 
    	                                    data[i].product_brand + 
    	                                    "</a></h3>" + 
    	                                    "<h3 style='margin:0px;'><a href='productDetail.do?product_code=" +
    	                                    	data[i].product_code +
    	                                    "'>" + 
    	                                    data[i].product_name +
    	                                    "</a></h3>" + 
    	                                    "<p class='price' style='margin:0px 0px 5px 0px;'>" +
    	                                		"&#65510; " + data[i].rent_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +
    	                                    "</p>" +
    	                                    "<!-- <p class='buttons' style='margin:0px 0px 5px 0px;'>" +
	                                        "<a href='productDetail.do?product_code=" +
	                                       		data[i].product_code +
	                                        	"' class='btn btn-default'>View detail</a>" +
	                                        "<a href='basket.html' class='btn btn-primary'><i class='fa fa-shopping-cart'></i>Add to cart</a>" +
	                                    	"</p> -->" +
    	                                "</div>" + 
        	                                "<!-- /.text -->" + 
    	                            "</div>" + 
    	                            "<!-- /.product -->" + 
    	                            "</div>";
                            	}
								return temp;
							};
						</script>
                    </div>


                </div>
                <!-- /.col-md-9 -->
                <c:import url="../main/wingCookie.jsp"/>
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

		<c:import url="../main/footer.jsp" />

    </div>
    <!-- /#all -->
	<script type="text/javascript">
		$(function(){
			$('body').css("background", "white");
		});
	</script>
</body>
</html>