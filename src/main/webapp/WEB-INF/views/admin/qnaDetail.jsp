<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/admin.css" rel="stylesheet">
</head>
<body>
	<c:set var="SUCCESS" value="1" />
	<c:set var="FAIL" value="0" />
	<c:if test="${modifyResult eq SUCCESS }">
		<script>
			alert('수정 성공');
		</script>
	</c:if>
	<c:if test="${modifyResult eq 0 }">
		<script>
			alert('수정 실패');
			history.back();
		</script>
	</c:if>
	<jsp:include page="../admin/header.jsp"/>
	
<div id="content">
	<form action="${conPath}/qna/replyView.do?qno=${qDto.qno }&pageNum=${param.pageNum }&aid=${admin.aid }&qgroup=${param.qgroup}" method="POST">
	
		<table id="qna_detail_table" class="whitebox">
<%-- 			<caption>${qDto.qno }번 글 / 작성자${qDto.qid }</caption> --%>
			<tr>
				<td class="td_20 rborder"><b>제목</b></td>
				<td class="left"><b>${qDto.qsubject }</b></td>
			</tr>
			<tr>
				<td class="td_20 rborder"><b>본문</b></td>
				<td class="content_box"><b>${qDto.qcontent }</b></td>
			</tr>
			<c:if test="${qDto.qreplycheck==0 }">
			<tr>
				<td colspan="2">
					<input type="submit" value="답변" class="blue_btn floatR">
				</td>
			</tr>
			</c:if>
		</table>
	</form>
	
	
	<c:if test="${not empty replyDto }">
		<table id="qna_detail_table" class="whitebox">
<%-- 				<caption>운영자 답변</caption> --%>
			<tr>
				<td class="td_20 rborder"><b>제목</b></td>
				<td class="left"><b>${replyDto.qsubject }</b></td>
			</tr>
			<tr>
				<td class="td_20 rborder"><b>본문</b></td>
				<td class="content_box"><b>${replyDto.qcontent }</b></td>
			</tr>
		</table>
	</c:if>
</div>




</body>
</html>