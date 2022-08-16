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
		#content .btn{
			margin:  30px 0;
            background: #fff;
            border-color: black;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${ oboardDelete > 0 }">
		<script>
			alert('해당글이 삭제되었습니다');
		</script>
	</c:if>
	<c:if test="${ not empty writeResult }">
		<script>
			alert('글작성 완료');
		</script>
	</c:if>
	<c:if test="${ not empty oboardModify }">
		<script>
			alert('글수정 완료');
		</script>
	</c:if>
	<div id="content">
	<h1>OWNER VOICE</h1>
		<table>
		<tr>
			<td>
				<input type="button" class="btn" value="글쓰기" onclick="location.href='${conPath}/oboard/WriteForm.do'">
			</td>
		</tr>
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
							${owners.oid }
						</td>
						<td>
							${owners.sname }				
						</td>
						<td>
							${owners.bloc }
						</td>
						<td>
							<input type="text" name="btitle" class="btitle" value="${owners.btitle }" 
							onclick="location.href='Content.do?bno=${owners.bno}&pageNum=${paging.currentPage}'" 
							 readonly="readonly" style="cursor: pointer">
				
						</td>
						<td>
							<fmt:formatNumber value="${owners.bhit }" groupingUsed="true"/>				
						</td>
						<td>
							${owners.bdate }
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
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>