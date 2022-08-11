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
		#content .btn{
			margin:  50px 0 0 120px;
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
	<div id="content">
		<table>
			<caption>MyStore</caption>
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
	<input type="button" class="btn" value="가게등록" onclick="location.href='${conPath}/store/storeRegisterView.do'">
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>