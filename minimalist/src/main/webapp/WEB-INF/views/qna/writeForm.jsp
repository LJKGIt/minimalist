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

}
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
table {
    display: table;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: grey;
}
colgroup {
    display: table-column-group;
}
form {
    display: block;
  
}
.board-write-1s tbody tr th {
    padding: 20px 0 10px 15px;
    vertical-align: top;
}
.board-write-1s tbody tr.textarea td {
    padding: 20px 0;
}
.board-write-1s tbody tr th, .board-write-1s tbody tr td{
    border-bottom: 1px solid #e6e6e6;
    color: #333;
    font-size: 14px;
    text-align: left;
    line-height: 18px;
   padding: 3px 0 5px 15px;
}


textarea {
    border: 1px solid #ccc;
    padding: 10px 8px;
    border-radius: 5px;
    resize: none;
    font-family: 'AppleGothic', 'Roboto', 'montserrat', 'noto', sans-serif;
    font-size: 14px;
    line-height: 20px;
    box-shadow: none;
    box-sizing: border-box;
    -webkit-appearance: none;
 
}
input {
    width: 100%;
    height: 38px;
    margin: 0;
    padding: 0;
    border: 1px solid #d0d0d0;
    color: #888;
    background: none;
  -webkit-border-radius: 5px;
  box-shadow: none;
 -webkit-appearance: none;
   letter-spacing: 0.5px;
    vertical-align: top;
}
.board-write-1s tbody tr.textarea td span.file {
 
    padding: 20px 0 0 10px;
    color: #333;
    font-size: 10px;
    line-height: 18px;
}
.board-write-1s tbody tr.textarea td {
    padding: 20px 0;
	padding-top: 20px;
    padding-right: 0px;
    padding-bottom: 20px;
    padding-left: 0px;
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
                        <li>문의하기</li>
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


                </div>

                <div class="col-md-9">


                    <div class="box" id="contact">
                      <!-- 질문하기 form --> 
                      <form action="qna.writeQna.do" method="post" enctype="multipart/form-data">
                      <table class="board-write-1s mgT40">
                     
			<colgroup>
				<col style="width:25%;">
				<col style="width:75%;">
			</colgroup>
			<tbody>
                      <tr><th scope="col"><label for="TypeInquiry"><strong>문의유형</strong></label></th>
                     <td><select id="cnslLrgCate" style="width:192px;" title="문의유형 항목을 선택하세요" name="category">
                      <option value="회원/멤버십" selected>회원/멤버십</option>
                      <option value="배송">배송</option>
                      <option value="교환/반품/환불">교환/반품/환불</option>
                      <option value="대여">대여</option>
                      <option value="경매">경매</option>
                      <option value="결제">주문/결제</option>
                	 <option value="기타">기타</option>
                      </select>
                     </td></tr>
                       <tr><td><strong>작성자</strong></td><td><input type="text" name="id"  style="width:98%;" value="${sessionScope.member.member_id}" readonly></td></tr>
                    <tr><td><strong>제목</strong></td><td><input type="text" name="title" style="width:98%;"></td></tr>
                      <tr><td><strong>내용</strong></td><td><textarea name="content" cols="30" rows="7" placeholder="문의내용을 입력해주세요.(2000자 이내)" style="width:98%;height:280px;"></textarea>
                     
							<input type="file" id="inputFile" name="cnslFile" class="btnFileAdd" value="첨부파일" title="첨부파일 선택">
							<input type="hidden" name="fileName" id="cnslFileName" value="">
							<span id="fileName" class="file" style="display: none;"><span></span><button type="button" id="btnFileDelete" class="ButtonDelete">삭제</button></span>
							<span class="txt">5MB 이하의 이미지 파일 (JPG, PNG, GIF) 1개를 첨부하실 수 있습니다.</span>
						</td>
					</tr>
                      </tbody>
                      
                      <!-- <tr><td><input type="submit" value="등록"  class="area1sButton"></td></tr> -->
                      
                      </table>
                      <div>
                       <input type="submit" value="등록"  class="btn-primary">
                      </div>
                     
                      </form>
                        

					

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