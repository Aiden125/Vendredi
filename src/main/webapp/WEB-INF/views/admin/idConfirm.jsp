<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:if test="${empty param.aid }">
		ID를 입력해주세요
	</c:if>
	
	<c:if test="${not empty param.aid and result eq 1 }">
		중복된 아이디입니다.
	</c:if>
	
	<c:if test="${not empty param.aid and result eq 0 }">
		사용가능한 아이디입니다.
	</c:if>
</body>
</html>