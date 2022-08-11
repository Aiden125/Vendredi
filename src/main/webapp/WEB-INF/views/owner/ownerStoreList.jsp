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
			width:1000px;
			height:500px;
			margin:0 auto;
		}
		#content table{
			margin:100px auto;
		}
	</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<table>
			<caption>My Store</caption>
			<c:forEach var="sList" items="${storeList }">
					<tr>
						<td>
							${sList.simage }
						</td>
						<td>
							<input type="text" name="sname" class="sname" value="${sList.sname }" 
							onclick="location.href='StoreDetail.do?sno=${sList.sno}'" 
							 readonly="readonly" style="cursor: pointer">		
						</td>
						<td>
							${sList.saddress }
						</td>
						<td>
							${sList.stel }
						</td>
						<td>
							${sList.sscore}
						</td>
					</tr>
			</c:forEach>
		</table>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>