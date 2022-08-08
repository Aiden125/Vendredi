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
    height: 100%;
    width: 100%;
    background-image: url('${conPath}/assets/img/중식1.jpg');
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
</style>
	<link href="${conPath }/assets/css/style.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="wrap">
            <div class="form-wrap">
	<form action="${conPath }/store/storeRegister.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="oid" value="bbb">
		<table>
			<tr>
				<th>가게 사진</th>
				<td><input type="file" name="simg" required="required"></td>
			</tr>
			<tr>
				<th>가게 이름</th>
				<td><input type="text" name="sname" required="required"></td>
			</tr>
			<tr>
				<th>가게 주소</th>
				<td><input type="text" name="saddress" required="required"></td>
			</tr>
			<tr>
				<th>가게 지역</th>
				<td>
  					<select name="slocation">
    					<option value="강남" selected>강남</option>
    					<option value="강북" >강북</option>
    					<option value="경기 북부">경기 북부</option>
    					<option value="경기 남부">경기 남부</option>
  					</select> 
				</td>
			</tr>
			<tr>
				<th>가게 전화번호</th>
				<td><input type="tel" name="stel" required="required"></td>
			</tr>
			<tr>
				<th>가게 종류</th>
				<td><input type="text" name="stype" required="required"></td>
			</tr>
			<tr>
				<th>가게 가격대</th>
				<td><input type="text" name="sprice" required="required"></td>
			</tr>
			<tr>
				<th>가게 운영시간</th>
				<td><input type="text" name="stime" required="required"></td>
			</tr>
			<tr>
				<th>가게 시작시간</th>
				<td><input type="number" name="sstart" required="required"></td>
			</tr>
			<tr>
				<th>가게 닫는시간</th>
				<td><input type="number" name="send" required="required"></td>
			</tr>
			<tr>
				<th>가게 휴일</th>
				<td><input type="text" name="sholiday" required="required"></td>
			</tr>
			<tr>
				<th>대표 메뉴 1</th>
				<td><input type="text" name="smenu1" required="required"></td>
			</tr>
			<tr>
				<th>대표 메뉴 1 가격</th>
				<td><input type="text" name="smenu1cost" required="required"></td>
			</tr>
			<tr>
				<th>대표 메뉴 2</th>
				<td><input type="text" name="smenu2" required="required"></td>
			</tr>
			<tr>
				<th>대표 메뉴 2 가격</th>
				<td><input type="text" name="smenu2cost" required="required"></td>
			</tr>
			<tr>
				<th>대표 메뉴 3</th>
				<td><input type="text" name="smenu3" required="required"></td>
			</tr>
			<tr>
				<th>대표 메뉴 3 가격</th>
				<td><input type="text" name="smenu3cost" required="required"></td>
			</tr>
			<tr>
				<th>가게 검색 태그</th>
				<td><input type="text" name="ssearchtag" required="required"></td>
			</tr> 
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="button" value="뒤로 가기" onclick="location.back()">
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
</body>
</html>