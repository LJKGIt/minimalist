<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript">
$(function(){
	//확인 버튼.
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
	
	
	//매출 추가
	$('#incomeBtn').click(function(){
		var arr=($(this).val()).split(',');
		$.ajax({
			url : "income.insertIncome.do",
			type : "post",
			data : {auction_code : arr[0], income : arr[1]},
			dataType : "text",
			success : function(value){
				if(value=='yes'){
					alert("매출에 집계되었습니다.");
				}else if(value=='no'){
					alert("이미 집계된 항목입니다.");
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
                                 <li>
                                    <a href="income.selectList.do">매출 확인</a>
                                </li>
								
								
                            </ul>

                        </div>
                    </div>

                    <!-- *** PAGES MENU END *** -->


                    
                </div>

                <div class="col-md-9">


                    <div class="box" id="contact">
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
			<button type="button" class="check" value="y,${au.auction_code}">확인</button>
			</c:if>
			<c:if test="${au.payment_yn eq 'y' }">
			<button type="button" class="check" value="n,${au.auction_code}">취소</button>
			</c:if>
			</td>
			
			<td><button type="button">전송</button></td>
			<td><button type="button" id="incomeBtn" value="${au.auction_code},${au.bid_price}">집계</button></td>
			</tr>
			</c:forEach>
   			
    </tbody>

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