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

<jsp:include page="../admin/header.jsp"/>

<div id="content">
	<form action="${conPath }/qna/reply.do" method="post">
	<input type="hidden" name="qid" value=${admin.aid }>
	<input type="hidden" name="qno" value=${param.qno }>
	<input type="hidden" name="qgroup" value=${param.qgroup }>
		<table id="modify_table">
			<caption>${param.qno }번 글 답변하기</caption>
			<tr>
				<td colspan="2"><p class="left">제목</p>
				<input type="text" name="qsubject" readonly="readonly" class="readonly box center" value="${param.qno }번 글 답변글">
				</td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">본문</p>
				<textarea name="qcontent" rows="15" cols="36" class="text_box"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="blue_btn" value="등록">
					<input type="button" class="reset_btn" value="취소"
					onclick="history.back();">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>