<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<style>
#content {
            width: 600px;
            height : 400px;
            margin: 0 auto;
            max-width: 500px;
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
	font-family: 'IBM Plex Sans KR', sans-serif;
	width:450px;
	margin:0 auto;
	padding:20px;
	}
	#content table tr{}
	#content table tr th{
	width:230px;
	}
	#content table tr td{
	width:230px;
	text-align: center;
	padding-top:10px;
	}
	#content table .name{
	font-weight:bold;
	font-size:1.3em;
	}
	#content .btn{
	width:100px;
	height:30px;
	margin-left:25px;
	background-color: #757169;
	color:white;
	border:none;
	}
	#content input[type="text", type="password"]{
	height:25px;
	width:230px;
	border:1px solid lightgray;
	border-radius: 3px;
	padding-left:10px;
	}
	#content input[type="email"]{
	height:25px;
	width:230px;
	border:1px solid lightgray;
	border-radius: 3px;
	padding-left:10px;
	}
	b{
		color: green;
	}
	b1{
		color: red;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
		$('input[name="opw"], input[name="opwChk"]').keyup(function(){
			var opw = $('input[name="opw"]').val();
			var opwChk = $('input[name="opwChk"]').val();
			if(opw==opwChk){
				$('#pwChkResult').html('<b>비밀번호 일치</b>');
			}else{
				$('#pwChkResult').html('<b1>비밀번호 불일치</b1>');
			}
		});
	$('form').submit(function(){
			var pwChkResult = $('#pwChkResult').text().trim();
			if(pwChkResult != '비밀번호 일치'){
				alert('비밀번호를 확인해주세요');
				$('input[name="opw"]').focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<input type="hidden" name="oid" value="${owner.oid }">
	<input type="hidden" name="opw" value="${owner.opw }">
	<div id="content">
	<form action="${conPath }/owner/Delete.do?oid=${oid}" id="content_form" method="post">
		<table>
		<caption>계정삭제</caption>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="opwChk" placeholder="PW 확인" >
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div id="pwChkResult">&nbsp;</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="탈퇴하기">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>