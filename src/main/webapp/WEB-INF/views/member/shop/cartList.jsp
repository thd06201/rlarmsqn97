<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">    
  <script src="/resources/jquery/jquery-3.3.1.min.js"></script>
  
  <title>Daily Shop | Home</title>

  <!-- Font awesome -->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/font-awesome.css"/>'>
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.css"/>'>
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/jquery.smartmenus.bootstrap.css"/>'>
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/jquery.simpleLens.css"/>'>
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/slick.css"/>'>
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/nouislider.css"/>'>
    <!-- Theme color -->
    <link rel="stylesheet"  href='<c:url value="/resources/css/theme-color/default-theme.css"/>'>
    <!-- Top Slider CSS -->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/sequence-theme.modern-slide-in.css"/>'>
    <!-- Main style sheet -->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/style.css"/>'>
    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<style >
	.allCheck { float:left; width:200px; }
	.allCheck input { width:16px; height:16px; }
	.allCheck label { margin-left:10px; }
	.delBtn { float:right; width:300px; text-align:right; }
	.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}

	.checkBox { float:left; width:30px; }
	.checkBox input { width:16px; height:16px; }

	.listResult { padding:20px; background:#eee; }
	.listResult .sum { float:left; width:45%; font-size:22px; }

	.listResult .orderOpne { float:right; width:45%; text-align:right; }
	.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
	.listResult::after { content:""; display:block; clear:both; }
	
	.orderInfo { border:5px solid #eee; padding:20px; display:none; }
	.orderInfo .inputArea { margin:10px 0; }
	.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
	.orderInfo .inputArea input { font-size:14px; padding:5px; }
	#userAddr2, #userAddr3 { width:250px; }
	
	.orderInfo .inputArea:last-child { margin-top:30px; }
	.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}

</style>
  </head>
  <body> 
   
<div>
<%@ include file="../../include/header.jsp" %>
</div>

 <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
   <img src="/resources/img/fashion/fashion-header-bg-8.jpg" alt="fashion img">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Cart Page</h2>
        <ol class="breadcrumb">
          <li><a href="/">Home</a></li>                   
          <li class="active">Cart</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->


<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>

<!-- Cart view section -->
 <section id="cart-view">
   <div class="container">
     <div class="row">
      
       <div class="col-md-12">
         <div class="cart-view-area">
           <div class="cart-view-table">
               <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>선택</th>
                        <th>이미지</th>
                        <th>상품</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>합계</th>
                        <th>삭제</th>
                      </tr>
                    </thead>
                    
                    <ul>
 					<li>
 					 <div class="allCheck">
  						 <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
					 <script>
						$("#allCheck").click(function(){
 						var chk = $("#allCheck").prop("checked");
 						if(chk) {
 						 $(".chBox").prop("checked", true);
 						} else {
  						$(".chBox").prop("checked", false);
						 }
						});
					</script>
					 </div>
  
 					 <div class="delBtn">
 				     	<button type="button" class="selectDelete_btn">삭제</button> 
  					
  					<script>
					 $(".selectDelete_btn").click(function(){
					  var confirm_val = confirm("정말 삭제하시겠습니까?");
					  
					  if(confirm_val) {
					   var checkArr = new Array();
					   
					   $("input[class='chBox']:checked").each(function(){
					    checkArr.push($(this).attr("data-cartNum"));
					   });
					    
					   $.ajax({
						   url : "/shop/deleteCart",
						   type : "post",
						   data : { chbox : checkArr },
						   success : function(result){
						    if(result == 1) {          
						     location.href = "/shop/cartList";
						    } else {
						     alert("삭제 실패");
						    }
						   }
						  });
						 } 
					  });
					</script>	
  					</div>
					 </li>
					</ul>

					
                    <c:set var="sum" value="0" />
                    <c:forEach items="${cartList}" var="cartList">
                    <tbody>
                      <tr>
                        <td>
                        <div class = "checkBox">
                        	<input type = "checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}"/>
                       <script>
						 $(".chBox").click(function(){
 						 $("#allCheck").prop("checked", false);
						 });
						</script>
                        </div>
                        </td>
                        
                        <div class="gdsInfo">
                  
                        <fmt:formatDate value="${cartList.gdsDate}" pattern="yyyy/MM/dd" var="datePath"/>
                        
                        <td><a href="#"> <img src="<c:url value="/resources/imgUpload/${datePath}/${cartList.gdsImg}"/>" alt="img">  
                        </a></td>
                         <td><a class="aa-cart-title" href="#">${cartList.gdsName}</a></td>
                        <td>${cartList.gdsPrice}</td>
                          <td><a class="aa-cart-quantity"  href="#">${cartList.cartStock}</a></td>
                         <td> <fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" />	
                    	</td>
                    	<td>
                    	<div class="delete">
								<button type="button" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button>
								
								<script>
									$(".delete_${cartList.cartNum}_btn").click(function(){
										var confirm_val = confirm("정말 삭제하시겠습니까?");
										
										if(confirm_val) {
											var checkArr = new Array();
											
											checkArr.push($(this).attr("data-cartNum"));
																						
											$.ajax({
												url : "/shop/deleteCart",
												type : "post",
												data : { chbox : checkArr },
												success : function(result){
													if(result == 1) {												
														location.href = "/shop/cartList";
													} else {
														alert("삭제 실패");
													}
												}
											});
										}	
									});
								</script>
							</div></td>
							</div>

                    		
                    	
                      </tr>
                      </tbody>
                      
                      <c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
                 	    <input type="hidden" name="gdsNum" value="${cartList.gdsNum}">
                      	<input type="hidden" name="stock" value="${cartList.cartStock}">
                     </c:forEach>
                  </table>
                </div>

			<div class="listResult">
				<div class="sum">
						총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				</div>
				
				<div class="orderOpne">
				<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
				
				<script>
				 $(".orderOpne_bnt").click(function(){
				  $(".orderInfo").slideDown();
				  $(".orderOpne_bnt").slideUp();
				 });      
				</script>

				</div>
				
			</div>

					 <div class="orderInfo">
 						<form role="form" method="post" autocomplete="off">
    
  						<input type="hidden" name="amount" value="${sum}" />
  						
  						
    
  						<div class="inputArea">
   						<label for="">수령인</label>
   						<input type="text" name="orderRec" id="orderRec" required="required" />
  						</div>
  
						<div class="inputArea">
							<label for="orderPhon">수령인 연락처</label>
						    <input type="text" name="orderPhon" id="orderPhon" required="required" />
						</div>
						
  						
					  <div class="inputArea">
					
						<p>
							<label for="">주소</label>
							<input type="text" id="sample2_postcode" placeholder="우편번호">
							<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
						</p>
						<p>
							<input type="text" name="userAddr1" id="sample2_address" placeholder="주소" >
							<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
							<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목">
						</p>
						
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
						    // 우편번호 찾기 화면을 넣을 element
						    var element_layer = document.getElementById('layer');
						
						    function closeDaumPostcode() {
						        // iframe을 넣은 element를 안보이게 한다.
						        element_layer.style.display = 'none';
						    }
						
						    function sample2_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }
						
						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("sample2_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample2_extraAddress").value = '';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample2_postcode').value = data.zonecode;
						                document.getElementById("sample2_address").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("sample2_detailAddress").focus();
						
						                // iframe을 넣은 element를 안보이게 한다.
						                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						                element_layer.style.display = 'none';
						            },
						            width : '100%',
						            height : '100%',
						            maxSuggestItems : 5
						        }).embed(element_layer);
						
						        // iframe을 넣은 element를 보이게 한다.
						        element_layer.style.display = 'block';
						
						        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
						        initLayerPosition();
						    }
						
						    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
						    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
						    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
						    function initLayerPosition(){
						        var width = 300; //우편번호서비스가 들어갈 element의 width
						        var height = 400; //우편번호서비스가 들어갈 element의 height
						        var borderWidth = 5; //샘플에서 사용하는 border의 두께
						
						        // 위에서 선언한 값들을 실제 element에 넣는다.
						        element_layer.style.width = width + 'px';
						        element_layer.style.height = height + 'px';
						        element_layer.style.border = borderWidth + 'px solid';
						        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
						        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
						        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
						    }
						</script>
					</div>
					  
					  
					  
					  <div class="inputArea">
					   <button type="submit" class="order_btn">주문</button>
					   <button type="button" class="cancel_btn">취소</button> 
					   
						<script>
						$(".cancel_btn").click(function(){
						 $(".orderInfo").slideUp();
						 $(".orderOpne_bnt").slideDown();
						});      
						</script>					   
					   
					  </div>
					  
					 </form> 
					</div>


							<!-- Cart Total view -->
   <!--           <div class="cart-view-total">
               <h4>Cart Totals</h4>
               <table class="aa-totals-table">
                 <tbody>
                   <tr>
                     <th>총합</th>
                     <td>백마넌너
                    	</td> 
                   </tr>
                 </tbody>
                 
               </table>
               <a href="#" class="aa-cart-view-btn">구매하기</a>
             </div> -->
          
           </div>
         </div>
       </div>
     </div>
   </div>
   </div>
 </section>
 <!-- / Cart view section -->

