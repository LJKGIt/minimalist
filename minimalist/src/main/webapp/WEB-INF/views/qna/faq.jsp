<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

    

    <title>
       Minimalist
    </title>
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
                        <li>FAQ</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** PAGES MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Pages</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="#">자주하는 질문</a>
                                </li>
                                <li>
                                    <a href="qna.selectList.do">1:1문의</a>
                                </li>
                               

                            </ul>

                        </div>
                    </div>

                    <!-- *** PAGES MENU END *** -->


                    <div class="banner">
                        <a href="#">
                            <img src="img/banner.jpg" alt="sales 2014" class="img-responsive">
                        </a>
                    </div>
                </div>

                <div class="col-md-9">


                    <div class="box" id="contact">
                        <h1>FAQ</h1>

                       
                <p><font color="gray">자주하는 질문들의 답변을 모아놓은 곳입니다.</font></p>

                        <hr>

                        <div class="panel-group" id="accordion">

                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">

					    <a data-toggle="collapse" data-parent="#accordion" href="#faq1">

						1. 반품시 숙지해야할 사항은 어떻게 되나요?

					    </a>

					</h4>
                                </div>
                                <div id="faq1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>반품하고자 하는 상품을 반품 신청서 뒷면에
										주문번호 또는 이름,전화번호,상품명,사이즈,색상,수량등을
										정확히 기재해주세요. </p>
                                        <ul>
                                            <li>반품요청-타 택배 발송시 추가요금이 발생할 수 있습니다. </li>
                                            <li>포장-반품하고자 하시는 제품을 반드시 해당상품 바코드가 부착된 비닐에 넣어 반품신청서와 함께 보내주세요.</li>
                                            <li>제품반송-포장이 완료된 상자를 cj대한통운택배 기사님께 착불로 전달해주세요.</li>
                                            <li>환불-물류센터 도착이후 주말제외 최소 2~3일 소요되며, 물량폭주시 더 지연될수 있습니다. 주문시 결제한 방식으로 환불해드립니다.</li>
                                        </ul>
                      			</div>
                                </div>
                            </div>
                            <!-- /.panel -->

                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">

					    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">

						2. 주문했는데 배송은 언제쯤 되나요?

					    </a>

					</h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse">
                                    <div class="panel-body">
                                       주문후 입금이 완료되는 시점부터 상품준비에 들어가며
   					보통 주말제외 1~4일정도 소요되며,
  					입고지연 상품일경우 주말제외 7일이상 소요될수도 있습니다.
   					조금 여유있게 기다려주시면 준비되는데로 빠른출고 도와드리겠습니다.
                                    </div>
                                </div>
                            </div>
                            <!-- /.panel -->


                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">

					    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">

						3. 입금은 언제까지 해야되나요?

					    </a>

					</h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                       주문후 주문일로부터 3일이내 입금을 해주셔야 합니다.
      주문일로부터 3일이내 입금이 되지않을 경우 주문이 자동 취소되어
      추후 입금을 하시더라도 입금확인이 되지않습니다.
      주문이 취소된후에 입금을 하신경우는 고객센터 또는 1:1문의게시판으로 연락바랍니다.
      환불을 원하실경우 예치금또는 계좌환불처리 도와드리고 있습니다.
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