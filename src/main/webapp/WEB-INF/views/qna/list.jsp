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
<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
		#content{
			width:100%;
			height:100%;
		}
		#content table{
			width:800px;
			margin: 80px auto;
			border-collapse: collapse;
			text-align: center;
		}
		#content caption{
			margin : 40px auto;
		}
		#content tr{
			border-bottom: 1px solid;
			height: 50px;
			width: 100px;
		}
		#content .paging{
			margin-bottom : 80px;
			text-align: center;
		}
		#content .btitle{
			border: none;
			width: 150px;
		}
		#content h1{
			margin-top: 120px;
			text-align: center;
		}
		</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			var aid = '${aid}';
			var mid = '${mid}';
			var qid = '${qid}';
			$('tr').click(function(){
				var qno = Number($(this).children().eq(0).text());
				if(!isNaN(qno)){
					location.href='${conPath}/qna/detail.do?qno='+qno+'&qgroup='+qno+'&pageNum=${paging.currentPage}';
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
		<script>alert('답변쓰기 실패');</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<h1>FAQ</h1>
	<table>
		<tr><td>
			<c:if test="${not empty member }">
				<a href="${conPath }/qna/writeView.do">글쓰기</a>
			</c:if>
			<c:if test="${empty member }">
				<a href="${conPath }/member/loginForm.do">글쓰기는 사용자 로그인 후에 이용 가능합니다</a>
			</c:if>
		</td></tr>
	</table>
	
	<table>
		<tr><th>글번호</th><th>작성자</th><th>글제목</th><th>조회수</th><th>날짜</th><th>답변여부</th></tr>
		<c:if test="${qnaList.size() eq 0 }">
			<tr><td colspan="6">등록된 글이 없습니다</td></tr>
		</c:if>
		<c:if test="${qnaList.size() != 0 }">
			<c:forEach items="${qnaList }" var="qna">
			<tr>
			<td>${qna.qno }</td>
			<td>${qna.qid }</td>
			<td>${qna.qsubject }
			<c:if test="${qna.qsecret eq 'Y'}">
				<img src="${conPath }/assets/img/비밀글.jpg" alt="비밀글" width="20px">
			</c:if>
			</td>
			<td>${qna.qhit }</td>
			<td><fmt:formatDate value="${qna.qrdate }" type="date" dateStyle="short"/></td>
			<td>
				<c:if test="${qna.qreplycheck == 0 }">답변대기</c:if>
				<c:if test="${qna.qreplycheck == 1 }">답변완료</c:if>
			</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/qna/list.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/qna/list.do?pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/qna/list.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	</div> 
<jsp:include page="../main/footer.jsp"/>
</body>
</html>