<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>


<!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src='<c:url value="/resources/js/bootstrap.js"/>'></script>  
    <!-- SmartMenus jQuery plugin -->
    <script type="text/javascript" src='<c:url value="/resources/js/jquery.smartmenus.js"/>'></script>
    <!-- SmartMenus jQuery Bootstrap Addon -->
    <script type="text/javascript" src='<c:url value="/resources/js/jquery.smartmenus.bootstrap.js"/>'></script>  
    <!-- To Slider JS -->
    <script src='<c:url value="/resources/js/sequence.js"/>'> </script>
    <script src='<c:url value="/resources/js/sequence-theme.modern-slide-in.js"/>'></script>  
    <!-- Product view slider -->
    <script type="text/javascript" src='<c:url value="/resources/js/jquery.simpleGallery.js"/>'></script>
    <script type="text/javascript" src='<c:url value="/resources/js/jquery.simpleLens.js"/>'></script>
    <!-- slick slider -->
    <script type="text/javascript" src='<c:url value="/resources/js/slick.js"/>'></script>
    <!-- Price picker slider -->
    <script type="text/javascript" src='<c:url value="/resources/js/nouislider.js"/>'></script>
    <!-- Custom js -->
    <script src='<c:url value="/resources/js/custom.js"/>'></script> 
    
<div>
<%@ include file="../../include/footer.jsp" %>
</div>    

</body>
</html>