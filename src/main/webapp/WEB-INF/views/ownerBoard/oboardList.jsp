<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<div id="content">
		<table>
			<caption>사장님 게시판</caption>
			<tr>
				<td colspan="2">
					<input type="button" value="글쓰기" onclick="location.href='${conPath}/oboard/WriteForm.do'">
				</td>
			<tr>
				<th>ID</th>
				<th>가게명</th>
				<th>지역</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록날짜</th>
			</tr>
				<c:forEach var="owners" items="${oboardList }">
					<tr>
						<td>
							<input type="text" name="oid" value=${owners.oid } readonly="readonly">
				
						</td>
						<td>
							<input type="text" name="sname" value=${owners.sname } readonly="readonly">
				
						</td>
						<td>
							<input type="text" name="bloc" value=${owners.bloc } readonly="readonly">
				
						</td>
						<td>
							<input type="text" name="btitle" value=${owners.btitle } 
							onclick="location.href='Content.do?bno=${owners.bno}&pageNum=${paging.currentPage}'" 
							 readonly="readonly" style="cursor: pointer">
				
						</td>
						<td>
							<input type="text" name="bhit" value=${owners.bhit } readonly="readonly">
				
						</td>
						<td>
							<input type="text" name="bdate" value=${owners.bdate } readonly="readonly">
						</td>
					</tr>
				</c:forEach>
		</table>
		<div class="paging">
			<c:if test="${paging.startPage>paging.blockSize}">
				[ <a href="${conPath }/oboard/List.do?pageNum=${paging.startPage-1 }">이전</a> ]
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }"> 
					<b>[ ${i } ]</b> 
				</c:if>
				<c:if test="${paging.currentPage != i }">
					[ <a href="${conPath }/oboard/List.do?pageNum=${i }">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/oboard/List.do?pageNum=${paging.endPage+1 }">다음</a> ]
			</c:if>
		</div>
	</div>
</body>
</html>