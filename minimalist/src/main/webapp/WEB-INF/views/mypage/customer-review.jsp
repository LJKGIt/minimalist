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
                        <li><a href="index.do">Home</a>
                        </li>
                        <li>Ladies</li>
                    </ul>

                    <div class="box">
                         <h1>My Review</h1>
                         <div class="table-responsive">
                         <table class="table table-hover">
	                         <thead>
		                         <tr>
		                         	<th>작성일자</th>
		                         	<th>상품명</th>
		                         	<th>제목</th>
		                         	<th>평점</th>
		                         	<th>상태</th>
	                         	</tr>
	                         </thead>
	                         <tbody>
	                         	<c:forEach var="review" items="${ reviewList }">
	                         		<tr>
	                         			<td>${ review.review_date }</td>
	                         			<td>상품명</td>
	                         			<td>${ review.review_title }</td>
	                         			<td>
		                         			<c:forEach var="starOn" begin="1" end="${review.review_rating}">
											<img src='/minimalist/resources/img_review/star-on.png'>
											</c:forEach>
										</td>
	                         			<td>
	                         				<a href="review.updateForm.do?review_no=${review.review_no}" class="btn btn-primary btn-sm">수정</a>
	                         				<a href="review.deleteReview.do?review_no=${review.review_no}&product_code=${review.product_code}" class="btn btn-primary btn-sm">삭제</a>
	                         				<% //TODO [yjP] 링크가 상품후기쪽으로 가짐 %>
	                         			</td>
	                         		</tr>
	                         	</c:forEach>
	                         </tbody>
                         	
                         </table>
                         </div>
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