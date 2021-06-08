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

   
  

  </head>
  <body>  

    <div>
<%@ include file="../../include/header.jsp" %>
</div>  

 
 

  <!-- product category -->
  <section id="aa-product-details">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-product-details-area">
            <div class="aa-product-details-content">
              <div class="row">
               <input type="hidden" name="n" value="${productdetail.gdsNum}"/>
                <!-- Modal view slider -->
                <div class="col-md-5 col-sm-5 col-xs-12">                              
                  <div class="aa-product-view-slider">                                
                    <div id="demo-1" class="simpleLens-gallery-container">
                      <div class="simpleLens-container">
                        <div class="simpleLens-big-image-container">
                        <fmt:formatDate value="${productdetail.gdsDate}" pattern="yyyy/MM/dd" var="datePath"/>	
                        <a data-lens-image="/resources/imgUpload/${datePath }/${productdetail.gdsImg}" class="simpleLens-lens-image">
                        <img src='<c:url value="/resources/imgUpload/${datePath }/${productdetail.gdsImg}"/>' class="simpleLens-big-image"/>
                        </a>
                        </div>
                      </div>
                      
                    </div>
                  </div>
                </div>
                <!-- Modal view content -->
                <div class="col-md-7 col-sm-7 col-xs-12">
                  <div class="aa-product-view-content">
                    <h3> ${productdetail.gdsName} </h3>
                    <div class="aa-price-block">
                      <span class="aa-product-view-price">상품 가격 :    ${productdetail.gdsPrice}</span>
                    </div>
                    <h4>Size</h4>
                    <div class="aa-prod-view-size">
                      <a href="#">S</a>
                      <a href="#">M</a>
                      <a href="#">L</a>
                      <a href="#">XL</a>
                    </div>
                    
                    <form id="numForm" action="/shop/pay" method="post">
                      	<input type="hidden" name="gdsNum" value="${productdetail.gdsNum}">
                    
                    <div class="aa-prod-quantity">
                          <p class="aa-prod-category">수량선e택:</p>
                    <select id="stock" name="stock">
                          <c:forEach begin="1" end="${productdetail.gdsStock }" step="1" var="i">
                          	<option value="${i}">${i}</option>
                          </c:forEach>
                      </select>
                    </div>
                    </form> 
                    <div class="aa-prod-view-bottom">
                       <button type="button" class="aa-add-to-cart-btn">장바구니 </button>
                       
                       <script>
 						 $(".aa-add-to-cart-btn").click(function(){
   							var gdsNum = ${productdetail.gdsNum};
   							var cartStock = $("#stock").val();
   							
   							console.log("gdsNum : " + gdsNum);
   							console.log("cartStock : " + cartStock);
      
   							var data = {
     							gdsNum : gdsNum,
     							cartStock : cartStock
     						};
   
 						  $.ajax({
    						url : "/shop/productdetail/addCart",
    						type : "post",
    						data : data,
    						success : function(result){
    	
    						if(result == 1) {	
     							alert("장바구니 담기 성공");alert("장바구니로 이동하시겠습니까?");
     							$(".numBox").val("1");
     							
     							window.location.href = "/shop/cartList";
    						} else {
    							alert("회원만 사용할 수 있습니다.")
    							$(".numBox").val("1");
    							window.location.href = "/member/signin";

   							}
    					},
   						error : function(){
    						alert("장바구니 담기 실패");
  						}
  					});
				});
			 </script>
                      <a class="aa-add-to-cart-btn" onclick="$('#numForm').submit();" }>바로구매</a>
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="aa-product-details-bottom">
              <ul class="nav nav-tabs" id="myTab2">
                <li><a href="#description" data-toggle="tab">상품상세보기</a></li>
                <li><a href="#review" data-toggle="tab">상품후기</a></li> 
                <li><a href="#review" data-toggle="tab">Q&A</a></li>                
              </ul>

              <!-- Tab panes -->
              <div class="tab-content">
                <div class="tab-pane fade in active" id="description">
                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                  <ul>
                    <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, culpa!</li>
                    <li>Lorem ipsum dolor sit amet.</li>
                    <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>
                    <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor qui eius esse!</li>
                    <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, modi!</li>
                  <h3> ${productdetail.gdsDes} </h3>
                  </ul>
                </div>
                <div class="tab-pane fade " id="review">
                 <div class="aa-product-review-area">
                   <h4>${productdetail.gdsName} 상품의 리뷰</h4> 
                   <c:forEach items="${list1}" var="list1">
                   <ul class="aa-review-nav">
                     <li>
                        <div class="media">
                          <div class="media-left">
                            <a href="#">
                            
                        	<fmt:formatDate value="${list1.gdsDate}" pattern="yyyy/MM/dd" var="datePath" />
                            <img class="media-object" src="<c:url value="/resources/imgUpload/${datePath}/${list1.gdsImg}"/>" alt="img">
                            </a>
                          </div>
                          <div class="media-body">
                            <h4 class="media-heading"><strong>${list1.userId}</strong> - <span>${list1.regDate}</span></h4>
                            <div class="aa-product-rating">
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star-o"></span>
                            </div>
                            <p><span>${list1.content}</span></p>
                          </div>
                        </div>
                      </li>
                   </ul>
                   </c:forEach>
                   <h4>리뷰 작성하기</h4>
                   <div class="aa-your-rating">
                     <p>Your Rating</p>
                     <a href="#"><span class="fa fa-star-o"></span></a>
                     <a href="#"><span class="fa fa-star-o"></span></a>
                     <a href="#"><span class="fa fa-star-o"></span></a>
                     <a href="#"><span class="fa fa-star-o"></span></a>
                     <a href="#"><span class="fa fa-star-o"></span></a>
                   </div>
                   <!-- review form -->
                   <form action="" class="aa-review-form">
                      <div class="form-group">
                        <label for="message">Your Review</label>
                        <textarea class="form-control" rows="3" id="message"></textarea>
                      </div>
                      <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Name">
                      </div>  
                      <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="example@gmail.com">
                      </div>

                      <button type="소감남기기" class="btn btn-default aa-review-submit">Submit</button>
                   </form>
                 </div>
                </div>            
              </div>
            </div>
            <!-- Related product -->
            <div class="aa-product-related-item">
              <h3>Related Products</h3>
              <ul class="aa-product-catg aa-related-item-slider">
                <!-- start single product item -->
                <li>
                  <figure>
                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-2.png" alt="polo shirt img"></a>
                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                     <figcaption>
                      <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                      <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                    </figcaption>
                  </figure>                     
                  <div class="aa-product-hvr-content">
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                  </div>
                  <!-- product badge -->
                  <span class="aa-badge aa-sale" href="#">SALE!</span>
                </li>
                 <!-- start single product item -->
               
                <!-- start single product item -->
                
                <!-- start single product item -->
                <li>
                  <figure>
                    <a class="aa-product-img" href="#"><img src="img/women/girl-3.png" alt="polo shirt img"></a>
                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                     <figcaption>
                      <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                      <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                    </figcaption>
                  </figure>                     
                  <div class="aa-product-hvr-content">
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                  </div>
                </li>
                <!-- start single product item -->
                <li>
                  <figure>
                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-1.png" alt="polo shirt img"></a>
                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                    <figcaption>
                      <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                      <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                    </figcaption>
                  </figure>                      
                  <div class="aa-product-hvr-content">
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                  </div>
                </li>
                <!-- start single product item -->
                <li>
                  <figure>
                    <a class="aa-product-img" href="#"><img src="img/women/girl-4.png" alt="polo shirt img"></a>
                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                    <figcaption>
                      <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                      <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                    </figcaption>
                  </figure>                     
                  <div class="aa-product-hvr-content">
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                  </div>
                  <!-- product badge -->
                </li>    
                <!-- start single product item -->
               
                <!-- start single product item -->
                <li>
                  <figure>
                    <a class="aa-product-img" href="#"><img src="img/women/girl-1.png" alt="polo shirt img"></a>
                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                     <figcaption>
                      <h4 class="aa-product-title"><a href="#">This is Title</a></h4>
                      <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                    </figcaption>
                  </figure>                     
                  <div class="aa-product-hvr-content">
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                  </div>
                  <!-- product badge -->
                </li>                                                                                   
              </ul>
              <!-- quick view modal -->                  
              <div class="modal fade" id="quick-view-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">                      
                    <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <div class="row">
                        <!-- Modal view slider -->
                        <div class="col-md-6 col-sm-6 col-xs-12">                              
                          <div class="aa-product-view-slider">                                
                            <div class="simpleLens-gallery-container" id="demo-1">
                              <div class="simpleLens-container">
                                  <div class="simpleLens-big-image-container">
                                      <a class="simpleLens-lens-image" data-lens-image="img/view-slider/large/polo-shirt-1.png">
                                          <img src="img/view-slider/medium/polo-shirt-1.png" class="simpleLens-big-image">
                                      </a>
                                  </div>
                              </div>
                              <div class="simpleLens-thumbnails-container">
                                  <a href="#" class="simpleLens-thumbnail-wrapper"
                                     data-lens-image="img/view-slider/large/polo-shirt-1.png"
                                     data-big-image="img/view-slider/medium/polo-shirt-1.png">
                                     <img src='<c:url value="/resources/imgUpload/${datePath }/${productdetail.gdsImg}"/>'/>
                                  </a>                                    
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Modal view content -->
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="aa-product-view-content">
                            <h3>T-Shirt</h3>
                            <div class="aa-price-block">
                              <span class="aa-product-view-price">$34.99</span>
                              <p class="aa-product-avilability">Avilability: <span>In stock</span></p>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis animi, veritatis quae repudiandae quod nulla porro quidem, itaque quis quaerat!</p>
                            <h4>Size</h4>
                            <div class="aa-prod-view-size">
                              <a href="#">S</a>
                              <a href="#">M</a>
                              <a href="#">L</a>
                              <a href="#">XL</a>
                            </div>
                            <div class="aa-prod-quantity">
                              <form action="">
                                <select name="" id="">
                                  <option value="0" selected="1">1</option>
                                  <option value="1">2</option>
                                  <option value="2">3</option>
                                  <option value="3">4</option>
                                  <option value="4">5</option>
                                  <option value="5">6</option>
                                </select>
                              </form>
                              <p class="aa-prod-category">
                                Category: <a href="#">Polo T-Shirt</a>
                              </p>
                            </div>
                            <div class="aa-prod-view-bottom">
                              <a href="#" class="aa-add-to-cart-btn"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                              <a href="#" class="aa-add-to-cart-btn">View Details</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>                        
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div>
              <!-- / quick view modal -->   
            </div>  
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / product category -->




  
 


    
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