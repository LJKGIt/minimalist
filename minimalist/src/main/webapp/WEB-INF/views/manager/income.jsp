<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
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
                        <li><a href="#">Home</a>
                        </li>
                        <li>문의하기</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** PAGES MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Pages</h3>
                        </div>

                         <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                	<a href="notice.viewWriteForm.do">공지사항 등록</a>
                                </li>
                                <li>
                                	<a href="qna.selectList.do">1:1문의 답변</a>
                                </li>
                                <li>
                                    <a href="member.memberSearchView.do">쪽지보내기</a>
                                </li>
                                <li>
                                    <a href="">대여상품 등록</a>
                                </li>
                                <li>
                                    <a href="auction.viewRegister.do">경매상품 등록</a>
                                </li>
                                <li>
                                    <a href="auction.viewAuctionEnd.do">종료된 경매 확인</a>
                                </li>
                                 <li>
                                    <a href="income.selectList.do">매출 확인</a>
                                </li>
								
								
                            </ul>

                        </div>
                    </div>

                    <!-- *** PAGES MENU END *** -->


                    <div class="banner">
                        <a href="#">
                            <img src="img/banner.jpg" alt="sales 2014" class="img-responsive">
                        </a>
                    </div>
                </div>

                <div class="col-md-9">


                    <div class="box" id="contact">
                       <h1>매출 현황</h1>

           
                        <hr>
                        
                        <table class="type07">
                       
    <thead>
    <tr>
        <th style="width:150px">매출구분</th>
        <th style="width:200px">매출일자</th>
        <th style="width:200px">대여/경매코드</th>
        <th style="width:200px">매출액</th>
   </tr>
   <tbody>
   		<!--  forEach -->
   		<c:forEach var="inc" items="${list}">
   		<tr>
   		<td>
   		<c:if test="${empty inc.product_code}">
   		경매
   		</c:if>
   		<c:if test="${empty inc.auction_code}">
   		대여
   		</c:if>
   		</td>
   		<td>
   		${inc.income_date}
   		</td>
   		<td>
   		<c:if test="${empty inc.product_code}">
   		${inc.auction_code}
   		</c:if>
   		<c:if test="${empty inc.auction_code}">
   		${inc.product_code}
   		</c:if>
   		</td>
   		<td>
   		${inc.income}
   		</td>
   		</tr>
   		</c:forEach>
   		
    </tbody>
</table>

<div class="pages">

                       

                        <ul class="pagination">
                        	<c:if test="${currentPage ne 1}">
                        		<li><a href="income.selectList.do?page=${currentPage-1}">&laquo;</a></li>
                        	</c:if>
                        	<c:forEach var="page" begin="${startPage}" end="${endPage}">      
                        		<c:if test="${page eq currentPage}">                        	
                        			<li class="active"><a href="#">${page}</a>
                        		</c:if>
                        		<c:if test="${page ne currentPage}">
                        			<li><a href="income.selectList.do?page=${page}">${page}</a></li>
                        		</c:if>
                        	</c:forEach>
                        	<c:if test="${currentPage ne maxPage}">
                        		<li><a href="income.selectList.do?page=${currentPage+1}">&raquo;</a></li>
                        	</c:if>
                        </ul>
                    </div>

					 


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