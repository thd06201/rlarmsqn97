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
				<a href="/"><div style="position: relative; bottom: 65px; right: -1100px;" > 홈 > 로그인 > 아이디 찾기</div><br></a>
                   
				<div class="col-md-6">
				  <div style="position: relative; right: -290px;" class="aa-myaccount-register" id="aa-myaccount">
					<div class="aa-myaccount-register">
					
  					  <h4>아이디 찾기</h4>

						<form method="post" role="form" id="findForm" autocomplete="off">
						
							<div class="row">
								<label for="userEmail">이메일</label> 
						   		<input type="text" id="userEmail" name="userEmail" class="form-control" required="required" />
						   		<button type="button" id="btnSendEmail" class="form-control">인증 번호 전송</button>
							</div>
						    
						    <div class="row">
								<label for="userEmail">인증 번호 입력</label> 
						   		<input type="text" id="key" name="key" class="form-control" required="required" />
						    </div>
						    
						    <div class="row">
						    	<button type="submit" id="btnFind" name="btnFind">찾기</button><br>
						    </div>
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
$("#btnSendEmail").click(function () {
	$.ajax({
		url : "/member/existsEmail",
		type : "post",
		data : {
			email: $("#userEmail").val(),
		},
		success: function (result) {
			if (result == 1) {
				$.ajax({
					url : "/member/requestMail",
					type : "post",
					data : {
						email: $("#userEmail").val()
					}
				});
				
				alert("인증 메일을 보냈습니다.");
				$("#userMail").attr("disabled", true);
				$("#btnSendEmail").attr("disabled", true);
			} else {
				alert("해당 메일과 일치하는 정보가 없습니다.");
			}
		}
	});

});

$("#btnFind").click(function () {
	$.ajax({
		url : "/member/requestId",
		type : "post",
		data : {
			email: $("#userEmail").val(),
			key: $("#key").val()
		},
		success: function (result) {
			$("#findForm").html("해당 이메일로 찾은 아이디입니다: " + result);
		}
	});
	
	return false;
});
</script>


</body>
</html>