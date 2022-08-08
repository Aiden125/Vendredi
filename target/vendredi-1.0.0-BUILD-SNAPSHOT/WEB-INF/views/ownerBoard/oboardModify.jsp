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
</head>
<body>
	<c:if test="${empty owner }">
			<script>
				alert('글수정은 로그인 후 가능합니다');
				location.href="${conPath}/owner/LoginForm.do";
			</script>
		</c:if>
	<div id="content">
		<form action="${conPath }/oboard/Modify.do" method ="post" enctype="multipart/form-data">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="bno" value="${oboard.bno }">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="oid" value="${owner.oid }" readonly="readonly" required="required">
					</td>
				</tr>
				<tr>
					<th>가게명</th>
					<td><input type="text" name="sname" value="${oboard.sname }" readonly="readonly" required="required">
					</td>
				</tr>
				<tr>
					<th>지역</th>
					<td><input type="text" name="bloc" value="${oboard.bloc }" readonly="readonly" required="required"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="btitle" required="required" value="${oboard.btitle }">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="bcontent" rows="5" cols="30">${oboard.bcontent }</textarea></td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="tempbphoto1">${oboard.bphoto1 }</td>
				</tr>
				<tr>
					<th></th>
					<td><input type="file" name="tempbphoto2">${oboard.bphoto2 }</td>
				</tr>
				<tr>
					<th></th>
					<td><input type="file" name="tempbphoto3">${oboard.bphoto3 }</td>
				</tr>
				<tr>
					<th></th>
					<td><input type="file" name="tempbphoto4">${oboard.bphoto4 }</td>
				</tr>
				<tr>
					<th></th>
					<td><input type="file" name="tempbphoto5">${oboard.bphoto5 }</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정" class="btn">
						<input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/oboard/List.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>