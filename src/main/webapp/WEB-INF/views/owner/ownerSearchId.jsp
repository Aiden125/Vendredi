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
			height:800px;
			padding:0;
			margin:0 auto;
		}
		#content table{
			width: 400px;
			height: 300px;
			margin: 100px auto;
			padding: 50px 50px;
		}
		#content caption{
			text-align: center;
			font-size: 1.5em;
		}
	</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div id="content">
	<form action="${conPath }/owner/SearchId.do" method="get">
		<table>
		<caption>ID 찾기</caption>
			<tr>
				<td>이름</td>
				<td><input type="text" name="oname"></td>
			</tr>
			<tr>
				<td>E-MAIL</td>
				<td><input type="email" name="oemail"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="ID찾기">
					<input type="button" value="PW찾기" onclick="location.href='SearchPwForm.do'">
					<input type="button" value="로그인하기" onclick="location.href='LoginForm.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>