<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<title>Daily Shop | Home</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/font-awesome.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/jquery.smartmenus.bootstrap.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/jquery.simpleLens.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/slick.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/nouislider.css"/>'>
<link rel="stylesheet" href='<c:url value="/resources/css/theme-color/default-theme.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/sequence-theme.modern-slide-in.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/style.css"/>'>
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<style>
.allCheck {
	float: left;
	width: 200px;
}
.allCheck input {
	width: 16px;
	height: 16px;
}
.allCheck label {
	margin-left: 10px;
}
.delBtn {
	float: right;
	width: 300px;
	text-align: right;
}
.delBtn button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}
.checkBox {
	float: left;
	width: 30px;
}
.checkBox input {
	width: 16px;
	height: 16px;
}
.listResult {
	padding: 20px;
	background: #eee;
}
.listResult .sum {
	float: left;
	width: 45%;
	font-size: 22px;
}
.listResult .orderOpne {
	float: right;
	width: 45%;
	text-align: right;
}
.listResult .orderOpne button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #999;
	background: #fff;
}
.listResult::after {
	content: "";
	display: block;
	clear: both;
}
.orderInfo {
	border: 5px solid #eee;
	padding: 20px;
	display: none;
}
.orderInfo .inputArea {
	margin: 10px 0;
}
.orderInfo .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}
.orderInfo .inputArea input {
	font-size: 14px;
	padding: 5px;
}
#userAddr2, #userAddr3 {
	width: 250px;
}
.orderInfo .inputArea:last-child {
	margin-top: 30px;
}
.orderInfo .inputArea button {
	font-size: 20px;
	border: 2px solid #ccc;
	padding: 5px 10px;
	background: #fff;
	margin-right: 20px;
}
</style>
</head>
<body>
	<div>
		<%@ include file="../../include/header.jsp"%>
	</div>

	<section id="aa-catg-head-banner">
		<img src="/resources/img/fashion/fashion-header-bg-8.jpg"
			alt="fashion img">
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
	
	<section id="cart-view">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cart-view-area">
						<div class="cart-view-table">
							<form action="cartList" method="post" id="infoForm" autocomplete="off">
								<div class="table-responsive">
									<div class="allCheck">
										<input type="checkbox" id="allCheck" name="allCheck"/>
										<label for="allCheck">모두 선택</label>
									</div>
									<div class="delBtn">
										<button type="button" class="selectDelete_btn">삭제</button>
									</div>
									<table class="table">
										<thead>
											<tr>
												<th>선택</th>
												<th>이미지</th>
												<th>상품</th>
												<th>가격</th>
												<th>수량</th>
												<th>합계</th>
												<th>삭제</th>
											</tr>
										</thead>
										<c:forEach items="${cartList}" var="cartList">
											<fmt:formatDate value="${cartList.gdsDate}" pattern="yyyy/MM/dd" var="datePath" />
											<tbody>
												<tr>
													<td><input type="checkbox" id="chBox" name="cartNum" class="chBox" value="${cartList.cartNum}"/></td>
													<td><a href="#"><img src="<c:url value="/resources/imgUpload/${datePath}/${cartList.gdsImg}"/>" alt="img"></a></td>
													<td><a class="aa-cart-title" href="#">${cartList.gdsName}</a></td>
													<td>${cartList.gdsPrice}</td>
													<td><a class="aa-cart-quantity" href="#">${cartList.cartStock}</a></td>
													<td><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /></td>
													<td><button type="button" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button></td>
												</tr>
											</tbody>
											
											<input type="hidden" id="gdsNumA" name="gdsNumA" value="${cartList.gdsNum}">
											<input type="hidden" id="gdsNameA" name="gdsNameA" value="${cartList.gdsName}">
											<input type="hidden" id="getPriceA" name="gdsPriceA" value="${cartList.gdsPrice}">
											<input type="hidden" id="cartStockA" name="cartStockA" value="${cartList.cartStock}">
										</c:forEach>
									</table>
								</div>
								<div class="listResult">
									<div class="sum">
										총 합계 : 0원
									</div>
									<button type="button" id="selectBtn">주문test</button>
									<div class="orderOpne">
										<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
									</div>
								</div>
								<div class="orderInfo">
									<div class="inputArea">
										<label for="">수령인</label>
										<input type="text" name="orderRec" id="orderRec" required="required" />
									</div>
									<div class="inputArea">
										<label for="orderPhon">수령인 연락처</label>
										<input type="text" name="orderPhon" id="orderPhon" required="required" />
									</div>
									<div class="inputArea">
										<p>
											<label for="">주소</label>
											<input type="text" id="sample2_postcode" placeholder="우편번호">
											<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
										</p>
										<p>
											<input type="text" name="userAddr1" id="sample2_address" placeholder="주소">
											<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
											<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목">
										</p>
										<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
											<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1" onclick="closeDaumPostcode()" alt="닫기 버튼">
										</div>
									</div>
									<input type="hidden" id="amount" name="amount" value="">
									<div class="inputArea">
										<button type="submit" id="order_btn">주문</button>
										<button type="button" class="cancel_btn">취소</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
	</section>
	
	<script>
		//주문 정보 입력
		$(".orderOpne_bnt").click(function() {
			$(".orderInfo").slideDown();
			$(".orderOpne_bnt").slideUp();
		});
		
		//주문 정보 취소
		$(".cancel_btn").click(function() {
			$(".orderInfo").slideUp();
			$(".orderOpne_bnt").slideDown();
		});
		
		//전체 선택 상품 총 금액
		$("#allCheck").click(function() {
			var check = $("#allCheck").prop("checked");
			
			if (check) {
				$(".chBox").prop("checked", true);
				ListSumPrice();
			}
			else {
				$(".chBox").prop("checked", false);
				ListSumPrice();
			}
		});
		
		//개별 선택 상품 총 금액
		$(".chBox").click(function() {
			var check = $("#chBox").prop("checked");
			
			if (check) {
				$("#chBox").prop("checked", true);
				ListSumPrice();
			}
			else {
				$("#chBox").prop("checked", false);
				ListSumPrice();
			}
		})
		
		$(".chBox").click(function() {
			$("#allCheck").prop("checked", false);
		});
		
		//선택 상품 총 금액
		function ListSumPrice() {
			var str = "";
			var sum = 0;
			var count = $(".chBox").length;
			
			var row = new Array();
			var checkbox = $("input:checkbox[name=cartNum]:checked");
			
			checkbox.each(function(i) {
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
					
				sum += parseInt(td.eq(3).text());
			});

			$(".sum").html("총 합계 : " + sum + "원");
			document.getElementById("amount").value = sum;
		}
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript" src='<c:url value="/resources/js/jquery.smartmenus.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/jquery.smartmenus.bootstrap.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/jquery.simpleGallery.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/jquery.simpleLens.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/slick.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/nouislider.js"/>'></script>
	<script src='<c:url value="/resources/js/sequence-theme.modern-slide-in.js"/>'></script>
	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>
	<script src='<c:url value="/resources/js/sequence.js"/>'></script>
	<script src='<c:url value="/resources/js/custom.js"/>'></script>

	<div>
		<%@ include file="../../include/footer.jsp"%>
	</div>
</body>
</html>