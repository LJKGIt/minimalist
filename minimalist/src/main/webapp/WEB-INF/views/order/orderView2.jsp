<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<form action="orderInfoInsert.do" method="POST">
		<input type="text" name="product_code" value="${ product.product_code }">
		<input type="text" name="product_name" value="${ product.product_name }">
		<input id="i_submit_order" type="submit" value="결제하기">
	</form>
	
	<script type="text/javascript">
	<% // TODO [lintogi] i_input >> type 값으로 바꾸기. %>
	$(function(){
		$('input').on('click', function(){
			alert("가");
			return false;
		});
		/* var IMP = window.IMP; 
        IMP.init('imp29035988');
		$("#income").click(function(){
        var cc = confirm("결제할래?");
        if(cc==true){
        	IMP.request_pay({
        	    pg : 'inicis',
        	    pay_method : 'card',
        	    merchant_uid : 'merchant_' + new Date().getTime(),
        	    name : '주문명:결제테스트',
        	    amount : 100,
        	    buyer_email : 'kyt3696@gmail.com',
        	    buyer_name : '김용태',
        	    buyer_tel : '010-2530-8548',
        	}, function(rsp) {
        	    if ( rsp.success ) {
        	        var msg = '결제가 완료되었습니다.';
        	        msg += '고유ID : ' + rsp.imp_uid;
        	        msg += '상점 거래ID : ' + rsp.merchant_uid;
        	        msg += '결제 금액 : ' + rsp.paid_amount;
        	        msg += '카드 승인번호 : ' + rsp.apply_num;
        	        console.log($("#form"));
        	        $("form").submit();
        	        console.log("ds");
        	    } else {
        	        var msg = '결제에 실패하였습니다.';
        	        msg += '에러내용 : ' + rsp.error_msg;
        	    }
        	    alert(msg);
        	});
        };
		}); */
		
        
	});
	</script>
	
	<script src="https://service.iamport.kr/js/iamport.payment-1.1.4.js" type="text/javascript"></script>
</body>
</html>