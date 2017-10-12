<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/owl.carousel.css" rel="stylesheet">
<link href="resources/css/owl.theme.css" rel="stylesheet">
<!-- theme stylesheet -->
<link href="resources/css/style.default.css" rel="stylesheet"
	id="theme-stylesheet">
<!-- your stylesheet with modifications -->
<link href="resources/css/custom.css" rel="stylesheet">
<style type="text/css">
body {
	background: #f0f0f0;
}

#top {
	background: #4fbfa8;
	color: white;
	padding: 0 20px;
}

hr {
	border-top: 1px solid #bbb;
	border-bottom: 1px solid #fff;
}
</style>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript">
	function trClick(gg) {
		var flag = gg.attr('data-sendYn');
		var mNum = gg.attr('data-msgNum');
		var indexgg = 0;
		gg.parent().children('tr').each(function(index, item) {
			// console.log(gg.html()==gg.parent().children('tr').eq(index).html());
			if (gg.html()==gg.parent().children('tr').eq(index).html()) {
				indexgg = index;
			}
		})
		
		var gg=gg.parent().children('tr').eq(indexgg+1);
		if (gg.attr('class') == "w3-hide") {
			gg.attr('class','');
			if (flag == 'n'.charAt(0)) {
				$.ajax({
					url : "mChkUpdate.do",
					data : {
						mNum : mNum
					},
					type : "POST",
					dataType : "text",
					success : function(data){
						// 비교용 색
					}
				})
			}
		} else {
			gg.attr('class', 'w3-hide');
		}
	}
</script>
<title>마사지</title>
</head>
<body>
	<div class="container">
		<div class="row" id="top">
			<h4>
				<strong>Message</strong>
			</h4>
		</div>
		<hr style="background: black;">

		<table class="w3-table-all w3-hoverable"
			style="width: 90%; margin: auto">
			<thead>
				<tr class="w3-light-grey">
					<th>제목</th>
					<th>보낸 날짜</th>
					<th>삭제</th>
				</tr>
			</thead>
			<c:choose>
			<c:when test="${empty messageList}">
			<tr><th colspan="3" style="text-align:center">쪽지가 없습니다.</th></tr>
			</c:when>
			<c:when test="${!empty messageList}">
			<c:forEach items="${ messageList }" var="list">
				<tr onclick="javascript:trClick($(this))" data-sendYn="${ list.check_yn }" data-msgNum="${list.message_number}">
					<td data-msgNum="${ list.message_number }">${ list.message_title }</td>
					<td>${ list.send_date }</td>
					<td><button onclick="javascript:deleteMessage($(this))" class="btn btn-primary">삭제</button></td>
				</tr>
				<tr class="w3-hide">
				<c:if test="${list.message_title eq '결제링크'}">
					<td colspan="3"><a href="${pageContext.request.contextPath}${list.message_content}" target="_about">결제링크</a></td>
				</c:if>
				<c:if test="${list.message_title ne '결제링크'}">
					<td colspan="3">${ list.message_content }</td>
					</c:if>
				</tr>
			</c:forEach>
			</c:when>
			</c:choose>

		</table>
		<c:if test="${endPage ne 0}">
		
		<div class="pages">


			<ul class="pagination">
				<c:if test="${currentPage ne 1}">
					<li><a href="message.messageListView.do?page=${currentPage-1}">&laquo;</a></li>
				</c:if>
				<c:forEach var="page" begin="${startPage}" end="${endPage}">
					<c:if test="${page eq currentPage}">
						<li class="active"><a href="#">${page}</a>
					</c:if>
					<c:if test="${page ne currentPage}">
						<li><a href="message.messageListView.do?page=${page}">${page}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage ne maxPage}">
					<li><a href="message.messageListView.do?page=${currentPage+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>
<script type="text/javascript">
	function deleteMessage(dbtn) {
		var mNum = dbtn.parent().parent().attr('data-msgNum'); 
		$.ajax({
			url : "message.messageDelete.do",
			data : {
				mNum : mNum
			},
			type : "POST",
			dataType : "text",
			success : function(data){
				if (data == '1') {
					alert("삭제완료");
					location.reload();
				}
				else {
					alert("삭제실패");
				}
			}
		})
		
	}
</script>
</div>
</body>

</html>