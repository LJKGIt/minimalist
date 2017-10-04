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
                    	<form id="i_form_insert" action="productInsert.do" method="POST" class="form-horizontal" enctype="multipart/form-data">
							<fieldset>
								<!-- Form Name -->
								<legend>대여 상품 등록</legend>

								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_text_name">이름</label>  
								  <div class="col-md-8">
								  <input id="i_text_name" name="product_name" type="text" class="form-control input-md">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_select_category">카테고리</label>
								  <div class="col-md-8">
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
								
								
								<% // TODO [lintogi] □ 완성될 쯤에 스크립트 확인해서 브랜드 정리하기. %>
								<!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_select_brand">브랜드</label>
								  <div class="col-md-8">
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
								
								<% // TODO [lintogi] □ 내용을 수치 등 값으로 넣을 것이므로 사라질 요소다. %>
								<!-- Textarea -->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_textarea_descript">설명</label>
								  <div class="col-md-8">
								    <textarea id="i_textarea_descript" class="form-control" name="product_descript"></textarea>
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_number_original_price">원가</label>  
								  <div class="col-md-8">
								  <input id="i_number_original_price" name="product_original_price" type="number" class="form-control input-md">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_number_rent_price">대여 금액</label>  
								  <div class="col-md-8">
								  <input id="i_number_rent_price" name="rent_price" type="number" class="form-control input-md">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- Multiple Checkboxes (inline) -->
								<div class="form-group">
									  <label class="col-md-3 control-label" for="checkboxes">사이즈</label>
									  <div class="col-md-8">
									    <label class="checkbox-inline" for="i_checkbox_size_33">
									      <input id="i_checkbox_size_33" type="checkbox" name="product_size33" value="1">
									      33
									    </label>
									    <label class="checkbox-inline" for="i_checkbox_size_44">
									      <input id="i_checkbox_size_44" type="checkbox" name="product_size44" value="1">
									     44
									    </label>
									    <label class="checkbox-inline" for="i_checkbox_size_55">
									      <input id="i_checkbox_size_55" type="checkbox" name="product_size55" value="1">
									     55
									    </label>
									    <label class="checkbox-inline" for="i_checkbox_checkbox_66">
									      <input id="i_checkbox_size_66" type="checkbox" name="product_size66" value="1">
									      66
									    </label>
									        <label class="checkbox-inline" for="i_checkbox_size_77">
									      <input id="i_checkbox_size_77" type="checkbox" name="product_size77" value="1">
									      77
									    </label>
									    <span class="help-block" style="color:red;"></span>
									  </div>
									  
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_text_color">색상</label>  
								  <div class="col-md-8">
								  <input id="i_text_color" name="product_color" type="text" class="form-control input-md">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								<!-- File Button --> 
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_file_image1">이미지 파일</label>
								  <div class="col-md-8">
								    <input id="i_file_image1" name="filebutton1" class="input-file" type="file">
								    <input id="i_hidden_image1" name="n_hidden_image1" type="hidden">
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- File Button --> 
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_file_image2">이미지 파일</label>
								  <div class="col-md-8">
								    <input id="i_file_image2" name="filebutton2" class="input-file" type="file">
								    <input id="i_hidden_image2" name="n_hidden_image2" type="hidden">
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- File Button --> 
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_file_image3">이미지 파일</label>
								  <div class="col-md-8">
								    <input id="i_file_image3" name="filebutton3" class="input-file" type="file">
								    <input id="i_hidden_hidden_image3" name="n_hidden_image3" type="hidden">
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label"></label>
									<div class="col-md-8" style="height:65px;">
										<div style="width:65px; height:65px; border:1px solid gray; display:inline-block;"><img id="i_img_image1" style="width:100%; height:100%; display:inline-block;" src="" alt=""></div>
										<div style="width:65px; height:65px; border:1px solid gray; display:inline-block;"><img id="i_img_image2" style="width:100%; height:100%; display:inline-block;" src="" alt=""></div>
										<div style="width:65px; height:65px; border:1px solid gray; display:inline-block;"><img id="i_img_image3" style="width:100%; height:100%; display:inline-block;" src="" alt=""></div>
								  	</div>
							  	</div>

								<script type="text/javascript">
									$(function(){
										
										// 각각의 요소에 대해 비어있는 값을 확인합니다.
										$('#i_text_name').on('focusout', function(){
											if($(this).val() == ""){
												$(this).parent().children('span').eq(0).text("이름을 입력해주시기 바랍니다.");
											}
										});
										$('#i_text_name').on('keypress', function(){
											$(this).parent().children('span').eq(0).text("");
										});
										$('#i_select_category').on('focusout', function(){
											if($(this).val() == null){
												$(this).parent().children('span').eq(0).text("카테고리를 선택해주시기 바랍니다.");
											}
										});
										$('#i_select_category').on('change', function(){
											$(this).parent().children('span').eq(0).text("");
										});
										$('#i_select_brand').on('focusout', function(){
											if($(this).val() == null){
												$(this).parent().children('span').eq(0).text("브랜드를 선택해주시기 바랍니다.");
											}
										});
										$('#i_select_brand').on('change', function(){
											$(this).parent().children('span').eq(0).text("");
										});
										$('#i_textarea_descript').on('focusout', function(){
											if($(this).val() == ""){
												$(this).parent().children('span').eq(0).text("내용을 입력해주시기 바랍니다.");
											}
										});
										$('#i_textarea_descript').on('keypress', function(){
											$(this).parent().children('span').eq(0).text("");
										});
										$('#i_number_original_price').on('focusout', function(){
											if($(this).val() == ""){
												$(this).parent().children('span').eq(0).text("원가를 입력해주시기 바랍니다.");
											}
										});
										$('#i_number_original_price').on('keypress', function(){
											$(this).parent().children('span').eq(0).text("");
										});
										$('#i_number_rent_price').on('focusout', function(){
											if($(this).val() == ""){
												$(this).parent().children('span').eq(0).text("대여 금액을 입력해주시기 바랍니다.");
											}
										});
										$('#i_number_rent_price').on('keypress', function(){
											$(this).parent().children('span').eq(0).text("");
										});
										$('#i_checkbox_size_33,#i_checkbox_size_44,#i_checkbox_size_55,#i_checkbox_size_66,#i_checkbox_size_77').on('click', function(){
											if($('#i_checkbox_size_33').prop("checked") == false && $('#i_checkbox_size_44').prop("checked") == false && $('#i_checkbox_size_55').prop("checked") == false && $('#i_checkbox_size_66').prop("checked") == false && $('#i_checkbox_size_77').prop("checked") == false){
												$('#i_checkbox_size_33').parent().parent().children('span').eq(0).text("사이즈를 선택해주시기 바랍니다.");
											} else {
												$('#i_checkbox_size_33').parent().parent().children('span').eq(0).text("");
											}
										});
										$('#i_text_color').on('focusout', function(){
											if($(this).val() == ""){
												$(this).parent().children('span').eq(0).text("색상을 입력해주시기 바랍니다.");
											}
										});
										$('#i_text_color').on('keypress', function(){
											$(this).parent().children('span').eq(0).text("");
										});
										$('#i_file_image1').on('focusout', function(){
											if($(this).val() == ""){
												$(this).parent().children('span').eq(0).text("이미지 파일을 첨부해주시기 바랍니다.");
											}
										});
										$('#i_file_image2').on('focusout', function(){
											if($(this).val() == ""){
												$(this).parent().children('span').eq(0).text("이미지 파일을 첨부해주시기 바랍니다.");
											}
										});
										$('#i_file_image3').on('focusout', function(){
											if($(this).val() == ""){
												$(this).parent().children('span').eq(0).text("이미지 파일을 첨부해주시기 바랍니다.");
											}
										});
										
										// 파일 첨부 시 jpg, jpeg 파일인지 확인합니다.
										// AJAX로 서버에 업로드합니다.
										// img 태그로 보여줍니다.
										$('#i_file_image1').on('change', function(){
											var this_image = $(this);
											if($(this).val().split('.').reverse()[0].toLowerCase() == "jpg"){
												var formData = new FormData($('#i_form_insert')[0]);
												$.ajax({
												    url: "productImageUpload.do",                                                                        
												    type: "POST",
												    data : formData,
										            processData : false,
										            contentType : false,
												    success: function (data) {
												    	if(data == "true"){
												    		$('#i_img_image1').attr('src', '${ pageContext.request.contextPath }/resources/img_product/' + this_image.val().split('\\').reverse()[0]);
												    	} else {
												    		alert("파일 업로드에 실패했습니다.");
												    	}
												    }, error: function (data) {
												    	alert("파일 업로드에 실패했습니다.");
												    }
												}); //ajax
												$(this).parent().children('span').eq(0).text("");
												$('#i_hidden_image1').val($(this).val().split('\\').reverse()[0]);
											} else {
												$(this).parent().children('span').eq(0).text("JPG 파일만 올려주시기 바랍니다.");
												$(this).focus();
											}
										});
										$('#i_file_image2').on('change', function(){
											var this_image = $(this);
											if($(this).val().split('.').reverse()[0].toLowerCase() == "jpg"){
												var formData = new FormData($('#i_form_insert')[0]);
												$.ajax({
												    url: "productImageUpload.do",                                                                        
												    type: "POST",
												    data : formData,
										            processData : false,
										            contentType : false,
												    success: function (data) {
												    	if(data == "true"){
												    		$('#i_img_image2').attr('src', '${ pageContext.request.contextPath }/resources/img_product/' + this_image.val().split('\\').reverse()[0]);
												    	} else {
												    		alert("파일 업로드에 실패했습니다.");
												    	}
												    }, error: function (data) {
												    	alert("파일 업로드에 실패했습니다.");
												    }
												}); //ajax
												$(this).parent().children('span').eq(0).text("");
												$('#i_hidden_image2').val($(this).val().split('\\').reverse()[0]);
											} else {
												$(this).parent().children('span').eq(0).text("JPG 파일만 올려주시기 바랍니다.");
												$(this).focus();
											}
										});
										$('#i_file_image3').on('change', function(){
											var this_image = $(this);
											if($(this).val().split('.').reverse()[0].toLowerCase() == "jpg"){
												var formData = new FormData($('#i_form_insert')[0]);
												$.ajax({
												    url: "productImageUpload.do",                                                                        
												    type: "POST",
												    data : formData,
										            processData : false,
										            contentType : false,
												    success: function (data) {
												    	if(data == "true"){
												    		$('#i_img_image3').attr('src', '${ pageContext.request.contextPath }/resources/img_product/' + this_image.val().split('\\').reverse()[0]);
												    	} else {
												    		alert("파일 업로드에 실패했습니다.");
												    	}
												    }, error: function (data) {
												    	alert("파일 업로드에 실패했습니다.");
												    }
												}); //ajax
												$(this).parent().children('span').eq(0).text("");
												$('#i_hidden_image3').val($(this).val().split('\\').reverse()[0]);
											} else {
												$(this).parent().children('span').eq(0).text("JPG 파일만 올려주시기 바랍니다.");
												$(this).focus();
											}
										});
										
										// submit 버튼을 클릭 시 비어있는 값을 확인합니다.
										$('#i_submit').on('click', function(){
											if($('#i_text_name').val() == ""){
												$('#i_text_name').parent().children('span').eq(0).text("이름을 입력해주시기 바랍니다.");
												$('#i_text_name').focus();
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
											} else if($('#i_number_original_price').val() == ""){
												$('#i_number_original_price').parent().children('span').eq(0).text("원가를 입력해주시기 바랍니다.");
												$('#i_number_original_price').focus();
												return false;
											} else if($('#i_number_rent_price').val() == ""){
												$('#i_number_rent_price').parent().children('span').eq(0).text("대여 금액을 입력해주시기 바랍니다.");
												$('#i_number_rent_price').focus();
												return false;
											} else if($('#i_checkbox_size_33').prop("checked") == false && $('#i_checkbox_size_44').prop("checked") == false && $('#i_checkbox_size_55').prop("checked") == false && $('#i_checkbox_size_66').prop("checked") == false && $('#i_checkbox_size_77').prop("checked") == false){
												$('#i_checkbox_size_33').parent().parent().children('span').eq(0).text("사이즈를 선택해주시기 바랍니다.");
												$('#i_checkbox_size_33').focus();
												return false;
											} else if($('#i_text_color').val() == ""){
												$('#i_text_color').parent().children('span').eq(0).text("색상을 입력해주시기 바랍니다.");
												$('#i_text_color').focus();
												return false;
											} else if($('#i_file_image1').val() == ""){
												$('#i_file_image1').parent().children('span').eq(0).text("이미지 파일을 첨부해주시기 바랍니다.");
												$('#i_file_image1').focus();
												return false;
											} else if($('#i_file_image1').val().split('.').reverse()[0].toLowerCase() != "jpg"){
												$('#i_file_image1').parent().children('span').eq(0).text("JPG 파일만 올려주시기 바랍니다.");
												$('#i_file_image1').focus();
												return false;
											} else if($('#i_file_image2').val() == ""){
												$('#i_file_image2').parent().children('span').eq(0).text("이미지 파일을 첨부해주시기 바랍니다.");
												$('#i_file_image2').focus();
												return false;
											} else if($('#i_file_image2').val().split('.').reverse()[0].toLowerCase() != "jpg"){
												$('#i_file_image2').parent().children('span').eq(0).text("JPG 파일만 올려주시기 바랍니다.");
												$('#i_file_image2').focus();
												return false;
											} else if($('#i_file_image3').val() == ""){
												$('#i_file_image3').parent().children('span').eq(0).text("이미지 파일을 첨부해주시기 바랍니다.");
												$('#i_file_image3').focus();
												return false;
											} else if($('#i_file_image3').val().split('.').reverse()[0].toLowerCase() != "jpg"){
												$('#i_file_image3').parent().children('span').eq(0).text("JPG 파일만 올려주시기 바랍니다.");
												$('#i_file_image3').focus();
												return false;
											}
										});
									});
								</script>
								<!-- Button (Double) -->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="button1id"></label>
								  <div class="col-md-8">
								    <button type="submit" id="i_button_submit" name="button1id" class="btn btn-success">등록하기</button>
								    <button type="button" name="button2id" class="btn btn-danger" onclick="javascript:location.reload();">다시 쓰기</button>
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
			$('#i_textt_name').focus();
		});
	</script>

</body>
</html>