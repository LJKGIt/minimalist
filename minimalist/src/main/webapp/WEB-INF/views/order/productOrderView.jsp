<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>


<body>
	<c:import url="../main/header.jsp" />
    <div id="all">

        <div id="content">
            <div class="container">


                    <%-- <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>결제</li>
                    </ul>

                   <div class="box">
                        <form action="orderInfoInsert.do" method="POST">
							<input type="text" name="product_code" value="${ product.product_code }" readonly>
							<input type="text" name="product_name" value="${ product.product_name }" readonly>
							<input id="i_submit_order" type="submit" value="결제하기">
						</form>
                    </div> --%>
                    <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Checkout - Order review</li>
                    </ul>
                </div>

                <div class="col-md-12" id="checkout">

                    <div class="box">
                        <form method="post" action="checkout4.html">
                            <h1>Checkout - Order review</h1>
                            <ul class="nav nav-pills nav-justified">
                                <li><a href="checkout1.html"><i class="fa fa-map-marker"></i><br>Address</a>
                                </li>
                                <li class="active"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                                </li>
                            </ul>

                            <div class="content">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th colspan="2">Product</th>
                                                <th>Quantity</th>
                                                <th>Unit price</th>
                                                <th>Discount</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <a href="#">
                                                        <img src="img/detailsquare.jpg" alt="White Blouse Armani">
                                                    </a>
                                                </td>
                                                <td><a href="#">White Blouse Armani</a>
                                                </td>
                                                <td>2</td>
                                                <td>$123.00</td>
                                                <td>$0.00</td>
                                                <td>$246.00</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="#">
                                                        <img src="img/basketsquare.jpg" alt="Black Blouse Armani">
                                                    </a>
                                                </td>
                                                <td><a href="#">Black Blouse Armani</a>
                                                </td>
                                                <td>1</td>
                                                <td>$200.00</td>
                                                <td>$0.00</td>
                                                <td>$200.00</td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="5">Total</th>
                                                <th>$446.00</th>
                                            </tr>
                                        </tfoot>
                                    </table>

                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.content -->

                        </form>
                        
                        <form method="post" action="checkout2.html">
                            <h1>Checkout</h1>
                            <ul class="nav nav-pills nav-justified">
                                <li class="active"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
                                </li>
                                <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                                </li>
                            </ul>

                            <div class="content">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="firstname">Firstname</label>
                                            <input type="text" class="form-control" id="firstname">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="lastname">Lastname</label>
                                            <input type="text" class="form-control" id="lastname">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="company">Company</label>
                                            <input type="text" class="form-control" id="company">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="street">Street</label>
                                            <input type="text" class="form-control" id="street">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="city">Company</label>
                                            <input type="text" class="form-control" id="city">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="zip">ZIP</label>
                                            <input type="text" class="form-control" id="zip">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="state">State</label>
                                            <select class="form-control" id="state"></select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="country">Country</label>
                                            <select class="form-control" id="country"></select>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="phone">Telephone</label>
                                            <input type="text" class="form-control" id="phone">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="text" class="form-control" id="email">
                                        </div>
                                    </div>

                                </div>
                                <!-- /.row -->
                            </div>

                        </form>
                    </div>
                    <!-- /.box -->

                        
                </div>
                <!-- /.col-md-9 -->
                    
						

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->


        <c:import url="../main/footer.jsp" />

    </div>
    <!-- /#all -->


    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
                    <script type="text/javascript">
						$(function(){
							$('input').on('click', function(){
								var IMP = window.IMP; // 생략가능
								IMP.init('imp72883964'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
								var cc = confirm("결제하시겠습니까?");
								<% // TODO [litnogi] ■ name 값에 상품 이름을 집어넣기. %>
								<% // TODO [litnogi] □ 컨트롤러에서 보안 처리하기. (REST API) %>
								if(cc == true){
									IMP.request_pay({
									    pg : 'uplus',
									    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
									    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
									    name : '주문명:결제테스트',
									    amount : 100,
									    buyer_email : 'iamport@siot.do',
									    buyer_name : '구매자이름',
									    buyer_tel : '010-1234-5678',
									    buyer_addr : '서울특별시 강남구 삼성동',
									    buyer_postcode : '123-456'
									}, function(rsp) {
									    if ( rsp.success ) {
									    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
									    	jQuery.ajax({
									    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
									    		type: 'POST',
									    		dataType: 'json',
									    		data: {
										    		imp_uid : rsp.imp_uid
										    		//기타 필요한 데이터가 있으면 추가 전달
									    		}
									    	}).done(function(data) {
									    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
									    		if ( everythings_fine ) {
									    			var msg = '결제가 완료되었습니다.';
									    			msg += '\n고유ID : ' + rsp.imp_uid;
									    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
									    			msg += '\n결제 금액 : ' + rsp.paid_amount;
									    			msg += '카드 승인번호 : ' + rsp.apply_num;
									    			
									    			alert(msg);
									    		} else {
									    			//[3] 아직 제대로 결제가 되지 않았습니다.
									    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
									    		}
									    	});
									    } else {
									        var msg = '결제에 실패하였습니다.';
									        msg += '에러내용 : ' + rsp.error_msg;
									        
									        alert(msg);
									    }
									});
								}
								return false;
							});
						});
						</script>






</body>
</html>