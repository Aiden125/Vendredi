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
<c:if test="${joinResult == 1 }">
	<script>alert("관리자 등록 완료")</script>
</c:if>
<c:if test="${joinResult == 0 }">
	<script>alert("관리자 등록 실패")</script>
</c:if>

<c:if test="${modifyResult == 1 }">
	<script>alert("정보수정 완료")</script>
</c:if>
<c:if test="${modifyResult == 0 }">
	<script>alert("정보수정 실패")</script>
</c:if>

<jsp:include page="../admin/header.jsp"/>

<div id="content">
	<table id="main_table">
		<caption>관리자 목록</caption>
		<tr><td></td></tr>
		<tr class="tr_top">
			<th>이름</th><th>번호</th><th>이메일</th><th>등급</th>
			<c:if test="${admin.alevel == 2 }"><th>수정</th></c:if>
		</tr>
		
		<c:forEach var="adminList" items="${adminList }">
		<tr>
			<td>${adminList.aname }</td>
			<td>${adminList.atel }</td>
			<td>${adminList.aemail }</td>
			<td>${adminList.alevelname }</td>
			<c:if test="${admin.alevel == 2 }">
				<td><a href="${conPath }/admin/modifyView.do?aid=${adminList.aid}" style="color:blue;">수정하기</a></td>
			</c:if>
		</tr>
		</c:forEach>
		
	</table>
</div>

<div id="footer">
	푸터 영역(필요할 경우)
</div>


</body>
</html>