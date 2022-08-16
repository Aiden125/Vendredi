<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

.wrap {
	height: 100%;
	width: 100%;
	background-image: url('${conPath}/assets/img/디저트.jpg');
	background-position: center;
	background-size: cover;
	position: absolute;
}

.form-wrap {
	width: 380px;
	height: 480px;
	position: relative;
	margin: 6% auto;
	background: #fff;
	padding: 5px;
	overflow: hidden;
}

.button-wrap {
	width: 230px;
	margin: 35px auto;
	position: relative;
	box-shadow: 0 0 600px 9px #fcae8f;
	border-radius: 30px;
}

.togglebtn {
	padding: 10px 30px;
	cursor: pointer;
	background: transparent;
	border: 0;
	outline: none;
	position: relative;
}

#btn {
	top: 0;
	left: 0;
	position: absolute;
	width: 110px;
	height: 100%;
	background: linear-gradient(to right, #ff105f, #ffad06);
	border-radius: 30px;
	transition: .5s;
}

.social-icons {
	margin: 30px auto;
	text-align: center;
}

.social-icons img {
	width: 30px;
	cursor: pointer;
}

.input-group {
	top: 180px;
	position: absolute;
	width: 280px;
	transition: .5s;
}

.input-field {
	width: 100%;
	padding: 10px 0;
	margin: 5px 0;
	border: none;
	border-bottom: 1px solid #999;
	outline: none;
	background: transparent;
}

.submit {
	width: 85%;
	padding: 10px 30px;
	cursor: pointer;
	display: block;
	margin: auto;
	background: linear-gradient(to right, #ff105f, #ffad06);
	border: 0;
	outline: none;
	border-radius: 30px;
}

.checkbox {
	margin: 30px 10px 30px 0;
}

span {
	color: #777;
	font-size: 12px;
	bottom: 68px;
	position: absolute;
}

#login {
	left: 50px;
}

#register {
	left: 450px;
}

p {
	font-family: sans-serif;
	font-size: 0.8em;
	text-decoration: none;
}
</style>
<script>
	function kakaoLogin() {
		location.href = "https://kauth.kakao.com/oauth/authorize?"
				+ "client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code"
	}
</script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "EP1XKpFve6IfuW3IICtO6",
  			// 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
			callbackUrl: "http://localhost:8081/member/callBack",
  			// 본인의 callBack url로 수정하세요.
			isPopup: false,
			loginButton: {color: "white", type: 3, height: 60}
  			// 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
		}
	);
naverLogin.init();
</script>
</head>
<body>
	<c:if test="${not empty searchIdResult}">
		<script>
			alert('${searchIdResult}');
		</script>
	</c:if>
	<c:if test="${not empty searchPwResult}">
		<script>
			alert('${searchPwResult}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn" onclick="login()">User</button>
				<button type="button" class="togglebtn" onclick="register()">OWNER</button>
			</div>
			<div id="naverIdLogin" class="social-icons">
				<a href="${url }"><img src="${conPath }/assets/img/naver.png" alt="naver"></a>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=9ab3a25c7202d038fb2c93a42fefcc2c&redirect_uri=http://localhost:8081/vendredi/member/kakaoLogin.do&response_type=code">
				<img src="${conPath }/assets/img/kakao.png" alt="Kakao"></a>
				<img src="${conPath }/assets/img/gl.png" alt="google">
			</div>
			<form id="login" action="${conPath }/member/mlogin.do" method="post"
				class="input-group">
				<input type="text" class="input-field" id="mid" name="mid"
					value="${mid }" placeholder="User ID" required> <input
					type="password" class="input-field" id="mpw" name="mpw"
					placeholder="Password" required><br> <a
					href="${conPath }/member/joinForm.do"><p>Don't have an
						account?</p></a><br> <a href="${conPath }/member/search.do"><p>Forget
						ID or PW?</p></a><br>
				<button class="submit">Login</button>
			</form>
			<form id="register" action="${conPath }/owner/Login.do" method="post" class="input-group">
                   <input type="text" class="input-field"  id="oid" name="oid"  placeholder="Owner ID" required>
                    <input type="password" class="input-field" id="opw" name="opw" placeholder="Password" required>
                    <a href="${conPath }/owner/JoinForm.do">Don't have an account?</a><br><br>
                    <p>Forget <a href="${conPath}/owner/SearchIdForm.do">ID</a> or <a href="${conPath}/owner/SearchIdForm.do">PW?</a></p><br>
                    <button class="submit">Login</button>
             </form>
		</div>
		<c:choose>
			<c:when test="${sessionId != null}">
				<h2>네이버 아이디 로그인 성공하셨습니다!!</h2>
				<h3>'${sessionId}' 님 환영합니다!</h3>
				<h3>
					<a href="${conPath }/member/logout">로그아웃</a>
				</h3>
			</c:when>
		</c:choose>
	</div>
	
	<script>
		var x = document.getElementById("login");
		var y = document.getElementById("register");
		var z = document.getElementById("btn");

		function login() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0";
		}

		function register() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
		}
	</script>
</body>
</html>