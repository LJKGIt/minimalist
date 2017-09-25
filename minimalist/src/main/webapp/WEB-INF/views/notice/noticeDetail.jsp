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

<head>

   <title>
       Minimalist
    </title>
     <link rel="shortcut icon" href="resources/favicon6.ico" type="image/x-icon">


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
                        <li>공지사항</li>
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
         <table class="board-view-1s mgT40">
                   
		<tbody>
		
				
		<tr><td colspan="2" style=" border-bottom-style: dashed; text-align:left;">
		<span class="tit" ><strong>${notice.notice_title}</strong></span>
		</td><td class="data" style="border-bottom-style: dashed; text-align:right;" >${notice.notice_date}</td></tr>
		
		<tr><td id="a" colspan="3" style="border-bottom: 2px solid #cccccc;" ><span>${notice.notice_content}</span></td></tr>
		
		</tbody>
		
	</table>
					 
             <div class="c"><!-- <tr><td colspan="2"> -->
		
                       <a href="notice.selectList.do"><button type="button" id="list" class="btn btn-default">목록</button></a>
				 <c:if test="${sessionScope.member.member_id eq 'admin'}">
                &nbsp;&nbsp;<a href="notice.viewUpdateForm.do?notice_no=${notice.notice_no}"><button type="button" class="btn btn-default">수정</button></a>
               &nbsp;&nbsp;<a href="notice.deleteNotice.do?notice_no=${notice.notice_no}"><button type="button" class="btn btn-default">삭제</button></a>
                  </c:if>
               
      <!--  </td> </tr> -->
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