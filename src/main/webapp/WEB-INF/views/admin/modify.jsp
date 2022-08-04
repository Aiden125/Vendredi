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
				<td colspan="2"><p class="left">아이디</p>
				<input type="text" class="box readonly" name="aid" value="${adminModify.aid }" readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">비밀번호</p>
				<input type="password" class="box" name="apw" value="${adminModify.apw }" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">이름</p>
				<input type="text" class="box" name="aname" value="${adminModify.aname }" required="required">
			</tr>
			<tr>
				<td colspan="2"><p class="left">번호</p>
				<input type="text" class="box" name="atel" value="${adminModify.atel }" required="required">
			</tr>
			<tr>
				<td colspan="2"><p class="left">이메일</p>
				<input type="email" class="box" name="aemail" value="${adminModify.aemail }" required="required"></td>
			</tr>
			<c:if test="${admin.alevel == 2 }">
				<tr>
					<td colspan="2"><p class="left">등급</p>
						<select name="alevel" class="box">
							<option value="">선택</option>
							<option value="0" ${adminModify.alevel == 0 ? "selected":""}>MANAGER</option>
							<option value="1" ${adminModify.alevel == 1 ? "selected":""}>HEAD_MANAGER</option>
							<option value="2" ${adminModify.alevel == 2 ? "selected":""}>MASTER</option>
						</select>
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2">
					<input type="submit" class="blue_btn" value="수정">
					<input type="button" class="reset_btn" value="취소"
					onclick="history.back();">
				</td>
			</tr>
		</table>
	</form>
</div>


</body>
</html>