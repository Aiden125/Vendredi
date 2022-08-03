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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${conPath }/js/address.js"></script>
</head>
<body>
		<jsp:include page="../main/header.jsp"/>
		<div id="middle">
	<div id="logos">
		<p>MODIFY</p>
    </div>
	<div id="memberinfo">
	<form action="${conPath }/member/modify.do" method="post">
		<input type="hidden" name="method" value="modify">
		<input type="hidden" name="mid" value="${member.mid }">
		<table>
		<tr><td>프로필</td><td>${member.mprofile }</tr>	
			<tr><td>아이디</td><td>${member.mid }</td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="mpw" value="${member.mpw }"></td></tr>
			<tr><td>이름</td><td><input type="text" name="mname" value="${member.mname }"></td></tr>
			<tr><td>전화번호</td><td><input type="text" name="mtel" value="${member.mtel }"></td></tr>
			<tr><td>메일</td><td><input type="text" name="memail" value="${member.memail }"></td></tr>
			<tr><td>우편번호</td><td>
			<input type="text" id="sample4_postcode" name="mpost" class="text_box" >
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td></tr>
			<tr><td>주소</td><td>
						<input type="text" id="sample4_roadAddress" name="maddress" value="${member.maddress }">
						<input type="hidden" id="sample4_jibunAddress" name="X" placeholder="지번주소">
						<span id="guide"></span>
				</td></tr>
			<tr><td>사진수정</td><td><input type="file" name=mprofile value="${member.mprofile }"></tr>	
			<tr><td colspan="3">
								<input type="button" value="이전" onclick="history.go(-1)" class="btn">
								<input type="submit" value="정보수정" class="btn">
								<input type="button" value="회원탈퇴"
										onclick="location.href='${conPath}/member/withdrawal.do'" class="btn">
							</td>
					</tr>
		</table>
	</form>
			</div><!-- memberInfo -->
		</div><!-- middle -->
		<jsp:include page="../main/footer.jsp"/>
</body>
</html>