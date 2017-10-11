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

				<input type="hidden" id="i_hidden_aside_active" value="매출 확인">
				<c:import url="../main/aside_admin.jsp" />
                <div class="col-md-9">


                    <div class="box" id="contact">
                       <h1>매출 현황</h1>
                       
           <form action="income.selectListByDate.do" method="post"> 
                        기간 : <input type="date" name="startDate" id="startDate">
                        <input type="date" name="endDate" id="endDate">
                       <!--  <button type="button" id=check>설정</button> -->
                         <input type="submit" value="설정">
                        </form> 
                        <hr>
                       
                        <table class="type07">
                       
    <thead>
    <tr>
        <th style="width:200px">매출일자</th>
        <th style="width:200px">경매코드</th>
        <th style="width:200px">매출액</th>
   </tr>
   <tbody>
   <c:choose>
  		<c:when test="${empty list}">
  		<tr>
  		<th></th>
  		<th></th>
  		<th>매출이 없습니다.</th>
  		<th></th>
  		</tr>
  		</c:when>
  		<c:when test="${!empty list}">
   		<!--  forEach -->
   		<c:forEach var="inc" items="${list}">
   		<tr>
   		
   		<td>
   		${inc.income_date}
   		
   		</td>
   		<td>
   	
   		<a href="auction.selectOne.do?auction_code=${inc.auction_code}">${inc.auction_code}</a>
   	
   		
   		</td>
   		<td>
   		${inc.income}
   		
   		</td>
   		</tr>
   		</c:forEach>
   		 </c:when>
   		</c:choose>
    </tbody>
   <tbody>
   <tr><th>
    	총 매출 : ${totalIncome} 원 
   </th></tr> 
   </tbody>
</table>

<div class="pages">

                       

                        <ul class="pagination">
                        	<c:if test="${currentPage ne 1}">
                        		<li><a href="income.selectListByDate.do?page=${currentPage-1}&startDate=${startDate}&endDate=${endDate}">&laquo;</a></li>
                        	</c:if>
                        	<c:forEach var="page" begin="${startPage}" end="${endPage}">      
                        		<c:if test="${page eq currentPage}">                        	
                        			<li class="active"><a href="#">${page}</a>
                        		</c:if>
                        		<c:if test="${page ne currentPage}">
                        			<li><a href="income.selectListByDate.do?page=${page}&startDate=${startDate}&endDate=${endDate}">${page}</a></li>
                        		</c:if>
                        	</c:forEach>
                        	<c:if test="${currentPage ne maxPage}">
                        		<li><a href="income.selectListByDate.do?page=${currentPage+1}&startDate=${startDate}&endDate=${endDate}">&raquo;</a></li>
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

    </div>
    <!-- /#all -->




    


</body>
</html>