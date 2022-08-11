<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Store Page</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="favicon.ico">

<!--Google Fonts link-->
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


<!--For Plugins external css-->
<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

<!--Theme custom css -->
<link rel="stylesheet" href="${conPath}/store/css/style.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="${conPath}/store/css/responsive.css" />

<script
	src="${conPath}/store/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>

<body>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e603db168d967f3b35b2916c4eaf88a"></script>
	<c:if test="${writeRequestResult != null }">
		<script type="text/javascript">
			alert("가게 등록이 완료되었습니다.");
		</script>
	</c:if>
	<c:if test="${storeModifyResult == 1 }">
		<script type="text/javascript">
			alert("가게 정보 수정이 완료되었습니다.");
		</script>
	</c:if>
	<c:if test="${storeModifyResult == 0 }">
		<script type="text/javascript">
			alert("가게 정보 수정에 실패하였습니다.");
		</script>
	</c:if>
	<c:if test="${not empty reservation}">
		<script>
			alert("예약이 완료되었습니다");
		</script>
	</c:if>

	<body data-spy="scroll" data-target=".navbar-collapse">
	<jsp:include page="../main/header.jsp" />
	<!--Blog Features Section-->
	<section id="blog_details" class="blog_details roomy-100">
		<div class="container">
			<div class="row">

				<div class="col-md-8">
					<div class="main_blog_details">

						<div class="blog_details_left">
							<div class="blog_details_img">
								<img src="${conPath }/storeImgFileUpload/${store.simage }"
									alt="가게 이미지" />
							</div>
							<div class="blog_details_content">
								<div class="blog_details_head m-top-40">
									<div class="head_text">
										<h2>${store.sname }</h2>
										<ul class="list-inline">
											<li><a href="#" class="text-black">운영시간 : </a></li>
											<li><a href="#" class="text-black">${store.stime }</a></li>
											<li><a href="#" class="text-black">휴무 : </a></li>
											<li><a href="#" class="text-black">${store.sholiday }
											</a></li>
										</ul>
									</div>
								</div>
								<div class="blog_details_figure m-top-40">
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
										elit, sed diam nonummy nibh euismod tincidunt ut laoreet
										dolore magna aliquam erat volutpat. Ut wisi enim ad minim
										veniam, quis nostrud exerci tation ullamcorper suscipit
										lobortis nisl ut aliquip ex ea commodo consequat. Duis autem
										vel eum iriure dolor in hendrerit in vulputate velit esse
										molestie consequat, vel illum dolore eu feugiat nulla
										facilisis blandit praesent luptatum.</p>

									<blockquote class="m-top-30 m-l-30">
										<h5>
											<em>Duis autem vel eum iriure dolor in hendrerit in
												vulputate velit esse molestie consequat, vel illum dolore eu
												feugiat nulla facilisis at vero eros demonstraverunt</em>
										</h5>
									</blockquote>

									<p class="m-top-30">Claritas est etiam processus dynamicus,
										qui sequitur mutationem consuetudium lectorum. Mirum est
										notare quam littera gothica, quam nunc putamus parum claram,
										anteposuerit litterarum formas humanitatis per seacula quarta
										decima et quinta decima. Eodem modo typi, qui nobisin futurum</p>
									<p>
									<ul class="list-inline">
											<li><a href="#" class="text-black"><input
												type="button" value="예약 페이지"
												onclick="location='${conPath}/reservationForm.do?sno=${param.sno }&mid=${member.mid }&sname=${store.sname }'"></a></li>
											<c:if test="${owner.oid == store.oid || admin != null }">
											<li><a href="#" class="text-black"><input
													type="button" value="등록 요청"
													onclick="location='${conPath}/request/writeRequest.do?sno=${param.sno }&oid=aaa&sname=${store.sname }'"></a></li>
											<li><a href="#" class="text-black"><input
													type="button" value="가게 정보 수정"
													onclick="location='${conPath}/store/storeModifyView.do?sno=${param.sno }&oid=aaa'"></a></li>
											<li><a href="#" class="text-black">${store.sholiday }
											</a></li>
											</c:if>
										</ul>
									</p>
								</div>



							</div>
						</div>


						<hr />

						<div class="blog_comments">
							<form action="${conPath }/storeReview/writeReview.do"
								method="POST" enctype="multipart/form-data">
								<h4 class="m-bottom-30">Comment</h4>
								<input type="hidden" value="${store.sno}" name="sno"> <input
									type="hidden" value="aaa" name="mid"> <input
									type="hidden" value="noimg.png" name="mprofile">
								<div class="row">
									<div class="comment_item">
										<div class="col-sm-2">
											<div class="blog_comments_img">
												<img class="img-circle" src="${member.mprofile }" alt="">
											</div>
										</div>
										<div class="col-sm-8">
											<div class="comments_top_tex">
												<div class="row">
													<div class="col-sm-8 pull-left">
														<h5 class="text-uppercase">${member.mid}</h5>
													</div>
												</div>
											</div>

											<article class="comments_bottom_text m-top-10">
												<p>Claritas est etiam processus dynamicus, qui sequitur
													mutationem consuetudium lectorum. Mirum est notare quam
													littera gothica, quam nunc putamus parum claram,
													anteposuerit litterarum formas</p>
												<p>
													리뷰사진 1 <input type="file" name="srimg1">
												</p>
												<br>
												<p>
													리뷰사진 2 <input type="file" name="srimg2">
												</p>
												<br>
												<p>
													리뷰사진 3 <input type="file" name="srimg3">
												</p>
												<br>
												<p>
													리뷰사진 4 <input type="file" name="srimg4">
												</p>
												<br>
												<p>
													리뷰사진 5 <input type="file" name="srimg5">
												</p>
												<br>
											</article>

										</div>
									</div>
								</div>
							</form>
							<hr />

							<div class="row">
								<div class="comment_item m-l-40">
									<div class="col-sm-2">
										<div class="blog_comments_img">
											<img class="img-circle" src="assets/images/comment-img2.jpg"
												alt="">
										</div>
									</div>
									<div class="col-sm-8">
										<div class="comments_top_tex">
											<div class="row">
												<div class="col-sm-8 pull-left">
													<h5 class="text-uppercase">kevin lee</h5>
													<small><em>Posted in Feb 29th 2016 at 16:50</em></small>
												</div>
												<div class="col-sm-2 pull-right">
													<a href="#"><i class="fa fa-mail-reply-all"></i> Reply</a>
												</div>
											</div>
										</div>
										<article class="comments_bottom_text m-top-10">
											<p>Claritas est etiam processus dynamicus, qui sequitur
												mutationem consuetudium lectorum. Mirum est notare quam
												littera gothica, quam nunc putamus parum claram,
												anteposuerit litterarum formas</p>
										</article>
									</div>
								</div>
							</div>

							<hr />

							<div class="row">
								<div class="comment_item">
									<div class="col-sm-2">
										<div class="blog_comments_img">
											<img class="img-circle" src="assets/images/comment-img1.jpg"
												alt="">
										</div>
									</div>
									<div class="col-sm-8">
										<div class="comments_top_tex">
											<div class="row">
												<div class="col-sm-8 pull-left">
													<h5 class="text-uppercase">laingockien</h5>
													<small><em>Posted in Feb 29th 2016 at 16:50</em></small>
												</div>
												<div class="col-sm-2 pull-right">
													<a href="#"><i class="fa fa-mail-reply-all"></i> Reply</a>
												</div>
											</div>
										</div>
										<article class="comments_bottom_text margin-top-10">
											<p>Claritas est etiam processus dynamicus, qui sequitur
												mutationem consuetudium lectorum. Mirum est notare quam
												littera gothica, quam nunc putamus parum claram,
												anteposuerit litterarum formas</p>
										</article>
									</div>
								</div>
							</div>

							<hr />

						</div>
						<!-- End off Blog comments -->



						<div class="live_chate">
							<h4>leave a comment</h4>
							<div class="row">
								<form>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="exampleInputEmail1">Your Name *</label> <input
												type="email" class="form-control">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Your Email *</label> <input type="text"
												class="form-control">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Your Website *</label> <input type="text"
												class="form-control">
										</div>
									</div>

									<div class="col-sm-12">
										<div class="form-group">
											<label>Your Message *</label>
											<textarea class="form-control" rows="6"></textarea>
										</div>
										<button type="submit" class="btn btn-default m-top-30">
											send message <i class="fa fa-long-arrow-right"></i>
										</button>
									</div>

								</form>

							</div>

						</div>


					</div>
				</div>
				<!-- End off col-md-8 -->

				<div class="col-md-4">
					<div class="blog_saidbar sm-m-top-70">
						<div class="said_ctg fix">
							<h6 class="text-uppercase">${store.sname }</h6>
							<ul class="text-uppercase m-top-40">
								<li><a href="">주소 <span class="pull-right">${store.saddress }</span></a></li>
								<li><a href="">가게 지역 <span class="pull-right">${store.slocation }</span></a></li>
								<li><a href="">가게 종류 <span class="pull-right">${store.stype }</span></a></li>
								<li><a href="">전화번호 <span class="pull-right">${store.stel }</span></a></li>
								<li><a href="">가격대 <span class="pull-right">${store.sprice }</span></a></li>
							</ul>
						</div>

						<div class="said_post fix m-top-70">
							<h6 class="m-bottom-40 text-uppercase">대표 메뉴</h6>
							<div class="post_item">
								<div class="item_img">
									<img src="assets/images/s-post-img1.jpg" alt="" />
								</div>
								<div class="item_text">
									<h6>${store.smenu1}</h6>
									<p>
										<i class="fa fa-clock-o"></i>${store.smenu1cost }</p>
								</div>
							</div>
							<div class="post_item">
								<div class="item_img">
									<img src="assets/images/s-post-img2.jpg" alt="" />
								</div>
								<div class="item_text">
									<h6>${store.smenu2}</h6>
									<p>
										<i class="fa fa-clock-o"></i>${store.smenu2cost }</p>
								</div>
							</div>
							<div class="post_item">
								<div class="item_img">
									<img src="assets/images/s-post-img3.jpg" alt="" />
								</div>
								<div class="item_text">
									<h6>${store.smenu3}</h6>
									<p>
										<i class="fa fa-clock-o"></i>${store.smenu3cost }</p>
								</div>
							</div>
						</div>

						<div class="said_socail fix m-top-70">
							<h6 class="text-uppercase">instagram</h6>
							<div class="socail_items m-top-40">
								<div class="socail_item">
									<img src="assets/images/gram-img1.jpg" alt="" />
								</div>
								<div class="socail_item">
									<img src="assets/images/gram-img2.jpg" alt="" />
								</div>
								<div class="socail_item">
									<img src="assets/images/gram-img3.jpg" alt="" />
								</div>
								<div class="socail_item">
									<img src="assets/images/gram-img4.jpg" alt="" />
								</div>
								<div class="socail_item">
									<img src="assets/images/gram-img5.jpg" alt="" />
								</div>
								<div class="socail_item">
									<img src="assets/images/gram-img6.jpg" alt="" />
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- End off col-md-4 -->


			</div>
			<!-- End off row -->




		</div>
		<!-- End off container -->
	</section>
	<!-- End off blog Fashion -->


	<!-- JS includes -->

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
