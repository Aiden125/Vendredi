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
	<style>
	#content{
			width: 800px;
	        height : 100%;
	        margin: 0 auto;
	        margin-top: 200px;
	        margin-bottom:80px;
	        padding: 20px;
	        background: #fff;
	        -webkit-border-radius: 10px;
	        -moz-border-radius: 10px;
	        border-radius: 10px;
	        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		#content table{
			width: 700px;
		}
		#content table th{
			width: 100px;
		}
		#content table tr td{
			width:300px;
			text-align: center;
			padding-top:10px;
		}
		#content textarea{
			width:230px;
			padding-top:10px;
			margin-left: 30px;
			border:none;
		}
		#content input{
			border-left:none;
			border-right:none;
			border-top:none;
		}
		#content input[type='file']{
			margin-left: 60px;
		}
		#content .btn{
			font-size: 1em;
			width: 80px;
			height: 50px;
			margin:  30px;
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
	<link href="conPath/assets/css/style.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			
		});
		function trclicked(sno) {
			location.href = '${conPath}/store/storeDetail.do?sno='+ sno ;
			
		}
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<table style="margin : 0 auto;"> 
		<c:if test="${paging.totCnt eq 0 }">
			<tr> <th colspan="5">등록된 가게가 없습니다.</th> </tr>
		</c:if>
		<c:if test="${paging.totCnt != 0 }">
				<c:forEach items="${storeList }" var="store">
				<tr onclick="trclicked(${store.sno })" style="text-align: center;"> 
					<td>
						<img alt="가게 이미지" src="${conPath }/storeImgFileUpload/${store.simage1}" width = "100px">
					</td>
					<td>${store.sname }</td>
					<td> 
						${store.slocation }
					</td>
					<td> 
						${store.stype }
					</td> 
				</tr> 
			</c:forEach>
			<tr>
				<td>
					<input type="button" class="btn" value="가게등록" onclick="location.href='${conPath}/store/storeRegisterView.do'">
				</td>
			</tr>
		</c:if>
	</table>
		<div id="paging" align="center">
		<c:if test="${paging.startPage> paging.blockSize }">
		[<a href="${conPath }/store/myStoreList.do?pageNum=${paging.startPage-1}&oid=${owner.oid}">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage}">
			<c:if test="${i eq paging.currentPage }">
			[<b style="color : red;">${i}</b>]
			</c:if>
			<c:if test="${i != paging.currentPage }">
			[<a href="${conPath }/store.do?method=myStoreList&pageNum=${i}">${i}</a>]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
		[<a href="${conPath }/store/myStoreList.do?pageNum=${paging.endPage +1}&oid=${owner.oid}">다음</a>]
		</c:if>
		</div>
	</div>

</body>
</html>
























