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
<
style>* {
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
</style>

</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn" onclick="login()">ID찾기</button>
				<button type="button" class="togglebtn" onclick="register()">PW찾기</button>
			</div>
			<form id="login" action="${conPath }/member/searchId.do" method="get"
				class="input-group">
				<input type="text" class="input-field" id="mname" name="mname"
					placeholder="가입된 이름" required="required"> <input
					type="text" class="input-field" id="memail" name="memail"
					placeholder="가입된 메일" required="required"> <a
					href="${conPath }/member/joinForm.do"><input type="checkbox"
					class="checkbox"><span>Don't have an account?</span></a>
				<button class="submit">ID찾기</button>
			</form>
			<form id="register" action="${conPath }/member/searchPw.do"
				method="get" class="input-group">
				<input type="text" class="input-field" id="mid" name="mid"
					placeholder="가입된 ID" required> <input type="text"
					class="input-field" id="opw" name="mname" placeholder="가입된 이름"
					required> <a href="${conPath }/member/joinForm.do"> <input
					type="checkbox" class="checkbox"><span>Don't have an
						account?</span></a>
				<button class="submit">PW찾기</button>
			</form>
		</div>
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