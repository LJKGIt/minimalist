<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
table.type07 {

    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border: 1px solid #ccc;
    margin: 20px 10px;
     border-top-style: none;
    border-right-style: none;
	border-left-style: none;
}
table.type07 thead {
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
   font-color:black;
    border-right-style: none;
	border-left-style: none;
}
table.type07 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
  border-bottom: 1px solid #ccc; 
}


table.type07 tbody th {
    /* width: 130px; */
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
  
}
table.type07 td {
 /*    width: 400px; */
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
div.write2{

position: absolute;
    right: 80px;
   bottom: 100px;


}
 
</style>
<!DOCTYPE html>
<html>
<head>

    <title>
        Obaju : e-commerce template
    </title>

</head>

<body>
	<% // TODO [lintogi] 조회수 처리하기. %>
	<% // TODO [lintogi] 브랜드, 색상, 정렬 처리하기. %>
   	<c:import url="../main/header.jsp" />

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li><a href="#">Ladies</a>
                        </li>
                        <li><a href="#">Dress</a><% //TODO [lintogi] 카테고리 순서 처리하기. %>
                        </li>
                        <li>${ product.product_name }</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

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
                    </div>

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
                            <img src="img/banner.jpg" alt="sales 2014" class="img-responsive">
                        </a>
                    </div>
                </div>

                <div class="col-md-9">

                    <div class="row" id="productMain">
                        <div class="col-sm-6">
                            <div id="mainImage">
                            	<% //TODO [lintogi] img.jpg 파일을 EL 태그로 만들기. %>
                                <img src="${ pageContext.request.contextPath }/resources/img/product/1900000001_01.jpg" alt="" class="img-responsive">
                            </div>

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
                                <p class="goToDescription"><a href="#details" class="scroll-to">Scroll to product details, material &#38; care and sizing</a>
                                </p>
                                <p class="price">${ product.rent_price }</p>

                                <p class="text-center buttons">
                                    <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</a> 
                                    <a href="basket.html" class="btn btn-default"><i class="fa fa-heart"></i> Add to wishlist</a>
                                </p>


                            </div>

                            <div class="row" id="thumbs">
                                <div class="col-xs-4">
                                    <a href="${ pageContext.request.contextPath }/resources/img/product/1900000001_01.jpg" class="thumb">
                                        <img src="${ pageContext.request.contextPath }/resources/img/product/1900000001_01.jpg" alt="" class="img-responsive">
                                    </a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="${ pageContext.request.contextPath }/resources/img/product/1900000001_02.jpg" class="thumb">
                                        <img src="${ pageContext.request.contextPath }/resources/img/product/1900000001_02.jpg" alt="" class="img-responsive">
                                    </a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="${ pageContext.request.contextPath }/resources/img/product/1900000001_03.jpg" class="thumb">
                                        <img src="${ pageContext.request.contextPath }/resources/img/product/1900000001_03.jpg" alt="" class="img-responsive">
                                    </a>
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
                                <p><em>Define style this season with Armani's new range of trendy tops, crafted with intricate details. Create a chic statement look by teaming this lace number with skinny jeans and pumps.</em>
                                </p>
                            </blockquote>

                            <hr>
                            <div class="social">
                                <h4>Show it to your friends</h4>
                                <p>
                                    <a href="#" class="external facebook" data-animate-hover="pulse"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="external gplus" data-animate-hover="pulse"><i class="fa fa-google-plus"></i></a>
                                    <a href="#" class="external twitter" data-animate-hover="pulse"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="email" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
                                </p>
                            </div>
                              <h2 align="center">상품후기</h2>
                      <table class="type07">
                      <thead>
<tr>
	<th style="width:150px">별점</th>
    <th style="width:200px">제목</th>
    <th style="width:170px">작성자</th>
    <th style="width:170px">작성일</th>
</tr>
</thead>
<tbody>
<c:choose>
<c:when test="${empty list}">
<h3 align="center">등록된 상품후기가 없습니다.</h3>
</c:when>
<c:when test="${!empty list}">
<c:forEach var="re" items="${list}">
<tr>
<!--  별 출력 -->
<td>
<c:forEach var="starOn" begin="1" end="${re.review_rating}">
<img src='/minimalist/resources/img_review/star-on.png'>
</c:forEach>
<c:forEach var="starOff" begin="${re.review_rating+1}" end="5">
<img src='/minimalist/resources/img_review/star-off.png'>
</c:forEach>
</td>
<td>
<a href="review.selectOne.do?product_code=${product.product_code}&review_no=${re.review_no}">
${re.review_title }
</a>
</td>
<td>
${re.member_id}
</td>
<td>
${re.review_date}
</td>
</tr>
</c:forEach>
</c:when>
</c:choose>

</tbody>
</table>
<div class="pages">

                       

                        <ul class="pagination">
                        	<c:if test="${currentPage ne 1}">
                        		<li><a href="productDetail.do?product_code=${product.product_code}&page=${currentPage-1}">&laquo;</a></li>
                        	</c:if>
                        	<c:forEach var="page" begin="${startPage}" end="${endPage}">      
                        		<c:if test="${page eq currentPage}">                        	
                        			<li class="active"><a href="#">${page}</a>
                        		</c:if>
                        		<c:if test="${page ne currentPage}">
                        			<li><a href="productDetail.do?product_code=${product.product_code}&page=${page}">${page}</a></li>
                        		</c:if>
                        	</c:forEach>
                        	<c:if test="${currentPage ne maxPage}">
                        		<li><a href="productDetail.do?product_code=${product.product_code}&page=${currentPage+1}">&raquo;</a></li>
                        	</c:if>
                        </ul>
                    </div>
                    </div>

                    <div class="row same-height-row">
                    
                      

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