<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>

<html>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript">
/* $(function(){
	//결제 확인 - 되돌리기
	$('.checkBtn').click(function(){
		var arr=$(this).val().split(',');
		var auction_code=arr[0];
		var message=arr[1];
		$.ajax({
			url : "auction.checkPayment.do",
			type : "get",
			data : {auction_code : auction_code, message : message},
			dataType : "text",
			success : function(value){
				if(value=='yes'){
					location.reload();
				}
			}
		});
	});
	
	
	
}); */


</script>



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

				<input type="hidden" id="i_hidden_aside_active" value="종료된 경매 확인">
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
			<th>경매코드</th>
			<th>경매종료일</th>
			<th>상세보기</th>
			<th>결과보기</th>

			</tr>
			</thead>
			<tbody>
			<c:forEach var="au" items="${list}">
			<tr>
			<td>${au.auction_code}</td>
			<td>${au.end_date}</td>
			<td><a href="auction.selectOne.do?auction_code=${au.auction_code}">상세보기</a></td>
			<td><a href="auction.selectOneEnd.do?auction_code=${au.auction_code}">결과확인</a></td>
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