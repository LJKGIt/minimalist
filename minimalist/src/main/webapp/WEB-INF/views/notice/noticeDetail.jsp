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
  padding: 20px 3px 20px; 
   color: #333;
   font-size: 15px;
   white-space:pre;
    text-align:center;
}
 
.board-view-1s>tbody>tr>td.a{
background: url(http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/bar_dott7x1.gif) repeat-x 0 0;
    word-break: break-all;
      padding-bottom:10%;
}
.board-view-1s>tbody>tr>td.data {

    font-size: 15px;
    line-height: 15px;
    text-align: right;
   
   
}
.board-view-1s>tbody>tr>td .tit{
    display: inline-block;
    color: #333;
    font-size: 20px;
   text-align:left;
       margin-left: -50px;

   
}
.area1sButton {
    padding: 10px 0 0;
    text-align: center;
    
}

.pdT30 {
    padding-top: 30px !important;
}

.area1sButton a.btnGray, .area1sButton a.btnGreenW, .area1sButton a.btnGreen {
    display: inline-block;
    width: 120px;
    box-sizing: border-box;
    height: 30px;
}

.area1sButton a.btnGreen, .area1sButton a.btnGray, .area2sButton a.btnGreen, .area1sButton a.btnGray, .area3sButton a.btnGreen, .area3sButton a.btnGray {
    color: #fff;
    font-weight: 700;
}
.btnGreen, a.btnGreen {
 
    background-color: #4fbfa8;
  margin:0 10px 5px 0;
    font-size: 16px;
    line-height: 30px;
    border-radius: 3px;
}


a {
    color: #666;

}
.btnGreen, a.btnGreen:hover {
    color: #ffffff;
    background-color: #3da892;
    text-decoration: none;
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
                        <li>Notice</li>
                        <li>Detail</li>
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
 <table class="board-view-1s mgT40">
       <tbody>
		<tr><td colspan="2" style="text-align:left;">
		<span class="tit" ><strong>${notice.notice_title}</strong></span>
		</td><td class="data" style="text-align:right;" >${notice.notice_date}</td></tr>
		<tr><td class="a" colspan="3" style="border-bottom: 2px solid #888;" ><p><span>${notice.notice_content}</span></p></td></tr>
		</tbody>
</table>
			<div class="area1sButton pdT30">
				<a href="notice.selectList.do" class="btnGreen">목록보기</a>
			<c:if test="${sessionScope.member.member_id eq 'admin'}">
                <a href="notice.viewUpdateForm.do?notice_no=${notice.notice_no}" class="btnGreen">수정</a>
              <a href="notice.deleteNotice.do?notice_no=${notice.notice_no}" class="btnGreen">삭제</a>
                 </c:if>	
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