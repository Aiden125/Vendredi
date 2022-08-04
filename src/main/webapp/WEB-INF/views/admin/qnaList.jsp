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
<link href="${conPath }/css/adminList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		<script>alert('삭제 성공');</script>
	</c:if>
	<c:if test="${deleteResult eq FAIL }">
		<script>alert('삭제 실패');</script>
	</c:if>
	<!--  글답변 성공 / 실패 alert -->
	<c:if test="${replyResult eq SUCCESS }">
		<script>alert('답변쓰기 성공');</script>
	</c:if>
	<c:if test="${replyResult eq FAIL }">
		<script>alert('답변쓰기 실패');</script>
	</c:if>
	<c:if test="${modifyResult eq SUCCESS }">
		<script>alert('수정 성공');</script>
	</c:if>
	<c:if test="${modifyResult eq FAIL }">
		<script>alert('수정 실패');</script>
	</c:if>
	
	
	
	
	
	<jsp:include page="../admin/header.jsp"/>

	<div id="content">
		<table id="main_table">
			<caption>FAQ</caption>
			<tr class="tr_top">
				<th>글번호</th><th>글제목</th><th>작성자</th><th>조회수</th><th>날짜</th><th>답변여부</th>
				<c:if test="${not empty admin }">
					<th>수정</th><th>삭제</th>
				</c:if>
			</tr>
			
			<c:if test="${qnaList.size() != 0 }">
				<c:forEach items="${qnaList }" var="qna">
					<tr>
						<td>${qna.qno }</td>
							<td>
							<a href="${conPath}/qna/detailAdminVer.do?qno=${qna.qno }&pageNum=${paging.currentPage}">
							${qna.qsubject }</a>
							<c:if test="${qna.qsecret eq 'Y'}">
								<img src="${conPath }/assets/img/비밀글.jpg" alt="비밀글" width="20px">
							</c:if>
						</td>
						<td>${qna.qid }</td>
						<td>${qna.qhit }</td>
						<td><fmt:formatDate value="${qna.qrdate }" type="date" dateStyle="short"/></td>
						<td>
							<c:if test="${qna.qreplycheck == 0 }">답변대기</c:if>
							<c:if test="${qna.qreplycheck == 1 }">답변완료</c:if>
						</td>
						
						<c:if test="${not empty admin }">
							<td><a href="${conPath }/qna/modifyViewAdminVer.do?qno=${qna.qno}">수정하기</a></td>
							<td><a href="${conPath }/qna/deleteAdminVer.do?qno=${qna.qno}">삭제하기</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<div class="center">
			<c:if test="${paging.startPage > paging.blockSize }">
				[ <a href="${conPath }/qna/list.do?pageNum=${paging.startPage-1}" class="dis_inline">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage }">
					[ <b> ${i } </b> ]
				</c:if>
				<c:if test="${i != paging.currentPage }">
					[ <a href="${conPath }/qna/list.do?pageNum=${i}" class="dis_inline">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
				[ <a href="${conPath }/qna/list.do?pageNum=${paging.endPage+1}" class="dis_inline">다음</a> ]
			</c:if>
		</div>
	</div>

</body>
</html>