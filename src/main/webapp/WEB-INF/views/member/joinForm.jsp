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
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">


<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/slick-theme.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/fonticons.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/bootsnav.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="${conPath }/assets/css/bootstrap1.css">
<link rel="stylesheet" href="${conPath }/assets/css/join.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="assets/css/responsive.css" />

<script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>	
<style>
body, html {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
	background-color: white;
}
</style>
<script>
	$(document)
			.ready(
					function() {
						$('input[name="mid"]').keyup(function() {
							var mid = $('input[name="mid"]').val();
							$.ajax({
								url : '${conPath}/member/idConfirm.do',
								type : 'get',
								dataType : 'html',
								data : 'mid=' + mid,
								success : function(data) {
									$('#idConfirmResult').html(data);
								}
							});//ajax
						});// mid keyup ?????????
						$('input[name="mpw"], input[name="mpwChk"]').keyup(
								function() {
									var mpw = $('input[name="mpw"]').val();
									var mpwChk = $('input[name="mpwChk"]')
											.val();
									if (mpw == mpwChk) {
										$('#pwChkResult').text('???????????? ??????');
									} else {
										$('#pwChkResult').html(
												'<b>???????????? ?????????</b>');
									}
								}); // pw check
						$('input[name="memail"]')
								.keyup(
										function() {
											var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // ?????? ??????
											var memail = $(
													'input[name="memail"]')
													.val();
											if (patternMail.test(memail)) {
												$
														.ajax({
															url : '${conPath}/member/emailConfirm.do',
															type : 'get',
															dataType : 'html',
															data : 'memail='
																	+ memail,
															success : function(
																	data) {
																$(
																		'#emailConfirmResult')
																		.html(
																				data);
															}
														});//ajax
											} else if (!memail) {
												$('#emailConfirmResult').html(
														' &nbsp; ');
											} else {
												$('#emailConfirmResult').html(
														'?????? ????????? ???????????????');
											}//if
										});// mEmail keyup ?????????
						$('form')
								.submit(
										function() {
											var idConfirmResult = $(
													'#idConfirmResult').text()
													.trim();
											var pwChkResult = $('#pwChkResult')
													.text().trim();
											var emailConfirmResult = $(
													'#emailConfirmResult')
													.text().trim();
											if (idConfirmResult != '?????? ????????? ID') {
												alert('??????????????? ID??? ???????????????');
												$('input[name="mid"]').focus();
												return false;
											} else if (pwChkResult != '???????????? ??????') {
												alert('??????????????? ???????????????');
												$('input[name="mpw"]').focus();
												return false;
											} else if (emailConfirmResult != ''
													&& emailConfirmResult != '?????? ????????? ???????????????') {
												alert('???????????? ???????????????');
												$('input[name="memail"]')
														.focus();
												return false;
											}
										});
					});//mIdConfirm??? click?????????
</script>

<script>
	$(function() {
		$("#mbirth").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					changeMonth : true, // ?????? ?????? ??? ?????? ????????? ?????? ??????
					monthNamesShort : [ '1???', '2???', '3???', '4???', '5???', '6???',
							'7???', '8???', '9???', '10???', '11???', '12???' ],
					showMonthAfterYear : true,
					yearSuffix : '???', // "2020??? 3???"
					showOtherMonths : true,
					dayNamesMin : [ '???', '???', '???', '???', '???', '???', '???' ],
					changeYear : true, // ?????? ?????? ??? ?????? ????????? ?????? ??????
					minDate : '-100y', // ?????? ??????????????? 100??? ???????????? ??????
					maxDate : 'y', // ?????? ????????????????????? ??????
					yearRange : 'c-100:c+100', // ?????? ?????? ????????? 
				});
	});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
		<div class="container">
			<div class="card login-card">
				<div class="row no-gutters" style="padding-top: 50px;">
					<div class="col-md-5">
						<img src="${conPath }/assets/img/?????????2.jpg" alt="login"
							class="login-card-img" style="height: 900px; width: 500px;">
					</div>
					<div class="col-md-7">
						<div class="card-body">

							<p class="login-card-description">CUSTOMER JOIN</p>
							<form action="${conPath }/member/join.do" method="post">
								<div class="form-group">
									<label for="mname" class="sr-only">??????</label> <input
										type="text" name="mname" id="mid" required="required"
										class="form-control" placeholder="??????">
								</div>
								<div class="form-group">
									<label for="mid" class="sr-only">?????????</label> <input type="text"
										name="mid" id="mid" value="${mid }" required="required"
										class="form-control" placeholder="?????????">
								</div>
								<div id="idConfirmResult">&nbsp;</div>
								<div class="form-group mb-4">
									<label for="password" class="sr-only">????????????</label> <input
										type="password" name="mpw" id="password" required="required"
										class="form-control" placeholder="????????????">
								</div>
								<div class="form-group mb-4">
									<label for="password" class="sr-only">??????????????????</label> <input
										type="password" name="mpwChk" id="password"
										required="required" class="form-control" placeholder="??????????????????">
								</div>
								<div id="pwChkResult">&nbsp;</div>
								<div class="form-group">
									<label for="mtel" class="sr-only">????????????</label> <input
										type="text" name="mtel" id="mtel" required="required"
										class="form-control" placeholder="????????????">
								</div>
								<div class="form-group">
									<label for="memail" class="sr-only">?????????</label> <input
										type="email" name="memail" id="memail" required="required"
										class="form-control" placeholder="?????????">
								</div>
								<div id="emailConfirmResult">&nbsp;</div>
								<div class="form-group">
									<label for="oaddress" class="sr-only">????????????</label><input
										type="text" id="sample4_postcode" name="mpost"
										class="text_box" placeholder="????????????"> <input
										type="button" onclick="sample4_execDaumPostcode()"
										value="???????????? ??????">
								</div>
								<div class="form-group">
									<label for="maddress" class="sr-only">??????</label> <input
										type="text" name="maddress" id="sample4_roadAddress"
										class="form-control" placeholder="??????"> <input
										type="hidden" id="sample4_jibunAddress" placeholder="????????????">
									<span id="guide"></span>
								</div>
								<div class="form-group">
									<label for="mbirth" class="sr-only">????????????</label> <input
										type="text" name="mbirth" id="mbirth" class="form-control"
										placeholder="????????????">
								</div>
								<div class="form-group">
									<label for="mgender" class="sr-only">??????</label> <input
										type="radio" name="mgender" id="mgender" checked="checked"
										placeholder="??????">?????? <input type="radio" name="mgender"
										id="mgender">??????
								</div>
								<input name="login" id="login"
									class="btn btn-block login-btn mb-4" type="submit" value="????????????">

							</form>
							<p class="ownerJoin">
								Owner Join &nbsp;<a href="${conPath }/owner/JoinForm.do">?????????
									????????????</a>
							</p>
							<p class="login-card-footer-text">
								Already have an account? <a
									href="${conPath}/member/loginForm.do" class="text-reset">Login</a>
							</p>
						</div>
					</div>
				</div>
			</div>

		</div>
	</main>
</body>
</html>