<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">    
  <title>Daily Shop | Home</title>

  
  </head>
  <body> 

<div>
<%@ include file="../../include/header.jsp" %>
</div>

 <!-- Cart view section -->

<section id="aa-myaccount">
	  <div class="container">
		<div class="row">
		  <div class="col-md-12">
			<div class="aa-myaccount-area">
    		  <div class="row">
                   
				<div class="col-md-6">
				  <div style="position: relative; right: -290px;" class="aa-myaccount-register" id="aa-myaccount">
					<div class="aa-myaccount-register">
					
  					 <a href="/shop/cu"> <h4>나만의 커스터마이징 꽃다발 만들기 </h4> </a>
					<section id="aa-slider">
  <div class="aa-slider-area">
    <div id="sequence" class="seq">
      <div class="seq-screen">
        <ul class="seq-canvas">
          <!-- single slide item -->
          <li>
            <div class="seq-model">
              <img data-seq src="/resources/img/slider/tu.jpg" alt="Men slide img" />
            </div>
         </li>
         <li>
          <div class="seq-model">
            <img data-seq src="/resources/img/slider/red.jpg" alt="Wristwatch slide img" />
          </div>
        </li>
        <li>
          <div class="seq-model">
            <img data-seq src="/resources/img/slider/for.jpg" alt="Wristwatch slide img" />
          </div>
        </li>
      </ul>
    </div>
    
    
    
    <!-- slider navigation btn -->
    <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
      <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
      <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
    </fieldset>
  </div>
</div>
</section>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</section>
			   
			

<div>
<%@ include file="../../include/footer.jsp" %>
</div>


</body>
</html>