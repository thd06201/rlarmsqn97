<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Shop | Home</title>


</head>
<body>

<div>
<%@ include file="../include/header.jsp" %>
</div>

	<section id="aa-myaccount">
	  <div class="container">
		<div class="row">
		  <div class="col-md-12">
			<div class="aa-myaccount-area">
    		  <div class="row">
    		  	<a href="/"><div style="position: relative; bottom: 65px; right: -1100px;" > 홈 > 정보수정</div><br></a>

				<div class="col-md-6">
				  <div style="position: relative; right: -290px;" class="aa-myaccount-register" id="aa-myaccount">
					<div class="aa-myaccount-register">
  					  <h4>회원가입</h4>

						<form  role="form" method="post" class="aa-login-form" autocomplete="off">
						<p>
						   <label for="userId">아이디</label> 
						   <input type="text" id="userId" name="userId" required="required" /> 
						   <button type="button"  class="idChk">중복확인</button>
					   </p>
					   <p class="result">
					   <span class="msg">아이디를 확인해 주십시오.</span>   
					   </p><br>
					   <p>	   
						   <label for="userPass">비밀번호</label> 
						   <input type="password" id="userPass" name="userPass" required="required" /> 
					   </p>
					   <p>	  
						   <label for="userName">이름</label> 
						   <input type="text" id="userName"	name="userName" placeholder="이름을 입력해주세요" required="required" />
					   </p>	
					   <p>  
						   <label for="userPhon">생년월일</label> 
						   <input type="text" id="userBi" name="userBi" placeholder="생년월일을 입력해주세요(8자리)" required="required" />
					   </p>

					   <p>  
						   <label for="userPhon">연락처</label> 
						   <input type="text" id="userPhon" name="userPhon" placeholder="연락처를 입력해주세요" required="required" />
					   </p>
						<button type="submit" id="signup_btn"  name="signup_btn">회원가입</button>
						
						
							
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

<script>
$(".idChk").click(function(){
 
 var query = {userId : $("#userId").val()};
 
 if(query.userId.length){
 
 $.ajax({
  url : "/member/idChk",
  type : "post",
  data : query,
  success : function(data) {
  
   if(data == 1) {
    $(".result .msg").text("사용 불가");
    $(".result .msg").attr("style", "color:#f00");    
    $("#submit").attr("disabled","disabled");
   } else {
    $(".result .msg").text("사용 가능");
    $(".result .msg").attr("style", "color:#00f");
    $("#submit").removeAttr("disabled");
   }
  }
 });  // ajax 끝
 } else {
	 alert("아이디를 입력해주세요");
	 }
});
</script>
</body>
</html>