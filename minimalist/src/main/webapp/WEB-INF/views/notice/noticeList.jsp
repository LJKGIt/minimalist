<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<style type="text/css">
div.write2{

position: absolute;
    right: 80px;
   bottom: 100px;


}
table.type07 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    margin: 20px 10px;
     border-top-style: none;
    border-right-style: none;
	border-left-style: none;
}
/* table.type07 thead {
     border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
   border-right:none;
border-left:none;

} */
table.type07 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
	text-align:left;
	 border-bottom: 1px solid #ccc; 
	
	}


table.type07 tbody th {
    /* width: 130px; 번호*/
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
     text-align: left;
}
 .btn-primary {
    color: #ffffff;
    background-color: #4fbfa8;
    border-color: #41b39c;
 
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open .dropdown-toggle.btn-primary {
    color: #ffffff;
    background-color: #3da892;
    border-color: #318675;
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
                        <li>NOTICE</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** PAGES MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">NOTICE</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="notice.selectList.do">NOTICE</a>
                                </li>
                              

                            </ul>

                        </div>
                    </div>

                    <!-- *** PAGES MENU END *** -->
                     </div>

                <div class="col-md-9">
    			

                    <div class="box" id="contact">
                        <h1>공지사항</h1><hr>
						
                 
                 <!--        <div class="u-divider u-divider-solid u-divider-center g-brd-pink w-75 mx-auto g-my-80">
                    <i class="u-divider__icon g-bg-pink g-color-white rounded-circle">공지</i>
                  </div> -->
                        <table class="type07">
    <thead>
    <tr>
       <th style="width:200px">번호</th>
        <th style="width:600px; ">제목</th>
        <th style="width:200px">작성일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="no" items="${list}">
    
    <tr>
        <th scope="row">${no.notice_no}</th>
        <td><a href="notice.selectOne.do?notice_no=${no.notice_no}">${no.notice_title}</a></td>
        <td>${no.notice_date}</td>
        
    </tr>
   </c:forEach>
   			<c:if test="${sessionScope.member.member_id eq 'admin' }">
    <div class="write2"><a href="notice.viewWriteForm.do"><button type="button" class="btn-primary">글쓰기</button></a></div>	
   			</c:if>	
    </tbody>
</table>

					 <div class="pages">

                       

                        <ul class="pagination">
                        	<c:if test="${currentPage ne 1}">
                        		<li><a href="notice.selectList.do?page=${currentPage-1}">&laquo;</a></li>
                        	</c:if>
                        	<c:forEach var="page" begin="${startPage}" end="${endPage}">      
                        		<c:if test="${page eq currentPage}">                        	
                        			<li class="active"><a href="#">${page}</a>
                        		</c:if>
                        		<c:if test="${page ne currentPage}">
                        			<li><a href="notice.selectList.do?page=${page}">${page}</a></li>
                        		</c:if>
                        	</c:forEach>
                        	<c:if test="${currentPage ne maxPage}">
                        		<li><a href="notice.selectList.do?page=${currentPage+1}">&raquo;</a></li>
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