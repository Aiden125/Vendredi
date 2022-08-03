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
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<script>
		$(function() {
		   $("#obirth").datepicker(
		         {
		            dateFormat : 'yy-mm-dd',
		            changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
		            monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
		                  '7월', '8월', '9월', '10월', '11월', '12월' ],
		            showMonthAfterYear : true,
		            yearSuffix : '년', // "2020년 3월"
		            showOtherMonths : true,
		            dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		            changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
		            minDate : '-100y', // 현재 날짜로부터 100년 이전까지 표시
		            maxDate : 'y', // 현재 날짜이전까지만 표시
		            yearRange : 'c-100:c+100', // 년도 선택 셀렉트 
		         });
		});
	</script>
	<script>
		$(document).ready(function(){
			$('input[name="oid"]').keyup(function(){
				var oid = $('input[name="oid"]').val();
				$.ajax({
					url : '${conPath}/owner/idConfirm.do',
					type : 'get',
					dataType : 'html',
					data : 'oid='+oid,
					success : function(data, status){
						$('#idConfirmResult').html(data);
					}
				});
			});
			$('input[name="oemail"]').keyup(function(){
				var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
				var oemail = $('input[name="oemail"]').val();
				if(patternMail.test(oemail)){
					$.ajax({
						url : '${conPath}/owner/emailConfirm.do',
						type : 'get',
						dataType : 'html',
						data : "oemail="+oemail,
						success : function(data, status){
							$('#emailConfirmResult').html(data);
						}
					});//ajax
				}else if(!oemail){
					$('#emailConfirmResult').html(' &nbsp; ');
				}else{
					$('#emailConfirmResult').html('<b>메일 형식을 지켜주세요</b>');
				}
			});
			$('input[name="opw"], input[name="opwChk"]').keyup(function(){
				var opw = $('input[name="opw"]').val();
				var opwChk = $('input[name="opwChk"]').val();
				if(opw==opwChk){
					$('#pwChkResult').html('<b>비밀번호 일치</b>');
				}else{
					$('#pwChkResult').html('<b>비밀번호 불일치</b>');
				}
			});
			$('form').submit(function(){
				var idConfirmResult = $('#idConfirmResult').text().trim();
				if(idConfirmResult != '사용가능한 ID입니다'){
					alert('아이디를 확인해주세요');
					$('input[name="oid"]').focus();
					return false;
				}
				var emailConfirmResult = $('#emailConfirmResult').text().trim();
				if(emailConfirmResult != '사용가능한 E-MAIL입니다'){
					alert('E-MAIL을 확인해주세요');
					$('input[name="oemail"]').focus();
					return false;
				}
			});
		});
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${conPath }/js/address.js"></script>
</head>
<body>
	<div id="content">
		<form action="${conPath }/owner/Join.do" method="post">
			<table>
			<caption>회원가입 화면</caption>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="oid" required="required">
						<div id="idConfirmResult" class="in"> &nbsp; </div>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="opw" id="opw" required="required">
					</td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td>
						<input type="password" name="opwChk" id="opwChk" required="required">
						<div id="pwChkResult" class="in"> &nbsp; </div>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="oname" required="required">
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="otel" required="required">
					</td>
				</tr>
				<tr>
					<td>E-MAIL</td>
					<td>
						<input type="email" name="oemail" required="required">
						<div id="emailConfirmResult" class="in"> &nbsp; </div>
					</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" id="sample4_postcode" name="mpost" class="text_box"  placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="sample4_roadAddress" name="oaddress"  placeholder="도로명주소">
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide"></span>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="text" id="obirth" name="obirth" required="required">
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<select id="ogender" name="ogender" class="in" required="required">
							<option>성별</option>
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="btn" value="회원가입">
						<input type="button" class="btn" value="취소" onclick="location.href='${conPath}/main.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>