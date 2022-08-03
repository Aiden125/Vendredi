<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<form action="${conPath }/owner/SearchPw.do" method="get">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="oname"></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="oid"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="PW찾기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>