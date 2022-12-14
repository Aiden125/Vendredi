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
<style>
.input-file-button {
   padding: 6px 25px;
   background-color: #FF6600;
   border-radius: 4px;
   color: white;
   cursor: pointer;
}
</style>
</head>

<body>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e603db168d967f3b35b2916c4eaf88a"></script>
	<c:if test="${writeRequestResult != null }">
		<script type="text/javascript">
			alert("?????? ????????? ?????????????????????.");
		</script>
	</c:if>
	<c:if test="${storeModifyResult == 1 }">
		<script type="text/javascript">
			alert("?????? ?????? ????????? ?????????????????????.");
		</script>
	</c:if>
	<c:if test="${storeModifyResult == 0 }">
		<script type="text/javascript">
			alert("?????? ?????? ????????? ?????????????????????.");
		</script>
	</c:if>
	<c:if test="${not empty reservation }">
		<script>
			alert("????????? ?????????????????????");
		</script>
	</c:if>
	<script>
	// ???????????? ????????? ???????????? ????????? ?????? ???????????? ?????????
	function uploadFileAdded() {
	    var uploadFiles = document.getElementById("uploadFiles")
	    for (var i = 0; i < uploadFiles.files.length; i++) {
	        var file = uploadFiles.files[i];
	        // ????????? ?????? ???????????? ????????????.
	        var uploader = new Uploader(file);
	        uploader.startUpload();
	    }
	    // ?????? ???????????? uploadFiles??? ????????? ?????? ????????? ??????????????????.
	    document.getElementById("uploadForm").reset();
	    
	} 
