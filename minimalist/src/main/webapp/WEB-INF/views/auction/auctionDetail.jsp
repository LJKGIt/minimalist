<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript">

/* 현재 입찰가 update */
$(document).ready(function(){
	var auction_code=$('#code').text();
	var currentPrice=$('#currentPrice').text();
	
	if(currentPrice==0){
		return;
	}
	
	else if(currentPrice!=0){
	setInterval(function(){
		$.ajax({
			url : "auction.reloadPrice.do",
			type : "get",
			data : {auction_code : auction_code},
			dataType : "text",
			success : function(value){
				$('#currentPrice').text();
			}
		});
	}, 5000);
	}
});


/* 입찰 함수 */
$(function(){
	$('#btn').click(function(){
		var price=$('#price').val();
		//유저가 입찰하려는 가격
		if(price==0){
			//값이 없는 경우.
			alert('입찰하려는 금액을 입력해주세요.');
			$('#price').focus();
			return false;
		}
		
		var currentPrice=$('#currentPrice').text();
		//현재 최고 입찰가
		if(currentPrice==0){
			//현재 입찰가가 없는 경우.
			var currentPrice=$('#startPrice').text();
			//시작가격을 현재 입찰가로.
		}
		
		var code=$('#code').text();
		//경매코드
		var id=$('#id').val();
		//입찰자 아이디
	
		if(price<=currentPrice){
			//입찰하려는 가격이 현재 입찰가보다 같거나 낮은 경우
			alert('현재 입찰가보다 높은 가격을 입찰하여야 합니다.');
			$('#price').focus();
			return false;
		}else if(price>currentPrice){
			//현재 입찰가보다 높은 금액을 입찰한 경우. - 정상인 경우.
			$.ajax({
				url : "auction.bid.do",
				type : "post",
				data : {price : price, code : code, id : id},
				dataType : "text",
				success : function(value){
					if(value==="yes"){
						alert('입찰이 완료되었습니다.');
						location.reload();
					}else if(value=="downPrice") {
						alert('회원이 입찰한 가격보다 높게 입찰하여야 합니다.');
					}else if(value=="lowPrice") {
						alert('시작 가격보다 높게 입찰하여야 합니다.');
					}else {
						alert('입찰 실패. 관리자에게 문의하세요.');
					}
				}
			});

		}	
	});
	
	$('#cancelBid').click(function(){
		var auction_code=$('#code').text();
		//경매코드
		var currentPrice=$('#currentPrice').text();
		//최고 입찰가 - 내 입찰가. (버튼이 최고입찰자만 보이기 때문~)
		$.ajax({
			url : "auction.deleteBid.do",
			type : "post",
			data : {auction_code : auction_code, bid_price : currentPrice},
			dataType : "text",
			success : function(value){
				if(value==="yes"){
					alert('입찰이 취소되었습니다.');
					location.reload();
				}else {
					alert('오류. 관리자에게 문의하세요.');
				}
			}
		});
		
	});
	
});



