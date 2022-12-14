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
<style>
	* {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}
.wrap {
    height: 500px;
    width: 100%;
    background-image: url(assets/img/디저트.jpg);
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
    width: 30px ;
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
p{
	font-family: sans-serif;
	font-size: 0.8em;
	text-decoration: none;
	
}

</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${not empty result}">
		<script>alert('${result}');</script>
	</c:if>
	 <div class="wrap" >
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">User</button>
                    <button type="button" class="togglebtn" onclick="register()">OWNER</button>
                </div>
                <div class="social-icons">
                    <img src="${conPath }/assets/img/fb.png" alt="facebook">
                    <img src="${conPath }/assets/img/tw.png" alt="twitter">
                    <img src="${conPath }/assets/img/gl.png" alt="google">
                </div>
                <form id="login" action="${conPath }/member/mlogin.do" method="post" class="input-group">
                    <input type="text" class="input-field" id="mid" name="mid" value="${mid }" placeholder="User ID" required>
                    <input type="password" class="input-field" id="mpw" name="mpw" placeholder="Password" required><br>
                    <a href="${conPath }/member/joinForm.do"><p>Don't have an account?</p></a><br>
                    <a href="${conPath }/member/search.do"><p>Forget ID or PW?</p></a><br>
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
        </div>
      
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>
        
</body>
</html>