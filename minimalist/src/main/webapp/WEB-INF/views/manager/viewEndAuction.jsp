<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript">
$(function(){
	$('.check').click(function(){
		var arr=($(this).val()).split(',');
		$.ajax({
			url : "auction.checkPayment.do",
			type : "post",
			data : {message : arr[0], auction_code : arr[1]},
			dataType : "text",
			success : function(value){
				if(value=='yes'){
					location.reload();
				}else if(value=='no'){
					alert("실패");
				}
			}
		});
		
	});
});


</script>

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
                        <li>관리자페이지</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** PAGES MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Management</h3>
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
								
								
                            </ul>

                        </div>
                    </div>

                    <!-- *** PAGES MENU END *** -->


                    
                </div>

                <div class="col-md-9">


                    <div class="box" id="contact">
                      <h1 align="center">종료된 경매 확인.</h1>

			<table border="1" align="center" width="600">
			<tr><th>경매번호</th><th>경매종료일</th><th>
			낙찰금액</th><th>낙찰된 회원ID</th><th>결제여부</th><th>결제체크</th><th>쪽지보내기</th></tr>
			
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
			<td>
			<c:if test="${au.payment_yn eq 'n' }">
			<button type="button" class="check" value="y,${au.auction_code}">결제확인</button>
			</c:if>
			<c:if test="${au.payment_yn eq 'y' }">
			<button type="button" class="check" value="n,${au.auction_code}">되돌리기</button>
			</c:if>
			
			</td>
			
			<td><button type="button">전송</button></td>
			</tr>
			</c:forEach>
			</table>
			 <!-- 페이징 처리 --> 
			 <div class="pages">
				<ul class="pagination">
					<c:if test="${currentPage ne 1}">
                 		 <li><a href="auction.viewAuctionEnd.do?page=${currentPage-1}&category=${category}">&laquo;</a></li>
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
                        <li><a href="auction.viewAuctionEnd.do?page=${currentPage+1}&category=${category}">&raquo;</a></li>
                     </c:if>
				</ul>
			 </div>

              
    <thead>
   	 
    </thead>
    <tbody>
    	
   			
    </tbody>


					

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

    




    

	<c:import url="../main/footer.jsp" /> 
</body>
</html>