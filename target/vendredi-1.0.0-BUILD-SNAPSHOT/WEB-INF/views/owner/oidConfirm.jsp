<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
</head>
<body>
	<c:if test="${empty param.oid }">
		ID 입력후, 중복확인하세요
	</c:if>
	<c:if test="${not empty param.oid and confirmResult eq 1 }">
		<b style="color:red;">중복된 ID입니다</b>
	</c:if>
	<c:if test="${not empty param.oid and confirmResult eq 0 }">
		<b>사용가능한 ID입니다</b>
	</c:if>
</body>
</html>