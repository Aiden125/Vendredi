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

<link rel="stylesheet" href="${conPath }/store/css/list.css">
<style>
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
	});
	function trclicked(sno) {
		location.href = '${conPath}/store/storeDetail.do?sno=' + sno;
	}
</script>
</head>
<body>
	<jsp:include page="../main/header2.jsp" />
	<section id="hello" class="img">
		<div class="overlay">
		<img src="${conPath }/assets/img/디저트.jpg" alt="" style="width: 100%; height: 15%" >
		</div>
		<div class="container">
			<div class="row">
				<div class="main_home text-center">
					<div class="home_text">
						<br /> <br />
						<h1 class="text-white text-uppercase">맛집 리스트</h1>
					</div>
				</div>
			</div>
			<!--End off row-->
		</div>
		<!--End off container -->
	</section>
	<div id="section">
		<c:if test="${paging.totCnt eq 0 }">
			<tr>
				<th colspan="5">등록된 가게가 없습니다.</th>
			</tr>
		</c:if>
		<div id="storeList">
			<c:forEach items="${storeList }" var="store">
				<c:if test="${paging.totCnt != 0 }">
					<div class="storeListCard">
						<table>
							<tr class="hotelListTr">
								<!-- 1행 -->
								<td rowspan="5"><img
									src="${conPath }/storeImgFileUpload/${store.simage1}"
									alt="가게이미지" ></td>
								<th class="td-1">${store.sname }</th>
							</tr>
							<tr>
								<!-- 2행 -->
								<td class="td-2">위치:&nbsp;&nbsp;${store.slocation }<br></td>
							</tr>
							<tr>
								<!-- 3행 -->
								<td class="td-3">종류:&nbsp;&nbsp;${store.stype }</td>
							</tr>
							<tr>
								<!-- 4행 -->
								<td class="td-4" style="color: orange; font-weight: bold">평점:&nbsp;&nbsp;${store.stscore }</td>
							</tr>
							<tr>
								<!-- 5행 -->
								<td class="td-5"><button
										onclick="location.href='${conPath }/store/storeDetail.do?sno=${store.sno }'"
										class="btn btn-default m-top-30">Detail</button></td>

							</tr>
						</table>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div id="paging" align="center">
			<c:if test="${paging.startPage> paging.blockSize }">
		[<a
					href="${conPath }/store.do?method=storeList&pageNum=${paging.startPage-1}&schItem=${param.schItem }">이전</a>]
		</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage}">
				<c:if test="${i eq paging.currentPage }">
			[<b style="color: red;">${i}</b>]
			</c:if>
				<c:if test="${i != paging.currentPage }">
			[<a
						href="${conPath }/store.do?method=storeList&pageNum=${i}&schItem=${param.schItem }">${i}</a>]
			</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
		[<a
					href="${conPath }/store.do?method=storeList&pageNum=${paging.endPage +1}&schItem=${param.schItem }">다음</a>]
		</c:if>
		</div>
	</div>
	<script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="assets/js/vendor/bootstrap.min.js"></script>

	<script src="assets/js/isotope.min.js"></script>
	<script src="assets/js/jquery.magnific-popup.js"></script>
	<script src="assets/js/jquery.easing.1.3.js"></script>
	<script src="assets/js/slick.min.js"></script>
	<script src="assets/js/jquery.collapse.js"></script>
	<script src="assets/js/bootsnav.js"></script>
	<script src="assets/js/masonry.min.js"></script>
	
	<script type="text/javascript">
		var msnry = new Masonry('.blog_area');
	</script>

	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
























