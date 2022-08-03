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
	<form action="${conPath }/owner/ModifyForm.do" id="content_form" method="post">
		<h1> ${owner.oid }님</h1>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="oid" value="${owner.oid }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="oname" value="${owner.oname }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>E-MAIL</th>
				<td>
					<input type="text" name="oemail" value="${owner.oemail }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="otel" value="${owner.otel }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="oaddress" value="${owner.oaddress }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="obirth" value="${owner.obirth }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="내 정보 수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>