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
	<c:if test="${not empty result}">
		<script>alert('${result}');</script>
	</c:if>

<jsp:include page="../admin/header.jsp"/>

<div id="content">
	<form action="${conPath }/admin/login.do" method="POST">
		<table id="login_table">
			<caption>관리자 로그인</caption>
			<tr>
				<td colspan="2"><p class="left">아이디 </p>
				<input type="text" class="box" name="aid" required="required" value="${aid }"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">비밀번호 </p>
				<input type="password" class="box" name="apw" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="blue_btn">
					<input type="button" value="취소" class="reset_btn" onclick="history.back();">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>