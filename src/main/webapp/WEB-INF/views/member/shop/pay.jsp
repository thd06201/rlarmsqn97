<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Daily Shop | Checkout Page</title>
    
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
    

  </head>
  <body>  

    <div id="wpf-loader-two">          
      <div class="wpf-loader-two-inner">
        <span>Loading</span>
      </div>
    </div> 
    <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>



<!-- menu -->
<section id="menu">
<h2 style="background-color:white;">
  <div class="container">
    <div class="menu-area">
      <!-- Navbar -->
      <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>          
        </div>
        <div class="navbar-collapse collapse">
          <!-- Left nav -->
          <ul class="nav navbar-nav">
            <h2 style="color:black;">F#(플라워 샵)</h2>
            
        <ol class="breadcrumb" style="background-color:#FF1493;">
          <li style="font-size:20px; color:white; ">주문</li>                   
          <li class="active" style="font-size:20px; color:white;">결제</li>
        </ol>
          </ul>
</div><!--/.nav-collapse -->
</div>
</div>       
</div>
</section>
<!-- / catg header banner section -->


 <!-- Cart view section -->
 <section id="checkout">
   <div class="container-fluid">
     <div class="row">
     <div style="position: relative; right: -120px;">
       <div class="col-md-11">
        <div class="checkout-area">
          <form action="/shop/logPayment" method="post">
            <div class="row">
              <div class="col-md-8 ">
               <div class="checkout-left">
                <div style="position: relative; right: -250px;" class="panel-group" id="accordion">	
                  <div class="panel-group" id="accordion">
                  
                   <fmt:formatDate value="${productdetail.gdsDate}" pattern="yyyy-MM-dd" var="datePath"/>	
                      
                  
                  
                  	<form role="form" method="post" autocomplete="off">
                  	
                     <!-- 주문자 -->
                    <div class="panel panel-default aa-checkout-coupon">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            주문자
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                        
                        <div class="row">
                            <div class="col-md-12">
                              <div class="aa-checkout-single-bill">
                       이름&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type="text" name="orderRec" placeholder="받는 사람*"></br>
                       이메일&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  <input type="text" name="userId" placeholder="이메일">
                            휴대전화 &nbsp&nbsp<input type="text" name="orderPhon" placeholder="휴대전화*"></br>
                        </div>
                      </div>
                    </div>
                    
                    </div>
                    </div>
                    </div>
                    
                   
                    <!-- 배송지 -->
                    <div class="panel panel-default aa-checkout-billaddress">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                            배송지
                          </a>
                        </h4>
                      </div>
                      
                      <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                        
                          
                          
                          <div class="row">
                            <div class="col-md-12">
                              <div class="aa-checkout-single-bill">
                              <p>
							<input type="text" id="sample2_postcode" placeholder="우편번호">
							<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
						</p>
						<p>
							<input type="text" name="userAddr1" id="sample2_address" placeholder="주소" >
							<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
							<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목">
						</p>
						
						
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
                            </div>                            
                          </div>   
                         
                         
                          
                          <div class="row">
                            <div class="col-md-12">
                              <div class="aa-checkout-single-bill">
                                <select>
                                  <option value="0">--메세지 선택(선택사항)--</option>
                                  <option value="1">배송 전에 미리 연락바랍니다.</option>
                                  <option value="2">부재 시 경비실에 맡겨주세요.</option>
                                  <option value="3">부재 시 문 앞에 놓아주세요.</option>
                                  <option value="4">빠른 배송 부탁드립니다.</option>
                                  <option value="5">택배함에 보관해 주세요.</option>
                                  <option value="6">직접 입력</option>
                                </select>
                              </div>                             
                            </div>                            
                          </div>  
                          
                        </div>
                      </div>
                    </div>
                    
                    
                    
                    <!-- 주문상품 -->
                    <div class="panel panel-default aa-checkout-billaddress">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                            주문상품
                          </a>
                        </h4>
                      </div>
                      <div id="collapseFive" class="panel-collapse collapse">
                        <div class="panel-body">
                          <div class="row">
                            <div class="col-md-12">
                              <div class="aa-checkout-single-bill">
                              <fmt:formatDate value="${productdetail.gdsDate}" pattern="yyyy/MM/dd" var="datePath"/>
                              <img src="<c:url value="/resources/imgUpload/${datePath}/${productdetail.gdsImg}"/>" alt="img">  
                                <input type="text" value="주문상품 : ${productdetail.gdsName}"class="aa-coupon-code" > 
                                <input type="text" value="가격 : ${productdetail.gdsPrice}"class="aa-coupon-code" > 
                                <input type="text" value="수량 : ${stock}"class="aa-coupon-code" > 
                                <input type="hidden" name="gdsNum" value="${param.gdsNum}">
                                <input type="hidden" name="gdsName" value="${productdetail.gdsName}">
                                <input type="hidden" name="gdsPrice" value="${productdetail.gdsPrice}">
                                <input type="hidden" name="gdsStock" value="${stock}">
                                
                             </div>                             
                            </div>                            
                          </div>              
                        </div>
                      </div>
                    </div>
                    
                    <!-- 결제정보 -->
                    <div class="panel panel-default aa-checkout-coupon">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                            결제정보
                          </a>
                        </h4>
                      </div>
                      <div id="collapseSix" class="panel-collapse collapse in">
                      	 <div class="panel-body">
                      	 <input type="hidden" name="amount" value="${productdetail.gdsPrice * stock}">
                          <input type="text" value="총 결제금액 : ${productdetail.gdsPrice * stock}" class="aa-coupon-code"style="background-color: #e2e2e2;">
                        </div>
                        </div>
                        </div>
                         </form>
                       
                    
                     <!-- 결제수단 -->
                    <div class="panel panel-default aa-checkout-billaddress">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">
                            결제수단
                          </a>
                        </h4>
                      </div>
                      <div id="collapseSeven" class="panel-collapse collapse">
                        <div class="panel-body">
                          <div class="row">
                            <div class="col-md-6">
                              <div class="aa-checkout-single-bill">
                                <input type="text" value="결제수단 선택" style="background-color: #e2e2e2;">
                                 <div class="aa-payment-method">  
                                 <!--                  
                    <label for="cashdelivery"><input type="radio" id="cashdelivery" name="optionsRadios"> Cash on Delivery </label>
                    <label for="paypal"><input type="radio" id="paypal" name="optionsRadios" checked> Via Paypal </label>-->  
                    <img src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg" border="0" alt="PayPal Acceptance Mark">    
                    <input type="submit" value="결제하기" class="aa-browse-btn">                
                  </div>
                             	 
                              
                              </div>                             
                            </div>
                          </div>               
                        </div>
                      </div>
                      
                    </div>
                    
                  </div>
                </div>
              </div>
                    
          
            </div>
            </div>
          </form>
         </div>
       </div>
     </div>
   </div>
  
   
    
                    
                    
                    
                    
        
            </div>
 </section>
 <!-- / Cart view section -->



 


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
    
  </body>
</html>

