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
	<div id="header">
	<div id="nav">
		<ul>
			<li class="font2_0 blue"><a href="${conPath }/qna/listAdminVer.do">Vendredi</a></li>
			<li class="font0_5">AdminMode</li>
		</ul>
		<br><hr><br>
		<ul>
			<li><a href="${conPath }/qna/listAdminVer.do">QnA 관리</a></li>
			<li><a href="${conPath }/qna/replyYetList.do">답변 안된 질문</a></li>
			<li><a href="${conPath }/qna/replyList.do">답변 관리</a></li>
		</ul>
		<br><hr><br>
		<ul>
			<li><a href="${conPath }/request/requestList.do">업체 관리</a></li>
		</ul>
		<br><hr><br>
		
		<ul>
		<c:if test="${empty admin }">
			<li><a href="${conPath }/admin/loginView.do">로그인</a></li>
		</c:if>
		
		<c:if test="${not empty admin }">
			<c:if test="${admin.alevel == 2 || admin.alevel == 1}">
				<li><a href="${conPath }/admin/joinView.do">관리자 등록</a></li>
			</c:if>
			<li><a href="${conPath }/admin/modifyView.do?aid=${aid}">내 정보수정</a></li>
			<li><a href="${conPath }/admin/logout.do">로그아웃</a></li>
		</c:if>
		</ul>
		<c:if test="${not empty admin }">
			<br><hr><br>
			<ul>
				<li>${admin.aid }님 접속중</li>
			</ul>
		</c:if>
		<br><hr><br>
		<ul>
			<li><a href="${conPath }/admin/main.do">관리자 목록</a></li>
			<li><a href="${conPath }/main.do">사용자 모드</a></li>
		</ul>
	</div>
</div>
</body>
</html>