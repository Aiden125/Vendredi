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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
	var naverLogin = new naver.LoginWithNaverId({
		clientId: "EP1XKpFve6IfuW3IICtO", // 본인걸로 수정, 띄어쓰기 금지.
		callbackUrl: "http://localhost:8081/member/loginForm", // 아무거나 설정
		isPopup: false,
		callbackHandle: true
	});
	naverLogin.init();

	window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {

	if (status) {
		/* console.log(naverLogin.user); */
		var age = naverLogin.user.getAge();
		var birthday = naverLogin.user.getBirthday();
		var email = naverLogin.user.getEmail();
		var gender = naverLogin.user.getGender();
		var id = naverLogin.user.getId();
		var name = naverLogin.user.getName();
// 		var nickName = naverLogin.user.getNickName();

		$.ajax({
			type: 'post',
			url: 'naverSave',
			data: {'n_age':age, 'n_birthday':birthday, 'n_email':email, 'n_gender':gender, 'n_id':id, 'n_name':name},
			dataType: 'text',
			success: function(result) {
				if(result=='ok') {
					console.log('성공')
					location.replace("http://localhost:8081/member/main.do") 
				} else if(result=='no') {
					console.log('실패')
					location.replace("http://localhost:8081/member/login.do")
				}
			},
			error: function(result) {
				console.log('오류 발생')
			}
		})

	} else {
		console.log("callback 처리에 실패하였습니다.");
	}
	});
});
</script>
</body>
</html>