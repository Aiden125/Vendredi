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
<link rel="stylesheet" href="${conPath }/assets/css/bootstrap1.css">
<link rel="stylesheet" href="${conPath }/assets/css/join.css">
<link rel="stylesheet" href="${conPath }/store/css/list.css">
<style>
body, html {
	width: 100%;
	margin: 0;
	padding: 0;
	background-color: white;
	
}
main{
	width:100%;
}
.container{
	float:left;	
	padding-left : 500px;
}
.login card {
	width: 400px;
	height : 250px;
}
p{
width:200px;
margin-left: 30px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
	});
	function trclicked(sno) {
		location.href = '${conPath}/store/storeDetail.do?sno=' + sno;
	}
</script>
</head>
<body> 
	<jsp:include page="../main/header.jsp"/>
	<div class="wrap">
	<div class="form-wrap">
	<table class="storeList"> 
		<c:if test="${paging.totCnt eq 0 }">
			<tr><th colspan="5">등록된 가게가 없습니다.</th> </tr>
		</c:if>
		<c:if test="${paging.totCnt != 0 }">
			<c:forEach items="${storeList }" var="store">
				<tr onclick="trclicked(${store.sno })"> 
					<td>
						${store.sno }
						<img alt="가게 이미지" src="${conPath }/storeImgFileUpload/${store.simage1}" width = "100px">
					</td>
					<td>${store.sname }</td>
					<td> 
						${store.slocation }
					</td>
					<td> 
						${store.stype }
					</td>
					<td> 
						${store.stscore }
					</td>    
				</tr> 
			</c:forEach>
		</c:if>
	</table> 
		<div id="paging" align="center"> 
<jsp:include page="../main/header.jsp"/>
				<c:if test="${paging.totCnt eq 0 }">
					<tr>
						<th colspan="5">등록된 가게가 없습니다.</th>
					</tr>
				</c:if>
	<main>
	<c:forEach items="${storeList }" var="store">
		<div class="container">
			<div class="card login-card">
				<c:if test="${paging.totCnt != 0 }">
						<div class="row no-gutters"
							onclick="location.href='${conPath }/store/storeDetail.do?sno=${store.sno }'">
							<div class="col-md-3"
								onclick="location.href='${conPath }/store/storeDetail.do?sno=${store.sno }'">
								<img src="${conPath }/storeImgFileUpload/${store.simage1}"
									alt="가게이미지" class="login-card-img"
									style="height: 350px; width: 200px;">
							</div>
							<div class="col-md-5">
								<div class="card-body" 
									onclick="location.href='${conPath }/store/storeDetail.do?sno=${store.sno }'">
									<p class="login-card-description">${store.sname }</p>
									<div class="person_details m-top-40">
										<div class="row">
											<div class="col-md-5 text-left">
												<p>가게 위치:</p>
												<p>가게 종류:</p>
												<p>평점:</p>
											</div>
											<div class="col-md-7 text-left">
												<p>${store.slocation }</p>
												<p>${store.stype }</p>
												<p style="color : orange; font-weight: bold">${store.stscore }</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</c:if>
			</div>
		</div>
		<br>
	</c:forEach>

	<div id="paging" align="center"> 
		<c:if test="${paging.startPage> paging.blockSize }">
		[<a href="${conPath }/store.do?method=storeList&pageNum=${paging.startPage-1}}">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }"
			end="${paging.endPage}">
			<c:if test="${i eq paging.currentPage }">
			[<b style="color: red;">${i}</b>]
			</c:if>
			<c:if test="${i != paging.currentPage }">
			[<a href="${conPath }/store.do?method=storeList&pageNum=${i}">${i}</a>]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
		[<ahref="${conPath }/store.do?method=storeList&pageNum=${paging.endPage +1}">다음</a>]
		</c:if>
	</div>
</main>	
</body>
</html>
























