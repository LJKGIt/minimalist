<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<style>

$(function(){
	$('#searching').click(function(){
		var keyword=$('#idid').val(); 
		 if(keyword==null){
			alert('아이디를 입력하세요.');
		} 
		
	});
});

</script>


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

                <c:import url="../main/aside_admin.jsp" />

                <div class="col-md-9">


                    <div class="box" id="contact">
                      <h1 align="center">회원 검색</h1>

              	
             <p align="center">	<input type="text" placeholder="아이디로 검색" id="idid"><button type="button" id="searching">검색</button>
              	</p>
             
             <div id="result"></div> 
    <!-- <thead>
   	 
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

		<c:import url="../main/footer.jsp" />


    </div>
    <!-- /#all -->

    




    

	<c:import url="../main/footer.jsp" /> 
</body>
</html>