<body data-spy="scroll" data-target=".navbar-collapse">
	<jsp:include page="../main/header2.jsp" />
	<!--Blog Features Section-->
	<section id="blog_details" class="blog_details roomy-100">
		<div class="container">
			<div class="row">

				<div class="col-md-8">
					<div class="main_blog_details">

						<div class="blog_details_left">
							<div class="blog_details_img">
								<img src="${conPath }/storeImgFileUpload/${store.simage1 }"
									alt="?????? ?????????" style="width: 200px; height: 200px;" />
									<img src="${conPath }/storeImgFileUpload/${store.simage2 }"
									alt="?????? ?????????" style="width: 200px; height: 200px;" />
									<img src="${conPath }/storeImgFileUpload/${store.simage3 }"
									alt="?????? ?????????" style="width: 200px; height: 200px;" />
							</div>
							
							<div class="blog_details_content">
								<div class="blog_details_head m-top-40">
									<div class="head_text">
										<h2>${store.sname }</h2>
										<ul class="list-inline">
											<li><a href="#" class="text-black">???????????? : </a></li>
											<li><a href="#" class="text-black"><i class="fa fa-clock-o"></i>${store.stime }</a></li>
											<li><a href="#" class="text-black">?????? : </a></li>
											<li><a href="#" class="text-black">${store.sholiday }</a></li>
											<li><c:if test="${storeLike.mid eq 'aaa' }">
													<a
														href="${conPath }/storeLike/deleteLike1.do?mid=aaa&sno=${store.sno}">
														<img alt="????????? ?????? ?????????"
														src="${conPath }/storeImgFileUpload/cancel.png"
														style="width: 75px">
													</a>
												</c:if> <c:if test="${storeLike.mid == null }">
													<a
														href="${conPath }/storeLike/insertLike.do?mid=aaa&sno=${store.sno}&sname=${store.sname}">
														<img alt="????????? ?????? ?????????"
														src="${conPath }/storeImgFileUpload/like.png"
														style="width: 75px">
													</a>
												</c:if></li>
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
									<c:if test="${member != null }">
										<li><a href="#" class="text-black"><input
												type="button" value="?????? ?????????"
												onclick="location='${conPath}/reservationForm.do?sno=${param.sno }&sname=${store.sname }'"></a></li>
										</c:if>
										<c:if test="${owner.oid == store.oid || admin != null }">
											<li><a href="#" class="text-black"><input
													type="button" value="?????? ??????"
													onclick="location='${conPath}/request/writeRequest.do?sno=${param.sno }&oid=${owner.oid }&sname=${store.sname }'"></a></li>
											<li><a href="#" class="text-black"><input
													type="button" value="?????? ?????? ??????"
													onclick="location='${conPath}/store/storeModifyView.do?sno=${param.sno }&oid=${owner.oid }'"></a></li>
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
							<h4 class="m-bottom-30">Comment</h4>
							<c:if test="${paging.totCnt eq 0 }">
								<tr>
									<th colspan="5">????????? ????????? ????????????.</th>
								</tr>
							</c:if>
							<c:if test="${paging.totCnt != 0 }">
								<c:forEach items="${storeReviewList }" var="storeReview">
									<input type="hidden" value="${store.sno}" name="sno">
									<input type="hidden" value="aaa" name="mid">
									<input type="hidden" value="noimg.png" name="mprofile">
									<div class="row">
										<div class="comment_item">
											<div class="col-sm-2">
												<div class="blog_comments_img">
													<img class="img-circle"
														src="${conPath }/storeReviewImgFileUpload/${storeReview.mprofile }"
														width="75px" alt="">
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
													<p>${storeReview.srcontent }</p>
													<p>?????? ?????? : ${storeReview.srscore }</p>
													<p>
														<img alt="?????? ?????????"
															src="${conPath }/storeReviewImgFileUpload/${storeReview.srimage1}"
															width="75px">
														
													</p>
												</article>

											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<hr />
						</div>
						<!-- End off Blog comments -->
						<div class="live_chate">
							<h4>leave a comment</h4>
							<c:if test="${member != null }">
								<div class="row">
									<form action="${conPath }/storeReview/writeReview.do"
										method="POST" enctype="multipart/form-data">
										<input type="hidden" value="${store.sno}" name="sno">
										<input type="hidden" value="${member.mid }" name="mid">
										<input type="hidden" value="${member.mprofile }"
											name="mprofile">
										<div class="col-sm-4">
											<div class="form-group">
												<label>Your Name *</label> <input type="text"
													value="${member.mname}" class="form-control">
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label for="input-file">?????? ?????? *</label><input type="file" name="srimg1" id="input-file">
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label>Your Message *</label>
												<textarea class="form-control" rows="6" name="srcontent">
												</textarea>

												<p>
													<select name="srscore">
														<option value="1">???????????????</option>
														<option value="2">???????????????</option>
														<option value="3">???????????????</option>
														<option value="4">???????????????</option>
														<option value="5" selected>???????????????</option>
													</select>
												</p>
											</div>
											<button type="submit" class="btn btn-default m-top-30">
												?????? ?????? <i class="fa fa-long-arrow-right"></i>
											</button>
										</div>
									</form>
								</div>
							</c:if>
						</div>


					</div>
				</div>
				<!-- End off col-md-8 -->

				<div class="col-md-4">
					<div class="blog_saidbar sm-m-top-70">
						<div class="said_ctg fix">
							<h6 class="text-uppercase">${store.sname }</h6>
							<ul class="text-uppercase m-top-40">
								<li><a href="">?????? <span class="pull-right">${store.saddress }</span></a></li>
								<li><a href="">?????? ?????? <span class="pull-right">${store.slocation }</span></a></li>
								<li><a href="">?????? ?????? <span class="pull-right">${store.stype }</span></a></li>
								<li><a href="">???????????? <span class="pull-right">${store.stel }</span></a></li>
								<li><a href="">????????? <span class="pull-right">${store.sprice }</span></a></li>
							</ul>
						</div>

						<div class="said_post fix m-top-70">
							<h6 class="m-bottom-40 text-uppercase">?????? ??????</h6>
							<div class="post_item">
								<div class="item_img">
									<img src="${conPath}/assets/img/menu1.jpg" alt="" />
								</div>
								<div class="item_text">
									<h6>${store.smenu1}</h6>
									<p>${store.smenu1cost }</p>
								</div>
							</div>
							<div class="post_item">
								<div class="item_img">
									<img src="${conPath}/assets/img/menu2.jpg" alt="" />
								</div>
								<div class="item_text">
									<h6>${store.smenu2}</h6>
									<p>${store.smenu2cost }</p>
								</div>
							</div>
							<div class="post_item">
								<div class="item_img">
									<img src="${conPath}/assets/img/menu3.jpg" alt="" />
								</div>
								<div class="item_text">
									<h6>${store.smenu3}</h6>
									<p>${store.smenu3cost }</p>
								</div>
							</div>
						</div>
						<div class="said_socail fix m-top-70">
							<h6 class="text-uppercase">??????</h6>
							<div class="socail_items m-top-40" id="map"
								style="width: 400px; height: 400px;"></div>
						</div>
						<script>
		var mapContainer = document.getElementById('map'), // ????????? ????????? div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${store.slati}, ${store.slongti}), // ????????? ????????????
	        level: 3 // ????????? ?????? ??????
	    };

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// ????????? ????????? ??????????????? 
		var markerPosition  = new kakao.maps.LatLng(${store.slati}, ${store.slongti}); 

		// ????????? ???????????????
		var marker = new kakao.maps.Marker({
	    	position: markerPosition
		});

		// ????????? ?????? ?????? ??????????????? ???????????????
	marker.setMap(map);

	var iwContent = '<div style="padding:5px;">${store.sname} <br><a href="https://map.kakao.com/link/map/${store.sname},${store.slati},${store.slongti}" style="color:blue" target="_blank">???????????????</a> <a href="https://map.kakao.com/link/to/${store.sname},${store.slati},${store.slongti}" style="color:blue" target="_blank">?????????</a></div>', // ?????????????????? ????????? ???????????? HTML ??????????????? document element??? ???????????????
	    iwPosition = new kakao.maps.LatLng(${store.slati}, ${store.slongti}); //??????????????? ?????? ???????????????

	// ?????????????????? ???????????????
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// ?????? ?????? ?????????????????? ???????????????. ????????? ??????????????? marker??? ???????????? ????????? ?????? ?????? ???????????????
	infowindow.open(map, marker);   
</script>
                  <div class="said_socail fix m-top-70">
                     <h6 class="text-uppercase">instagram</h6>
                     <div class="socail_items m-top-40">
                        <div class="socail_item">
                           <img src="${conPath}/assets/img/insta0.jpg" alt="" />
                        </div>
                        <div class="socail_item">
                           <img src="${conPath}/assets/img/insta7.jpg" alt=""  />
                        </div>
                        <div class="socail_item">
                           <img src="${conPath}/assets/img/insta8.jpg" alt=""  />
                        </div>
                        <div class="socail_item">
                           <img src="${conPath}/assets/img/insta1.jpg" alt=""  />
                        </div>
                        <div class="socail_item">
                           <img src="${conPath}/assets/img/insta2.jpg" alt="" style="width: 200px;"/>
                        </div>
                        <div class="socail_item">
                           <img src="${conPath}/assets/img/insta3.jpg" alt="" style="width: 200px;"/>
                        </div>
                     </div>
                  </div>

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