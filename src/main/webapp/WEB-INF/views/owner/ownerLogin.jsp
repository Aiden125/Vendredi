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
	<c:if test="${not empty joinResult }">
		<script>
			alert('회원가입 완료되었습니다');
		</script>
	</c:if>
	<c:if test="${not empty result}">
		<script>alert('${result}');</script>
	</c:if>
	<c:if test="${not empty searchId}">
		<script>alert('${searchId}');</script>
	</c:if>
	<c:if test="${not empty searchPw}">
		<script>alert('${searchPw}');</script>
	</c:if>
	<form action="${conPath }/owner/Login.do" method="post">
		<table>
			<caption>로그인 화면</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="oid" required="required" value="${oid }">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="opw" required="required" value="${opw }">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
	<button onclick="location.href='${conPath}/owner/SearchIdForm.do'">ID찾기</button>
	<button onclick="location.href='${conPath}/owner/SearchPwForm.do'">PW찾기</button>
</body>
</html>