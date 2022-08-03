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
	<form action="${conPath }/owner/Modify.do" id="content_form" method="post">
		<input type="hidden" name="obirth" value="${owner.obirth }">
		<input type="hidden" name="ogender" value="${owner.ogender }">
		
		<h1> ${owner.oname }님 정보</h1>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="oid" value="${owner.oid }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="opw" value="${owner.opw }" >
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="oname" value="${owner.oname }" >
				</td>
			</tr>
			<tr>
				<th>E-MAIL</th>
				<td>
					<input type="text" name="oemail" value="${owner.oemail }" >
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="otel" value="${owner.otel }" >
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="oaddress" value="${owner.oaddress }">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>