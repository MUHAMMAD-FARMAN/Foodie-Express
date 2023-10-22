<?php
	include "db.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
	
	<!-- Title -->
	<title>Foodie Express</title>
	
	<!-- Meta -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no">
	
	<!-- Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
    
	<!-- Favicon icon -->
    <link rel="icon" type="image/png" href="assets/images/favicon.png">
    
	<!-- Stylesheet -->
	<link href="assets/vendor/animate/animate.css" rel="stylesheet">
    <link href="assets/vendor/magnific-popup/magnific-popup.min.css" rel="stylesheet">
	<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	<link href="assets/vendor/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet">
	<link href="assets/vendor/tempus-dominus/css/tempus-dominus.min.css" rel="stylesheet">
	
	<!-- Custom Stylesheet -->
    <link rel="stylesheet" href="assets/vendor/rangeslider/rangeslider.css">
    <link rel="stylesheet" href="assets/vendor/switcher/switcher.css">
    <link rel="stylesheet" href="assets/css/style.css">
	<link class="skin" rel="stylesheet" href="assets/css/skin/skin-1.css">
    
	<!-- Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com/">
	<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Lobster&amp;family=Lobster+Two:ital,wght@0,400;0,700;1,400;1,700&amp;family=Poppins:ital,wght@0,100;0,200;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
	
</head>
<body id="bg">
<div id="loading-area" class="loading-page-3">
	<img src="assets/images/loading.gif" alt="">
