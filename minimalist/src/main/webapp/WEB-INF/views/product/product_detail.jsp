<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title> Obaju : e-commerce template </title>
            </head>

            <body>
                <% // TODO [lintogi] 조회수 처리하기. %>
                    <% // TODO [lintogi] 브랜드, 색상, 정렬 처리하기. %>
                        <c:import url="../main/header.jsp" />
                        <div id="all" style="background:white;">
                            <div id="content">
                                <div class="container">
                                    <div class="col-md-12">
                                        <ul class="breadcrumb">
                                            <li><a href="#">Home</a> </li>
                                            <li><a href="#">Product</a> </li>
                                            <li><a href="#">${fn:toUpperCase(product.product_category)}</a> </li>
                                            <li>${ product.product_name }</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3">
                                        <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                                        <div class="panel panel-default sidebar-menu">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Categories</h3> </div>
                                            <div class="panel-body">
                                                <ul class="nav nav-pills nav-stacked category-menu">
                                                    <li> <a href="category.html">Men <span class="badge pull-right">42</span></a>
                                                        <ul>
                                                            <li><a href="category.html">T-shirts</a> </li>
                                                            <li><a href="category.html">Shirts</a> </li>
                                                            <li><a href="category.html">Pants</a> </li>
                                                            <li><a href="category.html">Accessories</a> </li>
                                                        </ul>
                                                    </li>
                                                    <li class="active"> <a href="category.html">Ladies  <span class="badge pull-right">123</span></a>
                                                        <ul>
                                                            <li><a href="category.html">T-shirts</a> </li>
                                                            <li><a href="category.html">Skirts</a> </li>
                                                            <li><a href="category.html">Pants</a> </li>
                                                            <li><a href="category.html">Accessories</a> </li>
                                                        </ul>
                                                    </li>
                                                    <li> <a href="category.html">Kids  <span class="badge pull-right">11</span></a>
                                                        <ul>
                                                            <li><a href="category.html">T-shirts</a> </li>
                                                            <li><a href="category.html">Skirts</a> </li>
                                                            <li><a href="category.html">Pants</a> </li>
                                                            <li><a href="category.html">Accessories</a> </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="panel panel-default sidebar-menu">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Brands <a class="btn btn-xs btn-danger pull-right" href="#"><i class="fa fa-times-circle"></i> Clear</a></h3> </div>
                                            <div class="panel-body">
                                                <form>
                                                    <div class="form-group">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox">Armani (10) </label>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox">Versace (12) </label>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox">Carlo Bruni (15) </label>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox">Jack Honey (14) </label>
                                                        </div>
                                                    </div>
                                                    <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="panel panel-default sidebar-menu">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Colours <a class="btn btn-xs btn-danger pull-right" href="#"><i class="fa fa-times-circle"></i> Clear</a></h3> </div>
                                            <div class="panel-body">
                                                <form>
                                                    <div class="form-group">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox"> <span class="colour white"></span> White (14) </label>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox"> <span class="colour blue"></span> Blue (10) </label>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox"> <span class="colour green"></span> Green (20) </label>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox"> <span class="colour yellow"></span> Yellow (13) </label>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox"> <span class="colour red"></span> Red (10) </label>
                                                        </div>
                                                    </div>
                                                    <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- *** MENUS AND FILTERS END *** -->
                                        <div class="banner">
                                            <a href="#"> <img src="${ pageContext.request.contextPath }/resources/img/banner.jpg" alt="sales 2014" class="img-responsive"> </a>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row" id="productMain">
                                            <div class="col-sm-6">
                                                <div id="mainImage"> <img src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[0].product_image_path }" alt="" class="img-responsive"> </div>
                                                <div class="ribbon sale">
                                                    <div class="theribbon">SALE</div>
                                                    <div class="ribbon-background"></div>
                                                </div>
                                                <!-- /.ribbon -->
                                                <div class="ribbon new">
                                                    <div class="theribbon">NEW</div>
                                                    <div class="ribbon-background"></div>
                                                </div>
                                                <!-- /.ribbon -->
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="box">
                                                    <h1 class="text-center">${ product.product_name }</h1>
                                                    <p class="goToDescription"><a href="#details" class="scroll-to">Scroll to product details, material &#38; care and sizing</a> </p>
                                                    <p class="price">${ product.rent_price }</p>
                                                    <p class="text-center buttons"> <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> 바로구매</a>
                                                        <c:if test="${ empty wish }"> <a href="" class="btn btn-default" id="i_a_wish"><i class='fa fa-heart' style="color:#ff5757;"></i> Add to wishlist</a> </c:if>
                                                        <c:if test="${ not empty wish }"> <a href="" class="btn btn-default" id="i_a_wish"><i class='fa fa-heart' style="color:#ff5757;"></i> Remove to wishlist</a> </c:if>
                                                            <% // TODO [lintogi] 하트 색상이 바뀌는지 font-color 같은 것으로 테스트하기. style="font-color:red;"%>
                                                                <% // TODO [lintogi] 버튼 눌린 효과 만들기. %>
                                                    </p>
                                                    <% // TODO [lintogi] 나중에 아래로 옮기기. %>
                                                        <script type="text/javascript">
                                                            $(function () {
                                                                $('#i_a_wish').on('click', function () {
                                                                    var this_i_a_wish = $(this);
                                                                    if (this_i_a_wish.text() == " Add to wishlist") {
                                                                        $.ajax({
                                                                            url: "wishInsert.do"
                                                                            , type: "POST"
                                                                            , // TODO 150000001 값을 동적으로 바꾸기.
                                                                            data: {
                                                                                product_code: 1500000001
                                                                            }
                                                                            , success: function (data) {
                                                                                if (data == "true") {
                                                                                    this_i_a_wish.html("<i class='fa fa-heart' style='color:#ff5757;'></i> Remove to wishlist");
                                                                                    <% // TODO [lintogi] 값 변경으로 바꾸기. %>
                                                                                }
                                                                                else if (data == "false") {
                                                                                    alert("찜하기 중 오류가 발생했습니다.");
                                                                                }
                                                                                else if (data == "login") {
                                                                                    alert("로그인해주시기 바랍니다.");
                                                                                }
                                                                            }
                                                                            , error: function (data) {
                                                                                alert("찜하기 중 오류가 발생했습니다.");
                                                                            }
                                                                        }); //ajax */
                                                                    }
                                                                    else if (this_i_a_wish.text() == " Remove to wishlist") {
                                                                        $.ajax({
                                                                            url: "wishDelete.do"
                                                                            , type: "POST"
                                                                            , data: {
                                                                                product_code: 1500000001
                                                                            }
                                                                            , success: function (data) {
                                                                                if (data == "true") {
                                                                                    this_i_a_wish.html("<i class='fa fa-heart' style='color:#ff5757;'></i> Add to wishlist");
                                                                                }
                                                                                else {
                                                                                    alert("찜하기 중 오류가 발생했습니다.");
                                                                                }
                                                                            }
                                                                            , error: function (data) {
                                                                                alert("찜하기 중 오류가 발생했습니다.");
                                                                            }
                                                                        }); //ajax */
                                                                    }
                                                                    return false;
                                                                }); //click
                                                            }); //ready
                                                        </script>
                                                </div>
                                                <div class="row" id="thumbs">
                                                    <div class="col-xs-4">
                                                        <a href="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[0].product_image_path }" class="thumb"> <img src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[0].product_image_path }" alt="" class="img-responsive"> </a>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <a href="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[1].product_image_path }" class="thumb"> <img src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[1].product_image_path }" alt="" class="img-responsive"> </a>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <a href="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[2].product_image_path }" class="thumb"> <img src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[2].product_image_path }" alt="" class="img-responsive"> </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box" id="details">
                                            <p>
                                                <h4>Product details</h4>
                                                <p>White lace top, woven, has a round neck, short sleeves, has knitted lining attached</p>
                                                <h4>Material &#38; care</h4>
                                                <ul>
                                                    <li>Polyester</li>
                                                    <li>Machine wash</li>
                                                </ul>
                                                <h4>Size &#38; Fit</h4>
                                                <ul>
                                                    <li>Regular fit</li>
                                                    <li>The model (height 5'8" and chest 33") is wearing a size S</li>
                                                </ul>
                                                <blockquote>
                                                    <p><em>Define style this season with Armani's new range of trendy tops, crafted with intricate details. Create a chic statement look by teaming this lace number with skinny jeans and pumps.</em> </p>
                                                </blockquote>
                                                <hr>
                                                <!-- <div class="social">
                                <h4>Show it to your friends</h4>
                                <p>
                                    <a href="#" class="external facebook" data-animate-hover="pulse"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="external gplus" data-animate-hover="pulse"><i class="fa fa-google-plus"></i></a>
                                    <a href="#" class="external twitter" data-animate-hover="pulse"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="email" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
                                </p>
                            </div> --><a href="review.selectList.do?product_code=${product.product_code}" class="btn btn-primary">상품후기 목록 보기</a> </div>
                                        <div class="row same-height-row">
                                            <div class="col-md-3 col-sm-6">
                                                <div class="box same-height">
                                                    <h3>You may also like these products</h3> </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6">
                                                <div class="product same-height" style="border:none;">
                                                    <div class="flip-container">
                                                        <div class="flipper">
                                                            <div class="front">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[0].product_image_path }" alt="" class="img-responsive"> </a>
                                                            </div>
                                                            <div class="back">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[1].product_image_path }" alt="" class="img-responsive"> </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="detail.html" class="invisible"> <img src="${ pageContext.request.contextPath }/resources/img/product2.jpg" alt="" class="img-responsive"> </a>
                                                    <div class="text">
                                                        <h3>Fur coat</h3>
                                                        <p class="price">$143</p>
                                                    </div>
                                                </div>
                                                <!-- /.product -->
                                            </div>
                                            <div class="col-md-3 col-sm-6">
                                                <div class="product same-height">
                                                    <div class="flip-container">
                                                        <div class="flipper">
                                                            <div class="front">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img/product1.jpg" alt="" class="img-responsive"> </a>
                                                            </div>
                                                            <div class="back">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img/product1_2.jpg" alt="" class="img-responsive"> </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="detail.html" class="invisible"> <img src="${ pageContext.request.contextPath }/resources/img/product1.jpg" alt="" class="img-responsive"> </a>
                                                    <div class="text">
                                                        <h3>Fur coat</h3>
                                                        <p class="price">$143</p>
                                                    </div>
                                                </div>
                                                <!-- /.product -->
                                            </div>
                                            <div class="col-md-3 col-sm-6">
                                                <div class="product same-height">
                                                    <div class="flip-container">
                                                        <div class="flipper">
                                                            <div class="front">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img/product3.jpg" alt="" class="img-responsive"> </a>
                                                            </div>
                                                            <div class="back">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img/product3_2.jpg" alt="" class="img-responsive"> </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="detail.html" class="invisible"> <img src="${ pageContext.request.contextPath }/resources/img/product3.jpg" alt="" class="img-responsive"> </a>
                                                    <div class="text">
                                                        <h3>Fur coat</h3>
                                                        <p class="price">$143</p>
                                                    </div>
                                                </div>
                                                <!-- /.product -->
                                            </div>
                                        </div>
                                        <div class="row same-height-row">
                                            <div class="col-md-3 col-sm-6">
                                                <div class="box same-height">
                                                    <h3>Products viewed recently</h3> </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6">
                                                <div class="product same-height">
                                                    <div class="flip-container">
                                                        <div class="flipper">
                                                            <div class="front">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img/product2.jpg" alt="" class="img-responsive"> </a>
                                                            </div>
                                                            <div class="back">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img/product2_2.jpg" alt="" class="img-responsive"> </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="detail.html" class="invisible"> <img src="${ pageContext.request.contextPath }/resources/img/product2.jpg" alt="" class="img-responsive"> </a>
                                                    <div class="text">
                                                        <h3>Fur coat</h3>
                                                        <p class="price">$143</p>
                                                    </div>
                                                </div>
                                                <!-- /.product -->
                                            </div>
                                            <div class="col-md-3 col-sm-6">
                                                <div class="product same-height">
                                                    <div class="flip-container">
                                                        <div class="flipper">
                                                            <div class="front">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img/product1.jpg" alt="" class="img-responsive"> </a>
                                                            </div>
                                                            <div class="back">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img/product1_2.jpg" alt="" class="img-responsive"> </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="detail.html" class="invisible"> <img src="${ pageContext.request.contextPath }/resources/img/product1.jpg" alt="" class="img-responsive"> </a>
                                                    <div class="text">
                                                        <h3>Fur coat</h3>
                                                        <p class="price">$143</p>
                                                    </div>
                                                </div>
                                                <!-- /.product -->
                                            </div>
                                            <div class="col-md-3 col-sm-6">
                                                <div class="product same-height">
                                                    <div class="flip-container">
                                                        <div class="flipper">
                                                            <div class="front">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img/product3.jpg" alt="" class="img-responsive"> </a>
                                                            </div>
                                                            <div class="back">
                                                                <a href="detail.html"> <img src="${ pageContext.request.contextPath }/resources/img/product3_2.jpg" alt="" class="img-responsive"> </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="detail.html" class="invisible"> <img src="${ pageContext.request.contextPath }/resources/img/product3.jpg" alt="" class="img-responsive"> </a>
                                                    <div class="text">
                                                        <h3>Fur coat</h3>
                                                        <p class="price">$143</p>
                                                    </div>
                                                </div>
                                                <!-- /.product -->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.col-md-9 -->
                                </div>
                                <!-- /.container -->
                            </div>
                            <!-- /#content -->
                            <c:import url="../main/footer.jsp" /> </div>
                        <!-- /#all -->
                        <script type="text/javascript">
                            $(function () {
                                $('body').css("background", "white");
                            });
                        </script>
            </body>

            </html>