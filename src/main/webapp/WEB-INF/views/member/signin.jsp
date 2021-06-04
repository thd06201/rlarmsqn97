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
<%@ include file="../include/header.jsp" %>
</div>

 <!-- Cart view section -->

<section id="aa-myaccount">
	  <div class="container">
		<div class="row">
		  <div class="col-md-12">
			<div class="aa-myaccount-area">
    		  <div class="row">
				<a href="/"><div style="position: relative; bottom: 65px; right: -1100px;" > 홈 > 로그인</div><br></a>
                   
				<div class="col-md-6">
				  <div style="position: relative; right: -290px;" class="aa-myaccount-register" id="aa-myaccount">
					<div class="aa-myaccount-register">
					
  					  <h4>로그인</h4>

						<form method="post" role="form" class="aa-login-form" autocomplete="off">

						   <label for="userId">아이디</label> 
						   <input type="text" id="userId" name="userId" required="required" /> 
						   <label for="userPass">비밀번호</label> 
						   <input type="password" id="userPass" name="userPass" required="required" /> 
						    
						   <button type="submit" id="signup_btn" name="signup_btn">로그인</button><br>
							
							<c:if test="${msg == false}">
							<br><p style="color: #f00;">로그인에 실패했습니다.</p>
							</c:if>
						</form>
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
<%@ include file="../include/footer.jsp" %>
</div>


</body>
</html>