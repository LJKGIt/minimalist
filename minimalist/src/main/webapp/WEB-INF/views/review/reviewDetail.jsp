<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.table {
   
    margin-bottom: 20px;
}



table {
    border-collapse: collapse;
    
}
table {
    display: table;
    table-layout: auto;
   
    }

.container {
    padding-right: 15px;
    padding-left: 15px;
   
    
}

.col-md-10{
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}

    tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.form-inline .form-group {
    display:table-row-group;
    margin-bottom: 0;
    vertical-align: middle;
}
.form-inline .form-control {
    display: inline-block;
}

textarea.form-control, #btn {
    height: 94px;
   resize:none;
}

.form-control {
    display: block;
   height: 34px;
    padding: 6px 12px;
    font-size: 14px;
   color: #555555;
    vertical-align: middle;
    background-color: #ffffff;
    border: 1px solid #cccccc;
 
}
.col-md-10 #qna_no{
overflow:hidden;
 display: none;
}
.table table-condensed>.detail_table{
border-bottom: 2px solid #cccccc;
 margin-bottom: 20px;
 

}
.table{
    width: 750px;
    max-width: 100%;
    margin-bottom: 20px;
}
.table table-condensed_b>.answer{
border-top: 2px solid #ddd;

}
.form-control col-lg-12> #btn{
 height: 94px;
}

</style>

   
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
                        <li><a href="#">Ladies</a>
                        </li>
                        <li><a href="#">Dress</a>
                        </li>
                        <li></li>
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

                    


                    <div class="box" id="details">
                      
                              <!--  리뷰 디테일 -->
                               <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                           
                           <th colspan="1"> &nbsp;<strong>${review.review_title}</strong></th>
                              
                            </tr>
                        </thead>
                        <tbody class="detail_table">
                            <tr>
                            <td colspan="1">별점&nbsp;&nbsp; 
                            <c:forEach var="starOn" begin="1" end="${review.review_rating}">
							<img src='/minimalist/resources/img_review/star-on.png'>
							</c:forEach>
							<c:forEach var="starOff" begin="${review.review_rating+1}" end="5">
							<img src='/minimalist/resources/img_review/star-off.png'>
							</c:forEach>
                            
                            </td>
                                <td colspan="2">작성일&nbsp;&nbsp; ${review.review_date}
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="2">글쓴이 &nbsp;&nbsp;<span>${review.member_id}</span>
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="2" style="border-bottom: 2px solid #cccccc;">
                                <img src="/minimalist/resources/img_review/${review.image_path}">
                                    <p>${review.review_content}</p>
                       		
                                </td>
                                
                            </tr>
                            
                        </tbody></table>
                        <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                              
                                    <span>
                                 
                                       <a href="javascript:history.back()"><button type="button" id="list" class="btn btn-default">목록</button></a>
                                      
                                      
                                       <c:if test="${sessionScope.member.member_id eq review.member_id}">
                                     &nbsp;&nbsp;<a href="review.updateForm.do?review_no=${review.review_no}"><button type="button" class="btn btn-default">수정</button></a>
                                     &nbsp;&nbsp;<a href="review.deleteReview.do?review_no=${review.review_no}&product_code=${review.product_code}"><button type="button" class="btn btn-default">삭제</button></a>
                                    </c:if>
                                     <c:if test="${sessionScope.member.member_id eq 'admin'}">
                                      &nbsp;&nbsp;<a href="review.deleteReview.do?review_no=${review.review_no}&product_code=${review.product_code}"><button type="button" class="btn btn-default">삭제</button></a>
                                    </c:if>
                              
                                    
                                    </span>
                                    
                                </td>
                            </tr>
                        </thead>
                    </table>

                    </div>

                    <div class="row same-height-row">
                    
                      

                    </div>

                  
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

		<c:import url="../main/footer.jsp" />


</div>
    </div>
    <!-- /#all -->


    






</body>
</html>