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
	* {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}
.wrap {
    height: 100%;
    width: 100%;
    background-image: url('${conPath}/assets/img/디저트.jpg');
    background-position: center;
    background-size: cover;
    position: absolute;
}
.form-wrap {
    width: 720px;
    height: 770px;
    position: relative;
    margin: 6% auto;
    background: #fff;
    padding: 5px;
    overflow: hidden;
}
.button-wrap {
    width: 230px;
    margin: 35px auto;
    position: relative;
    box-shadow: 0 0 600px 9px #fcae8f;
    border-radius: 30px;
}
.togglebtn {
    padding: 10px 30px;
    cursor: pointer;
    background: transparent;
    border: 0;
    outline: none;
    position: relative;
}
#btn {
    top: 0;
    left: 0;
    position: absolute;
    width: 110px;
    height: 100%;
    background: linear-gradient(to right, #ff105f, #ffad06);
    border-radius: 30px;
    transition: .5s;
}
.social-icons {
    margin: 30px auto;
    text-align: center;
}
.social-icons img {
    width: 30px ;
    cursor: pointer;
}
.input-group {
    top: 180px;
    position: absolute;
    width: 280px;
    transition: .5s;
}
.input-field {
    width: 100%;
    padding: 10px 0;
    margin: 5px 0;
    border: none;
    border-bottom: 1px solid #999;
    outline: none;
    background: transparent;
}
.submit {
    width: 85%;
    padding: 10px 30px;
    cursor: pointer;
    display: block;
    margin: auto;
    background: linear-gradient(to right, #ff105f, #ffad06);
    border: 0;
    outline: none;
    border-radius: 30px;
}
.checkbox {
    margin: 30px 10px 30px 0;
}
span {
    color: #777;
    font-size: 12px;
    bottom: 68px;
    position: absolute;
}
#login {
    left: 50px;
}
#register {
    left: 450px;
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
	<div class="wrap">
	<div class="form-wrap">
	<table style="margin : 0 auto;"> 
		<c:if test="${paging.totCnt eq 0 }">
			<tr> <th colspan="5">등록된 가게가 없습니다.</th> </tr>
		</c:if>
		<c:if test="${paging.totCnt != 0 }">
				<c:forEach items="${storeList }" var="store">
				<tr onclick="trclicked(${store.sno })"> 
					<td>
						<img alt="가게 이미지" src="${conPath }/storeImgFileUpload/${store.simage}" width = "100px" height="150px">
					</td>
					<td>${store.sname }</td>
					<td style="color : orange; font-weight: bold">${store.stscore }</td>
				</tr> 
				<tr>	
					<td> 
						${store.slocation }
					</td>
					<td colspan="2"> 
						${store.stype }
					</td>   
				</tr>
			</c:forEach>
		</c:if>
	</table>
		<div id="paging" align="center">
		<c:if test="${paging.startPage> paging.blockSize }">
		[<a href="${conPath }/store/storeListSearch.do?pageNum=${paging.startPage-1}&ssearchtag=${param.ssearchtag }">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage}">
			<c:if test="${i eq paging.currentPage }">
			[<b style="color : red;">${i}</b>]
			</c:if>
			<c:if test="${i != paging.currentPage }">
			[<a href="${conPath }/store/storeListSearch.do?pageNum=${i}&ssearchtag=${param.ssearchtag }">${i}</a>]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
		[<a href="${conPath }/store/storeListSearch.do?pageNum=${paging.endPage +1}&ssearchtag=${param.ssearchtag }">다음</a>]
		</c:if>
		</div>
	</div>
	</div>

</body>
</html>
























