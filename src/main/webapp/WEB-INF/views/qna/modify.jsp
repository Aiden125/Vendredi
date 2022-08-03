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
<link rel="stylesheet" href="${conPath }/assets/css/member.css">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="logos">
		<p>QNA_MODIFY</p>
	</div>
	<div id="border3">
	<form action="${conPath }/qna/modify.do">
	<input type="hidden" name="qno" value="${qnaModify.qno }">
	<input type="hidden" name="pageNum" value="${param.pageNum }">
		<table>
			<caption>${qnaModify.qno }MODIFY</caption>
			<tr>
				<th>작성자</th>
				<td><input type="text" required="required" value="${qnaModify.qid }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name ="qusbject" value="${qnaModify.qsubject }"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="10" cols="38" name="qcontent">${qnaModify.qcontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn">
					<input type="button" value="목록" class="btn" onclick="location='${conPath}/qna/list.do?pageNum=${param.pageNum }'">
					<input type="reset" value="이전" class="btn" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>