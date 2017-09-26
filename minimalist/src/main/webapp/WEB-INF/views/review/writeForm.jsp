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
                        <li><a href="#">Ladies</a>
                        </li>
                        <li><a href="#">Dress</a>
                        </li>
                        <li></li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Categories</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked category-menu">
                                <li>
                                    <a href="category.html">Men <span class="badge pull-right">42</span></a>
                                    <ul>
                                        <li><a href="category.html">T-shirts</a>
                                        </li>
                                        <li><a href="category.html">Shirts</a>
                                        </li>
                                        <li><a href="category.html">Pants</a>
                                        </li>
                                        <li><a href="category.html">Accessories</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="active">
                                    <a href="category.html">Ladies  <span class="badge pull-right">123</span></a>
                                    <ul>
                                        <li><a href="category.html">T-shirts</a>
                                        </li>
                                        <li><a href="category.html">Skirts</a>
                                        </li>
                                        <li><a href="category.html">Pants</a>
                                        </li>
                                        <li><a href="category.html">Accessories</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="category.html">Kids  <span class="badge pull-right">11</span></a>
                                    <ul>
                                        <li><a href="category.html">T-shirts</a>
                                        </li>
                                        <li><a href="category.html">Skirts</a>
                                        </li>
                                        <li><a href="category.html">Pants</a>
                                        </li>
                                        <li><a href="category.html">Accessories</a>
                                        </li>
                                    </ul>
                                </li>

                            </ul>

                        </div>
                    </div>

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Brands <a class="btn btn-xs btn-danger pull-right" href="#"><i class="fa fa-times-circle"></i> Clear</a></h3>
                        </div>

                        <div class="panel-body">

                            <form>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Armani (10)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Versace (12)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Carlo Bruni (15)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Jack Honey (14)
                                        </label>
                                    </div>
                                </div>

                                <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>

                            </form>

                        </div>
                    </div>

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Colours <a class="btn btn-xs btn-danger pull-right" href="#"><i class="fa fa-times-circle"></i> Clear</a></h3>
                        </div>

                        <div class="panel-body">

                            <form>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> <span class="colour white"></span> White (14)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> <span class="colour blue"></span> Blue (10)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> <span class="colour green"></span> Green (20)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> <span class="colour yellow"></span> Yellow (13)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> <span class="colour red"></span> Red (10)
                                        </label>
                                    </div>
                                </div>

                                <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>

                            </form>

                        </div>
                    </div>

                    <!-- *** MENUS AND FILTERS END *** -->

                    <div class="banner">
                        <a href="#">
                            <img src="img/banner.jpg" alt="sales 2014" class="img-responsive">
                        </a>
                    </div>
                </div>

                <div class="col-md-9">

                    


                    <div class="box" id="details">
                      
                              <!--  리뷰 작성 폼 -->
                              <div class="box" id="contact">
                               <form action="review.insertReview.do" method="post" enctype="multipart/form-data">
                      <table class="board-write-1s mgT40">
                     
			<colgroup>
				<col style="width:25%;">
				<col style="width:75%;">
			</colgroup>
			<tbody>
			<tr><th>상품 번호 </th><td><input type="text" value="${product_code}" name="product_code" readonly></td></tr>
                      <tr><th scope="col"><label for="TypeInquiry"><strong>평가</strong></label></th>
                     <td>
                     <c:forEach var="star1" begin="1" end="5">
                     	<c:forEach var="star2" begin="${star1}" end="5">
                     	<img src='/minimalist/resources/img_review/star-on.png'>
                     	</c:forEach>
                     	<c:if test="${star1 ne 1}">
                         <input type="radio" name="review_rating" value="${6-star1}">&nbsp;
                     	</c:if>
                     	<c:if test="${star1 eq 1}">
                         <input type="radio" name="review_rating" value="${6-star1}"  checked="checked">&nbsp;
                     	</c:if>
                     </c:forEach>
                     </td></tr>
                       <tr><td><strong>작성자</strong></td><td><input type="text" name="member_id"  style="width:98%;" value="${sessionScope.member.member_id}" readonly></td></tr>
                    <tr><td><strong>제목</strong></td><td><input type="text" name="review_title" style="width:98%;"></td></tr>
                      <tr><td><strong>내용</strong></td><td><textarea name="review_content" cols="30" rows="7" placeholder="상품 후기를 입력해주세요.(2000자 이내)" style="width:98%;height:280px;"></textarea>
                     
							<input type="file" id="inputFile" name="cnslFile" class="btnFileAdd" value="첨부파일" title="첨부파일 선택">
							<input type="hidden" name="fileName" id="cnslFileName" value="">
							<span id="fileName" class="file" style="display: none;"><span></span><button type="button" id="btnFileDelete" class="ButtonDelete">삭제</button></span>
							<span class="txt">5MB 이하의 이미지 파일 (JPG, PNG, GIF) 1개를 첨부하실 수 있습니다.</span>
						</td>
					</tr>
                      
                      
                      <!-- <tr><td><input type="submit" value="등록"  class="area1sButton"></td></tr> -->
                      
                      </table>
                      <div>
                       <input type="submit" value="등록"  class="area1sButton">
                      </div>
                     
                      </form>
                              
						</div>
                    </div>

                    <div class="row same-height-row">
                    
                      

                    </div>

                  
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

		<c:import url="../main/footer.jsp" />


	</div>
    </div>
    <!-- /#all -->


    






</body>
</html>