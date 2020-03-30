<!-- 원본 분석 시작 -->
<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath();	
%>
<%@ page import="com.bbc.userInfo.model.vo.UserInfo"%>
<% 
	UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>BBC</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<meta name="keywords" content=" a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<link href="<%=contextPath%>/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="<%=contextPath%>/resources/css/owl.carousel.css" type="text/css" media="all">
	<link rel="stylesheet" href="<%=contextPath%>/resources/css/owl.theme.css" type="text/css" media="all">
	<link href="<%=contextPath%>/resources/css/style.css" rel='stylesheet' type='text/css' />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="<%=contextPath%>/resources/css/fontawesome-all.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,900" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700" rel="stylesheet">
</head>

<body>

	<!--/banner-->
	<div class="banner" id="home">
		<!-- header -->
		<header>
			<nav class="navbar navbar-expand-lg navbar-light bg-light top-header">
				<button class="navbar-toggler mx-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				    aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<!-- login -->
				<!-- <div class="search">  -->
					<div class="cd-main-header">
						<ul class="cd-header-buttons">
							<li>
							<%if(loginUser == null){ %>
							<li > <a data-toggle="modal" href="#myModal3" data-backdrop="static" aria-hidden="true" style="background-color:none;color:#ffc107;border:none;">로그인</a></li>
							<% } else { %>
								<li> <a href="<%=request.getContextPath()%>/logout.ui" style="color:#ffc107">로그아웃</a></li>
							
							<% } %>
							</li>
						</ul>
					</div>
				<!-- </div> -->
				<!-- //login-->

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto">
						<li class="nav-item">
							<a class="nav-link ml-lg-0" href="index.html">Home
								<span class="sr-only">(current)</span>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<%=contextPath%>/reservationSearch.rv">차량예약</a>							
						</li>
						
						<%if(loginUser != null){ %>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
							    aria-expanded="false">
								마이페이지
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item text-center" onclick="goMyRes();">차량 이용 내역</a>
								<a class="dropdown-item text-center" onclick="goMyReservation();">예약 내역 조회</a>
								<a class="dropdown-item text-center" onclick="goCoupon();">쿠폰함 조회</a>
								<a class="dropdown-item text-center" onclick="goDl();">운전면허 등록</a>
								<a class="dropdown-item text-center" href="">나의 문의 내역</a>
								<a class="dropdown-item text-center" onclick="goMyBranch();">나의 지점 관리</a>
								<a class="dropdown-item text-center" onclick="goMyInfo();">회원 정보 수정</a>
							</div>
						</li>
							<%} else{ %>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
							    aria-expanded="false" readonly>
								마이페이지
							</a>
							</li>
							<%} %>
						
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
							    aria-expanded="false">
								고객센터
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item text-center" href="">FAQ</a>
								<a class="dropdown-item text-center" href="">고객의견</a>
								<a class="dropdown-item text-center" href="">1:1 상담</a>
								<a class="dropdown-item text-center" href="">공지사항</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- //header -->
		<!-- banner-text -->
		<div id="wrapper">

			<!-- Slideshow 1 -->
			<div class="rslides_container">
				<ul class="rslides" id="slider1">
					<li>
						<div class="banner-img">
							<div class="banner-info text-center">
								<h3 class="logo">
									<a class="navbar-brand" href="index.html">
										<i class="fas fa-cubes"></i> B B C</a>
								</h3>
								<h4>bbang bban car</h4>
								<div class="banner-form">
									<form action="#" method="post">
										<div class="row">
											<div class="col-md-3">
												<input type="text" class="form-control" name="name" placeholder="대여 일자" required readonly>
											</div>
											<div class="col-md-3">
												<input type="text" class="form-control" name="name" placeholder="반납 일자" required readonly>
											</div>
										
											<div class="col-md-3">
												<button type="submit" class="btn btn-primary submit">Submit</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!--footer-->
	<footer>
		<div class="container">
			<div class="footer-top-agileits-w3ls text-center">
				<h2 class="logo">
					<a href="index.html">
						<i class="fas fa-cubes"></i> B B C</a>
				</h2>
				<p class="para three mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at placerat ante. Praesent nulla nunc, pretium dapibus
					efficitur in, auctor eget elit. Lorem ipsum dolor sit amet consectetur adipiscing elit. Phasellus at placerat ante.
					Praesent nulla nunc</p>
			</div>
			<div class="subscribe-grid text-center">
				<h5>Subscribe for our latest updates</h5>
				<p>Get
					<span>10%</span> off on booking</p>
				<form action="#" method="post">
					<input class="form-control" type="email" placeholder="Subscribe" name="Subscribe" required="">
					<button class="btn1">
						<i class="far fa-envelope"></i>
					</button>
				</form>
			</div>
			<div class="row footer-bottom-wthree-agile">
				<div class="col-lg-6 copyright">
					<p>&copy; 2018 Transco . All Rights Reserved | Design by
						<a href="http://w3layouts.com/"> W3layouts </a>
					</p>

				</div>
				<div class="col-lg-6 social-icon footer text-right">
					<div class="icon-social">
						<a href="#" class="button-footr">
							<i class="fab fa-facebook-f"></i>
						</a>
						<a href="#" class="button-footr">
							<i class="fab fa-twitter"></i>
						</a>
						<a href="#" class="button-footr">
							<i class="fab fa-dribbble"></i>
						</a>
						<a href="#" class="button-footr">
							<i class="fab fa-pinterest-p"></i>
						</a>
					</div>
				</div>
				<div class="clearfix"></div>

			</div>
			<!-- //footer -->
		</div>
	</footer>

	<!-- Dropdown jquery -->
	<!--slider-->
	<script src="<%=contextPath%>/resources/js/index/responsiveslides.min.js"></script>
	<script>
		$(function () {

			// Slideshow 1
			$("#slider1").responsiveSlides({
				auto: false,
				pager: true,
				nav: true,
				speed: 500,
				namespace: "centered-btns"
			});


		});
	</script>
	<!--//slider-->

	<!-- carousel -->
	<script src="<%=contextPath%>/resources/js/index/owl.carousel.js"></script>
	<script>
		$(document).ready(function () {
			$('.owl-carousel').owlCarousel({
				loop: true,
				margin: 10,
				responsiveClass: true,
				responsive: {
					0: {
						items: 1,
						nav: true
					},
					600: {
						items: 1,
						nav: false
					},
					900: {
						items: 2,
						nav: false
					},
					1000: {
						items: 3,
						nav: true,
						loop: false,
						margin: 20
					}
				}
			})
		})
	</script>
	<!-- //carousel -->



	<!-- simpleLightbox -->
	<script src="<%=contextPath%>/resources/js/index/simpleLightbox.js"></script>
	<script>
		$('.proj_gallery_grid a').simpleLightbox();
	</script>
	<!-- //simpleLightbox -->

	<!--search-bar-->
	<!--/ start-smoth-scrolling -->
	<script  src="<%=contextPath%>/resources/js/index/move-top.js"></script>
	<script  src="<%=contextPath%>/resources/js/index/easing.js"></script>
	<script >
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 900);
			});
		});
	</script>
	<!--// end-smoth-scrolling -->

	<script >
		$(document).ready(function () {
			/*
									var defaults = {
							  			containerID: 'toTop', // fading element id
										containerHoverID: 'toTopHover', // fading element hover id
										scrollSpeed: 1200,
										easingType: 'linear' 
							 		};
									*/

			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
	<a href="#home" class="scroll" id="toTop" style="display: block;">
		<span id="toTopHover" style="opacity: 1;"> </span>
	</a>

	<!-- //Custom-JavaScript-File-Links -->
	<script src="<%=contextPath%>/resources/js/index/bootstrap.js"></script>

	<!-- Modal 로그인 -->	
	<div class="modal fade" id="myModal3" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content" style="margin-top:200px; width:350px;margin-right:300px;">
				<!-- 로그인  -->
				<div class="modal-body" style="height:500px; width:300px; padding:0px 0px 0px 0px;">				         
					<%@ include file="../views/mypage/login.jsp" %>
				</div>
			</div>
		</div>
	</div>
		
	<!-- 마이페이지 기능(요한) -->	
		<script>
		
		function goCoupon(){
			location.href = "<%=request.getContextPath()%>/list.mc";
		}
		function goMyBranch(){
			location.href = "<%=request.getContextPath()%>/areaSearch.mb";
		}
		function goMyInfo(){
			location.href = "<%=request.getContextPath()%>/view.ui";
		}
		function goMyRes(){
			location.href = "<%= request.getContextPath()%>/view.rv";
		}
		
 		function goMyReservation(){
			location.href = "<%= request.getContextPath()%>/viewReservation.rv";
 		}

 		function goDl(){
 			location.href = "<%= request.getContextPath()%>/go.dl";
 		}
	</script>
	
	
</body>

</html>
