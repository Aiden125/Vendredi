<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/admin.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
<div id="header">
	
	<c:if test="${empty admin }">
		<a href="${conPath }/admin/loginView.do">로그인</a>
	</c:if>
	
	<c:if test="${not empty admin }">
		<a href="${conPath }/admin/joinView.do">관리자 등록</a>
		<a href="${conPath }/admin/logout.do">로그아웃</a>
	</c:if>
</div>

<br>
<br>

<div id="content">
	관리자 리스트 보여줄 공간
</div>

<br>
<br>

<div id="footer">
	푸터 영역(필요할 경우)
</div>
</body>
</html>