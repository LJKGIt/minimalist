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
					alert('답글달기 완료');
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
thead{
 font-size: 16px;
  border-top: 2px solid #888;

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
                        <li>QUESTION &#38; ANSWER</li>
                        <li>Detail</li>
                    </ul>

                </div>

                <div class="col-md-3">
                   <!-- *** PAGES MENU ***
_________________________________________________________ -->
                   <div class="panel panel-default sidebar-menu">

                       <div class="panel-heading">
                           <h3 class="panel-title">QUESTION &#38; ANSWER</h3>
                       </div>

                       <div class="panel-body">
                           <ul class="nav nav-pills nav-stacked">
                               <li>
                                   <a href="qna.selectFaq.do">FAQ</a>
                               </li>
                               <li>
                                   <a href="qna.selectList.do">1:1 CONTACT</a>
                               </li>

                            </ul>

                        </div>
                    </div>

                    <!-- *** PAGES MENU END *** -->

                </div>

	                <div class="col-md-9">
					<div class="box" id="contact">
                     <div class="row">
                	<div class="col-md-10">
                 	<div id="qna_no">${qna.qna_no}</div>
                  
                 <table class="table table-condensed" style="border-bottom: 2px solid #888;">
                        <thead>
                         <tr>
                      <td colspan="2"><strong>${qna.qna_title}</strong></td>
                     </tr>
                        </thead>
                        <tbody class="detail_table">
                            <tr><td>글쓴이 &nbsp;&nbsp;${qna.member_id}</td><td>작성일&nbsp;&nbsp; ${qna.qna_date}</td></tr>
                           
                              
                            <tr>
                                <td colspan="2" >
                                    <p style="margin: 20px 0 20px 0;">${qna.qna_content}</p>
                       		<img src="/minimalist/resources/img_qna/${qna.img_path}">
                                </td>
                                
                            </tr>
                        </tbody></table>
                        
                   <div>
                   <p><strong>관리자 답변 :</strong><br>
                   <c:if test="${empty qna.qna_comment}">
                      <p><font color="gray">관리자의 답변이 완료되지 않았습니다.</font></p>
                   </c:if>
                  
                   <c:if test="${!empty qna.qna_comment}">
                   <p id="showComment" style="word-break:break-all;">${qna.qna_comment}</p>
                   
                   
                   </c:if>
                   
                  
               </div>
                	
                	<div>
                	
                	 <c:if test="${sessionScope.member.member_id eq 'admin' }">  
                                <textarea id="comment" class="form-control col-lg-12"  cols="30" rows="4"></textarea>
                                 <div class="form-group">
                                 		<button type="button" id="btn" style=" color: #fff; font-weight: 700; background-color: #4fbfa8;">입력</button>
                                 </div>
                                 </c:if>
                	</div>
                    
                    	
                  
                 
                              
                                    <div class="area1sButton pdT30">
                                    <a href="qna.selectList.do" class="btnGreen">목록보기</a>
                                    <c:if test="${sessionScope.member.member_id eq 'admin'}">
				 <a href="qna.viewUpdateForm.do?qna_no=${qna.qna_no}" class="btnGreen">수정</a>
              <a href="qna.deleteQna.do?qna_no=${qna.qna_no}" class="btnGreen">삭제</a>
                 </c:if>	
			</div>
	</div>	 

                    </div>


             
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

		</div>

		
		<c:import url="../main/footer.jsp" />



    <!-- /#all -->
</div>


</div>

    

</body>
</html>

