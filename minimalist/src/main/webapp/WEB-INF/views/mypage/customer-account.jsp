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
                        <form action="mupdate.do" method="post">
								<div class="form-group">
									<label for="id">ID</label><br>
									<input type="text"
										class="form-control" value="${ member.member_id }" disabled id="member_id" name="member_id" style="width: 60%; display: inline; margin-right: 20px;">
										<div id="checkID"></div>
								</div>
								
								<div class="form-group">
									<label for="pwd">Password</label>
								<a href="#" class="btn btn-primary"> 비밀번호 변경하기</a>
								<!-- PASSWORD FORM 
								 <input type="password"
										class="form-control" id="member_pwd" name="member_pwd">
								</div>
								<div class="form-group">
									<label for="pwd2">Password Check</label> <input type="password"
										class="form-control" id="member_pwd2">
										<div id="checkPwd"></div>
										-->
								</div> 
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="member_name" name="member_name" style="width: 50%;">
								</div>
								<div class="form-group">
									<label for="birth">Birth</label> <input type="date"
										class="form-control" id="birth" name="birth" style="width: 50%">
								</div>
								<div class="form-group">
									<label for="phone">Phone</label> <input type="tel"
										class="form-control" id="phone" name="phone">
								</div>
								<!-- ADDRESS -->
								<div class="form-group">
									<label for="address">Address</label><br>
								<input type="text" id="postcode" name="post"
									placeholder="우편번호" class="form-control" style="width: 30%; display: inline; margin: 0 20px 10px 0"> <input type="button"
									onclick="execDaumPostcode()" value="Post Search" class="btn btn-primary">
								<input type="text" id="address" name="address1" placeholder="주소" class="form-control" style="margin-bottom: 10px;">
								<input type="text" id="address2" name="address2"
									placeholder="상세주소" class="form-control" ><br>
								<div id="checkAddress"></div>
								</div>
								
								<div class="form-group">
									<label for="email">Email</label><br> <input type="text"
										class="form-control" id="email_id" name="email1" style="width: 20%; display:inline;">@
										<input type="text"
										class="form-control" id="email_id2" name="email2" style="width: 20%; display:inline;">
										<select class="form-control" id="email_sel" style="width: 20%; display:inline;">
											<option>직접입력</option>
											<option>naver.com</option>
											<option>gmail.com</option>
											<option>nate.com</option>
											<option>iei.or.kr</option>
										</select>
										<a href="emailAuth.do" class="btn btn-primary">ㅇㅈ</a>
								</div>


								<div class="text-center">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-user-md"></i> Register
									</button>
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