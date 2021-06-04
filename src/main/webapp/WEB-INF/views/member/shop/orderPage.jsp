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



<!-- Cart view section -->
      <section id="cart-view">
         <br><br><br><br><br><br>
         <div class="container">
            <a href="return.html" class="aa-cart-view-btn col-md-6">취소/반품(1)</a>      
            <a href="order.html" class="aa-cart-view-btn col-md-6">주문 내역 조회(2)</a> 
         </div>   
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="cart-view-area">
                     <div class="cart-view-table">
                        <form action="">
                           <div class="table-responsive">
                              <table class="table">
                                 <thead>
                                    <tr>
                                       <th>주문ID</th>
                                       <th>이미지</th>
                                       <th>상품정보</th>
                                       <th>가격</th>
                                       <th>수량</th>
                                       <th>총금액</th>
                                       <th>주문처리상태</th>
                                       <th>취소/반품</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                  	
                  	
                                 
									<c:forEach items="${orderList}" var="List">
                                    <tr>
                                       <td>${List.getOrderId()}</td>
                                       <td>
                                       <a href="#"><fmt:formatDate value="${List.gdsDate}" pattern="yyyy/MM/dd" var="datePath"/>
                              		   <img src="<c:url value="/resources/imgUpload/${datePath}/${List.gdsImg}"/>" alt="img"></a>
                              		   </td>
                                       <td>${List.gdsName}</td> <!-- 상품이름 -->
                                       <td>${List.gdsPrice}</td><!-- 상품가격 -->
                                       <td>${List.gdsStock}</td>
                                       <td>${List.amount}</td>
                                       <td>배송중</td>
                                       <td><a href="return.html" class="aa-cart-view-btn">취소/반품</a></td>
                                    </tr>
                                   </c:forEach>

                                 </tbody>
                              </table>
                           </div>
                        </form>

                        <a href="/" class="aa-cart-view-btn col-md-2 col-md-pull-5">홈으로</a>

                     </div>
                  </div>
               </div>
            </div>
         <br><br><br><br>   </div>
         <br><br><br><br></div>
      </section>



<div>
<%@ include file="../../include/footer.jsp" %>
</div>  

 

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