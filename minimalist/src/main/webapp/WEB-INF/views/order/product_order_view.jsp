<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>

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
                        <li>Checkout</li>
                    </ul>
                </div>

                <div class="col-md-12" id="checkout">

                    <div class="box">
                        <form method="post" action="">
                        <div id="i_div_form1">
                            <h1>Checkout</h1>
                            <ul class="nav nav-pills nav-justified">
                                <li class="active"><a><i class="fa fa-map-marker"></i><br>Address</a>
                                </li>
                            </ul>

                            <div class="content">
                                <div class="row">
                                	<div class="col-sm-5">
                                        <div class="form-group">
                                            <label for="firstname">이름</label>
                                            <input type="text" class="form-control" id="i_text_reciever_name" value="${ sessionScope.member.member_name }">
                                        </div>
                                    </div>
                                    <div class="col-sm-5">
                                        <div class="form-group">
                                            <label for="city">전화번호</label>
                                            <input type="text" class="form-control" id="i_text_reciever_phone" value="${ sessionScope.member.phone }">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="company">주소</label>
                                            <input type="text" class="form-control" id="i_text_reciever_address" value="${ sessionScope.member.address1 } ${ sessionScope.member.address2 }">
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- /.row -->
                            </div>
                            
                            <ul class="nav nav-pills nav-justified">
                                <li class="active"><a><i class="fa fa-map-marker"></i><br>Order Review</a>
                                </li>
                            </ul>
                            <div class="content">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th colspan="2">Product</th>
                                                <th>상품 사이즈</th>
                                                <th>대여 비용</th>
                                                <th>대여 기간</th>
                                                <th>대여 기간</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <a href="productDetail.do?product_code=${ product.product_code }">
                                                        <img src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[0].product_image_path }" alt="${ product.product_name }">
                                                    </a>
                                                </td>
                                                <td><a href="productDetail.do?product_code=${ product.product_code }">${ product.product_name }</a>
                                                </td>
                                                <td><input type="text" class="form-control" id="i_text_order_size" value="${ orderInfo.order_size }"></td>
                                                <td>${ product.rent_price }</td>
                                                <jsp:useBean id="now1" class="java.util.Date" />
                                                <fmt:formatDate value="${now1}" pattern="yyyy-MM-dd" var="now2"/>
                                                <td>${ now2 }</td>
                                                <c:set var="now3" value="<%=new Date(new Date().getTime() + 60*60*24*1000*14)%>"/>
												<fmt:formatDate value="${now3}" pattern="yyyy-MM-dd" var="now4"/>
                                                <td>${ now4 }</td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="5">결제 금액</th>
                                                <th>${ product.rent_price }</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    <div style="text-align:center;">
										<input type="submit" value="결제하기" id="i_submit_order" class="btn btn-primary">
									</div>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.content -->
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
							$('#i_submit_order').on('click', function(){
								var IMP = window.IMP; // 생략가능
								IMP.init('imp72883964'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
								var cc = confirm("결제하시겠습니까?");
								if(cc == true){
									IMP.request_pay({
									    pg : 'uplus',
									    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
									    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
									    name : '주문명:결제테스트(${ product.product_code })',
									    amount : 100,
									    buyer_email : 'iamport@siot.do',
									    buyer_name : '${ sessionScope.member.member_name }',
									    buyer_tel : '${ sessionScope.member.phone }',
									    buyer_addr : '${ sessionScope.member.address1 } ${ sessionScope.member.address2 }',
									    buyer_postcode : '${ sessionScope.member.post }'
									}, function(rsp) {
									    if ( rsp.success ) {
									    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
									    	$.ajax({
									    		url: "orderInfoInsert.do", //cross-domain error가 발생하지 않도록 주의해주세요
									    		type: 'POST',
									    		dataType: 'json',
									    		data: {
									    			product_code : ${ product.product_code },
									    			order_reciever_name : $('#i_text_reciever_name').val(),
									    			order_reciever_address : $('#i_text_reciever_address').val(),
									    			order_reciever_phone : $('#i_text_reciever_phone').val(),
									    			order_size : $('#i_text_order_size').val()
										    		//기타 필요한 데이터가 있으면 추가 전달
									    		}
								    		}).done(function(data) {
									    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
									    		if ( data ) {
									    			// var msg = '결제가 완료되었습니다.';
									    			// msg += '\n고유ID : ' + rsp.imp_uid;
									    			// msg += '\n상점 거래ID : ' + rsp.merchant_uid;
									    			// msg += '\n결제 금액 : ' + rsp.paid_amount;
									    			// msg += '카드 승인번호 : ' + rsp.apply_num;
									    			
									    			// alert(msg);
									    			
									    			location.href='member.mypage.do';

									    		} else {
									    			//[3] 아직 제대로 결제가 되지 않았습니다.
									    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
									    		}
									    	});
									    } else {
									        // var msg = '결제에 실패하였습니다.';
									        // msg += '에러내용 : ' + rsp.error_msg;
									        
									        // alert(msg);
									    }
									});
								}
								return false;
							});
						});
						</script>






</body>
</html>