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
                        <li>My account</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="panel-title">Customer section</h3>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="customer-orders.jsp"><i class="fa fa-list"></i> 주문내역</a>
                                </li>
                                <li>
                                    <a href="customer-wishlist.jsp"><i class="fa fa-heart"></i> 찜 목록</a>
                                </li>
                                <li class="active">
                                    <a href="customer-account.jsp"><i class="fa fa-user"></i> 내 정보보기</a>
                                </li>
                                <li>
                                    <a href="index.jsp"><i class="fa fa-sign-out"></i> Logout</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** CUSTOMER MENU END *** -->
                </div>

                <div class="col-md-9">
                    <div class="box">
                        <h3>Password reconfirm</h3>


                        <form action="member.information.do" method="post">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="member_pwd"> password</label>
                                        <input type="hidden" class="form-control" id="member_id" name="member_id" value="${ member.member_id }">
                                        <input type="password" class="form-control" id="member_pwd" name="member_pwd" style="width: 40%; margin-right: 10px;">
                                        <p style="color: red; font-size: 7px; float:right;">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->
							<div class="row">
	                           <div class="col-sm-12 text-center">
	                               <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Confirm</button>
	                               <button type="button" class="btn btn-primary" onclick="history.back();"><i class="fa fa-remove"></i> Cancel</button>
	                           </div>
                            </div>
                        </form>

                    </div>
                </div>

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->
		<c:import url="../main/footer.jsp" />
    </div>
    <!-- /#all -->
</body>
</html>