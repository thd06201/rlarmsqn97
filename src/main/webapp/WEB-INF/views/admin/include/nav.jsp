<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<ul>
	<c:if test="${member != null}">
		
		<a href="/" style="position: relative; bottom: -7px;  font-size:19px;">일반 화면 &nbsp;&nbsp;&nbsp;&nbsp;
	
		<a href="/member/signout" style="position: relative; bottom: -7px;  font-size:19px;">로그아웃 &nbsp;&nbsp;&nbsp;&nbsp;</a></a>
	</c:if>
</ul>