</script>
<head>

   

 
     <link rel="shortcut icon" href="resources/favicon6.ico" type="image/x-icon">
   



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
                        <li><a href="#">Ladies</a>
                        </li>
                        <li><a href="#">Tops</a>
                        </li>
                        <li>White Blouse Armani</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                     <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Auction</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked category-menu">
                   
                               <li class="active">
                                    
                                    <ul>
                                    	<li class="active"><a href="auction.selectList.do">ALL</a></li>
                                        <li class="active"><a href="auction.selectList.do?auction_category=의류">- CLOTHING</a>
                                        </li>
                                        <li class="active"><a href="auction.selectList.do?auction_category=잡화">- BAG</a>
                                        </li>
                                        <li class="active"><a href="auction.selectList.do?auction_category=악세사리">- ACCESSORY</a>
                                        </li>  
                                    </ul>
                               </li>
                            
                            </ul>

                        </div>
                    </div>
                    

                    

                    <!-- *** MENUS AND FILTERS END *** -->

                </div>
                
                
                 <c:forTokens var="img" items="${auction.image_path}" delims="," varStatus="index">
                             <c:if test="${index.count eq 1 }">
                             <c:set var="img1" value="${img}"/>
                             </c:if>
                             <c:if test="${index.count eq 2 }">
                             <c:set var="img2" value="${img}"/>
                             </c:if>
                             <c:if test="${index.count eq 3 }">
                             <c:set var="img3" value="${img}"/>
                             </c:if>
                             </c:forTokens>

                <div class="col-md-9">

                    <div class="row" id="productMain">
                        <div class="col-sm-6">
                            <div id="mainImage">
                                <img src="/minimalist/resources/img_auction/${img1}" alt="" class="img-responsive">
                            </div>

                            <!-- <div class="ribbon sale">
                                <div class="theribbon">SALE</div>
                                <div class="ribbon-background"></div>
                            </div> -->
                            <!-- /.ribbon -->

                           <!--  <div class="ribbon new">
                                <div class="theribbon">NEW</div>
                                <div class="ribbon-background"></div>
                            </div> -->
                            <!-- /.ribbon -->

                        </div>
                        
                        
                      
                        <div class="col-sm-6">
                            <div class="box">
                            	<span id="code" style="display:none">${auction.auction_code}</span>
                                <h1 class="text-center">${auction.auction_brand} <br> ${auction.auction_name}</h1>
                             	<p align="center"><font size=3px>경매 시작가 : <span id="startPrice">${auction.start_price}</span> 원</font></p>    
                                <p align="center"><font size=3px>현재 입찰가 : <span id="currentPrice">${auction.bidInfo[0].bid_price}</span> 원</font></p>
								<p align="center"><font color="red">
								경매 종료 :<fmt:formatDate value="${auction.end_date}" type="date" pattern="MM월dd일"/></font></p>
                               <c:if test="${sessionScope.member.member_id eq 'admin'}">
                               <a href="auction.viewUpdateForm.do?auction_code=${auction.auction_code}"><button type="button">수정</button></a>
                               <a href="auction.deleteAuction.do?auction_code=${auction.auction_code}"><button type="button">삭제</button></a>
                               <a href="auction.auctionStop.do?auction_code=${auction.auction_code}"><button type="button">중지</button></a>
                               </c:if>


                            </div>
                            

                            <div class="row" id="thumbs">
                                <div class="col-xs-4">
                                    <a href="/minimalist/resources/img_auction/${img1}" class="thumb">
                                        <img src="/minimalist/resources/img_auction/${img1}" alt="" class="img-responsive">
                                    </a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="/minimalist/resources/img_auction/${img2}" class="thumb">
                                        <img src="/minimalist/resources/img_auction/${img2}" alt="" class="img-responsive">
                                    </a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="/minimalist/resources/img_auction/${img3}" class="thumb">
                                        <img src="/minimalist/resources/img_auction/${img3}" alt="" class="img-responsive">
                                    </a>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="box" id="details">
                        <p>
                            <h4>Product details</h4>
                            <p>${auction.auction_descript}</p>
                            <h4>color&#38;size</h4>
                            <ul>
                                <li>color : ${auction.auction_color}</li>
                                <li>size : ${auction.auction_size }</li>
                                
                            </ul>
                            
                            <c:if test="${empty sessionScope.member}">
                                                         <font color="red">로그인한 회원만 경매에 참가할 수 있습니다. </font>                          
                            </c:if>
							<c:if test="${!empty sessionScope.member}">
							<c:if test="${sessionScope.member.grade < 3 }">
								<font color="red">회원등급 3레벨 이상만 경매에 참여할 수 있습니다. </font>             
							</c:if>
							<c:if test="${sessionScope.member.grade >= 3 }">
                            <blockquote>
                               <input type="hidden" id="id" value="${sessionScope.member.member_id}">
                               <input type="number" id="price"><input type="button" class="btn btn-primary" id="btn" value="입찰하기">
                            </blockquote>
                            	<%-- 최고 입찰자 : ${auction.bidInfo[0].member_id} --%>
                            <c:if test="${sessionScope.member.member_id eq auction.bidInfo[0].member_id}">
                            	현재 최고 입찰자입니다. <button type="button" id="cancelBid">입찰 취소</button>
                            </c:if>
                            </c:if>
                            </c:if>
                            <hr>
                            <div class="social">
                                <h4>Show it to your friends</h4>
                                <p>
                                    <a href="#" class="external facebook" data-animate-hover="pulse"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="external gplus" data-animate-hover="pulse"><i class="fa fa-google-plus"></i></a>
                                    <a href="#" class="external twitter" data-animate-hover="pulse"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="email" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
                                </p>
                            </div>
                    </div>

                 

		<c:import url="../main/footer.jsp" />


		</div>
		</div>
		</div>
    </div>
    <!-- /#all -->


    






</body>
</html>