<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Groovin Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="">
</style>
<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
.searchInput {
	outline: none;
	float: left;
	font-size: 16px;
	transition: 0.4s;
	line-height: 50px;
	width: 300px;
	border-radius: 50px;
	background: white;
}

.searchButton {
	color: white;
	float: right;
	width: 50px;
	height: 50px;
	padding: 10px;
	border-radius: 50%;
	background: #2f3640;
	display: flex;
	justify-content: center;
	align-items: center;
	transition: 0.4s;
}
</style>
</head>

<body>
<c:if test="${not empty Delete }">
	<script>
		alert('?????????????????? ???????????????');
	</script>
</c:if>
	<jsp:include page="header.jsp" />
	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div class="hero-container">
			<div id="heroCarousel" data-bs-interval="5000"
				class="carousel slide carousel-fade" data-bs-ride="carousel">

				<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<!-- Slide 1 -->
					<div class="carousel-item active"
						style="background-image: url(assets/img/?????????.jpg);">
						<div class="carousel-container">
							<div class="carousel-content">
								<h2 class="animate__animated animate__fadeInDown">Vendredi</h2>
								<p class="animate__animated animate__fadeInUp">????????? ???????????? ?????????
									Vendredi??? ?????? ????????? ????????? ?????? ??? ?????? ????????? ???????????????!</p>
								<div class="container h-100">
										<div class="d-flex justify-content-center h-100">
											<form
												action="${conPath}/store/storeListSearch.do?ssearchtag=${param.ssearchtag}">
												<div class="searchBox">
													<input class="searchInput" type="text" name="ssearchtag"
														value="${param.ssearchtag}">
													<button class="searchButton">
														<i class="material-icons"> Search </i>
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<a class="carousel-control-prev" href="#heroCarousel" role="button"
				data-bs-slide="prev"> <span
				class="carousel-control-prev-icon bi bi-chevron-left"
				aria-hidden="true"></span>
			</a> <a class="carousel-control-next" href="#heroCarousel" role="button"
				data-bs-slide="next"> <span
				class="carousel-control-next-icon bi bi-chevron-right"
				aria-hidden="true"></span>
			</a>



	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container">

				<div class="section-title">
					<h2>????????? ??????</h2>
					
				</div>

				<div class="row">
					<div class="col-lg-12 d-flex justify-content-center">
						<ul id="portfolio-flters">
							<li data-filter="*" class="filter-active">All</li>
							<li data-filter=".filter-app">This Week</li>
							<li data-filter=".filter-card">Last Week</li>
						</ul>
					</div>
				</div>

				<div class="row portfolio-container">

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="${conPath }/assets/img/??????1.jpg" class="img-fluid"
								alt="" style="width: 416, height:312">
							<div class="portfolio-info">
								<h4>??????</h4>
								<p>??????</p>
								<div class="portfolio-links">
									<a href="${conPath }/assets/img/??????1.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										title="#??????#??????#???"><i class="bx bx-plus"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="${conPath }/assets/img/??????1.jpg" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>?????????</h4>
								<p>?????????</p>
								<div class="portfolio-links">
									<a href="${conPath }/assets/img/??????1.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										title="#?????????#??????"><i class="bx bx-plus"></i></a> 
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="${conPath }/assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>?????????</h4>
								<p>?????????</p>
								<div class="portfolio-links">
									<a href="${conPath }/assets/img/??????.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										title="#?????????#??????#??????"><i class="bx bx-plus"></i></a> 
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="${conPath }/assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>??????</h4>
								<p>??????</p>
								<div class="portfolio-links">
									<a href="${conPath }/assets/img/??????.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										title="#?????????#??????"><i class="bx bx-plus"></i></a> 
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="${conPath }/assets/img/????????????.jpg" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>????????????</h4>
								<p>????????????</p>
								<div class="portfolio-links">
									<a href="${conPath }/assets/img/????????????.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										title="#????????????#??????#????????????"><i class="bx bx-plus"></i></a> 
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="${conPath }/assets/img/??????1.jpg" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>?????? ??????</h4>
								<p>?????? ??????</p>
								<div class="portfolio-links">
									<a href="${conPath }/assets/img/??????1.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										title="#????????????#??????"><i class="bx bx-plus"></i></a> 
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="${conPath }/assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>??????</h4>
								<p>??????</p>
								<div class="portfolio-links">
									<a href="${conPath }/assets/img/??????.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										title="#??????"><i class="bx bx-plus"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="${conPath }/assets/img/?????????.jpg" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>?????????</h4>
								<p>?????????</p>
								<div class="portfolio-links">
									<a href="${conPath }/assets/img/?????????.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										title="#?????????"><i class="bx bx-plus"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="${conPath }/assets/img/?????????.jpg" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>?????????</h4>
								<p>?????????</p>
								<div class="portfolio-links">
									<a href="${conPath }/assets/img/?????????.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										title="#?????????#?????????"><i class="bx bx-plus"></i></a>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Portfolio Section -->

		<!-- ======= ????????? ?????? ?????? Section ======= -->
		<section id="team" class="team">
			<div class="container">

				<div class="section-title">
					<h2>????????? ?????? ??????</h2>
				</div>

				<div class="row">

					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="member">
							<img src="assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
								<div class="member-info-content">
									<h4>??????/????????????</h4>
									<span>#?????? ?????????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.1s">
						<div class="member">
							<a><img src="assets/img/?????????.jpg" class="img-fluid" alt=""></a>
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
								<div class="member-info-content">
									<h4>?????????</h4>
									<span>#??????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.2s">
						<div class="member">
							<img src="assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=?????????'">
								<div class="member-info-content">
									<h4>????????????/?????????</h4>
									<span>#????????????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
						<div class="member">
							<img src="assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
								<div class="member-info-content">
									<h4>??????</h4>
									<span>#??????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
						<div class="member">
							<img src="assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
								<div class="member-info-content">
									<h4>??????</h4>
									<span>#??????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
						<div class="member">
							<img src="assets/img/?????????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=?????????'">
								<div class="member-info-content">
									<h4>?????????</h4>
									<span>#??????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
						<div class="member">
							<img src="assets/img/?????????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=?????????'">
								<div class="member-info-content">
									<h4>?????????</h4>
									<span>#??????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
						<div class="member">
							<img src="assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
								<div class="member-info-content">
									<h4>??????</h4>
									<span>#??????</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
						<div class="member">
							<img src="assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
								<div class="member-info-content">
									<h4>??????</h4>
									<span>#????????????</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
						<div class="member">
							<img src="assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
								<div class="member-info-content">
									<h4>??????</h4>
									<span>#?????????</span>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- End Team Section -->

		<!-- ======= ????????? ?????? ?????? Section ======= -->
		<section id="team" class="team">
			<div class="container">

				<div class="section-title">
					<h2>????????? ?????? ??????</h2>
					
				</div>

				<div class="row">

					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="member">
							<img src="assets/img/??????.jpg" class="img-fluid" alt="">
							<div class="member-info">
								<div class="member-info-content"
									onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
									<h4>2022 ?????? ?????? TOP 30</h4>
									<span>?????????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.1s">
						<div class="member">
							<img src="assets/img/??????1.jpg" class="img-fluid" alt="">
							<div class="member-info">
								<div class="member-info-content"
									onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
									<h4>2022 ?????? ?????? TOP 30</h4>
									<span>?????????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.2s">
						<div class="member">
							<img src="assets/img/??????1.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
								<div class="member-info-content">
									<h4>2022 ?????? ?????? TOP 30</h4>
									<span>?????????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
						<div class="member">
							<img src="assets/img/????????????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
								<div class="member-info-content">
									<h4>2022 ?????? ?????? TOP 30</h4>
									<span>?????????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
						<div class="member">
							<img src="assets/img/?????????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=?????????'">
								<div class="member-info-content">
									<h4>2022 ????????? ?????? TOP 30</h4>
									<span>?????????</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
						<div class="member">
							<img src="assets/img/?????????.jpg" class="img-fluid" alt="">
							<div class="member-info"
								onclick="location.href='${conPath }/store/storeListSearch.do?ssearchtag=??????'">
								<div class="member-info-content">
									<h4>2022 ??? ??? ?????? TOP 30</h4>
									<span>?????????</span>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Team Section -->



