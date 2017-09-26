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
	width: 100%;
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



<body>
	<c:import url="../main/header.jsp" /> 
<div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>관리자페이지</li>
                    </ul>

                </div>

				<c:import url="../main/aside_admin.jsp" />
                <div class="col-md-9">


                    <div class="box" id="contact">
<%-- <<<<<<< HEAD
                      <h1 align="center">종료된 경매 확인.</h1>

<table class="type07">
    <thead>
   	 
			<tr><th style="width:120px">경매번호</th><th style="width:150px">경매종료일</th>
			<th style="width:150px">
			낙찰금액</th><th style="width:150px">ID</th><th style="width:150px">결제여부</th>
			<th style="width:150px">체크</th><th style="width:150px">쪽지보내기</th>
			<th style="width:150px">매출집계</th>
			</tr>
    </thead>
    <tbody>
    	<c:forEach var="au" items="${list}">
======= --%>
                      <h1>종료된 경매 확인</h1>
<hr>
			<table class="type07">
			<thead>
			<tr>
			<th style="width:10%;">번호</th>
			<th style="width:15%;">경매종료일</th>
			<th style="width:12%;">금액</th>
			<th style="width:12%;">낙찰 ID</th>
			<th style="width:12%;">결제</th>
			<th style="width:13%;">쪽지</th>
	
			</tr>
			</thead>
			<tbody>
			<c:forEach var="au" items="${list}">

			<tr><td><a href="auction.selectOne.do?auction_code=${au.auction_code}">${au.auction_code}</a></td><td>${au.end_date}</td>
			<td>${au.bid_price}</td><td>${au.member_id}</td>
			<td>
			<c:if test="${au.payment_yn eq 'n' }">
			미완료
			</c:if>
			<c:if test="${au.payment_yn eq 'y' }">
			결제완료
			</c:if>
	

			<td><a href="message.endAuctionInsertMessage.do?member_id=${au.member_id}&auction_code=${au.auction_code}&income=${au.bid_price}
			&root=${ pageContext.request.contextPath }"><button type="button" style="pont-size:10px;">전송</button></a></td>
		
			</tr>
			
			</c:forEach>

   			
    </tbody>

</table>

			 <div class="pages">
				<ul class="pagination">
					<c:if test="${currentPage ne 1}">
                 		 <li><a href="auction.viewAuctionEnd.do?page=${currentPage-1}&category=${auction_category}">&laquo;</a></li>
                    </c:if>
					<c:forEach var="page" begin="${startPage}" end="${endPage}">
					<c:if test="${page eq currentPage}">
						<li class="active"><a href="#">${page}</a>
					</c:if>
					<c:if test="${page ne currentPage}">
						<li><a href="auction.viewAuctionEnd.do?page=${page}">${page}</a></li>
					</c:if>
					</c:forEach>
					<c:if test="${currentPage ne maxPage}">
                        <li><a href="auction.viewAuctionEnd.do?page=${currentPage+1}&category=${auction_category}">&raquo;</a></li>
                     </c:if>
				</ul>
			 </div>


                    </div>


                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

	


    </div>
    <!-- /#all -->

    




    

	<c:import url="../main/footer.jsp" /> 
</body>
</html>