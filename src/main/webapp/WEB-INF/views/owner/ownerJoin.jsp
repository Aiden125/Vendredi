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
	<link rel="stylesheet" href="${conPath }/assets/css/bootstrap1.css">
	<link rel="stylesheet" href="${conPath }/assets/css/join.css">
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
	
	 <jsp:include page="../main/header.jsp"/>
    <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
           <div class="col-md-5">
             <img src="${conPath }/assets/img/햄버거2.jpg" alt="login" class="login-card-img" style="height:900px; width:500px;"> 
          </div>
          <div class="col-md-7">
            <div class="card-body">
              
              <p class="login-card-description">OWNER JOIN </p>
              <form action="${conPath }/owner/Join.do" method="post">
				 <div class="form-group">
                    <label for="oname" class="sr-only">이름</label>
                    <input type="text" name="oname" id="oid" required="required" class="form-control" placeholder="이름">
                  </div>	              
                  <div class="form-group">
                    <label for="oid" class="sr-only">아이디</label>
                    <input type="text" name="oid" id="mid" value="${oid }" required="required" class="form-control" placeholder="아이디">
                  </div>
                  <div id="idConfirmResult">&nbsp;</div>
                  <div class="form-group mb-4">
                    <label for="password" class="sr-only">비밀번호</label>
                    <input type="password" name="opw" id="password" required="required"  class="form-control" placeholder="비밀번호">
                  </div>
                   <div class="form-group mb-4">
                    <label for="password" class="sr-only">비밀번호확인</label>
                    <input type="password" name="opwChk" id="passwordChk" required="required"  class="form-control" placeholder="비밀번호확인">
                  </div>
                   <div id="pwChkResult">&nbsp;</div>
                   <div class="form-group">
                    <label for="otel" class="sr-only">전화번호</label>
                    <input type="text" name="otel" id="otel" required="required" class="form-control" placeholder="전화번호">
                  </div>
                  <div class="form-group">
                    <label for="oemail" class="sr-only">이메일</label>
                    <input type="email" name="oemail" id="oemail" required="required" class="form-control" placeholder="이메일">
                  </div>
                   <div id="emailConfirmResult">&nbsp;</div>
                  <div class="form-group">
                    <label for="oaddress" class="sr-only">주소</label>
                    <input type="text" name="oaddress" id="oaddress"  class="form-control" placeholder="주소">
                  </div>
                  <div class="form-group">
                    <label for="obirth" class="sr-only">생년월일</label>
                    <input type="text" name="obirth" id="obirth"  class="form-control" placeholder="생년월일">
                  </div>
                   <div class="form-group">
                    <label for="ogender" class="sr-only">성별</label>
                    <input type="radio" name="ogender" id="ogender"   checked="checked" placeholder="성별">남자
                    <input type="radio" name="ogender" id="ogender"  >여자
                  </div>
                  <input name="login" id="login" class="btn btn-block login-btn mb-4" type="submit" value="회원가입">
               		
                </form>
                <p class="login-card-footer-text">Already have an account? <a href="${conPath}/owner/LoginForm.do" class="text-reset">Login</a></p>
               
            </div>
          </div>
        </div>
      </div>
    
    </div>
  </main>
</body>
</html>