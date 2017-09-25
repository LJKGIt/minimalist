<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript">
$(function(){
	$('#btn').click(function(){
		var comment=$('#comment').val();
		var qna_no=$('#qna_no').text();
		console.log(comment);
		console.log(qna_no);
		$.ajax({
			url : "qna.addComment.do",
			type : "get",
			data : {qna_no : qna_no, comment : comment},
			dataType : "text",
			success : function(value){
				if(value=='yes'){
					alert('답글달기 완');
					$('#showComment').text(comment);
				}else if(value=='no'){
					alert('답글달기 실패');
				}
			}
		});
		
	});
});

</script>
 <link></link>
<style type="text/css">
.table {
   
    margin-bottom: 20px;
}



table {
    border-collapse: collapse;
    
}
table {
    display: table;
    table-layout: auto;
   
    }

.container {
    padding-right: 15px;
    padding-left: 15px;
   
    
}

.col-md-10{
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
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

.form-inline .form-group {
    display:table-row-group;
    margin-bottom: 0;
    vertical-align: middle;
}
.form-inline .form-control {
    display: inline-block;
}

textarea.form-control, #btn {
    height: 94px;
   resize:none;
}

.form-control {
    display: block;
   height: 34px;
    padding: 6px 12px;
    font-size: 14px;
   color: #555555;
    vertical-align: middle;
    background-color: #ffffff;
    border: 1px solid #cccccc;
 
}
.col-md-10 #qna_no{
overflow:hidden;
 display: none;
}
.table table-condensed>.detail_table{
border-bottom: 2px solid #cccccc;
 margin-bottom: 20px;
 

}
.table{
    width: 750px;
    max-width: 100%;
    margin-bottom: 20px;
}
.table table-condensed_b>.answer{
border-top: 2px dashed #ddd;
border-bottom: 2px dashed #ddd;

}
.form-control col-lg-12> #btn{
 height: 94px;
}
.btn-theme {
    color: #fff;
    background-color: #009688;
    border-color: #00897b;
}

.btn {
    border-radius: 4px;
}

.m-b-1 {
    margin-bottom: 1rem !important;
}

.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: normal;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}

input, button, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}

button, html input[type="button"], input[type="reset"], input[type="submit"] {
    -webkit-appearance: button;
    cursor: pointer;
}


button, select {
    text-transform: none;
}

button {
    overflow: visible;
}
.u-btn-outline-teal {
    color: #18ba9b;
    border-color: #18ba9b;
    background-color: transparent;
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
                                    <a href="qna.selectFaq.do">자주하는 질문</a>
                                </li>
                                <li>
                                    <a href="qna.selectList.do">1:1문의</a>
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
                              
            			<div class="row">
                	<div class="col-md-10">
                 	<div id="qna_no">${qna.qna_no}</div>
                  
                 <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                          
                           <th style="border-bottom: 3px solid ;" colspan="1"> &nbsp;<strong>${qna.qna_title}</strong></th>
                           
                              
                            </tr>
                        </thead>
                        <tbody class="detail_table">
                            <tr>
                                <td colspan="1">작성일&nbsp;&nbsp; ${qna.qna_date}
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="1">글쓴이 &nbsp;&nbsp;<span>${qna.member_id}</span>
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="2" style="border-bottom: 3px solid ;">
                                    <p>${qna.qna_content}</p>
                       		<img src="/minimalist/resources/img_qna/${qna.img_path}">
                                </td>
                                
                            </tr>
                        </tbody></table>
                        
                     <c:if test="${sessionScope.member.member_id eq 'admin' }">  
                	
                    
                    	<table class="table table-condensed_b">
                        <tbody class="answer"><tr>
                               
                              <td colspan="1" style="border-top-style:2px dashed #ccc;"><strong>관리자 답변 :</strong> &nbsp;&nbsp;<span id="showComment">${qna.qna_comment}</span> </td></tr>
                                 <tr><td>  
                                <textarea id="comment" class="form-control col-lg-12"  cols="30" rows="4"></textarea>
                                 <div class="form-group">
                                 		<button type="button" id="btn">입력</button>
                                 </div>
                                   </td></tr>
                        
                           
                    </tbody></table>
                    </c:if>
                   
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                              
                                   
<%-- <<<<<<< HEAD
                                      
                                       <a href="javascript:history.back()"><button type="button" id="list" class="btn btn-default">목록</button></a>
                                     &nbsp;&nbsp;<a href="qna.viewUpdateForm.do?qna_no=${qna.qna_no}"><button type="button" class="btn btn-default">수정</button></a>
                                     &nbsp;&nbsp;<a href="qna.deleteQna.do?qna_no=${qna.qna_no}"><button type="button" class="btn btn-default">삭제</button></a>
 --%>

                                      <p style="text-align:center">
                                       <span>
                                       <a href="javascript:history.back()"><button class="btn btn-md u-btn-outline-teal g-mr-10 g-mb-15" type="button" id="list" style="border-style: 1px solid #18ba9b;
                  "><!-- <i class="fa fa-shopping-cart"></i> --> 목록</button></a>
                                     &nbsp;&nbsp;<a href="qna.viewUpdateForm.do?qna_no=${qna.qna_no}"><button class="btn btn-md u-btn-outline-teal g-mr-10 g-mb-15" type="button" id="list">수정</button></a>
                                     &nbsp;&nbsp;<a href="qna.deleteQna.do?qna_no=${qna.qna_no}"><button class="btn btn-md u-btn-outline-teal g-mr-10 g-mb-15" type="button" id="list">삭제</button></a>
                                  </span>
                                 </p>
                               
                                 
                                   
                    
                                   
                                    
                                </td>
                            </tr>
                        </thead>
                    </table>
                    
               
       

                       
  
				</div>	 

                    </div>


             
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

		</div>
</div>
</div>
		
		<c:import url="../main/footer.jsp" />



    <!-- /#all -->





    

</body>
</html>

