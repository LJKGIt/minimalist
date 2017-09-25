<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="col-md-3">
                    <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Customer section</h3>
                        </div>

                        <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked">
                                <li class="active">
                                    <a href="customer-orders.html"><i class="fa fa-list"></i> My orders</a>
                                </li>
                                <li>
                                    <a href="customer-wishlist.html"><i class="fa fa-heart"></i> My wishlist</a>
                                </li>
                                <li>
                                    <a href="customer-account.html"><i class="fa fa-user"></i> My account</a>
                                </li>
                                <li>
                                	<a href="notice.viewWriteForm.do">공지사항 등록</a>
                                </li>
                                <li>
                                	<a href="member.memberSearchView.do">회원관리</a>
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
</body>
</html>