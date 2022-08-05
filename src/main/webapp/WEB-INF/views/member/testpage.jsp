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
</head>
<body>
<h1>카카오 로그인 테스트</h1>
 <c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=9ab3a25c7202d038fb2c93a42fefcc2c&redirect_uri=http://localhost:8081/vendredi/member/kakaoLogin.do&response_type=code">
            <img src="/img/kakao_account_login_btn_medium_wide_ov.png">
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
        <input type="button" value="로그아웃" onclick="location.href='/logout'">
    </c:if>
</body>
</html>