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
                                    <a href="">공지사항</a>
                                </li>
                                <li>
                                    <a href="">자주하는 질문</a>
                                </li>
                                <li>
                                    <a href="">문의하기</a>
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
                       <h1>1:1문의</h1>

                       
                <p><font color="gray">회원님의 문의사항에 빠른 답변 드리도록 노력하겠습니다.</font></p>
<div style="border-bottom: 3px solid #80cbc4;"></div>
                     
                        
                        <table class="type07">
                       
    <thead>
    <tr>
        <th style="width:150px">카테고리</th>
        <th style="width:400px">제목</th>
        <th style="width:170px">작성일</th>
        <th style="width:120px">답변여부</th>
    </tr>
    </thead>
    <tbody>
    	<!-- 관리자 또는 작성자만 글 볼 수 있게 처리하기. -->
    <c:if test="${empty sessionScope.member}">
    	로그인 해주세요.
    	 <font color="red">자신이 등록한 질문만 열람이 가능합니다.</font>
    </c:if>
    
      <c:if test="${!empty sessionScope.member}">
    <c:choose>
    
    
    
    <c:when test="${sessionScope.member.member_id eq 'admin'}">
    <c:forEach var="qna" items="${list}">
    
    <tr>
        <th scope="row">${qna.qna_category}</th>
        
        <td><a href="qna.selectOne.do?qna_no=${qna.qna_no}">${qna.qna_title}</a></td>
       
        	<td>${qna.qna_date}</td>
        	
        	<c:if test="${empty qna.qna_comment}">
        	<td>미완료</td>
        	</c:if>
        	<c:if test="${!empty qna.qna_comment}">
        	<td>답변완료</td>
        	</c:if>
        
    </tr>
   </c:forEach>
   </c:when>
    <c:when test="${sessionScope.member.member_id ne 'admin'}">
   
   
    <c:forEach var="qna" items="${list}">
    <c:if test="${sessionScope.member.member_id eq qna.member_id}">
    <tr>
        <th scope="row">${qna.qna_category}</th>
        
        <td><a href="qna.selectOne.do?qna_no=${qna.qna_no}">${qna.qna_title}</a></td>
       
        	<td>${qna.qna_date}</td>
        	
        	<c:if test="${empty qna.qna_comment}">
        	<td>미완료</td>
        	</c:if>
        	<c:if test="${!empty qna.qna_comment}">
        	<td>답변완료</td>
        	</c:if>
        
    </tr>
    </c:if>
   </c:forEach>
   			</c:when>	
   			
   			
   			</c:choose>	
   			 <div class="write2"><a href="qna.viewWriteForm.do"><button type="button" id="write">글쓰기</button></a></div>	
   			</c:if>				
    </tbody>
</table>

					 <div class="pages">

                       

                        <ul class="pagination">
                        	<c:if test="${currentPage ne 1}">
                        		<li><a href="qna.selectList.do?page=${currentPage-1}">&laquo;</a></li>
                        	</c:if>
                        	<c:forEach var="page" begin="${startPage}" end="${endPage}">      
                        		<c:if test="${page eq currentPage}">                        	
                        			<li class="active"><a href="#">${page}</a>
                        		</c:if>
                        		<c:if test="${page ne currentPage}">
                        			<li><a href="qna.selectList.do?page=${page}">${page}</a></li>
                        		</c:if>
                        	</c:forEach>
                        	<c:if test="${currentPage ne maxPage}">
                        		<li><a href="qna.selectList.do?page=${currentPage+1}">&raquo;</a></li>
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




    


</body>
</html>