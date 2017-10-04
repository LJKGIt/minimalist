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

.board-write-1s tbody tr th, .board-write-1s tbody tr td {
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

.area1sButton {
	padding: 10px 0 0;
	text-align: center;
	align: center;
}
</style>



<body>
	<c:import url="../main/header.jsp" />
	<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li>관리자페이지</li>
					</ul>

				</div>

				<input type="hidden" id="i_hidden_aside_active" value="쪽지">
				<c:import url="../main/aside_admin.jsp" />

				<div class="col-md-9">



					<div class="box" id="contact">
						<h1 align="center">쪽지 보내기</h1>


						<form action="message.writeMessage.do" method="post">
							<table class="board-write-1s mgT40">

								<colgroup>
									<col style="width: 25%;">
									<col style="width: 75%;">
								</colgroup>
								<tbody>

									<tr>
										<td><strong>수신인</strong></td>
										<td><input type="text" id="mId_List" name="mId_List" style="width: 75%;"><a
											href="javascript:mSearch()" class="btn btn-primary" style="margin-left: 10px;">아이디
												검색</a></td>
									</tr>
									<tr>
										<td><strong>제목</strong></td>
										<td><input type="text" name="message_title" style="width: 98%;"></td>
									</tr>
									<tr>
										<td><strong>내용</strong></td>
										<td><textarea name="message_content" cols="30" rows="7"
												placeholder="내용을 입력하세요." style="width: 98%; height: 280px;"></textarea>


										</td>
									</tr>


									<!-- <tr><td><input type="submit" value="등록"  class="area1sButton"></td></tr> -->
							</table>
							<div>
								<input type="submit" value="등록" class="area1sButton">
							</div>

						</form>
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

		

	</div>
	<!-- /#all -->

<script type="text/javascript">
	var openPop;
	function mSearch() {
		// 변수명 주면 값을 가지게됨
		openPop = window.open("memberList.do", "a", "width=500 height=400, left=100, top=100");
	}
</script>
</body>
</html>