<!-- 		<!-- ======= Contact Section ======= --> -->
<!-- 		<section id="contact" class="contact"> -->
<!-- 			<div class="container"> -->

<!-- 				<div class="section-title"> -->
<!-- 					<h2>Contact</h2> -->
<!-- 					<p>Magnam dolores commodi suscipit. Necessitatibus eius -->
<!-- 						consequatur ex aliquid fuga eum quidem. Sit sint consectetur -->
<!-- 						velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit -->
<!-- 						suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem -->
<!-- 						hic quas.</p> -->
<!-- 				</div> -->

<!-- 				<div class="row contact-info"> -->

<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="contact-address"> -->
<!-- 							<i class="bi bi-geo-alt"></i> -->
<!-- 							<h3>Address</h3> -->
<!-- 							<address>A108 Adam Street, NY 535022, USA</address> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="contact-phone"> -->
<!-- 							<i class="bi bi-phone"></i> -->
<!-- 							<h3>Phone Number</h3> -->
<!-- 							<p> -->
<!-- 								<a href="tel:+155895548855">+1 5589 55488 55</a> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="contact-email"> -->
<!-- 							<i class="bi bi-envelope"></i> -->
<!-- 							<h3>Email</h3> -->
<!-- 							<p> -->
<!-- 								<a href="mailto:info@example.com">info@example.com</a> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 				</div> -->

<!-- 				<div class="form"> -->
<!-- 					<form action="forms/contact.php" method="post" role="form" -->
<!-- 						class="php-email-form"> -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-6 form-group"> -->
<!-- 								<input type="text" name="name" class="form-control" id="name" -->
<!-- 									placeholder="Your Name" data-rule="minlen:4" -->
<!-- 									data-msg="Please enter at least 4 chars"> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-6 form-group mt-3 mt-md-0"> -->
<!-- 								<input type="email" class="form-control" name="email" id="email" -->
<!-- 									placeholder="Your Email" data-rule="email" -->
<!-- 									data-msg="Please enter a valid email"> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="form-group mt-3"> -->
<!-- 							<input type="text" class="form-control" name="subject" -->
<!-- 								id="subject" placeholder="Subject" required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group mt-3"> -->
<!-- 							<textarea class="form-control" name="message" rows="5" -->
<!-- 								placeholder="Message" required></textarea> -->
<!-- 						</div> -->
<!-- 						<div class="my-3"> -->
<!-- 							<div class="loading">Loading</div> -->
<!-- 							<div class="error-message"></div> -->
<!-- 							<div class="sent-message">Your message has been sent. Thank -->
<!-- 								you!</div> -->
<!-- 						</div> -->
<!-- 						<div class="text-center"> -->
<!-- 							<button type="submit">Send Message</button> -->
<!-- 						</div> -->
<!-- 					</form> -->
<!-- 				</div> -->

<!-- 			</div> -->
<!-- 		</section> -->
		<!-- End Contact Section -->

	</main>
	<!-- End #main -->

	<jsp:include page="footer.jsp" />

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>