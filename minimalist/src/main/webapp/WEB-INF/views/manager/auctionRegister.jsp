<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<style type="text/css">
element.style {
    display: none;
}
.board-write-1s {
    table-layout: fixed;
    width: 100%;
    margin: 0 auto;
    border-top: 2px solid #888;
  }

/* .mgT40 {
    margin-top: 40px !important;
} */

table {
    border-spacing: 0;
    border: 0;
}
label, input.button, input.submit, input.image, button {
    cursor: pointer;

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
                      <h1 align="center">경매등록</h1>

               <form action="auction.insertAuction.do"  method="post" enctype="multipart/form-data">
<table>
<tr><th>상품명 : </th><td><input type="text" name="product_name"></td></tr>
<tr><th>상품 카테고리 : </th><td><select name="category">
                      <option value="의류">의류</option>
                      <option value="잡화">잡화</option>
                      <option value="악세사리">악세사리</option>
                      </select></td></tr>
<tr><th>상품 브랜드 : </th><td><input type="text" name="product_brand"></td></tr>
<tr><th>물품 사이즈 : </th><td><input type="text" name="product_size"></td></tr>
<tr><th>물품 색상 : </th><td><input type="text" name="product_color"></td></tr>
<tr><th>상품 설명 : </th><td><textarea name="product_descript"></textarea></td></tr>
<tr><th>경매시작가격 : </th><td><input type="number" name="bid_price"></td></tr>
<tr><th>경매시작일 : </th><td><input type="date" name="start_date"></td></tr>
<tr><th>경매종료일 : </th><td><input type="date" name="end_date"></td></tr>
<tr><th>파일첨부1 : </th><td><input type="file" name="img1"></td></tr>
<tr><th>파일첨부2 : </th><td><input type="file" name="img2"></td></tr>
<tr><th>파일첨부3 : </th><td><input type="file" name="img3"></td></tr>
<tr><th><input type="submit" value="등록하기"></th></tr>
</table>
</form>
                       
                       
  <!--   <thead>
   	 
    </thead>
    <tbody>
    	
   			
    </tbody>
 -->

					

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