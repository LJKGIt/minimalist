<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="orderInfoInsert.do" method="POST">
		<input type="text" name="product_code" value="${ product.product_code }">
		<input type="text" name="product_name" value="${ product.product_name }">
		<input type="submit" value="결제하기">
	</form>
</body>
</html>