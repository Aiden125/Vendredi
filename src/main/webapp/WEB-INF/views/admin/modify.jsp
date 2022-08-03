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

<jsp:include page="../admin/header.jsp"/>

<div id="content">
	<form action="${conPath }/admin/modify.do" method="POST">
		<table id="modify_table">
			<caption>관리자 정보 수정(${adminModify.aname })</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="aid" value="${adminModify.aid }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="apw" value="${adminModify.apw }" required="required"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="aname" value="${adminModify.aname }" required="required"></td>
			</tr>
			<tr>
				<th>번호</th>
				<td><input type="text" name="atel" value="${adminModify.atel }" required="required"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="aemail" value="${adminModify.aemail }" required="required"></td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					<select name="alevel">
						<option value="">선택</option>
						<option value="0" ${adminModify.alevel == 0 ? "selected":""}>MANAGER</option>
						<option value="1" ${adminModify.alevel == 1 ? "selected":""}>HEAD_MANAGER</option>
						<option value="2" ${adminModify.alevel == 2 ? "selected":""}>MASTER</option>
					</select>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="정보수정">
					<input type="button" value="삭제"
					onclick="location.href='${conPath}/admin/delete.do?aid=${adminModify.aid }'">
				</td>
			</tr>
		</table>
	</form>
</div>


</body>
</html>