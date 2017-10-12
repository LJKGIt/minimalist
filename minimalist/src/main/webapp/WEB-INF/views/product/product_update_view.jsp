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
                        <li><a href="#">Product</a>
                        </li>
                        <li>Update # ${ product.product_code }</li>
                    </ul>

                </div>

				<%-- <input type="hidden" id="i_hidden_aside_active" value="대여상품 등록">
                <c:import url="../main/aside_admin.jsp" /> --%>

                <div class="col-md-12" id="customer-order">
                    <div class="box">
                    	<form id="i_form_insert" action="productUpdate.do" method="POST" class="form-horizontal" enctype="multipart/form-data">
							<fieldset>
								<!-- Form Name -->
								<legend>대여 상품 수정</legend>

								<input type="hidden" name="product_code" value="${ product.product_code }">

								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_text_name">이름</label>  
								  <div class="col-md-8">
								  <input id="i_text_name" name="product_name" type="text" class="form-control input-md" value="${ product.product_name }">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_select_category">카테고리</label>
								  <div class="col-md-8">
								    <select id="i_select_category" name="product_category" class="form-control">
								    	<option value="" disabled>카테고리</option>
								   		<c:if test="${ product.product_category eq 'outer' }"><option value="outer" selected>OUTER</option></c:if><c:if test="${ product.product_category ne 'outer' }"><option value="outer" selected>OUTER</option></c:if>
								   		<c:if test="${ product.product_category eq 'dress' }"><option value="dress" selected>DRESS</option></c:if><c:if test="${ product.product_category ne 'dress' }"><option value="dress">DRESS</option></c:if>
								   		<c:if test="${ product.product_category eq 'top' }"><option value="top" selected>TOP</option></c:if><c:if test="${ product.product_category ne 'top' }"><option value="top">TOP</option></c:if>
								   		<c:if test="${ product.product_category eq 'bottom' }"><option value="bottom" selected>BOTTOM</option></c:if><c:if test="${ product.product_category ne 'bottom' }"><option value="bottom">BOTTOM</option></c:if>
								   		<c:if test="${ product.product_category eq 'bag' }"><option value="bag" selected>BAG</option></c:if><c:if test="${ product.product_category ne 'bag' }"><option value="bag">BAG</option></c:if>
								   		<c:if test="${ product.product_category eq 'accessory' }"><option value="accessory" selected>ACCESSORY</option></c:if><c:if test="${ product.product_category ne 'accessory' }"><option value="accessory">ACCESSORY</option></c:if>
								    </select>
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_select_brand">브랜드</label>
								  <div class="col-md-8">
								    <select id="i_select_brand" name="product_brand" class="form-control">
						      			<c:if test="${ product.product_brand eq 'BITTE KAI RAND' }"><option value="BITTE KAI RAND">BITTE KAI RAND</option>		  </c:if><c:if test="${ product.product_brand ne 'BITTE KAI RAND' }"><option value="BITTE KAI RAND">BITTE KAI RAND</option>		  </c:if>
										<c:if test="${ product.product_brand eq 'CHRISTIAN WIJNANTS' }"><option value="CHRISTIAN WIJNANTS">CHRISTIAN WIJNANTS</option> </c:if><c:if test="${ product.product_brand ne 'CHRISTIAN WIJNANTS' }"><option value="CHRISTIAN WIJNANTS">CHRISTIAN WIJNANTS</option> </c:if>
										<c:if test="${ product.product_brand eq 'EDIT' }"><option value="EDIT">EDIT</option>                             </c:if><c:if test="${ product.product_brand ne 'EDIT' }"><option value="EDIT">EDIT</option>                             </c:if>
										<c:if test="${ product.product_brand eq 'ENFOLD' }"><option value="ENFOLD">ENFOLD</option>                         </c:if><c:if test="${ product.product_brand ne 'ENFOLD' }"><option value="ENFOLD">ENFOLD</option>                         </c:if>
										<c:if test="${ product.product_brand eq 'ERIKA CAVALLINI' }"><option value="ERIKA CAVALLINI">ERIKA CAVALLINI</option>       </c:if><c:if test="${ product.product_brand ne 'ERIKA CAVALLINI' }"><option value="ERIKA CAVALLINI">ERIKA CAVALLINI</option>       </c:if>
										<c:if test="${ product.product_brand eq 'JOIE' }"><option value="JOIE">JOIE</option>                             </c:if><c:if test="${ product.product_brand ne 'JOIE' }"><option value="JOIE">JOIE</option>                             </c:if>
										<c:if test="${ product.product_brand eq 'JUCCA' }"><option value="JUCCA">JUCCA</option>                           </c:if><c:if test="${ product.product_brand ne 'JUCCA' }"><option value="JUCCA">JUCCA</option>                           </c:if>
										<c:if test="${ product.product_brand eq 'LOOKAST' }"><option value="LOOKAST">LOOKAST</option>                       </c:if><c:if test="${ product.product_brand ne 'LOOKAST' }"><option value="LOOKAST">LOOKAST</option>                       </c:if>
										<c:if test="${ product.product_brand eq 'LUCIO VANOTTI' }"><option value="LUCIO VANOTTI">LUCIO VANOTTI</option>           </c:if><c:if test="${ product.product_brand ne 'LUCIO VANOTTI'}"><option value="LUCIO VANOTTI">LUCIO VANOTTI</option>           </c:if>
										<c:if test="${ product.product_brand eq 'M. MARTIN' }"><option value="M. MARTIN">M. MARTIN</option>                   </c:if><c:if test="${ product.product_brand ne 'M. MARTIN' }"><option value="M. MARTIN">M. MARTIN</option>                   </c:if>
										<c:if test="${ product.product_brand eq 'MARIE SIXTINE' }"><option value="MARIE SIXTINE">MARIE SIXTINE</option>           </c:if><c:if test="${ product.product_brand ne 'MARIE SIXTINE' }"><option value="MARIE SIXTINE">MARIE SIXTINE</option>           </c:if>
										<c:if test="${ product.product_brand eq 'PIECE' }"><option value="PIECE">PIECE</option>                           </c:if><c:if test="${ product.product_brand ne 'PIECE' }"><option value="PIECE">PIECE</option>                           </c:if>
										<c:if test="${ product.product_brand eq 'RE;CODE' }"><option value="RE;CODE">RE;CODE</option>                       </c:if><c:if test="${ product.product_brand ne 'RE;CODE' }"><option value="RE;CODE">RE;CODE</option>                       </c:if>
										<c:if test="${ product.product_brand eq 'SWILDENS' }"><option value="SWILDENS">SWILDENS</option>                     </c:if><c:if test="${ product.product_brand ne 'SWILDENS' }"><option value="SWILDENS">SWILDENS</option>                     </c:if>
										<c:if test="${ product.product_brand eq 'TARA JARMON' }"><option value="TARA JARMON">TARA JARMON</option>               </c:if><c:if test="${ product.product_brand ne 'TARA JARMON' }"><option value="TARA JARMON">TARA JARMON</option>               </c:if>
										<c:if test="${ product.product_brand eq 'THE EDITOR' }"><option value="THE EDITOR">THE EDITOR</option>                 </c:if><c:if test="${ product.product_brand ne 'THE EDITOR' }"><option value="THE EDITOR">THE EDITOR</option>                 </c:if>
										<c:if test="${ product.product_brand eq 'TRUE NYC' }"><option value="TRUE NYC">TRUE NYC</option>                     </c:if><c:if test="${ product.product_brand ne 'TRUE NYC' }"><option value="TRUE NYC">TRUE NYC</option>                     </c:if>
								    </select>
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- Textarea -->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_textarea_descript">설명</label>
								  <div class="col-md-8">
								    <textarea id="i_textarea_descript" class="form-control" name="product_descript">${ product.product_descript }</textarea>
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_number_original_price">원가</label>  
								  <div class="col-md-8">
								  <input id="i_number_original_price" name="product_original_price" type="number" class="form-control input-md" value="${ product.product_original_price }">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_number_rent_price">대여 금액</label>  
								  <div class="col-md-8">
								  <input id="i_number_rent_price" name="rent_price" type="number" class="form-control input-md" value="${ product.rent_price }">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- Multiple Checkboxes (inline) -->
								<div class="form-group">
									  <label class="col-md-3 control-label" for="checkboxes">사이즈</label>
									  <div class="col-md-8">
									    <label class="checkbox-inline" for="i_checkbox_size_33">
									    <c:if test="${ product.product_size33 eq 0 }"><input id="i_checkbox_size_33" type="checkbox" name="product_size33" value="1"></c:if><c:if test="${ product.product_size33 eq 1 }"><input id="i_checkbox_size_33" type="checkbox" name="product_size33" value="1" checked></c:if>
									    33</label>
									    <label class="checkbox-inline" for="i_checkbox_size_44">
									    <c:if test="${ product.product_size44 eq 0 }"><input id="i_checkbox_size_44" type="checkbox" name="product_size44" value="1"></c:if><c:if test="${ product.product_size44 eq 1 }"><input id="i_checkbox_size_44" type="checkbox" name="product_size44" value="1" checked></c:if>
									    44</label>
									    <label class="checkbox-inline" for="i_checkbox_size_55">
									    <c:if test="${ product.product_size55 eq 0 }"><input id="i_checkbox_size_55" type="checkbox" name="product_size55" value="1"></c:if><c:if test="${ product.product_size55 eq 1 }"><input id="i_checkbox_size_55" type="checkbox" name="product_size55" value="1" checked></c:if>
									    55</label>
									    <label class="checkbox-inline" for="i_checkbox_checkbox_66">
									    <c:if test="${ product.product_size66 eq 0 }"><input id="i_checkbox_size_66" type="checkbox" name="product_size66" value="1"></c:if><c:if test="${ product.product_size66 eq 1 }"><input id="i_checkbox_size_66" type="checkbox" name="product_size66" value="1" checked></c:if>
									    66</label>
									    <label class="checkbox-inline" for="i_checkbox_size_77">
									    <c:if test="${ product.product_size77 eq 0 }"><input id="i_checkbox_size_77" type="checkbox" name="product_size77" value="1"></c:if><c:if test="${ product.product_size77 eq 1 }"><input id="i_checkbox_size_77" type="checkbox" name="product_size77" value="1" checked></c:if>
									    77</label>
									    <span class="help-block" style="color:red;"></span>
									  </div>
									  
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_text_color">색상</label>  
								  <div class="col-md-8">
								  <input id="i_text_color" name="product_color" type="text" class="form-control input-md" value="${ product.product_color }">
								  <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								<!-- File Button --> 
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_file_image1">이미지 파일</label>
								  <div class="col-md-8">
								    <input id="i_file_image1" name="filebutton1" class="input-file" type="file">
								    <input id="i_hidden_image1" name="n_hidden_image1" type="hidden" value="">
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- File Button --> 
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_file_image2">이미지 파일</label>
								  <div class="col-md-8">
								    <input id="i_file_image2" name="filebutton2" class="input-file" type="file">
								    <input id="i_hidden_image2" name="n_hidden_image2" type="hidden" value="">
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<!-- File Button --> 
								<div class="form-group">
								  <label class="col-md-3 control-label" for="i_file_image3">이미지 파일</label>
								  <div class="col-md-8">
								    <input id="i_file_image3" name="filebutton3" class="input-file" type="file">
								    <input id="i_hidden_image3" name="n_hidden_image3" type="hidden" value="">
								    <span class="help-block" style="color:red;"></span>
								  </div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label"></label>
									<div class="col-md-8" style="height:65px;">
										<div style="width:65px; height:65px; border:1px solid gray; display:inline-block;"><img id="i_img_image1" style="width:100%; height:100%; display:inline-block;" src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[0].product_image_path }" alt=""></div>
										<div style="width:65px; height:65px; border:1px solid gray; display:inline-block;"><img id="i_img_image2" style="width:100%; height:100%; display:inline-block;" src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[1].product_image_path }" alt=""></div>
										<div style="width:65px; height:65px; border:1px solid gray; display:inline-block;"><img id="i_img_image3" style="width:100%; height:100%; display:inline-block;" src="${ pageContext.request.contextPath }/resources/img_product/${ product.productImageList[2].product_image_path }" alt=""></div>
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
												    		$('#i_hidden_image1').val(this_image.val().split('\\').reverse()[0])
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
												    		$('#i_hidden_image2').val(this_image.val().split('\\').reverse()[0])
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
												    		$('#i_hidden_image3').val(this_image.val().split('\\').reverse()[0])
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
			$('#i_text_name').focus();
		});
	</script>

</body>
</html>