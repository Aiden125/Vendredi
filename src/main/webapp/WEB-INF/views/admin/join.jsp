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
	<link href="${conPath }/css/admin.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			// id check
			$('input[name="aid"]').keyup(function(){
				var mid = $('input[name="aid"]').val();
				
				$.ajax({
					url : '${conPath}/admin/idConfirm.do',
					data : 'aid='+mid,
					type : 'get',
					dataType : 'html',
					success : function(data){
						$('#idConfirmResult').html(data);
					}
				});
			});
			
			// 조건 부합x인 경우 가입 못하게
			$('form').submit(function(){
				var idConfirmResult = $('#idConfirmResult').text().trim();
				if(idConfirmResult != '사용가능한 아이디입니다.'){
					alert('아이디를 확인해주세요')
					$('#idConfirmResult').focus();
					return false;
				}
			});
			
		});
	</script>
</head>
<body>

<jsp:include page="../admin/header.jsp"/>

<div id="content">
	<form action="${conPath }/admin/join.do" method="POST">
		<table id="join_table">
			<caption>관리자 등록</caption>
			<tr>
				<td colspan="2"><p class="left">아이디 <span class="red">*</span> </p><input type="text" class="box" name="aid" required="required">
				<div id="idConfirmResult"> &nbsp; </div></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">비밀번호 <span class="red">*</span></p>
				<input type="password" class="box" name="apw" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">이름 <span class="red">*</span></p>
				<input type="text" class="box" name="aname" required="required">
			</tr>
			<tr>
				<td colspan="2"><p class="left">번호 <span class="red">*</span></p>
				<input type="text" class="box" name="atel" required="required">
			</tr>
			<tr>
				<td colspan="2"><p class="left">이메일 <span class="red">*</span></p>
				<input type="email" class="box" name="aemail" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" class="blue_btn">
					<input type="button" value="취소" class="reset_btn" onclick="history.back();">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>