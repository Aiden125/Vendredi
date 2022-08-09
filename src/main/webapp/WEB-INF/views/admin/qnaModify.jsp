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
<link href="${conPath }/css/admin.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../admin/header.jsp"/>
	<div id="content">
	<form action="${conPath }/qna/modifyAdminVer.do" method="post">
	<input type="hidden" name="qno" value="${qDto.qno }">
		<table id="modify_table">
			<caption>${qDto.qno }번글 수정</caption>
			<tr>
				<th>작성자</th>
				<td><input type="text" required="required" value="${qDto.qid }" readonly="readonly" class="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name ="qsubject" value="${qDto.qsubject }"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="10" cols="38" name="qcontent">${qDto.qcontent }</textarea></td>
			</tr>
			<tr>
				<th>작성일시</th>
				<td><input type="text" name ="tempqrdate" value="${qDto.qrdate }" class="readonly"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn">
					<input type="reset" value="이전" class="btn" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>