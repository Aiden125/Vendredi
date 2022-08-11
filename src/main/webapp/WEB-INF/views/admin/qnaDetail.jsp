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
		
		<!-- 질문 글 영역 -->
		<div id="qna_question_box" class="whitebox">
			<p class="title left font2_0 co">Q
			</p>
			<p class="floatR">작성자 : ${qDto.qid } &nbsp; ${qDto.qrdate }</p>
			<p class="title left font1_5"><b>${qDto.qsubject }</b></p>
			<hr color="#4B89DC" class="blue"><br>
			<p class="content_box">${qDto.qcontent }</p>
			
			<c:if test="${qDto.qreplycheck==0 }">
				<p><input type="submit" value="답변" class="blue_btn floatR"></p>
			</c:if>
		</div>

	</form>
	
		<!-- 답변글 영역 -->
	<c:if test="${not empty replyDto }">
		<div id="qna_answer_box" class="whitebox">
			<p class="title left font2_0">A</p>
			<hr color="#4B89DC" class="blue"><br>
			<p class="content_box">${replyDto.qcontent }</p>
			<c:if test="${not empty admin }">
				<input type="button" value="삭제" class="reset_btn floatR">
				<input type="button" value="수정" class="blue_btn floatR">
			</c:if>
		</div>
	</c:if>
	
</div>




</body>
</html>