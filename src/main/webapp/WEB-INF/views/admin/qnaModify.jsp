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
	<div class="height_box"></div>
	<div id="content">
	<form action="${conPath }/qna/modifyAdminVer.do" method="post">
	<input type="hidden" name="qno" value="${qDto.qno }">
			
		<table id="modify_table">
			<caption>글 수정하기</caption>
			<tr>
				<td colspan="2"><p class="left"><b>제목</b></p>
				<input type="text" name ="qsubject" value="${qDto.qsubject }" class="box"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left"><b>본문</b></p>
				<textarea rows="10" cols="38" name="qcontent" class="text_box">${qDto.qcontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="수정" class="blue_btn">
				<input type="reset" value="이전" class="reset_btn" onclick="history.back()"></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>