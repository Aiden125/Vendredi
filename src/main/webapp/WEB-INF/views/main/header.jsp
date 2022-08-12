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
<!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <!-- <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File 
  <link href="assets/css/style.css" rel="stylesheet">-->
  <style>
  #header {
  background: rgba(0, 0, 0, 0.75);
  transition: all 0.5s;
  z-index: 997;
  height: 80px;
  width:100%;
}

#header .logo {
  font-size: 28px;
  margin: 0;
  padding: 0;
  line-height: 1;
  font-weight: 700;
  letter-spacing: 1px;
  text-transform: uppercase;
}

#header .logo a {
  color: #fff;
}

#header .logo img {
  max-height: 40px;
}
#header .navbar {
  padding: 0;
}

#header .navbar ul {
  margin: 0;
  padding: 0;
  display: flex;
  list-style: none;
  align-items: center;
}

.navbar li {
  position: relative;
}

.navbar>ul>li {
  white-space: nowrap;
  padding: 10px 0 10px 22px;
}

.navbar a,
.navbar a:focus {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 4px;
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  font-weight: 500;
  color: rgba(255, 255, 255, 0.7);
  white-space: nowrap;
  transition: 0.3s;
  text-transform: uppercase;
  position: relative;
}

.navbar a i,
.navbar a:focus i {
  font-size: 12px;
  line-height: 0;
  margin-left: 5px;
}

.navbar>ul>li>a:before {
  content: "";
  position: absolute;
  width: 100%;
  height: 2px;
  bottom: -6px;
  left: 0;
  background-color: #5c9f24;
  visibility: hidden;
  width: 0px;
  transition: all 0.3s ease-in-out 0s;
}

.navbar a:hover:before,
.navbar li:hover>a:before,
.navbar .active:before {
  visibility: visible;
  width: 100%;
}

.navbar a:hover,
.navbar .active,
.navbar .active:focus,
.navbar li:hover>a {
  color: #fff;
}

.navbar .getstarted,
.navbar .getstarted:focus {
  padding: 8px 25px;
  margin-left: 12px;
  border-radius: 4px;
  color: #fff;
  font-weight: 400;
  font-family: "Poppins", sans-serif;
  border: 2px solid #5c9f24;
}

.navbar .getstarted:hover,
.navbar .getstarted:focus:hover {
  color: #fff;
  background: #5c9f24;
}

.navbar .getstarted:hover:before,
.navbar li:hover>.getstarted:before {
  visibility: hidden;
}

.navbar .dropdown ul {
  display: block;
  position: absolute;
  left: 22px;
  top: calc(100% + 30px);
  margin: 0;
  padding: 10px 0;
  z-index: 99;
  opacity: 0;
  visibility: hidden;
  background: #fff;
  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);
  transition: 0.3s;
}

.navbar .dropdown ul li {
  min-width: 200px;
}

.navbar .dropdown ul a {
  padding: 10px 20px;
  font-size: 14px;
  font-weight: 500;
  text-transform: none;
  color: #2a2a2a;
}

.navbar .dropdown ul a i {
  font-size: 12px;
}

.navbar .dropdown ul a:hover,
.navbar .dropdown ul .active:hover,
.navbar .dropdown ul li:hover>a {
  color: #5c9f24;
}

.navbar .dropdown:hover>ul {
  opacity: 1;
  top: 100%;
  visibility: visible;
}

.navbar .dropdown .dropdown ul {
  top: 0;
  left: calc(100% - 30px);
  visibility: hidden;
}

.navbar .dropdown .dropdown:hover>ul {
  opacity: 1;
  top: 0;
  left: 100%;
  visibility: visible;
}

@media (max-width: 1366px) {
  .navbar .dropdown .dropdown ul {
    left: -90%;
  }

  .navbar .dropdown .dropdown:hover>ul {
    left: -100%;
  }
}
.mobile-nav-toggle {
  color: #fff;
  font-size: 28px;
  cursor: pointer;
  display: none;
  line-height: 0;
  transition: 0.5s;
}

.mobile-nav-toggle.bi-x {
  color: #5c9f24;
}

@media (max-width: 991px) {
  .mobile-nav-toggle {
    display: block;
  }

  .navbar ul {
    display: none;
  }
}

.navbar-mobile {
  position: fixed;
  overflow: hidden;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  background: rgba(17, 17, 17, 0.9);
  transition: 0.3s;
  z-index: 999;
}

.navbar-mobile .mobile-nav-toggle {
  position: absolute;
  top: 15px;
  right: 15px;
}

.navbar-mobile ul {
  display: block;
  position: absolute;
  top: 55px;
  right: 15px;
  bottom: 15px;
  left: 15px;
  padding: 10px 0;
  background-color: #fff;
  overflow-y: auto;
  transition: 0.3s;
}

