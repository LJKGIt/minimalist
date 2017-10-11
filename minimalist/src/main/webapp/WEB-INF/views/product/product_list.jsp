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
                
                <div class="col-md-12">
	                <form class="navbar-form" role="search">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search" id="searchBox">
							<span class="input-group-btn">
	
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-search"></i>
								</button>
	
							</span>
						</div>
					</form>
				</div>

                <%-- <div class="col-md-3">
                    <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                    <!-- <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Categories</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked category-menu">
                                <li>
                                    <a href="category.html">Men <span class="badge pull-right">42</span></a>
                                    <ul>
                                        <li><a href="category.html">T-shirts</a>
                                        </li>
                                        <li><a href="category.html">Shirts</a>
                                        </li>
                                        <li><a href="category.html">Pants</a>
                                        </li>
                                        <li><a href="category.html">Accessories</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="active">
                                    <a href="category.html">Ladies  <span class="badge pull-right">123</span></a>
                                    <ul>
                                        <li><a href="category.html">T-shirts</a>
                                        </li>
                                        <li><a href="category.html">Skirts</a>
                                        </li>
                                        <li><a href="category.html">Pants</a>
                                        </li>
                                        <li><a href="category.html">Accessories</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="category.html">Kids  <span class="badge pull-right">11</span></a>
                                    <ul>
                                        <li><a href="category.html">T-shirts</a>
                                        </li>
                                        <li><a href="category.html">Skirts</a>
                                        </li>
                                        <li><a href="category.html">Pants</a>
                                        </li>
                                        <li><a href="category.html">Accessories</a>
                                        </li>
                                    </ul>
                                </li>

                            </ul>

                        </div>
                    </div> -->

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Brands <a class="btn btn-xs btn-danger pull-right" href="#"><i class="fa fa-times-circle"></i> Clear</a></h3>
                        </div>

                        <div class="panel-body">

                            <form>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Armani (10)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Versace (12)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Carlo Bruni (15)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Jack Honey (14)
                                        </label>
                                    </div>
                                </div>

                                <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>

                            </form>

                        </div>
                    </div>

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Colours <a class="btn btn-xs btn-danger pull-right" href="#"><i class="fa fa-times-circle"></i> Clear</a></h3>
                        </div>

                        <div class="panel-body">

                            <form>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> <span class="colour white"></span> White (14)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> <span class="colour blue"></span> Blue (10)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> <span class="colour green"></span> Green (20)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> <span class="colour yellow"></span> Yellow (13)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> <span class="colour red"></span> Red (10)
                                        </label>
                                    </div>
                                </div>

                                <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>

                            </form>

                        </div>
                    </div>

                    <!-- *** MENUS AND FILTERS END *** -->

                    <div class="banner">
                        <a href="#">
                            <img src="${ pageContext.request.contextPath }/resources/img/banner.jpg" alt="sales 2014" class="img-responsive">
                        </a>
                    </div>
                </div> --%>

                <div class="col-md-11">
                    <!-- <div class="box">
                        <h1>Ladies</h1>
                        <p>In our Ladies department we offer wide selection of the best products we have found and carefully selected worldwide.</p>
                    </div> -->

                    <!-- <div class="box info-bar">
                        <div class="row">
                            <div class="col-sm-12 col-md-4 products-showing">
                                Showing <strong>12</strong> of <strong>25</strong> products
                            </div>

                            <div class="col-sm-12 col-md-8  products-number-sort">
                                <div class="row">
                                    <form class="form-inline">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="products-number">
                                                <strong>Show</strong>  <a href="#" class="btn btn-default btn-sm btn-primary">12</a>  <a href="#" class="btn btn-default btn-sm">24</a>  <a href="#" class="btn btn-default btn-sm">All</a> products
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="products-sort-by">
                                                <strong>Sort by</strong>
                                                <select name="sort-by" class="form-control">
                                                    <option>Price</option>
                                                    <option>Name</option>
                                                    <option>Sales first</option>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div> -->

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
	                                    <!-- <p class="buttons" style="margin:0px 0px 5px 0px;">
	                                        <a href="productDetail.do?product_code=${ product.product_code }" class="btn btn-default">View detail</a>
	                                        <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
	                                    </p> -->
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
	                                    data: { product_category : '${ product.product_category }', productPage : productPage + 1 }, 
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
		                                    data: { product_category : '${ product.product_category }', productPage : productPage + 1 }, 
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

                        <!-- <ul class="pagination">
                            <li><a href="#">&laquo;</a>
                            </li>
                            <li class="active"><a href="#">1</a>
                            </li>
                            <li><a href="#">2</a>
                            </li>
                            <li><a href="#">3</a>
                            </li>
                            <li><a href="#">4</a>
                            </li>
                            <li><a href="#">5</a>
                            </li>
                            <li><a href="#">&raquo;</a>
                            </li>
                        </ul> -->
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