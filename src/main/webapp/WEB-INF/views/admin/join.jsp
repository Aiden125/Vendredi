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
	<form action="${conPath }/admin/join.do" method="POST">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="aid"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="apw"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="aname"></td>
			</tr>
			<tr>
				<th>번호</th>
				<td><input type="text" name="atel"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="ameail"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="관리자 등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>