<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>아이디 검색</title>

<style>
@midea (max-width: 700px ;) {
	body {
		disply: none;
	}
}
</style>
</head>

<body>
	<div class="w3-row">
		<div class="w3-col" style="width: 100%; margin-left: 20px;">
			<input type="radio" value="name_chk" name="chkGroup" class="rbtn_mSearch" checked> 이름 
			<input type="radio" value="id_chk" name="chkGroup" class="rbtn_mSearch"> 아이디 <br>
			<input type="text" id="txt_mSearch" style="margin-right: 30px;">
			<a href="javascript:mSearch($('#txt_mSearch').val())" class="btn btn-primary">검색</a>
		</div>
	</div>
	<hr>
	<div class="w3-row">
		<div class="w3-col noSe" style="width: 50%; margin: 0 5%;">
			<table class="table table-condensed" border="1">
				<thead>
					<tr>
						<th><input type="checkbox" id="allChk"></th>
						<th>이름</th>
						<th>아이디</th>
					</tr>
				</thead>
				<tbody id="memList">
					<c:forEach var="list" items="${ list }">
						<tr class="id_list">
							<td><input type="checkbox" name="chk_mList" class="id_chk" onclick="mov_id($(this))"></td>
							<td>${ list.member_name }</td>
							<td>${ list.member_id }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="w3-col" style="width: 35%">
			<table class="table table-condensed" id="confirm_id"
				style="width: 80%" border="1">
				<thead>
					<tr>
						<th>아이디(이름)</th>
				<tbody>


				</tbody>

			</table>
			<a href="javascript:complete()" class="btn btn-primary">선택완료</a>

		</div>
	</div>
</body>
<script type="text/javascript">

	// MemberList to JavaScript Array
	var result = new Array();
	<c:forEach items="${ list }" var="list">
		var json=new Object();
		json.member_id="${ list.member_id }";
		json.member_name="${ list.member_name }";
		result.push(json);
	</c:forEach>
	
	// 이름 or 아이디로 검색
	function mSearch(val) {
		var index= new Array();
		if ($('.rbtn_mSearch:checked').val() == 'name_chk') {
			for (var i=0; i<result.length; i++) {				
				if (val == result[i].member_name) {
					index.push(i);
				}
			}	
		} else {
			for (var i=0; i<result.length; i++) {				
				if (val == result[i].member_id) {
					index.push(i);
				}
			}
		}
		
		if (index.length > 0) {
			$('#memList').html("");
			for (var i=0; i<index.length; i++) {
				$('#memList').html($('#memList').html() + '<tr><td><input type="checkbox" name="chk_mList" class="id_chk" onclick="mov_id($(this))"></td><td>' + result[index[i]].member_name
				+ '</td><td>' + result[index[i]].member_id + '</td></tr>');
			}
		} else {
			$('.noSe').html('검색결과가 없습니다.');
		}
	}

	// 체크박스 전체선택 / 해
	$('#allChk').click(function() {
		if ($('#allChk').prop('checked')) {
			$('input[name=chk_mList]').prop('checked', true);
			$('#memList').children('tr').each(function(index, element) {
				$('#confirm_id').children('tbody').html($('#confirm_id').children('tbody').html() + '<tr><td>' + $(this).children('td:eq(2)').text() + "(" + $(this).children('td:eq(1)').text() + ")" + '</td></tr>');
			})
		} else {
			$('input[name=chk_mList]').prop('checked', false);
			$('#confirm_id').children('tbody').children('tr').remove();
		}
		
		
		
	});

	// checkbox 	클릭시 확인용 테이블로 정보전환
	function mov_id(val) {
		if (val.prop('checked') == true) {
			var chk_id = val.parent().parent().children('td:eq(2)').text() + "(" + val.parent().parent().children('td:eq(1)').text() + ")";
			var chk_index = -1;
			$('#confirm_id').children('tbody').children('tr').each(function(index, element){
				if ($(this).children('td').text() == chk_id) {
					chk_index = index;
					
				}
			});
			if (chk_index == -1) {
				$('#confirm_id').children('tbody').html($('#confirm_id').children('tbody').html() + '<tr><td>' + val.parent().parent().children('td:eq(2)').text() + "(" + val.parent().parent().children('td:eq(1)').text() + ")" + '</td></tr>');
			}
			
			
		} else {
			var chk_id = val.parent().parent().children('td:eq(2)').text() + "(" + val.parent().parent().children('td:eq(1)').text() + ")";
			var chk_index = -1;
			$('#confirm_id').children('tbody').children('tr').each(function(index, element){
				if ($(this).children('td').text() == chk_id) {
					chk_index = index;
					
				}
			});
			if (chk_index >= 0) {
				$('#confirm_id').children('tbody').children('tr').eq(chk_index).remove();
			}
		}
		
		
	}
	
	
	function complete(){
		var chkId = opener.document.getElementById("mId_List").value;
		var strArray1 = new Array();
		if (opener.document.getElementById("mId_List").value != "") {
			strArray1 = opener.document.getElementById("mId_List").value.split(',');
		}
		$('#confirm_id').children('tbody').children('tr').each(function(index, element){
			var temp = $(this).children('td').text().substring(0, $(this).children('td').text().indexOf("("));
			
			if (strArray1.indexOf(temp) == -1) {
				strArray1.push(temp);
			}
		});
		
		opener.document.getElementById("mId_List").value = strArray1.toString();
		window.close();
	};
	

</script>
</html>