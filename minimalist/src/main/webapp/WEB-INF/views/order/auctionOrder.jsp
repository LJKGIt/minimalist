<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<style type="text/css">
#pay td{
padding:10px;
}

#btn2 {
margin-top:30px;
}

</style>

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
                        <li>결제</li>
                        <li>경매상품 결제</li>
                    </ul>
                    </div>
                    
                     <div class="col-md-3">
                    <!-- *** PAGES MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">결제 상품보기</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">경매상품</a>
                                </li>
                                <li>
                                    <a href="qna.selectList.do">대여상품</a>
                                </li>
                               

                            </ul>

                        </div>
                    </div>
                    </div>
                          <div class="col-md-9">
                    
                    <!-- 이미지 처리 -->
                    <c:forTokens var="au" items="${auction.image_path}" delims=","  varStatus="index">
                    <c:if test="${index.count eq 1 }">
                    <c:set var="img1" value="/minimalist/resources/img_auction/${au}"/>
                    </c:if>
                    
                    </c:forTokens>
						
          <div class="box">
                   <h3 align="center">주문 정보</h3>
                   <p align="center"><img src="${img1}"></p>
                        <form action="income.insertIncome.do" method="POST">
                        <table style="margin:auto" id="pay">
                        <thead> <tr><th></th><td><font size="5">- 물품정보 -</font></td></tr>
                        	<tr><th>물품명 &nbsp;</th><td>${auction.auction_brand}  - ${auction.auction_name}</td></tr>
                        	<tr><th>상세 &nbsp;</th><td> <a href="auction.selectOne.do?auction_code=${auction.auction_code}">상세보기</a></td></tr>
							<tr><th>경매코드  &nbsp;</th><td id="auction_code">${auction.auction_code}</td></tr>
						
						</thead>
						<tbody> 
							<tr><th></th><td><font size="5">- 배송정보 -</font></td></tr>
							<tr><th>받는이  &nbsp;</th><td><input type="text" id="receiver" value="${name}" size="10px"></td></tr>
							<tr><th>기본주소 &nbsp; </th><td><input type="text" id="address1" value="${address1}" size="40px"></td><td><input type="button"
									onclick="execDaumPostcode()" value="Post Search" class="btn btn-primary"></td></tr>
							<tr><th>상세주소 &nbsp; </th><td><input type="text" id="address2" value="${address2}"  size="30px"></td></tr>
							<tr><th>결제가격 &nbsp; </th><td id="income">${price}</td></tr>
							<tr><th>배송시 요청사항</th><td><input type="text" id="request" size="50px" value="부재시 경비실에 맡겨주세요."></td></tr>
						</tbody>
						</table>
						<div id="btn2" align="center">
						<input type="button" class="btn btn-primary" id="i_submit_order" value="결제하기"><a href="message.cancelOrder.do?auction_code=${auction.auction_code}">&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary" value="낙찰거부"></a>
						
						</div>
						</form>
                    </div> 
                    
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
									    name : '주문명:결제테스트',
									    amount : 100,
									    buyer_email : 'iamport@siot.do',
									    buyer_name : '구매자이름',
									    buyer_tel : '010-1234-5678',
									    buyer_addr : '서울특별시 강남구 삼성동',
									    buyer_postcode : '123-456'
									}, function(rsp) {
									    if ( rsp.success ) {
									    	var auction_code=$('#auction_code').text();
									    	var income=$('#income').text();
									    	var address1=$('#address1').val();
									    	var address2=$('#address2').val();
									    	var receiver=$('#receiver').val();
									    	var request=$('#request').val();
									    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
									    	jQuery.ajax({
									    		url: "income.insertIncome.do", //cross-domain error가 발생하지 않도록 주의해주세요
									    		type: 'POST',
									    		dataType: 'text',
									    		data: {
										    		auction_code : auction_code,
										    		income : income,
										    		address1 : address1,
										    		address2 : address2,
										    		receiver : receiver,
										    		request : request
										    		//기타 필요한 데이터가 있으면 추가 전달
									    		},
									    		success : function(value){
									    			if ( value == 'yes' ) {
										    			
										    			alert('결제가 완료되었습니다.'); 
										    			
										    			location.href='auction.selectMemberAuction.do';
										    		} else {
										    			//[3] 아직 제대로 결제가 되지 않았습니다.
										    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
										    			alert('결제실패');
										    		}
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
						<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
						<script>
						function execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
					                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                var fullAddr = ''; // 최종 주소 변수
					                var extraAddr = ''; // 조합형 주소 변수

					                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					                    fullAddr = data.roadAddress;

					                } else { // 사용자가 지번 주소를 선택했을 경우(J)
					                    fullAddr = data.jibunAddress;
					                }

					                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					                if(data.userSelectedType === 'R'){
					                    //법정동명이 있을 경우 추가한다.
					                    if(data.bname !== ''){
					                        extraAddr += data.bname;
					                    }
					                    // 건물명이 있을 경우 추가한다.
					                    if(data.buildingName !== ''){
					                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                    }
					                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					                }

					                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                /* document.getElementById('postcode').value = data.zonecode; */
					                document.getElementById('address1').value = fullAddr;
									
					                // 커서를 상세주소 필드로 이동한다.
					                document.getElementById('address2').focus();
					            }
					        }).open();
					    } // ADDRESS API Close
						</script>
						
                    <!-- <div class="box info-bar">
                        <div class="row">
                            <div class="col-sm-12 col-md-4 products-showing">
                                Showing <strong>12</strong> of <strong>25</strong> products
                            </div>

                            <div class="col-sm-12 col-md-8  products-number-sort">
                                <div class="row">
                                    <form class="form-inline">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="products-number">
                                                <strong>Show</strong>  <a href="#" class="btn btn-default btn-sm btn-primary">12</a>  <a href="#" class="btn btn-default btn-sm">24</a>  <a href="#" class="btn btn-default btn-sm">All</a> products
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="products-sort-by">
                                                <strong>Sort by</strong>
                                                <select name="sort-by" class="form-control">
                                                    <option>Price</option>
                                                    <option>Name</option>
                                                    <option>Sales first</option>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div> -->

                    <!-- <div class="row products">

                        <div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="img/product1.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="img/product1_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="img/product1.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="detail.html">Fur coat with very but very very long name</a></h3>
                                    <p class="price">$143.00</p>
                                    <p class="buttons">
                                        <a href="detail.html" class="btn btn-default">View detail</a>
                                        <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </p>
                                </div>
                                /.text
                            </div>
                            /.product
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="img/product2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="img/product2_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="img/product2.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="detail.html">White Blouse Armani</a></h3>
                                    <p class="price"><del>$280</del> $143.00</p>
                                    <p class="buttons">
                                        <a href="detail.html" class="btn btn-default">View detail</a>
                                        <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </p>
                                </div>
                                /.text

                                <div class="ribbon sale">
                                    <div class="theribbon">SALE</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                /.ribbon

                                <div class="ribbon new">
                                    <div class="theribbon">NEW</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                /.ribbon

                                <div class="ribbon gift">
                                    <div class="theribbon">GIFT</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                /.ribbon
                            </div>
                            /.product
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="img/product3.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="img/product3_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="img/product3.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="detail.html">Black Blouse Versace</a></h3>
                                    <p class="price">$143.00</p>
                                    <p class="buttons">
                                        <a href="detail.html" class="btn btn-default">View detail</a>
                                        <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </p>

                                </div>
                                /.text
                            </div>
                            /.product
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="img/product3.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="img/product3_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="img/product3.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="detail.html">Black Blouse Versace</a></h3>
                                    <p class="price">$143.00</p>
                                    <p class="buttons">
                                        <a href="detail.html" class="btn btn-default">View detail</a>
                                        <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </p>

                                </div>
                                /.text
                            </div>
                            /.product
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="img/product2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="img/product2_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="img/product2.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="detail.html">White Blouse Versace</a></h3>
                                    <p class="price">$143.00</p>
                                    <p class="buttons">
                                        <a href="detail.html" class="btn btn-default">View detail</a>
                                        <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </p>

                                </div>
                                /.text

                                <div class="ribbon new">
                                    <div class="theribbon">NEW</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                /.ribbon
                            </div>
                            /.product
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="img/product1.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="img/product1_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="img/product1.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="detail.html">Fur coat</a></h3>
                                    <p class="price">$143.00</p>
                                    <p class="buttons">
                                        <a href="detail.html" class="btn btn-default">View detail</a>
                                        <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </p>

                                </div>
                                /.text

                                <div class="ribbon gift">
                                    <div class="theribbon">GIFT</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                /.ribbon

                            </div>
                            /.product
                        </div>
                        /.col-md-4

                        <div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="img/product2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="img/product2_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="img/product2.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="detail.html">White Blouse Armani</a></h3>
                                    <p class="price"><del>$280</del> $143.00</p>
                                    <p class="buttons">
                                        <a href="detail.html" class="btn btn-default">View detail</a>
                                        <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </p>
                                </div>
                                /.text

                                <div class="ribbon sale">
                                    <div class="theribbon">SALE</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                /.ribbon

                                <div class="ribbon new">
                                    <div class="theribbon">NEW</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                /.ribbon

                                <div class="ribbon gift">
                                    <div class="theribbon">GIFT</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                /.ribbon
                            </div>
                            /.product
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="img/product3.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="img/product3_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="img/product3.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="detail.html">Black Blouse Versace</a></h3>
                                    <p class="price">$143.00</p>
                                    <p class="buttons">
                                        <a href="detail.html" class="btn btn-default">View detail</a>
                                        <a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </p>

                                </div>
                                /.text
                            </div>
                            /.product
                        </div>

                    </div> -->
                    <!-- /.products -->

                    <!-- <div class="pages">

                        <p class="loadMore">
                            <a href="#" class="btn btn-primary btn-lg"><i class="fa fa-chevron-down"></i> Load more</a>
                        </p>

                        <ul class="pagination">
                            <li><a href="#">&laquo;</a>
                            </li>
                            <li class="active"><a href="#">1</a>
                            </li>
                            <li><a href="#">2</a>
                            </li>
                            <li><a href="#">3</a>
                            </li>
                            <li><a href="#">4</a>
                            </li>
                            <li><a href="#">5</a>
                            </li>
                            <li><a href="#">&raquo;</a>
                            </li>
                        </ul>
                    </div> -->


                </div>
                <!-- /.col-md-9 -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->
</div>

        <c:import url="../main/footer.jsp" />

 
    <!-- /#all -->


    






</body>
</html>