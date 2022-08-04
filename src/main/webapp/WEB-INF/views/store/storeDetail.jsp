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
    background-image: url(assets/img/디저트.jpg);
    background-position: center;
    background-size: cover;
    position: absolute;
}
.form-wrap {
    width: 500px; 
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
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="wrap">
	<div class="form-wrap"> 
		<table>
		<tr>
			<td colspan="2"> 
				${store.sno }
				<img alt="가게 이미지" src="${conPath }/storeReviewImgFileUpload/${store.simage }" width = "75px">
			</td>
		</tr>
		<tr> 	  
			<td>
				<h1>${store.sname }</h1>
			</td>
			<td style="color:orange;">
				<fmt:formatNumber value="${store.sscore/store.sreplycnt }" pattern=".0"/>
			 </td>
		</tr> 
		<tr>
			<th>
				주소
			</th>	
			<td> 
				${store.saddress }
			</td>
		</tr>
		<tr>
			<th>
				전화번호
			</th>	
			<td> 
				${store.stel }
			</td>
		</tr>
		<tr>
			<th>
				가격대
			</th>	
			<td> 
				${store.sprice }
			</td>
		</tr>
		<tr>
			<th>
				운영시간
			</th>	
			<td> 
				${store.stime }
			</td>
		</tr>
		<tr>
			<th>
				휴무
			</th>	
			<td> 
				${store.sholiday }
			</td>
		</tr> 
		<tr>	
			<th colspan="2" align="center">
				대표 메뉴 
			</th>
		</tr>  
		<tr>
			<th>
				${store.smenu1}
			</th>	
			<td> 
				${store.smenu1cost }
			</td>
		</tr>
		<tr>
			<th>
				${store.smenu2}
			</th>	
			<td> 
				${store.smenu2cost }
			</td>
		</tr>
		<tr>
			<th>
				${store.smenu3}
			</th>	
			<td> 
				${store.smenu3cost }
			</td>
		</tr>
		<tr>
			<th colspan="2">
				추후 owner, admin 적용하게 바꿀예정 <br>
				<input type="button" value="등록 요청" onclick="location='${conPath}/request/requestWrite.do?sno=${param.sno }&oid=aaa&sname=${store.sname }'">
				<input type="button" value="가게 정보 수정" onclick="location='${conPath}/store/storeModifyView.do?sno=${param.sno }'">> 
			</th>
		</tr>
		</table>		
		<br>
		<jsp:include page="/storeReview/storeReviewList.do?sno=${param.sno }&pageNum=1"/>
	</div>	 
	</div> 
</body>
</html>