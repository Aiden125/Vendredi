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
<link rel="icon" type="image/png" href="favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">


<link rel="stylesheet" href="${conPath}/store/css/slick.css">
<link rel="stylesheet" href="${conPath}/store/css/slick-theme.css">
<link rel="stylesheet" href="${conPath}/store/css/animate.css">
<link rel="stylesheet" href="${conPath}/store/css/fonticons.css">
<link rel="stylesheet" href="${conPath}/store/css/font-awesome.min.css">
<link rel="stylesheet" href="${conPath}/store/css/bootstrap.css">
<link rel="stylesheet" href="${conPath}/store/css/magnific-popup.css">
<link rel="stylesheet" href="${conPath}/store/css/bootsnav.css">
<link rel="stylesheet" href="${conPath}/store/css/responsive.css" />

<script
	src="${conPath}/store/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body>
	<div class="culmn">
		<nav
			class="navbar navbar-default navbar-fixed white no-background bootsnav text-uppercase">
			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<form
						action="${conPath}/store/storeListSearch.do?ssearchtag=${param.ssearchtag}">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-search"></i></span>
							<input type="text" class="form-control" placeholder="Search" name="ssearchtag" value="${param.ssearchtag}">
							<span class="input-group-addon close-search"><i
								class="fa fa-times"></i></span>
						</div>
					</form>
				</div>
			</div>
			<!-- End Top Search -->

			<div class="container">
				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navbar-menu">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" style="font-size: 2em; font-style: bold; line-height: 50px;"
						href="${conPath }/main.do">Vendredi </a>
				</div>
				<!-- End Header Navigation -->

				<!--로그인 전 화면  -->
				<c:if test="${empty member && empty owner }">
					<div class="collapse navbar-collapse" id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li><a href="${conPath }/main.do">Home</a></li>
							<li><a href="${conPath }/member/loginForm.do">Login</a></li>
							<li><a href="${conPath }/member/joinForm.do">Join</a></li>
							<li><a href="${conPath }/store/storeList.do">맛집 리스트</a></li>
							<li><a href="${conPath }/qna/list.do">Q&A</a></li>
						</ul>
					</div>
				</c:if>
				<!-- 고객 로그인 후  -->
				<c:if test="${not empty member }">
					<div class="collapse navbar-collapse" id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li><a href="${conPath }/main.do">${member.mname }님</a></li>
							<li><a href="${conPath }/member/modify.do">my
									Page</a></li>
							<li><a href="${conPath }/store/storeList.do">맛집 리스트</a></li>
							<li><a href="${conPath }/qna/list.do">QnA</a></li>
							<li><a href="${conPath }/storeLike/myLikeList.do?mid=${member.mid}">Like</a></li>
							<li><a href="${conPath }/member/logout.do">Logout</a></li>
						</ul>
					</div>
				</c:if>
				<!--사장님 로그인 후  -->
				<c:if test="${not empty owner}">
					<div class="collapse navbar-collapse" id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li><a href="${conPath }/main.do">${owner.oname }님</a></li>
							<li><a href="${conPath }/owner/Info.do?oid=${oid}">my Page</a></li>
							<li><a href="${conPath }/owner/StoreList.do?oid=${oid}">my Store</a></li>
							<li><a href="${conPath }/owner/ReState.do?oid=${oid}">예약 현황</a></li>
							<li><a href="${conPath }/oboard/List.do">커뮤니티</a></li>
							<li><a href="${conPath }/owner/Logout.do">Logout</a></li>
						</ul>
					</div>
				</c:if>
				<!-- /.navbar-collapse -->
			</div>


		</nav>
	</div>
	<!-- JS includes -->

	<script src="${conPath}/store/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="${conPath}/store/js/vendor/bootstrap.min.js"></script>

	<script src="${conPath}/store/js/isotope.min.js"></script>
	<script src="${conPath}/store/js/jquery.magnific-popup.js"></script>
	<script src="${conPath}/store/js/jquery.easing.1.3.js"></script>
	<script src="${conPath}/store/js/slick.min.js"></script>
	<script src="${conPath}/store/js/jquery.collapse.js"></script>
	<script src="${conPath}/store/js/bootsnav.js"></script>

	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>