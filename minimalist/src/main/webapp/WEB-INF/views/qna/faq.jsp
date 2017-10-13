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

                 <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>QUESTION &#38; ANSWER</li>
                    </ul>

                </div>

                <div class="col-md-3">
                   <!-- *** PAGES MENU ***
_________________________________________________________ -->
                   <div class="panel panel-default sidebar-menu">

                       <div class="panel-heading">
                           <h3 class="panel-title">QUESTION &#38; ANSWER</h3>
                       </div>

                       <div class="panel-body">
                           <ul class="nav nav-pills nav-stacked">
                               <li>
                                   <a href="qna.selectFaq.do">FAQ</a>
                               </li>
                               <li>
                                   <a href="qna.selectList.do">1:1 CONTACT</a>
                               </li>
                               

                            </ul>

                        </div>
                    </div>

                    <!-- *** PAGES MENU END *** -->


                </div>

                <div class="col-md-9">


                    <div class="box" id="contact">
                        <h1>FAQ</h1>

                       
                <font color="gray">자주하는 질문들의 답변을 모아놓은 곳입니다.</font><br>
 				<font color="gray">상세한 질문은 1:1문의를 이용해주세요.</font>
                        <hr>

                        <div class="panel-group" id="accordion">
							
							<div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">

					    <a data-toggle="collapse" data-parent="#accordion" href="#faq1">

						1.대여상품은 어떻게 이용해야 되나요?

					    </a>

					</h4>
                                </div>
                                <div id="faq1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                   <div style="align:center;">  <img src="resources/img_qna/faq2.png"  class="img-responsive"></div>
                                    
               

<p>1. 아이템 주문</p>
마음에 드는 아이템을 자유롭게 주문하세요.
<hr>
<p>2. 아이템 이용</p>
주문한 아이템을 실생활에서 마음껏 입어보세요.<br> 
한 아이템 당 최대 15일까지 이용 가능합니다.
<hr>
<p>3. 구매하거나 새로 주문</p>
이용 중 아이템을 돌려보내고 싶지 않을 때, <br> 
경매가능한 회원등급일 경우 경매를 통해 구매하실 수 있습니다.<br>  
주문 회차가 남아있다면 마음에 드는 아이템을 새로 대여하세요.
<hr>
<p>4. 아이템 맞교환</p>
현재 이용중인 아이템이 있는 경우 새 주문을 하면<br> 
이용중인 아이템은 자동으로 반납이 신청되고,<br>  
새 아이템이 배송됩니다. (일요일, 공휴일 제외)
*이용권 만료시 자동 반납됩니다.
                                    
                        <br>                
                      			</div>
                                </div>
                            </div>
                            
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">

					    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">

						2. 반품시 숙지해야할 사항은 어떻게 되나요?

					    </a>

					</h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse">
                                    <div class="panel-body">
                                     
                                        
                                      <p>반품하고자 하는 상품을 반품 신청서 뒷면에<br> 
										주문번호 또는 이름,전화번호,상품명,사이즈,색상을<br> 
										정확히 기재해주세요. </p>
                                        <ul>
                                            <li>반품요청-타 택배 발송시 추가요금이 발생할 수 있습니다. </li>
                                            <li>포장-반품하고자 하시는 제품을<br> 
                                             반드시 해당상품 바코드가 부착된 비닐에 넣어 반품신청서와 함께 보내주세요.</li>
                                            <li>제품반송-포장이 완료된 상자를<br> 
                                             cj대한통운택배 기사님께 착불로 전달해주세요.</li>
                                            <li>환불-물류센터 도착이후 주말제외 최소 2~3일 소요되며,<br> 
                                             물량폭주시 더 지연될수 있습니다. 주문시 결제한 방식으로 환불해드립니다.</li>
                                        </ul>
                      			</div>
                                </div>
                            </div>
                            <!-- /.panel -->

                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">

					    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">

						3. 주문했는데 배송은 언제쯤 되나요?

					    </a>

					</h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                       주문후 입금이 완료되는 시점부터 상품준비에 들어가며<br> 
   					보통 주말제외 1~4일정도 소요되며,<br> 
  					입고지연 상품일경우 주말제외 7일이상 소요될수도 있습니다.<br> 
   					조금 여유있게 기다려주시면 준비되는데로 빠른출고 도와드리겠습니다.
                                    </div>
                                </div>
                            </div>
                            <!-- /.panel -->


                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">

					    <a data-toggle="collapse" data-parent="#accordion" href="#collapsefour">

						4. 입금은 언제까지 해야되나요?

					    </a>

					</h4>
                                </div>
                                <div id="collapsefour" class="panel-collapse collapse">
                                    <div class="panel-body">
                                       주문후 주문일로부터 3일이내 입금을 해주셔야 합니다.<br> 
      주문일로부터 3일이내 입금이 되지않을 경우 주문이 자동 취소되어<br> 
      추후 입금을 하시더라도 입금확인이 되지않습니다.<br> 
      주문이 취소된후에 입금을 하신경우는 고객센터 또는 1:1문의게시판으로 연락바랍니다.<br> 
      환불을 원하실경우 예치금또는 계좌환불처리 도와드리고 있습니다.<br> 
                                    </div>
                                </div>
                            </div>
                            <!-- /.panel -->

                        </div>
                        <!-- /.panel-group -->


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