.navbar-mobile a,
.navbar-mobile a:focus {
  padding: 10px 20px;
  font-size: 15px;
  color: #2a2a2a;
}

.navbar-mobile a:hover,
.navbar-mobile .active,
.navbar-mobile li:hover>a {
  color: #5c9f24;
}

.navbar-mobile>ul>li {
  white-space: nowrap;
  padding: 0;
}

.navbar-mobile a:hover:before,
.navbar-mobile li:hover>a:before,
.navbar-mobile .active:before {
  visibility: hidden;
}

.navbar-mobile .getstarted,
.navbar-mobile .getstarted:focus {
  margin: 15px;
  color: #5c9f24;
  padding-left: 15px;
}

.navbar-mobile .dropdown ul {
  position: static;
  display: none;
  margin: 10px 20px;
  padding: 10px 0;
  z-index: 99;
  opacity: 1;
  visibility: visible;
  background: #fff;
  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);
}

.navbar-mobile .dropdown ul li {
  min-width: 200px;
}

.navbar-mobile .dropdown ul a {
  padding: 10px 20px;
}

.navbar-mobile .dropdown ul a i {
  font-size: 12px;
}

.navbar-mobile .dropdown ul a:hover,
.navbar-mobile .dropdown ul .active:hover,
.navbar-mobile .dropdown ul li:hover>a {
  color: #5c9f24;
}

.navbar-mobile .dropdown>.dropdown-active {
  display: block;
}
.align-items-center {
  align-items: center !important;
}
.justify-content-sm-between {
    justify-content: space-between !important;
}
.d-flex {
  display: flex !important;
}
  </style>
</head>
<body>
	 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="${conPath }/main.do">Vendredi</a></h1>
      
	<!--로그인 전 화면  -->
	<c:if test="${empty member and empty owner }">
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="${conPath }/main.do">Home</a></li>
          <li><a class="nav-link scrollto" href="${conPath }/member/loginForm.do">Login</a></li>
          <li><a class="nav-link scrollto" href="${conPath }/member/joinForm.do">Join</a></li>
          <li><a class="nav-link scrollto " href="${conPath }/store/storeList.do">맛집 리스트</a></li>
          <li><a class="nav-link scrollto" href="${conPath }/qna/list.do">Q&A</a></li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
         <!--  <li><a class="getstarted scrollto" href="#about">Get Started</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
  </c:if>
	<!-- 고객 로그인 후  -->
	<c:if test="${not empty member and  empty owner and empty admin}">
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="index_minwoo.jsp">${member.mname }님</a></li>
          <li><a class="nav-link scrollto" href="${conPath }/member/modify.do">my Page</a></li>
          <li><a class="nav-link scrollto" href="${conPath }/qna/list.do">QnA</a></li>
          <li><a class="nav-link scrollto " href="${conPath }/store/storeList.do">맛집 리스트</a></li>          
          <li><a href="blog.html">like</a></li>
          <li class="dropdown"><a href="#"><span>최근에 본 맛집</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
          <li><a class="nav-link scrollto" href="${conPath }/member/logout.do">Logout</a></li>
         <!--  <li><a class="getstarted scrollto" href="#about">Get Started</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
  </c:if>
  
  <!--사장님 로그인 후  -->
  <c:if test="${empty member and  not empty owner and empty admin}">
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active">${owner.oname }님</a></li>
          <li><a class="nav-link scrollto" href="${conPath }/owner/Info.do?oid=${owner.oid}">my Page</a></li>
          <li><a class="nav-link scrollto" href="${conPath }/store/myStoreList.do?oid=${owner.oid}">my Store</a></li>
          <li><a class="nav-link scrollto " href="${conPath }/owner/ReState.do?oid=${owner.oid}">예약 현황 </a></li>
          <li><a href="${conPath }/oboard/List.do">커뮤니티</a></li>
          <li><a class="nav-link scrollto" href="${conPath }/owner/Logout.do">로그아웃</a></li>
         <!--  <li><a class="getstarted scrollto" href="#about">Get Started</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
  </c:if>
  
  <!-- 관리자 로그인 후  -->
   <c:if test="${not empty admin and empty member and empty owner}">
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="index_minwoo.jsp">${owner.oname }님</a></li>
          <li><a class="nav-link scrollto" href="${conPath }/member/login.jsp">내 가게</a></li>
          <li><a class="nav-link scrollto " href="${conPath }">예약 현황 </a></li>
          <li><a href="${conPath }">커뮤니티</a></li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
         <!--  <li><a class="getstarted scrollto" href="#about">Get Started</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
  </c:if>
    </div>
  </header><!-- End Header -->
</body>
</html>