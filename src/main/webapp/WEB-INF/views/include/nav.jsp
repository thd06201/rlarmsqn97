<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">    
  <title>Flower Shop | Home</title>

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



               
               
             

               
       
            

<div class="aa-header-top">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-top-area">
              <!-- start header top left -->
              <div style="position: relative; left: -250px;">
              <div class="aa-header-top-left">



<ul>
<c:if test="${member == null}">



<div class="cellphone hidden-xs"> 
  <p><a href="/member/signin" style="position: relative; bottom: -4px;  font-size:19px;">로그인 </a></p>
</div>
 

<div class="cellphone hidden-xs">
 <p><a href="/member/signup" style="position: relative; bottom: -4px;  font-size:19px;">회원가입 </a></p>
</div>

<div class="cellphone hidden-xs">
 <p><a href="/shop/cartList" style="position: relative; bottom: -4px;  font-size:19px;">장바구니 </a></p>
 </div>
 
 <div class="cellphone hidden-xs">
 <p><a href="/board/listPageSearch?num=1" style="position: relative; bottom: -4px;  font-size:19px;">리뷰 </a></p>
 </div>

  <div class="aa-language">
      <div class="dropdown">
          <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="font-size:19px;">
             커뮤니티
             <span class="caret"></span>
         </a>
         <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
         <li><a href="returnn" style="font-size:19px;"> 주문내역</a></li>
         <li><a href="cart" style="font-size:19px;">장바구니</a></li>
         <li><a href="#" style="font-size:19px;">내가 쓴 리뷰</a></li>
         </ul>
      </div>
  </div>



</c:if>

<c:if test="${member != null}">

<c:if test="${member.verify == 9}">

<div class="cellphone hidden-xs">
 <p><a href="/admin/index" style="position: relative; bottom: -4px;  font-size:19px;">관리자 화면 </a></p>
</div>
</c:if>

<div class="cellphone hidden-xs">
 <p><a href="/member/signout" style="position: relative; bottom: -4px;  font-size:19px;">로그아웃 </a></p>
</div> 
 
<div class="cellphone hidden-xs"> 
 <p><a href="/shop/cartList" style="position: relative; bottom: -4px;  font-size:19px;">장바구니 </a></p>
</div> 
 <div class="cellphone hidden-xs">
 <p><a href="/board/listPageSearch?num=1" style="position: relative; bottom: -4px;  font-size:19px;">리뷰 </a></p>
 </div>
 
 <div class="cellphone hidden-xs">
 <p><a href="/shop/orderPage" style="position: relative; bottom: -4px;  font-size:19px;">주문 </a></p>
 </div>
 



  <div class="aa-language">
      <div class="dropdown">
          <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="font-size:19px;">
             회원정보
             <span class="caret"></span>
          </a>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
          <li><a href="/member/modify" style="font-size:19px;"> 정보수정</a></li>
          <li><a href="/member/withdrawal" style="font-size:19px;">회원탈퇴</a></li>
          </ul>
      </div>
  </div>
  

  
  <div class="aa-language">
      <div class="dropdown">
          <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="font-size:19px;">
             마이페이지
             <span class="caret"></span>
         </a>
         <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
         <li><a href="returnn" style="font-size:19px;"> 주문내역</a></li>
         <li><a href="cart" style="font-size:19px;">장바구니</a></li>
         <li><a href="#" style="font-size:19px;">내가 쓴 리뷰</a></li>
         </ul>
      </div>
  </div>
  
  <div class="aa-language">
      <div class="dropdown">
          <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="font-size:19px;">
             커뮤니티
             <span class="caret"></span>
         </a>
         <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
         <li><a href="returnn" style="font-size:19px;"> 주문내역</a></li>
         <li><a href="cart" style="font-size:19px;">장바구니</a></li>
         <li><a href="#" style="font-size:19px;">내가 쓴 리뷰</a></li>
         </ul>
      </div>
  </div>

</c:if>
</ul>

  </div>
  </div>
   
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header top  -->

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