<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>

<html>
<style type="text/css">
.board-view-1s {
    table-layout: fixed;
    width: 100%;
    border-top: 2px solid #888;
    border-bottom: 2px solid #888;
        margin-bottom: 20px;
}

.contEditor {
    color: #333;
    line-height: normal;
     margin-top: 30px !important;
    
}
.mgT40 {
   margin-top: 10px !important; 
}


td, th {
    display: table-cell;
    vertical-align: inherit;

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
table {
    display: table;
    border-collapse: separate;
    border-spacing: 1px;
    border-color: grey;
	    border-top: 2px solid #888;
    border-bottom: 2px solid #888;
    
}
.c{
border-top: 1px none #888;!important; 
    border-bottom: 2px none #888;!important; 

}

.board-view-1s>tbody>tr>td {
  padding: 20px 10px; 
    color: #333;
    font-size: 15px;
    line-height: 15px;
}
 
.board-view-1s>tbody>tr>td #a{
  padding: 20px 10px; 
    color: #333;
    font-size: 15px;
    line-height: 15px;
     padding: 50px;
}
.board-view-1s>tbody>tr>td .data {
    display: inline-block;
    color: #333;
    font-size: 15px;
    line-height: 15px;

   
}
.board-view-1s>tbody>tr>td .tit{
    display: inline-block;
    color: #333;
    font-size: 20px;
    line-height: 15px;

   
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

                      <h1 align="center">종료된 경매 확인.</h1>
				
				<table class="board-view-1s mgT40">
                   
		<tbody>
		
				
		<tr><td colspan="2" style=" border-bottom-style: dashed; text-align:left;">
		<span class="tit" ><strong>경매 코드 : ${auction.auction_code}</strong></span>
		</td><td class="data" style="border-bottom-style: dashed; text-align:right;" >종료일 : ${auction.end_date}</td></tr>
		
		<tr><td id="a" colspan="3" style="border-bottom: 2px solid #cccccc;" ></td></tr>
		<tr><td>입찰 정보 - 상위 입찰자 5명</td></tr>
		<c:forEach var="au" items="${auction.bidInfo}" varStatus="index">
			<tr>
			<td>
			${au.member_id}
			</td>
			<td>
			${au.bid_price}
			</td>
			<td>
			<a href="message.endAuctionInsertMessage.do?auction_code=${auction.auction_code}&member_id=${au.member_id}&bid_price=${au.bid_price}"><button type="button">쪽지보내기</button></a>
			</td>
			</tr>
		</c:forEach>
		
		
		</tbody>
		
	</table>
				

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