</div>
<div class="page-wraper">
	
	<!-- Header -->
	<header class="site-header mo-left header header-transparent transparent-white style-1">
		<!-- Main Header -->
		<div class="sticky-header main-bar-wraper navbar-expand-lg">
			<div class="main-bar clearfix ">
				<div class="container clearfix">
					
					<!-- Website Logo -->
					<div class="logo-header mostion">
						<a href="index.html" class="anim-logo"><img src="assets/images/logo.png" alt="/"></a>
					</div>
					
					<!-- Nav Toggle Button -->
					<button class="navbar-toggler collapsed navicon justify-content-end" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
						<span></span>
						<span></span>
						<span></span>
					</button>
					
					<!-- EXTRA NAV -->
					<div class="extra-nav">
						<div class="extra-cell">
							<ul>
								<li>
									<a class="btn btn-white btn-square btn-shadow" data-bs-toggle="offcanvas" href="#offcanvasLogin" role="button" aria-controls="offcanvasLogin">
										<i class="flaticon-user"></i>
									</a>
								</li>
								<li>
									<button type="button" class="btn btn-white btn-square btn-shadow cart-btn">
										<i class="flaticon-shopping-bag-1"></i>
										<span class="badge">6</span>
									</button>
									<ul class="dropdown-menu cart-list">
										<li class="cart-item">
											<div class="media"> 
												<div class="media-left"> 
													<a href="product-detail.html"> 
														<img alt="/" class="media-object" src="assets/images/shop/pic2.jpg"> 
													</a> 
												</div> 
												<div class="media-body"> 
													<h6 class="dz-title"><a href="product-detail.html" class="media-heading">Double Burger</a></h6>
													<span class="dz-price">$28.00</span>
													<span class="item-close">&times;</span>
												</div> 
											</div>
										</li>
										<li class="cart-item">
											<div class="media"> 
												<div class="media-left"> 
													<a href="product-detail.html"> 
														<img alt="/" class="media-object" src="assets/images/shop/pic3.jpg"> 
													</a> 
												</div> 
												<div class="media-body"> 
													<h6 class="dz-title"><a href="product-detail.html" class="media-heading">Cheese Burger</a></h6>
													<span class="dz-price">$20.00</span>
													<span class="item-close">&times;</span>
												</div> 
											</div>
										</li>
										<li class="cart-item">
											<div class="media"> 
												<div class="media-left"> 
													<a href="product-detail.html"> 
														<img alt="/" class="media-object" src="assets/images/shop/pic4.jpg"> 
													</a> 
												</div> 
												<div class="media-body"> 
													<h6 class="dz-title"><a href="product-detail.html" class="media-heading">Burger</a></h6>
													<span class="dz-price">$15.00</span>
													<span class="item-close">&times;</span>
												</div> 
											</div>
										</li>
										<li class="cart-item text-center d-flex justify-content-between">
											<h6 class="text-primary mb-0">Total:</h6>
											<h6 class="text-primary mb-0">$63</h6>
										</li>
										<li class="text-center d-flex">
											<a href="shop-cart.html" class="btn btn-primary me-2 w-100 d-block btn-hover-1"><span>View Cart</span></a>
											<a href="our-menu-1.html" class="btn btn-outline-primary w-100 d-block btn-hover-1"><span>Menu</span></a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<!-- EXTRA NAV -->
					
					<!-- Header Nav -->
					<div class="header-nav navbar-collapse collapse justify-content-end" id="navbarNavDropdown">
						<div class="logo-header">
							<a href="index.html" class="anim-logo"><img src="assets/images/logo.png" alt="/"></a>
						</div>
						<ul class="nav navbar-nav navbar">
							<li class="sub-menu-down"><a href="javascript:void(0);">Home</a>
								<ul class="sub-menu">
									<li><a href="index.php">Home 01</a></li>
								</ul>
							</li>
							<li class="has-mega-menu">
								<a href="javascript:void(0);">Pages</a>
								<ul class="mega-menu">
									<li><a href="javascript:;">Pages</a>
										<ul>
											<li><a href="about-us.html">About Us</a></li>
											<li><a href="faq.html">FAQ</a></li>
											<li><a href="team.html">Team</a></li>
											<li><a href="team-detail.html">Team Detail</a></li>
											<li><a href="testimonial.html">Testimonial</a></li>
										</ul>
									</li>
									<li><a href="javascript:;">Pages</a>
										<ul>
											<li><a href="services.html">Services</a></li>
											<li><a href="service-detail.html">Service Detail</a></li>
											<li><a href="error-404.html">Error 404</a></li>
											<li><a href="coming-soon.html">Coming Soon</a></li>
											<li><a href="under-maintenance.html">Under Maintenance</a></li>
										</ul>
									</li>
									<li><a href="javascript:;">Our Menus</a>
										<ul>
											<li><a href="our-menu-1.html">Menu Style 1</a></li>
											<li><a href="our-menu-2.html">Menu Style 2</a></li>
											<li><a href="our-menu-3.html">Menu Style 3</a></li>
											<li><a href="our-menu-4.html">Menu Style 4</a></li>
											<li><a href="our-menu-5.html">Menu Style 5</a></li>
										</ul>
									</li>
									<li class="header-adv p-0"><img src="assets/images/adv-media.jpg" alt="/"></li>
								</ul>
							</li>
							<li class="sub-menu-down"><a href="javascript:void(0);">Shop</a>
								<ul class="sub-menu">
									<li><a href="shop-style-1.html">Shop Style 1</a></li>
									<li><a href="shop-style-2.html">Shop Style 2</a></li>
									<li><a href="shop-cart.html">Shop Cart</a></li>
									<li><a href="shop-wishlist.html">Shop Wishlist</a></li>
									<li><a href="shop-checkout.html">Shop Checkout</a></li>
									<li><a href="product-detail.html">Product Detail</a></li>
								</ul>
							</li>
							<li><a href="contact-us.html">Contact Us</a></li>
						</ul>
						<div class="dz-social-icon">
							<ul>
								<li><a target="_blank" class="fab fa-facebook-f" href="https://www.facebook.com/"></a></li>
								<li><a target="_blank" class="fab fa-twitter" href="https://twitter.com/"></a></li>
								<li><a target="_blank" class="fab fa-linkedin-in" href="https://www.linkedin.com/"></a></li>
								<li><a target="_blank" class="fab fa-instagram" href="https://www.instagram.com/"></a></li>
							</ul>
						</div>	
					</div>
					
				</div>
			</div>
		</div>
		<!-- Main Header End -->
	</header>
	<!-- Header -->