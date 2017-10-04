<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>
<html>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>

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
.search{

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

				<input type="hidden" id="i_hidden_aside_active" value="회원관리">
                <c:import url="../main/aside_admin.jsp" />

                <div class="col-md-9">


                    <div class="box" id="contact">
                      <h1 align="center">회원 목록</h1>
						
				<table class="type07" style="margin:auto">
                       
    <thead>
    <tr>
        <th style="width:150px">회원아이디</th>
         <th style="width:150px">회원등급</th>
          <th style="width:150px">휴면여부(y/n)</th>
        <th style="width:150px">상세보기</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${empty list}">
   <p align="center">일치하는 회원이 없습니다.</p>
    </c:if>
    <c:if test="${!empty list}">
    	<c:forEach var="member" items="${list}">
    	<tr>
    	<td> ${member.member_id} </td>
    	<td>${member.grade}</td>
    	<td>${member.dormant_yn}</td>
    	<td><a href="member.selectOne.do?member_id=${member.member_id}"><button type="button">상세보기</button></a></td>
    	</tr>
    	</c:forEach>
    	</c:if>
    </tbody>
</table>
<div>
<form action="member.searchingMember.do" method="post">
<table style="margin:auto">
<tr><td><input type="text" class="search" name="keyword"><input type="submit" value="검색" class="search"></td></tr>
</table>
</form>
</div>

					 <div class="pages">

                       

                        <ul class="pagination">
                        	<c:if test="${currentPage ne 1}">
                        		<li><a href="member.memberManage.do?page=${currentPage-1}">&laquo;</a></li>
                        	</c:if>
                        	<c:forEach var="page" begin="${startPage}" end="${endPage}">      
                        		<c:if test="${page eq currentPage}">                        	
                        			<li class="active"><a href="#">${page}</a>
                        		</c:if>
                        		<c:if test="${page ne currentPage}">
                        			<li><a href="member.memberManage.do?page=${page}">${page}</a></li>
                        		</c:if>
                        	</c:forEach>
                        	<c:if test="${currentPage ne maxPage}">
                        		<li><a href="member.memberManage.do?page=${currentPage+1}">&raquo;</a></li>
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

		<c:import url="../main/footer.jsp" />


    </div>
    <!-- /#all -->

    




    

	<c:import url="../main/footer.jsp" /> 
</body>
</html>