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
                                    <a href="member.memberSearchView.do">회원관리</a>
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
                      <h1 align="center">관리자 페이지</h1>

               <h1>관리자 페이지 구현은 해당 페이지를 복사해서 사용하면 됨.</h1>
                       <a href="productDetail.do?product_code=1500000001">1번 대여상품에 대한 리뷰 보기</a>
                       
   <!--  <thead>
   	 
    </thead>
    <tbody>
    	
   			
    </tbody> -->


					

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