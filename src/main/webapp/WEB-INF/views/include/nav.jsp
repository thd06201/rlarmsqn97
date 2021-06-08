<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="aa-header-top">
      <div class="container">
        <div class="row" style="margin-top:0%;">
          <div class="col-md-12">
 
  <div class="aa-header-top-area">
              <!-- start header top left -->
              <div style="position: relative; left: -250px;">
              <div class="aa-header-top-left">



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

  <div class="aa-language">
      <div class="dropdown">
          <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="font-size:19px;">
             커뮤니티
             <span class="caret"></span>
         </a>
         <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
         <li><a href="/shop/orderList" style="font-size:19px;"> 주문내역</a></li>
         <li><a href="/shop/orderView" style="font-size:19px;"> 상세주문내역</a></li>
         <li><a href="/board/listPageSearch?num=1" style="font-size:19px;">리뷰</a></li>
         </ul>
      </div>
  </div>

</c:if>

<c:if test="${member != null}">

<c:if test="${member.verify == 9}">

<div class="cellphone hidden-xs">
 <p><a href="/admin/index2" style="position: relative; bottom: -4px;  font-size:19px;">관리자 화면 </a></p>
</div>
</c:if>

<div class="cellphone hidden-xs">
 <p><a href="/member/signout" style="position: relative; bottom: -4px;  font-size:19px;">로그아웃 </a></p>
</div> 
<div class="cellphone hidden-xs">
 <p><a href="/shop/cartList" style="position: relative; bottom: -4px;  font-size:19px;">장바구니 </a></p>
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
         <li><a href="/shop/orderList" style="font-size:19px;"> 주문내역</a></li>
         <li><a href="/shop/orderView" style="font-size:19px;"> 상세주문내역</a></li>
         <li><a href="cartList" style="font-size:19px;">장바구니</a></li>
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
         <li><a href="/board/listPageSearch?num=1" style="font-size:19px;">Q&A</a></li>
         <li><a href="/board/listPageSearch?num=1" style="font-size:19px;">리뷰</a></li>
         </ul>
      </div>
  </div>

</c:if>

  </div>
  </div>
   
            </div>
  
   </div>
        </div>
      </div>
    </div>
         
    <!-- / header top  -->

