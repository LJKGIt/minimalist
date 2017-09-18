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
 <script>
  
                        $(function(){
                              
                            //제일 하단에 있는 depth1의 댓글을 다는 이벤트
                            $("#commentParentSubmit").click(function( event ) {
                                  
                                //ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
                               
                                var pText = $("#commentParentText");
                                  
                                if($.trim(pText.val())==""){
                                    alert("내용을 입력하세요.");
                                    pText.focus();
                                    return;
                               
                                
                           }
                                  
                                var commentParentText = '<tr id="r1" name="commentParentCode">'+
                                                            '<td colspan=2>'+
                                                                '<strong>'+pName.val()+' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                                            '</td>'+
                                                        '</tr>';
                                  
                                //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
                                if($('#commentTable').contents().size()==0){
                                    $('#commentTable').append(commentParentText);
                                }else{
                                    $('#commentTable tr:last').after(commentParentText);
                                }
                                  
                             
                                $("#commentParentText").val("");
                                  
                            });
                              
                            //댓글의 댓글을 다는 이벤트
                            $(document).on("click","#commentChildSubmit", function(){
                                  
                               
                            var cText = $("#commentChildText");
                                  
                                if($.trim(cText.val())==""){
                                	 alert("내용을 입력하세요.");
                                     cText.focus();
                                     return;
                               
                                
                         }
                                  
                                var commentChildText = '<tr name="commentChildCode">'+
                                                            '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'+
                                                            '<td style="width:99%">'+
                                                               ' <a style="cursor:pointer;" name="cAdd">답글</a> | <a style="cursor:pointer;" name="cDel">삭제</a>'+
                                                                '<p>'+cText.val().replace(/\n/g, "<br>")+'</p>'+
                                                            '</td>'+
                                                        '</tr>';
                                                          
                                //앞의 tr노드 찾기
                                var prevTr = $(this).parent().parent().parent().parent().prev();
                                //댓글 적는 에디터 삭제
                                $("#commentEditor").remove();//여기에서 삭제를 해줘야 에디터tr을 안 찾는다.
                                  
                                //댓글을 타고 올라가며 부모 tr을 찾음
                                while(prevTr.attr("name")!="commentParentCode"){
                                    prevTr = prevTr.prev();
                                }
                                //while를 타는지 체크
                                var check = false;
                                //다음 노드가 댓글(depth1)의 댓글인지 찾기위해 next
                                var nextTr = prevTr.next();
                                //뒤에 댓글(depth1)의 댓글(depth2_1)이 없다면 바로 붙인다.
                                if(nextTr.attr("name")!="commentChildCode"){
                                    prevTr.after(commentChildText);
                                }else{
                                    //댓글(depth1)의 댓글(depth2_n)이 있는경우 마지막까지 찾는다.
                                    while(nextTr.attr("name")=="commentChildCode"){
                                        nextTr = nextTr.next();
                                        check = true;
                                    }
                                }
                                  
                                if(check){//댓글(depth1)의 댓글(depth2_n)이 있다면 그 댓글(depth2_n) 뒤에 댓글(depth2_n+1) 추가
                                    nextTr = nextTr.prev();//while문에서 검색하느라 next로 넘거갔던거 다시 앞으로 돌려줌
                                    nextTr.after(commentChildText);
                                }
                                  
                            });
                              
                            //답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
                            $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
                                  
                                if($(this).attr("name")=="pDel"){
                                    if (confirm("답글을 삭제 하시면 밑에 답글도 모두 삭제 됩니다. 정말 삭제하시겠습니까?") == true){    //확인
                                          
                                        var delComment = $(this).parent().parent();
                                        var nextTr = delComment.next();
                                        var delTr;
                                        //댓글(depth1)의 댓글(depth2_1)이 있는지 검사하여 삭제
                                        while(nextTr.attr("name")=="commentCode"){
                                            nextTr = nextTr.next();
                                            delTr = nextTr.prev();//삭제하고 넘기면 삭제되서 없기 때문에 다음값을 가져오기 어려워 다시 앞으로 돌려서 찾은 다음 삭제
                                            delTr.remove();
                                        }
                                          
                                        delComment.remove();
                                          
                                    }else{   //취소
                                        return;
                                    }
                                }else if($(this).attr("name")=="cDel"){
                                    if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                                        $(this).parent().parent().remove();
                                    }else{   //취소
                                        return;
                                    }
                                }else{
                                    //자기 부모의 tr을 알아낸다.
                                    var parentElement = $(this).parent().parent();
                                    //댓글달기 창을 없앤다.
                                    $("#commentEditor").remove();
                                    //부모의 하단에 댓글달기 창을 삽입
                                    var commentEditor = '<tr id="commentEditor">'+
                                                            '<td style="width:1%"> </td>'+
                                                            '<td>'+
                                                                '<span class="form-inline" role="form">'+
                                                                    '<p>'+ '<textarea id="commentChildText" name="commentChildText" class="form-control" cols="80" rows="4"></textarea>'+
                                                                       
                                                                        '<div class="form-group">'+
                                                                            '<button type="button" id="commentChildSubmit" class="btn btn-default">확인</button>'+
                                                                        '</div>'+
                                                                    '</p>'+
                                                                       
                                                                '</span>'+
                                                            '</td>'+
                                                        '</tr>';
                                                          
                                    parentElement.after(commentEditor); 
                                }
                                  
                            });
                              
                         
                    $( "#write" ).click(function( event ) {
                                location.href='qna.addComment.do';
                            });
                        });
                    </script>
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
    display: inline-block;
    margin-bottom: 0;
    vertical-align: middle;
}
.form-inline .form-control {
    display: inline-block;
}

textarea.form-control {
    height: auto;
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




</style>


<head>

  
   
    <title>
    qna
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
                              
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                            <span id="qna_no" type="hidden">${qna.qna_no}</span>
                                <th colspan="1"> &nbsp;<strong>${qna.qna_title}</strong></th>
                              
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="1">작성일&nbsp;&nbsp; ${qna.qna_date}
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="1">글쓴이 &nbsp;&nbsp;<span>${qna.member_id}</span>
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p>${qna.qna_content}</p>
                       		<img src="/minimalist/resources/img_qna/${qna.img_path}">
                                </td>
                                
                            </tr>
                        </tbody>
                       
                       </table>
                     <c:if test="${sessionScope.member.member_id eq 'admin' }">  
                <table id="commentTable" class="table table-condensed"></table>
                    
                    <table class="table table-condensed">
                        <tbody><tr>
                                <!-- <span class="form-inline" role="form"> -->
                              <td colspan="1"><strong>답변 :</strong> &nbsp;&nbsp;<span id="showComment">${qna.qna_comment}</span> </td></tr>
                                 <tr><td>  
                                <textarea id="comment" class="form-control col-lg-12"  cols="30" rows="4" style="resize:none;"></textarea>
                                 <div class="form-group">
                                 		<button type="button" id="btn">확인 또는 수정</button>
                                 </div>
                                   </td></tr>
                           
                           
                    </tbody></table>
                    </c:if>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span>
                                       <a href="javascript:history.back()"><button type="button" id="list" class="btn btn-default">목록</button></a>
                                     &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<a href="qna.viewUpdateForm.do?qna_no=${qna.qna_no}"><button type="button">수정</button></a>
                                     &nbsp;<a href="qna.deleteQna.do?qna_no=${qna.qna_no}"><button type="button">삭제</button></a>
                                    </span>
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

