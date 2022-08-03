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
<link rel="stylesheet" href="${conPath }/assets/css/member.css">
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
	<jsp:include page="../main/header.jsp" />
	<div id="logos">
		<p>QNA_Detail</p>
	</div>
	<div id="border">
		<table>
			<caption>${qnaDetail.qno }noCONTENT</caption>
			<tr>
				<td><b>작성자</b></td>
				<td><b>${qnaDetail.qid }님</b></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><b>${qnaDetail.qtitle }</b></td>
			</tr>
			<tr>
				<td><b>본문</b></td>
				<td><b>${qnaDetail.qcontent }</b></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${member.mid eq qnaDetail.qid }">
						<button class="btn"
							onclick="location='${conPath}/qna/modify.do?qno=${qnaDetail.qno }&pageNum=${param.pageNum }'">수정</button>
					</c:if> 
					<c:if test="${member.mid eq qnaDetail.qid or not empty admin}">
						<button class="btn"
							onclick="location='${conPath}/qna/delete.do?qno=${qnaDetail.qno }&pageNum=${param.pageNum }'">삭제</button>
					</c:if> 
					<c:if test="${not empty admin and empty member.mid }">
						<button class="btn"
							onclick="location='${conPath}/qna/reply.do?qno=${qnaDetail.qno }&pageNum=${param.pageNum }&aid=${admin.aid }'">답변</button>
					</c:if> <input type="button" value="목록" class="btn"
					onclick="location='${conPath}/qna/list.do?pageNum=${param.pageNum }'">
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>