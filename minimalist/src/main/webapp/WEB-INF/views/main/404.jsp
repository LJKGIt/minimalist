<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>



<body>
	
	<c:import url="header.jsp" />
	
    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Page not found</li>
                    </ul>


                    <div class="row" id="error-page">
                        <div class="col-sm-6 col-sm-offset-3">
                            <div class="box">

                                <p class="text-center">
                                    <img src="resources/img/logo23.png" alt="Obaju template">
                                </p>

                                <h3>요청하신 페이지를 찾을 수 없습니다.</h3>
                                <p>주소가 잘못 입력 되었거나 수정, 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
                                <p>입력하신 주소가 정확한지 다시 한번 확인해 주세요.</p>
                                <hr>
                                <h4 class="text-muted">요청하신 페이지는 오류페이지입니다.</h4>

                                <!-- <p class="text-center">To continue please use the <strong>Search form</strong> or <strong>Menu</strong> above.</p> -->

                                <p class="buttons"><a href="index.do" class="btn btn-primary"><i class="fa fa-home"></i>main으로 가기</a>
                                </p>
                            </div>
                        </div>
                    </div>


                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

		<c:import url="footer.jsp" />
    </div>
    <!-- /#all -->
    
</body>
</html>