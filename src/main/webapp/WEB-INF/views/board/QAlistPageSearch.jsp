<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">    
  <title>Q&A</title>

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
   
<div id="header">
<jsp:include page="../include/header.jsp"></jsp:include>
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

  
<div id="nav">
<jsp:include page="../board/include/nav.jsp"></jsp:include>
</div>




<div style="position: relative; right: -320px;" class="page-header">            
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">Q&A</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                  </div>
              </div>
<div class="panel panel-default">
<div class="panel-heading">Q&A </div>
<div class="panel-body">
<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.bno}</td>
				<td>
				    <a href="view?bno=${list.bno}">${list.title}</a>
				</td>
				<td>${list.regDate}</td>
				<td>${list.userId}</td>
				<td>${list.viewCnt}</td>
			</tr>
		</c:forEach>		
	</tbody>
</table>

 <div class="page-header" >	
<!--  <div style="position: relative; right: -500px;" class="page-header" >		-->
<div>
<c:if test="${page.prev}">
 [ <a href="QAlistPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]
</c:if>

<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
 <span>
 
  <c:if test="${select != num}">
   <a href="QAlistPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
  </c:if>    
  
  <c:if test="${select == num}">
   <b>${num}</b>
  </c:if>
    
 </span>
</c:forEach>

<c:if test="${page.next}">
 [ <a href="QAlistPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]
</c:if>
</div>
</div>
 <div>
 <select name="searchType">
     <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
        <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
     <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
     <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
 </select>
 
 <input type="text" name="keyword" value="${page.keyword}"/>
 
 <button type="button" id="searchBtn">검색</button>
</div>
 
 <script>

 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
	
  location.href = "QAlistPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 
 };
</script>
 

</div></div></div></div>
</div>
</div>

</div>

<div id="footer">
<jsp:include page="../board/include/footer.jsp"></jsp:include>
</div>

</body>
</html>