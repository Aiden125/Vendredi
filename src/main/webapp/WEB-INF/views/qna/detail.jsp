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
<link rel="stylesheet" href="${conPath }/assets/css/qnawrite.css">
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
		<p>QNA상세보기</p>
	</div>
	<div id="border">
		<table>
			<tr>
				<td><b>작성자 : </b></td>
				<td><b>${qDto.qid }님</b></td>
			</tr>
			<tr>
				<td><b>제목 : </b></td>
				<td><b>${qDto.qsubject }</b></td>
			</tr>
			<tr>
				<td><b>본문 : </b></td>
				<td><b>${qDto.qcontent }</b></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${member.mid eq qDto.qid }">
						<button class="btn"
							onclick="location='${conPath}/qna/modifyView.do?qno=${qDto.qno }&pageNum=${param.pageNum }&qgroup=${param.qgroup }'">수정</button>
					</c:if> 
					<c:if test="${member.mid eq qDto.qid || not empty admin}">
						<button class="btn"
							onclick="location='${conPath}/qna/delete.do?qno=${qDto.qno }&pageNum=${param.pageNum }'">삭제</button>
					</c:if> 
					<c:if test="${not empty admin && empty member.mid }">
						<button class="btn"
							onclick="location='${conPath}/qna/reply.do?qno=${qDto.qno }&pageNum=${param.pageNum }&aid=${admin.aid }'">답변</button>
					</c:if> 
					<input type="button" value="목록" class="btn"
					onclick="location='${conPath}/qna/list.do?pageNum=${param.pageNum }'">
				</td>
			</tr>
		</table>
	</div>
	<!-- 답변글 영역 -->
	<c:if test="${not empty replyDto }">
		<div id="border">
			<table>
			<tr>
				<td><b style="font-size: 1.2em; font-weight: bold;">관리자 답변 : </b></td>
				<td><b>${replyDto.qcontent }</b></td>
			</tr>
			</table>
		</div>
	</c:if>
<jsp:include page="../main/footer.jsp"/>
	<script src="${conPath}/store/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="${conPath}/store/js/vendor/bootstrap.min.js"></script>

	<script src="${conPath}/store/js/isotope.min.js"></script>
	<script src="${conPath}/store/js/jquery.magnific-popup.js"></script>
	<script src="${conPath}/store/js/jquery.easing.1.3.js"></script>
	<script src="${conPath}/store/js/slick.min.js"></script>
	<script src="${conPath}/store/js/jquery.collapse.js"></script>
	<script src="${conPath}/store/js/bootsnav.js"></script>



	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>