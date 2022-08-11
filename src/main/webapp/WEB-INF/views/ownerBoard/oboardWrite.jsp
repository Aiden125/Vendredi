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
	        height : 600px;
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
		#content input[type='file']{
			margin-left: 60px;
		}
		#content .btn{
			margin: 10px;
			border: 1px solid;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<c:if test="${empty owner }">
			<script>
				alert('글쓰기는 로그인 후 가능합니다');
				location.href="${conPath}/owner/LoginForm.do";
			</script>
		</c:if>
		<form action="${conPath }/oboard/Write.do" method ="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="oid" value="${owner.oid }" readonly="readonly" required="required">
					</td>
				</tr>
				<tr>
					<th>가게명</th>
					<td><input type="text" name="sname" required="required">
					</td>
				</tr>
				<tr>
					<th>지역</th>
					<td><input type="text" name="bloc" required="required"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="btitle" required="required">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="bcontent" rows="5" cols="30"></textarea></td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="tempbphoto1" ></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="file" name="tempbphoto2" ></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="file" name="tempbphoto3" ></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="file" name="tempbphoto4" ></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="file" name="tempbphoto5" ></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" class="btn">
						<input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/oboard/List.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
		<jsp:include page="../main/footer.jsp"/>
</body>
</html>