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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
<jsp:include page="../admin/header.jsp"/>
<div id="content">
<c:if test="${empty admin }">
	<table id="main_table2">
		<tr class="tr_top">
			<th>관리자 로그인 이후 볼 수 있는 페이지입니다.</th>
		</tr>
	</table>
</c:if>
<c:if test="${not empty admin }">
	<table id="main_table2">
		<caption>업체 요청 리스트</caption>
		<tr class="tr_top">
			<th>등록번호</th><th>가게번호</th><th>사업자 아이디</th>
			<th>가게 이름</th><th>등록일</th><th>처리여부</th>
		</tr>
		<c:if test="${paging.totCnt eq 0 }">
			<tr> <th colspan="6">등록된 요청 없습니다.</th> </tr>
		</c:if>
		
		<c:if test="${paging.totCnt != 0 }">
			<c:forEach items="${requestList }" var="request">
				<tr> 
					<td>${request.rno }</td>
					<td>${request.sno }</td>
					<td> 
						${request.oid }
					</td>
					<td>
						<a href="${conPath }/store/storeDetailAdminVer.do?sno=${request.sno }">
						${request.sname }</a>
					</td>  
					<td>
						<fmt:formatDate value="${request.rdate }" pattern="yy년MM월dd일"/>
					 </td> 
					 <td>
					 	<input type="button" value="처리완료" onclick="location='${conPath}/request/requestDone.do?sno=${request.sno }'">
					 </td>
				</tr> 
			</c:forEach>
		</c:if>
	</table>

	<div class="center">
		<c:if test="${paging.startPage> paging.blockSize }">
		[<a href="${conPath }/request/requestList.do?pageNum=${paging.startPage-1}" class="dis_inline">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage}">
			<c:if test="${i eq paging.currentPage }">
			[<b style="color : red;">${i}</b>]
			</c:if>
			<c:if test="${i != paging.currentPage }">
			[<a href="${conPath }/request/requestList.do?pageNum=${i}" class="dis_inline">${i}</a>]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
		[<a href="${conPath }/request/requestList.do?pageNum=${paging.endPage +1}" class="dis_inline">다음</a>]
		</c:if>
	</div>
</c:if>	
</div>
	
</body>
</html>