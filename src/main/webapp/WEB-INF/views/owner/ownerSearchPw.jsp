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
			width: 600px;
	        height : 300px;
	        margin: 0 auto;
	        max-width: 500px;
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
		#content .btn{
			margin:  80px 0;
            background: #fff;
            border-color: black;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		h2{
			text-align: center;
		}
	</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div id="content">
	<form action="${conPath }/owner/SearchPw.do" method="get">
		<h2>Search Your PW</h2>
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="oname" placeholder="name"></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="oid" placeholder="ID"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="PW찾기" class="btn">
					<input type="button" value="ID찾기" class="btn" onclick="location.href='SearchIdForm.do'">
					<input type="button" value="로그인하기" class="btn" onclick="location.href='LoginForm.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>