<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>


 <meta charset="utf-8">
<meta name="robots" content="all,follow">
<meta name="googlebot" content="index,follow,snippet,archive">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="minimalist">
<meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
<meta name="keywords" content="">

 

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100'
	rel='stylesheet' type='text/css'>
<!-- styles -->
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/owl.carousel.css" rel="stylesheet">
<link href="resources/css/owl.theme.css" rel="stylesheet">
<!-- theme stylesheet -->
<link href="resources/css/style.default.css" rel="stylesheet"
	id="theme-stylesheet">
<!-- your stylesheet with modifications -->
<link href="resources/css/custom.css" rel="stylesheet">

<script src="resources/js/respond.min.js"></script>


<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
<script src="resources/js/jquery-1.11.0.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.cookie.js"></script>
<script src="resources/js/waypoints.min.js"></script>
<script src="resources/js/modernizr.js"></script>
<script src="resources/js/bootstrap-hover-dropdown.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/front.js"></script>
	
 <title>
       Minimalist
    </title>
     
</head>

<body>

	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="Login" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="Login">Customer login</h4>
				</div>
				<div class="modal-body">
					<form action="login.do" method="post">
						<div class="form-group">
							<input type="text" name="member_id" class="form-control"
								id="id-modal" placeholder="id">
						</div>
						<div class="form-group">
							<input type="password" name="member_pwd" class="form-control"
								id="password-modal" placeholder="password">
						</div>
						<p class="text-center">
							<button type="submit" id="mlogin" class="btn btn-primary">
								<i class="fa fa-sign-in"></i> Log in
							</button>
						</p>
					</form>
					<p class="text-center text-muted">Not registered yet?</p>
					<p class="text-center text-muted">
						<a href="register.do"><strong>Register now</strong></a>! It is
						easy and done in 1&nbsp;minute and gives you access to special
						discounts and much more!
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<!--  *** Message-Modal *** -->

	<div class="modal fade" id="message-modal" tabindex="-1" role="dialog"
		aria-labelledby="Login" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="Login" style="margin-left: 30px;">message</h4>
				</div>
				<div class="modal-body">
					<div class="panel-group" id="accordion" style="padding: 2px 10px;">
					<c:forEach items="${ messageList }" var="list">					
						<div class="panel panel-primary">
							<div class="panel-heading" <c:if test="${ list.check_yn ne 'n'.charAt(0) }"> style="background-color:white; color:#4fbfa8;" </c:if>>
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#msg${ list.message_number }" onclick="readCheck($(this).attr('href'), (this))" data-sendYn="${ list.check_yn }">
										${ list.message_title } </a>
								</h4>
							</div>
							<c:choose>
							<c:when test="${list.message_title ne '결제링크' }">
							<div id="msg${list.message_number}" class="panel-collapse collapse">
								<div class="panel-body">
									<p>${ list.message_content }</p>
									</div>
								</div>
								</c:when>
								
								<c:when test="${list.message_title eq '결제링크' }">
								<div id="msg${list.message_number}" class="panel-collapse collapse">
								<div class="panel-body">
									<p><a href="${ pageContext.request.contextPath}${list.message_content}">결제</a></p>
									</div>
								</div>
								</c:when>
								</c:choose>
							</div>
						</c:forEach>
						<!-- panel -->
					</div>
					<!-- modal -->
				</div>
			</div>
		</div>
	</div>
	
	<!-- *** Message-Modal End*** -->
	<div class="navbar navbar-default yamm" role="navigation" id="navbar">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand home" href="index.do"
					data-animate-hover="bounce"> <img
					src="resources/img/logo23.png" alt="Obaju logo" class="hidden-xs">
					<img src="resources/img/logo23-2.png" alt="Obaju logo"
					class="visible-xs"><span class="sr-only">Minimalist
						home </span>
				</a>
				<div class="navbar-buttons">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navigation">
						<span class="sr-only">Toggle navigation</span> <i
							class="fa fa-align-justify"></i>
					</button>
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#search">
						<span class="sr-only">Toggle search</span> <i class="fa fa-search"></i>
					</button>
					<a class="btn btn-default navbar-toggle"
						href="resources/basket.html"> <i class="fa fa-shopping-cart"></i>
						<span class="hidden-xs"> 
					</span>
					</a>
				</div>
			</div>
			<!--/.navbar-header -->
			<div class="navbar-collapse collapse" id="navigation">
				<ul class="nav navbar-nav navbar-left">
					<li class="hidden-md hidden-lg hidden-sm"
						style="text-align: center; margin-bottom: 12.5px;">
						<div>
							<c:if test="${ empty sessionScope.member }">
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#login-modal"
									style="margin-right: 10px;">
									<span class="sr-only">Toggle Login</span> <i
										class="fa fa-sign-in"> Login</i>
								</button>
								<a href="register.do" class="btn btn-default"> <span
									class="sr-only">Toggle Join</span> <i class="fa fa-user-plus">
										Join</i>
								</a>
							</c:if>
							<c:if test="${ !empty sessionScope.member }">
								<a href="logout.do" class="btn btn-default"
									style="margin-right: 10px;"> <span class="sr-only">Toggle
										Logout</span> <i class="fa fa-sign-out"> Logout</i>
								</a>
								<!-- 마이페이지 연결 -->
								<a href="member.mypage.do" class="btn btn-default"> <span
									class="sr-only">My Page</span> <i class="fa fa-user">
										MyPage</i>
								</a>
							</c:if>
						</div>
					</li>
					<li class="active"><a href="index.do">How</a></li>
					<li class="dropdown yamm-fw"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-delay="200">Product <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<div class="yamm-content">
									<div class="row">
										<div class="col-sm-3">
											<h5>Clothing</h5>
											<ul>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">Outer</a></li>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">DRESS</a></li>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">TOP</a></li>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">BOTTOM</a></li>
											</ul>
										</div>
										<div class="col-sm-3">
											<h5>Miscellaneous</h5>
											<ul>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">BAG</a></li>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">ACESSORY</a></li>
											</ul>
										</div>
										<%
											// TODO [lintogi] 있어보이게 하기 위한 임의의 목차이므로 'outer' 카테고리로 이동하게 만들었다.
										%>
										<div class="col-sm-3">
											<h5>Featured</h5>
											<ul>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">Trainers</a></li>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">Sandals</a></li>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">Hiking
														shoes</a></li>
											</ul>
											<h5>Looks and trends</h5>
											<ul>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">Trainers</a></li>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">Sandals</a></li>
												<li><a
													href="${ pageContext.request.contextPath }/productList.do?product_category=outer">Hiking
														shoes</a></li>
											</ul>
										</div>
									</div>
								</div> <!-- /.yamm-content -->
							</li>
						</ul></li>
					<li class="dropdown yamm-fw"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-delay="200">Auction <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<div class="yamm-content">
									<div class="row">
										<div class="col-sm-3">
											<h5>
												<a href="auction.selectList.do">전체상품</a>
											</h5>
											<ul>
												<li><a href="auction.selectList.do?auction_category=의류">의류</a></li>
												<li><a href="auction.selectList.do?auction_category=잡화">잡화</a></li>
												<li><a href="auction.selectList.do?auction_category=악세사리">악세사리</a></li>
											</ul>
										</div>
									</div>
								</div> <!-- /.yamm-content -->
							</li>
						</ul></li>
					<li class="dropdown yamm-fw"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-delay="200">Community <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<div class="yamm-content">
									<div class="row">
										<div class="col-sm-3">
											<h5>공지사항</h5>
											<ul>
												<li><a href="notice.selectList.do">공지사항</a></li>
												<li><a href="">할인정보</a></li>
											</ul>
										</div>
										<div class="col-sm-3">
											<h5>질문 답변</h5>
											<ul>
												<li><a href="qna.selectFaq.do">자주하는 질문</a></li>
												<li><a href="qna.selectList.do">1:1 문의</a></li>
												<li><a href="register.do">Register</a></li>
												<li><a href="resources/customer-orders.html">Orders
														history</a></li>
												<li><a href="resources/customer-order.html">Order
														history detail</a></li>
												<li><a href="resources/customer-wishlist.html">Wishlist</a></li>
												<li><a href="resources/customer-account.html">Customer
														account / change password</a></li>
											</ul>
										</div>
										<div class="col-sm-3">
											<h5>Order process</h5>
											<ul>
												<li><a href="resources/basket.jsp">Shopping cart</a></li>
												<li><a href="resources/checkout1.jsp">Checkout -
														step 1</a></li>
												<li><a href="resources/checkout2.jsp">Checkout -
														step 2</a></li>
												<li><a href="resources/checkout3.jsp">Checkout -
														step 3</a></li>
												<li><a href="resources/checkout4.jsp">Checkout -
														step 4</a></li>
											</ul>
										</div>
										<div class="col-sm-3">
											<h5>Pages and blog</h5>
											<ul>
												<li><a href="resources/blog.jsp">Blog listing</a></li>
												<li><a href="resources/post.jsp">Blog Post</a></li>
												<li><a href="resources/faq.jsp">FAQ</a></li>
												<li><a href="resources/text.jsp">Text page</a></li>
												<li><a href="resources/text-right.jsp">Text page -
														right sidebar</a></li>
												<li><a href="resources/404.jsp">404 page</a></li>
												<li><a href="resources/contact.jsp">Contact</a></li>
											</ul>
										</div>
									</div>
								</div> <!-- /.yamm-content -->
							</li>
						</ul></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
			<div class="navbar-buttons">
				<!--/.nav-collapse -->
				<div class="navbar-collapse collapse right" id="search-not-mobile">
					<c:if test="${ empty sessionScope.member }">
						<button type="button" class="btn navbar-btn btn-primary"
							data-toggle="modal" data-target="#login-modal">
							<span class="sr-only">Toggle login</span> <i
								class="fa fa-sign-in"></i><span class="hidden-sm"> Login</span>
						</button>
						<a href="register.do" class="btn navbar-btn btn-primary"> <span
							class="sr-only">sign up</span> <i class="fa fa-sign-in"></i><span
							class="hidden-sm"> Sign up</span>
						</a>
					</c:if>
					<c:if test="${ !empty sessionScope.member }">
						<a href="logout.do" class="btn navbar-btn btn-primary"> <span
							class="sr-only">Toggle logout</span> <i class="fa fa-sign-out"></i><span
							class="hidden-sm"> Logout</span>
						</a>
						<c:if test="${ sessionScope.member.member_id eq 'admin' }">
							<a href="notice.viewWriteForm.do" class="btn navbar-btn btn-primary"> <span
								class="sr-only">Toggle logout</span> <i class="fa fa-cog"></i><span
								class="hidden-sm"> 관리</span>
							</a>

						</c:if><c:if test="${ sessionScope.member.member_id ne 'admin' }">
							<a href="member.mypage.do" class="btn btn-primary navbar-btn"><i

							class="fa fa-user"></i><span class="hidden-sm"> MyPage </span></a>
						<button type="button" class="btn navbar-btn btn-primary"
							data-toggle="modal" data-target="#message-modal">
							<i class="fa fa-envelope"></i></button>
						</c:if>
					</c:if>
					<button type="button" class="btn navbar-btn btn-primary"
						data-toggle="collapse" data-target="#search">
						<span class="sr-only">Toggle search</span> <i class="fa fa-search"></i>
					</button>
				</div>
			</div>
			<div class="collapse clearfix" id="search">
				<form class="navbar-form" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-btn">

							<button type="submit" class="btn btn-primary">
								<i class="fa fa-search"></i>
							</button>

						</span>
					</div>
				</form>
			</div>
			<!--/.nav-collapse -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#navbar -->
	<!-- *** NAVBAR END *** -->
</body>

<script type="text/javascript">
		function readCheck(num, rchk) {
			var mNum = num.replace("#msg","");
			if ($(rchk).attr("data-sendYn") == 'n'.charAt(0)) {
				console.log(mNum);
				$.ajax({
					url : "mChkUpdate.do",
					data : {
						mNum : mNum
					},
					type : "POST",
					dataType : "text",
					success : function(data){
						$(rchk).parent().parent().css({"background-color" :"white", "color": "#4fbfa8"});
						
					}
				})
			}
		}
		
		$(function(){
			
			  var link = document.createElement('link');
			    link.type = 'image/x-icon';
			    link.rel = 'shortcut icon';
			    link.href = 'resources/favicon11.png';
			    document.getElementsByTagName('head')[0].appendChild(link);
			
			
		});
		
		
			
			
	

		
		
		
</script>
 

</html>