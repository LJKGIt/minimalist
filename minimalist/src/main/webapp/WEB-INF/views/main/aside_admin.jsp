<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<body>
<div class="col-md-3">
                    <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Customer section</h3>
                        </div>

                        <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked" id="i_ul_active">
                                <!-- <li class="active">
                                    <a href="#"><i class="fa fa-list"></i> My orders</a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-heart"></i> My wishlist</a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-user"></i> My account</a>
                                </li> -->
                                <li>
                                	<a href="notice.viewWriteForm.do">공지사항 등록</a>
                                </li>
                                <li>
                                	<a href="member.memberManage.do">회원관리</a>
                                </li>
                                <li>
                                	<a href="member.memberSearchView.do">쪽지</a>
                                </li>
                                <li>
                                	<a href="productInsertView.do">대여상품 등록</a>
                                </li>
                                <li>
                                	<a href="auction.viewRegister.do">경매상품 등록</a>
                                </li>
                                <li>
                                	<a href="auction.viewAuctionEnd.do">종료된 경매 확인</a>
                                </li>
                                <li>
                                	<a href="income.selectList.do">매출 확인</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** CUSTOMER MENU END *** -->
                </div>
                <script type="text/javascript">
                	$(function(){
                		$('#i_ul_active').children('li').each(function(index, element){
                			if($(this).children('a').eq(0).text().trim() == $('#i_hidden_aside_active').val().trim()){
                				$(this).attr('class', 'active');
                				return false;
                			}
                		});
                		;
                	});
                </script>
</body>
</html>