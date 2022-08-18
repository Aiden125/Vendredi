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
		#content{
			width: 800px;
	        height : 100%;
	        margin: 0 auto;
	        margin-top: 200px;
	        margin-bottom:80px;
	        padding: 20px;
	        background: #fff;
	        -webkit-border-radius: 10px;
	        -moz-border-radius: 10px;
	        border-radius: 10px;
	        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		#content table{
			width: 700px;
		}
		#content table th{
			width: 100px;
		}
		#content table tr td{
			width:300px;
			text-align: center;
			padding-top:10px;
		}
		#content textarea{
			width:230px;
			padding-top:10px;
			margin-left: 30px;
			border:none;
		}
		#content input:not(.btn){
			border-left:none;
			border-right:none;
			border-top:none;
			width:300px;
		}
		#content input[type='file']{
			margin-left: 60px;
		}
		#content .btn{
			margin:  30px;
            background: #fff;
            border-color: black;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
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
	<div id="content">
	<form action="${conPath }/store/storeRegister.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="oid" value="${owner.oid }">
		<table >
			<tr>
				<th>가게 사진 1</th>
				<td><input type="file" name="simg1" required="required"></td>
			</tr>
			<tr>
				<th>가게 사진 2</th>
				<td><input type="file" name="simg2" required="required"></td>
			</tr>
			<tr>
				<th>가게 사진 3</th>
				<td><input type="file" name="simg3" required="required"></td>
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
					<input type="submit" value="등록" class="btn">
					<input type="button" value="뒤로 가기" class="btn" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>