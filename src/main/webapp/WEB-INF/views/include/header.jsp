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
  <title>Flower Shop | Home</title>

    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/font-awesome.css"/>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.css"/>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/jquery.smartmenus.bootstrap.css"/>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/jquery.simpleLens.css"/>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/slick.css"/>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/nouislider.css"/>'>
    <link rel="stylesheet"  href='<c:url value="/resources/css/theme-color/default-theme.css"/>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/sequence-theme.modern-slide-in.css"/>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/style.css"/>'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>


</head>
<body>

 <!-- wpf loader Two -->
   <div id="wpf-loader-two">          
    <div class="wpf-loader-two-inner">
      <span>Loading</span>
    </div>
  </div> 
  
  <!-- SCROLL TOP BUTTON -->
  <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->
  
  
  
   <!-- Start header section -->
  <header id="aa-header">
  
 
 <div>
<%@ include file="nav.jsp" %>
</div>
  
  

<!-- start header bottom  -->
<div class="aa-header-bottom">
  <div class="container">
    <div class="row" style="margin-top:-10%;">
      <div class="col-ld-12">
        <div class="aa-header-bottom-area">
          <!-- logo  -->
            <div class wrapper="aa-logo">
            <div style="position: relative;  right: -520px; bottom:-120px;">
            <!-- Text based logo -->
            <a href="/"><img src="/resources/img/logo.jpg" alt="img"></a>
           </div>
              </div>
              <!-- / logo  -->
          
          <div style="position: relative; bottom: -15px; left: -200px; "  > 
			<form>
 				 <select name="kind" >
				    <option value="none">=== 종류별 ===</option>
				    <option value="korean">꽃다발</option>
				    <option value="english">꽃바구니</option>
				    <option value="chinese">커스터마이징</option>
 				 </select>
			</form>
		  </div>
		  <div style="position: relative; bottom: -20px; left: -200px; "  > 
			<form>
 				 <select name="price" >
				    <option value="none">=== 가격별 ===</option>
				    <option value="korean">10,000원 이상</option>
				    <option value="english">100,000원 이상</option>
				    <option value="chinese">200,000원 이상</option>
				    <option value="spanish">300,000원 이상</option>
 				 </select>
			</form>
		  </div>
	      <input type=button style="position: relative; WIDTH: 46pt; HEIGHT: 37pt; bottom: 30px; right: 50px; background-color:#FF1493; color:white" value="검색">

			<div style="position: relative; bottom: 1px; right: -300px; " class="aa-cartbox" > 
          <div class="aa-cartbox">
                <a class="aa-cart-link" href="#">
                  <span class="fa fa-shopping-basket"></span>
                  <span class="aa-cart-title">SHOPPING CART</span>
                  <span class="aa-cart-notify">2</span>
                </a>
                <div class="aa-cartbox-summary">
                  <ul>
					<c:forEach items="${cartList}" var="cartList">
                    <li>
                    <fmt:formatDate value="${cartList.gdsDate}" pattern="yyyy/MM/dd" var="datePath" />
                      <a class="aa-cartbox-img" href="#"><img src="<c:url value="/resources/imgUpload/${datePath}/${cartList.gdsImg}"/>" alt="img"></a>
                      <div class="aa-cartbox-info">
                      
                        <h4><a href="#">${cartList.gdsName}</a></h4>
                        <p>${cartList.cartStock} x ${cartList.gdsPrice}</p>
                      </div>
                      <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
                    
                    </li>
                                   
                    <li>
                      <span class="aa-cartbox-total-title">
                        Total
                      </span>
                      <span class="aa-cartbox-total-price">
                        <fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" />
                      </span>
                    </li>
                    </c:forEach>
                  </ul>
                  <a class="aa-cartbox-checkout aa-primary-btn" href="/shop/cartList">Checkout</a>
                </div>
              </div>        
              </div>
              
              <div style="position: relative; bottom: 10px; right: -300px; " class="aa-search-box" > 
             <form method="POST" action="/shop/productSearch" id ="search" name="search">
              <div class="aa-search-box">
              	
                  <input type="text" name="keyword" id="keyword" name="keyword" placeholder=" '하트뿅뿅' ">
                  <button type="button" style="background-color:#FF1493;"><span class="fa fa-search" ></span></button>
              </div>
              </form>
              </div>
              
              
        </div>
      </div>
    </div>
  </div>
</div>
<!-- / header bottom  -->
</header>
<!-- / header section -->
<!-- menu -->
<section id="menu">
<h2 style="background-color:#FF1493;"></h2>
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
          	<li style="margin-left: 100px;"><a href="/">HOME</a></li>
            <li style="margin-left: 200px;"><a href="/shop/cu">CustoMize</a></li>

            <li style="margin-left: 200px;"><a href="/shop/flower?c=101&c=102">꽃다발 <span class="caret"></span></a>
              <ul class="dropdown-menu">                
                <li><a href="/shop/flower?c=101">일반꽃다발</a></li>
                <li><a href="/shop/flower?c=102">대형꽃다발</a></li>
              </ul>
            
            <li style="margin-left: 200px;"><a href="/shop/flower?c=201&c=202">꽃바구니 <span class="caret"></span></a>
              <ul class="dropdown-menu">                              
                <li><a href="/shop/flower?c=201">일반꽃바구니</a></li>              
                <li><a href="/shop/flower?c=202">대형꽃바구니</a></li>
              </ul>
            </li>
          </ul>
        </li>
      </ul>
    </li>
  </ul>
</li>
</ul>
</div><!--/.nav-collapse -->
</div>
</div>       
</div>
</section>
<!-- / menu -->

<!-- Start slider -->
       
               
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
                        

