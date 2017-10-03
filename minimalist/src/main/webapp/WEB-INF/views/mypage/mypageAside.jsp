<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-3">
		<div class="panel panel-default sidebar-menu">
			<div class="panel-heading">
				<h3 class="panel-title">Customer section</h3>
			</div>
			<div class="panel-body">
				<ul id="asideMenu" class="nav nav-pills nav-stacked">
					<li><a href="member.mypage.do"><i
							class="fa fa-tags"></i> 주문내역</a></li>
					<li><a href="wish.wishlist.do"><i class="fa fa-heart"></i>
							찜 목록</a></li>
					<li><a href="member.passwordCheck.do"><i
							class="fa fa-user"></i> 내 정보보기</a></li>
					<li><a href="review.myReview.do"><i class="fa fa-pencil-square-o"></i>
							내가 쓴 후기</a></li>
					<li><a href="qna.selectList.do"><i class="fa fa-commenting-o"></i>
							내 상품문의</a></li>
					<li><a href="auction.selectMemberAuction.do"><i
							class="fa fa-money"></i> 내 경매</a></li>
				</ul>
			</div>
		</div>
		<!-- /.col-md-3 -->
		<!-- *** CUSTOMER MENU END *** -->
	</div>
	
	<script>
	$(function(){
		$('#asideMenu > li:eq('+menuNum+')').addClass('active');
	})
	</script>
</body>
</html>