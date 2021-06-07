<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">    

<title>게시물 작성</title>


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
<script src="/resources/ckeditor/ckeditor.js"></script>
<div id="header">
<jsp:include page="../board/include/header.jsp"></jsp:include>
</div>

<!-- catg header banner section -->
  <section id="aa-catg-head-banner">
   <img src="/resources/img/fashion/fashion-header-bg-8.jpg" alt="fashion img">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Q&A</h2>
        <ol class="breadcrumb">
          <li><a href="/">Home</a></li>                   
          <li class="active">Q&A</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

	<c:if test="${member == null }">
		<script>
			alert("로그인 후 이용해 주세요.");
			alert("로그인 화면으로 이동하시겠습니까?");
			window.location.href = "/member/signin";
		</script>
	</c:if>


<c:if test="${member != null}">

<div style="position: relative; right: -320px;">
<div class="col-lg-8">

	<label>제목</label>
${view.title}<br />

<label>작성자</label>
${view.userId}<br />

<label>내용</label><br />
${view.content}<br />

<div>
<button type="submit"><a href="QAmodify?bno=${view.bno}">게시물 수정</a></button>
<button type="submit"><a href="delete?bno=${view.bno}">게시물 삭제</a></button>
</div>

</div>
</div>
</c:if>

<div id="footer">
<jsp:include page="../board/include/footer.jsp"></jsp:include>
</div>

</body>
</html>