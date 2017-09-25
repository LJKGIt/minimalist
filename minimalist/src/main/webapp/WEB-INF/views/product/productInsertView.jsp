<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

   

    <title>
        Obaju : e-commerce template
    </title>

    



</head>

<body>
<c:import url="../main/header.jsp" />

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li><a href="#">My orders</a>
                        </li>
                        <li>Order # 1735</li>
                    </ul>

                </div>

                <c:import url="../main/aside_admin.jsp" />

                <div class="col-md-9" id="customer-order">
                    <div class="box">
                    	<form action="productInsert.do" method="POST" class="form-horizontal">
							<fieldset>
								<!-- Form Name -->
								<legend>대여 상품 등록</legend>
								<% // TODO [lintogi] 자바스크립트 추가하기. 값을 하나라도 넣지 않으면 submit에 false를 return하기.. %>
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">이름</label>  
								  <div class="col-md-4">
								  <input id="i_input_name" name="product_name" type="text" class="form-control input-md">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								
								
								<!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="selectbasic">카테고리</label>
								  <div class="col-md-4">
								    <select id="i_select_category" name="product_category" class="form-control">
								    	<option value="" disabled selected>카테고리</option>
								   		<option value="outer">OUTER</option>
										<option value="dress">DRESS</option>
										<option value="top">TOP</option>
										<option value="bottom">BOTTOM</option>
										<option value="bag">BAG</option>
										<option value="accessory">ACCESSORY</option>
								    </select>
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								
								<% // TODO [lintogi] 완성될 쯤에 스크립트 확인해서 브랜드 정리하기. %>
								<!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="selectbasic">브랜드</label>
								  <div class="col-md-4">
								    <select id="i_select_brand" name="product_brand" class="form-control">
							      		<option value="" disabled selected>브랜드</option>
							      		<option value="ACLER">ACLER</option>
										<option value="AERON">AERON</option>
										<option value="ANYA HINDMARCH">ANYA HINDMARCH</option>
										<option value="BALENCIAGA">BALENCIAGA</option>
										<option value="BAUM UND PFERDGARTEN">BAUM UND PFERDGARTEN</option>
										<option value="BITTE KAI RAND">BITTE KAI RAND</option>
										<option value="CACHAREL">CACHAREL</option>
										<option value="CARON CALLAHAN">CARON CALLAHAN</option>
										<option value="CHLOE">CHLOE</option>
								    </select>
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								
								<% // TODO [lintogi] 내용을 수치 등 값으로 넣을 것이므로 사라질 요소다. %>
								<!-- Textarea -->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textarea">설명</label>
								  <div class="col-md-4">                     
								    <textarea id="i_textarea_descript" class="form-control" name="product_descript"></textarea>
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">원가</label>  
								  <div class="col-md-4">
								  <input id="i_input_original_price" name="product_original_price" type="number" class="form-control input-md">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">대여 금액</label>  
								  <div class="col-md-4">
								  <input id="i_input_rent_price" name="rent_price" type="number" class="form-control input-md">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- Multiple Checkboxes (inline) -->
								<div class="form-group">
									  <label class="col-md-4 control-label" for="checkboxes">사이즈</label>
									  <div class="col-md-8">
									    <label class="checkbox-inline" for="checkboxes-0">
									      <input id="i_input_size_33" type="checkbox" name="product_size33" value="1">
									      33
									    </label>
									    <label class="checkbox-inline" for="checkboxes-1">
									      <input id="i_input_size_44" type="checkbox" name="product_size44" value="1">
									     44
									    </label>
									    <label class="checkbox-inline" for="checkboxes-2">
									      <input id="i_input_size_55" type="checkbox" name="product_size55" value="1">
									     55
									    </label>
									    <label class="checkbox-inline" for="checkboxes-3">
									      <input id="i_input_size_66" type="checkbox" name="product_size66" value="1">
									      66
									    </label>
									        <label class="checkbox-inline" for="checkboxes-4">
									      <input id="i_input_size_77" type="checkbox" name="product_size77" value="1">
									      77
									    </label>
									    <span class="help-block" style="color:red;"></span>
									  </div>
									  
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">색상</label>  
								  <div class="col-md-4">
								  <input id="i_input_color" name="product_color" type="text" class="form-control input-md">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								<script type="text/javascript">
									$(function(){
										
										
										$('#i_input_name').on('focusout', function(){
											if($('#i_input_name').val() == ""){
												$('#i_input_name').parent().children('span').eq(0).text("이름을 입력해주시기 바랍니다.");
											}
										});
										$('#i_input_name').on('keypress', function(){
											$('#i_input_name').parent().children('span').eq(0).text("");
										});
										$('#i_select_category').on('focusout', function(){
											if($('#i_select_category').val() == null){
												$('#i_select_category').parent().children('span').eq(0).text("카테고리를 선택해주시기 바랍니다.");
											}
										});
										$('#i_select_category').on('change', function(){
											$('#i_select_category').parent().children('span').eq(0).text("");
										});
										$('#i_select_brand').on('focusout', function(){
											if($('#i_select_brand').val() == null){
												$('#i_select_brand').parent().children('span').eq(0).text("브랜드를 선택해주시기 바랍니다.");
											}
										});
										$('#i_select_brand').on('change', function(){
											$('#i_select_brand').parent().children('span').eq(0).text("");
										});
										$('#i_textarea_descript').on('focusout', function(){
											if($('#i_textarea_descript').val() == ""){
												$('#i_textarea_descript').parent().children('span').eq(0).text("내용을 입력해주시기 바랍니다.");
											}
										});
										$('#i_textarea_descript').on('keypress', function(){
											$('#i_textarea_descript').parent().children('span').eq(0).text("");
										});
										$('#i_input_original_price').on('focusout', function(){
											if($('#i_input_original_price').val() == ""){
												$('#i_input_original_price').parent().children('span').eq(0).text("원가를 입력해주시기 바랍니다.");
											}
										});
										$('#i_input_original_price').on('keypress', function(){
											$('#i_input_original_price').parent().children('span').eq(0).text("");
										});
										$('#i_input_rent_price').on('focusout', function(){
											if($('#i_input_rent_price').val() == ""){
												$('#i_input_rent_price').parent().children('span').eq(0).text("대여 금액을 입력해주시기 바랍니다.");
											}
										});
										$('#i_input_rent_price').on('keypress', function(){
											$('#i_input_rent_price').parent().children('span').eq(0).text("");
										});
										$('#i_input_size_33,#i_input_size_44,#i_input_size_55,#i_input_size_66,#i_input_size_77').on('click', function(){
											if($('#i_input_size_33').prop("checked") == false && $('#i_input_size_44').prop("checked") == false && $('#i_input_size_55').prop("checked") == false && $('#i_input_size_66').prop("checked") == false && $('#i_input_size_77').prop("checked") == false){
												$('#i_input_size_33').parent().parent().children('span').eq(0).text("사이즈를 선택해주시기 바랍니다.");
											} else {
												$('#i_input_size_33').parent().parent().children('span').eq(0).text("");
											}
										});
										$('#i_input_color').on('focusout', function(){
											if($('#i_input_color').val() == ""){
												$('#i_input_color').parent().children('span').eq(0).text("색상을 입력해주시기 바랍니다.");
											}
										});
										$('#i_input_color').on('keypress', function(){
											$('#i_input_color').parent().children('span').eq(0).text("");
										});
										$('#i_button_submit').on('click', function(){
											if($('#i_input_name').val() == ""){
												$('#i_input_name').parent().children('span').eq(0).text("이름을 입력해주시기 바랍니다.");
												$('#i_input_name').focus();
												return false;
											} else if($('#i_select_category').val() == null){
												$('#i_select_category').parent().children('span').eq(0).text("카테고리를 선택해주시기 바랍니다.");
												$('#i_select_category').focus();
												return false;
											} else if($('#i_select_brand').val() == null){
												$('#i_select_brand').parent().children('span').eq(0).text("브랜드를 선택해주시기 바랍니다.");
												$('#i_select_brand').focus();
												return false;
											} else if($('#i_textarea_descript').val() == ""){
												$('#i_textarea_descript').parent().children('span').eq(0).text("내용을 입력해주시기 바랍니다.");
												$('#i_textarea_descript').focus();
												return false;
											} else if($('#i_input_original_price').val() == ""){
												$('#i_input_original_price').parent().children('span').eq(0).text("원가를 입력해주시기 바랍니다.");
												$('#i_input_original_price').focus();
												return false;
											} else if($('#i_input_rent_price').val() == ""){
												$('#i_input_rent_price').parent().children('span').eq(0).text("대여 금액을 입력해주시기 바랍니다.");
												$('#i_input_rent_price').focus();
												return false;
											} else if($('#i_input_size_33').prop("checked") == false && $('#i_input_size_44').prop("checked") == false && $('#i_input_size_55').prop("checked") == false && $('#i_input_size_66').prop("checked") == false && $('#i_input_size_77').prop("checked") == false){
												$('#i_input_size_33').parent().parent().children('span').eq(0).text("사이즈를 선택해주시기 바랍니다.");
												$('#i_input_size_33').focus();
												return false;
											} else if($('#i_input_color').val() == ""){
												$('#i_input_color').parent().children('span').eq(0).text("색상을 입력해주시기 바랍니다.");
												$('#i_input_color').focus();
												return false;
											}
										});
									});
								</script>
								<!-- Button (Double) -->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="button1id"></label>
								  <div class="col-md-8">
								    <button type="submit" id="i_button_submit" name="button1id" class="btn btn-success">등록하기</button>
								    <% // TODO [lintogi] 자바스크립트로 새로고침 하기. %>
								    <button type="button" name="button2id" class="btn btn-danger">취소하기</button>
								  </div>
								</div>
							</fieldset>
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

	<script type="text/javascript">
		$(function(){
			$('#i_input_name').focus();
		});
	</script>

</body>
</html>