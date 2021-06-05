<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin</title>

        <script src="/resources/jquery/jquery-3.3.1.min.js"></script>

        <script src="/resources/bootstrap/bootstrap.min.js"></script>
        <script src="/resources/ckeditor/ckeditor.js"></script>	

        <link rel="stylesheet" type="text/css" href= '<c:url value="/resources/css/styles.css"/>'>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
   
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">관리자페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
	
	<div id="nav_box">
	<%@ include file="../include/nav.jsp" %>
	</div>           

 <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                상품등록
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/admin/goods/register">일반 상품</a>
                                    <a class="nav-link" href="/admin/goods/register2">커스터마이징 상품</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                상품목록
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="/admin/goods/list">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                상품목록
                            </a>
                            <a class="nav-link" href="/admin/goods/member">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                회원목록
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Static Navigation</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Static Navigation</li>
                        </ol>
                       
                        <div style="height: 100vh">
		<div id ="root">



<section id ="container">

<div id = "container_box">
<h2>상품수정</h2>

<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">

<input type="hidden" name="cuNum" value="${cugoods.cuNum}" />


<div class="inputArea">
 <label for="cuName">상품명</label>
 <input type="text" id="cuName" name="cuName" value="${cugoods.cuName}"/>
</div>
<div class="inputArea">
 <label for="cuPrice">상품가격</label>
 <input type="text" id="cuPrice" name="cuPrice" value="${cugoods.cuPrice}"/>
</div>
<div class="inputArea">
 <label for="cuStock">상품수량</label>
 <input type="text" id="cuStock" name="cuStock" value="${cugoods.cuStock}"/>
</div>

</div>
 <fmt:formatDate value="${cugoods.cuDate}" pattern="yyyy/MM/dd" var="datePath"/>
<div class="inputArea">
 <label for="cuImg">이미지</label>
 <input type="file" id="cuImg" name="file" />
 <div class="select_img">

  <img src='<c:url value="/resources/imgUpload/${datePath }/${cugoods.cuImg}"/>'/>
  <input type="hidden" name="cuImg" value="${cugoods.cuImg}" />
  <input type="hidden" name="cuThumbImg" value="${cugoods.cuThumbImg}" /> 
 </div>
 
 <script>
  $("#cuImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
 <%=request.getRealPath("/") %>
</div>

<div class="inputArea">
 <button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
 <button type="button" id="back_Btn" class="btn btn-warning">취소</button>
 
<script>
 $("#back_Btn").click(function(){
  //history.back();
  location.href = "/admin/goods/view2?n=" + ${cugoods.cuNum};
 });   
</script>
</div>   
</form>

</section>
</div>	

</body>
</html>
