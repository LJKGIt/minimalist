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
                                    <a href="">회원관리</a>
                                </li>
                                <li>
                                    <a href="">대여상품 등록</a>
                                </li>
                                <li>
                                    <a href="auction.viewRegister.do">경매상품 등록</a>
                                </li>

                            </ul>

                        </div>
                    </div>

                    <!-- *** PAGES MENU END *** -->
<c:forTokens var="img" items="${auction.image_path}" delims="," varStatus="index">
                             <c:if test="${index.count eq 1 }">
                             <c:set var="img01" value="/minimalist/resources/img_auction/${img}"/>
                             </c:if>
                             <c:if test="${index.count eq 2 }">
                             <c:set var="img02" value="/minimalist/resources/img_auction/${img}"/>
                             </c:if>
                             <c:if test="${index.count eq 3 }">
                             <c:set var="img03" value="/minimalist/resources/img_auction/${img}"/>
                             </c:if>
                             </c:forTokens>

                    
                </div>

                <div class="col-md-9">
                
                
				

                    <div class="box" id="contact">
                      <h1 align="center">경매수정</h1>

               <form action="auction.updateAuction.do"  method="post" enctype="multipart/form-data">
<table>
<tr><th>경매코드 : </th><td><input type="text" name="auction_code" value="${auction.auction_code}" readonly></td></tr>
<tr><th>상품명 : </th><td><input type="text" name="auction_name" value="${auction.auction_name}"></td></tr>
<tr><th>상품 카테고리 : </th><td><select name="auction_category">
	<c:set var="calist" value="의류,잡화,가방"/>
		 <c:forTokens var="category" items="${calist}" delims="," >
                   <c:if test="${category eq auction.auction_category}">
                      <option value="${category}" selected>${category}</option>
                      </c:if> 
                      <option value="${category}">${category}</option>
          </c:forTokens>
                      </select></td></tr>
<tr><th>상품 브랜드 : </th><td><input type="text" name="auction_brand" value="${auction.auction_brand}"></td></tr>
<tr><th>물품 사이즈 : </th><td><input type="text" name="auction_size" value="${auction.auction_size}" ></td></tr>
<tr><th>물품 색상 : </th><td><input type="text" name="auction_color" value="${auction.auction_color}"></td></tr>
<tr><th>상품 설명 : </th><td><textarea name="auction_descript">${auction.auction_descript}</textarea></td></tr>
<tr><th>경매시작가격 : </th><td><input type="number" name="start_price"  value="${auction.start_price}"></td></tr>
<tr><th>경매시작일 : </th><td><input type="date" name="start_date"  value="${auction.start_date}"></td></tr>
<tr><th>경매종료일 : </th><td><input type="date" name="end_date" value="${auction.end_date}"></td></tr>
<tr><th><h5>이미지 1</h5>
<img src="${img01}">
<h5>이미지 2</h5>
<img src="${img02}">
<h5>이미지 3</h5>
<img src="${img03}">
</th></tr>
<tr><th></th><td><font color="red">※사진을 새로 등록하지 않으면 기존 사진이 사용됩니다.</font></td></tr>
<tr><th>파일첨부1 : </th><td><input type="file" name="img1"></td></tr>
<tr><th>파일첨부2 : </th><td><input type="file" name="img2"></td></tr>
<tr><th>파일첨부3 : </th><td><input type="file" name="img3"></td></tr>
<tr><th><input type="submit" value="수정하기"></th></tr>
</table>
</form>
                       
                       
 <!--    <thead>
   	 
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

		<c:import url="../main/footer.jsp" />


    </div>
    <!-- /#all -->

    




    

	<c:import url="../main/footer.jsp" /> 
</body>
</html>