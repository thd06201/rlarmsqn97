<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
</head>
<body>

<label>제목</label>
${view.title}<br />

<label>작성자</label>
${view.userId}<br />

<label>내용</label><br />
${view.content}<br />

<div>
<a href="modify?bno=${view.bno}">게시물 수정</a>
<a href="delete?bno=${view.bno}">게시물 삭제</a>
</div>

</body>
</html>