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
<link rel="stylesheet" href="${conPath }/assets/css/boardwrite.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('tr').click(function(){
				var qno = Number($(this).children().eq(0).text());
				if(!isNaN(qno)){
					location.href='${conPath}/qna/detail.do?qno='+qno+'&pageNum=${pageNum}';
				}
				
			});
		});
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<!--  글쓰기 성공 / 실패 alert -->
	<c:if test="${writeResult eq SUCCESS }">
		<script>alert('글쓰기 성공');</script>
	</c:if>
	<c:if test="${writeResult eq FAIL }">
		<script>alert('글쓰기 실패');</script>
	</c:if>
	<!--  글삭제 성공 / 실패 alert -->
	<c:if test="${deleteResult eq SUCCESS }">
		<script>alert('${param.bid}번 글삭제 성공');</script>
	</c:if>
	<c:if test="${deleteResult eq FAIL }">
		<script>alert('${param.bid}번 글삭제 실패');</script>
	</c:if>
	<!--  글답변 성공 / 실패 alert -->
	<c:if test="${replyResult eq SUCCESS }">
		<script>alert('답변쓰기 성공');</script>
	</c:if>
	<c:if test="${replyResult eq FAIL }">
		<script>alert('답변쓰기 성공');</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp"/>
	  <div id="logos">
			<p>QNA_BOARD</p>
         </div>
	<div id="wrap">
	<div id="writeform">
	<table>
		<tr><td>
			<c:if test="${not empty member }">
				<a href="${conPath }/qna/writeView.do">&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;글쓰기</a>
			</c:if>
			<c:if test="${empty member }">
				<a href="${conPath }/member/loginForm.do">글쓰기는 사용자 로그인 후에 이용 가능합니다</a>
			</c:if>
		</td></tr>
	</table>
	</div> <!-- writeform -->
	<div id="listform">
	<table>
		<tr><th>글번호</th><th>작성자</th><th>글제목</th><th>조회수</th><th>날짜</th></tr>
		<c:if test="${qnaList.size() eq 0 }">
			<tr><td colspan="6">등록된 글이 없습니다</td></tr>
		</c:if>
		<c:if test="${qnaList.size() != 0 }">
			<c:forEach items="${qnaList }" var="qna">
			<tr>
			<td>${qna.qno }</td>
			<td>${qna.qid }</td>
			<td>${qna.qsubject }</td>
			<td>${qna.qhit }</td>
			<td><fmt:formatDate value="${qna.qrdate }" type="date" dateStyle="short"/></td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	</div> <!-- listform -->
	</div> <!-- wrap -->
</body>
</html>