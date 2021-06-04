<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>admin</title>
	
	<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
	<style>
 	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
 	ul { padding:0; margin:0; list-style:none;  }

	div#root { width:90%; margin:0 auto; }
 
 	header#header { font-size:60px; padding:20px 0; }
 	header#header h1 a { color:#000; font-weight:bold; }
 
 	nav#nav { padding:10px; text-align:right; }
 	nav#nav ul li { display:inline-block; margin-left:10px; }

   	section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:5px solid #eee; }
 	section#container::after { content:""; display:block; clear:both; }
 	aside { float:left; width:200px; }
 	div#container_box { float:right; width:calc(100% - 200px - 20px); }
 
 	aside ul li { text-align:center; margin-bottom:10px; }
 	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
 	
 	aside#aside li { position:relative; }
	aside#aside li:hover { background:#eee; }   
	aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
	aside#aside li:hover > ul.low { display:block; }
	aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
	aside#aside li:hover > ul.low li a:hover { background:#fff;}
	aside#aside li > ul.low li { width:180px; }
 
 	footer#footer { background:#f9f9f9; padding:20px; }
 	footer#footer ul li { display:inline-block; margin-right:10px; }
	</style>

</head>
<body>

<div id ="root">

<nav id="nav">
	<div id="nav_box">
		<%@ include file="include/nav.jsp" %>
	</div>
</nav>

<section id ="container">
<aside>
	<%@ include file="include/aside.jsp" %>
</aside>
<div id = "container_box">
본문영역
</div>

</section>
</div>


</body>
</html>
