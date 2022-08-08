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
<link rel="stylesheet" href="${conPath }/assets/css/qnawrite.css">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
<div id="logos">
		<p>QNA</p>
    </div>
	<div id="border">
	<form action="${conPath }/qna/write.do" method="post">
	<input type="hidden" name="qid" value=${member.mid }>
		<table id="writeqboard">
			<tr>
				<th>제목</th>
				<td><input type="text" name="qsubject" required="required" class="title">
				<input type="checkbox" name="qsecret" id="qsecret"  value="Y">
				</td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea name="qcontent" rows="15" cols="36" class="qcontent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기" class="btn">
					<input type="reset" value="취소" class="btn">
					<input type="button" value="목록" class="btn" onclick="location.href='${conPath }/qna/list.do'">
				</td>
			</tr>
		</table>
	</form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>