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
	
	<style>
		.DZ-theme-btn.DZ-bt-support-now{
			display: none;
		}
		.DZ-theme-btn.DZ-bt-buy-now{
			display: none;
		}
	</style>

</head>
<body id="bg">
<!-- <div id="loading-area" class="loading-page-3">
	<img src="assets/images/loading.gif" alt="">
</div> -->
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
									<?php
										require_once('db.php');

										$user_id = 1; // Replace this with the actual user's ID from the session

										// Query to count the number of cart items for the user
										$cartItemCountQuery = "SELECT COUNT(ci.product_id) AS item_count
															FROM cartitems ci
															INNER JOIN carts c ON ci.cart_id = c.cart_id
															WHERE c.user_id = $user_id";

										$cartItemCountResult = db::getRecord($cartItemCountQuery);

										// Fetch the count of cart items
										$itemCount = isset($cartItemCountResult['item_count']) ? $cartItemCountResult['item_count'] : 0;
									?>
									<a href="shop-cart.php"> 
										<button type="button" class="btn btn-white btn-square btn-shadow cart-btn">
											<i class="flaticon-shopping-bag-1"></i>
											<span class="badge"><?php echo $itemCount; ?></span>
										</button>
									</a>
									<!-- <ul class="dropdown-menu cart-list">
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
									</ul> -->
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
							<li><a href="index.php">Home</a></li>
							<li><a href="about-us.php">About us</a></li>
							<li class="sub-menu-down"><a href="javascript:void(0);">Pages</a>
								<ul class="sub-menu">
									<li><a href="services.php">Services</a></li>
									<li><a href="menu.php">Menu</a></li>
									<li><a href="shop-cart.php">Shop Cart</a></li>
									<li><a href="shop-wishlist.php">Shop Wishlist</a></li>
									<li><a href="shop-checkout.php">Shop Checkout</a></li>
								</ul>
							</li>
							<li><a href="contact-us.php">Contact Us</a></li>
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
	<!-- Offcanvas Form Start -->
	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasLogin">
		<div class="offcanvas-body">
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			<div class="offcanvas-form">
				<div class="login-head">
					<h4 class="title">Welcome Back</h4>
					<p>We'd love have you join our 100% remote network of creatord & freelance.</p>
					<button name="submit" value="submit" type="submit" class="btn google-btn w-100 d-block">
						<svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
						<g clip-path="url(#clip0_1381_2836)">
						<path d="M5.76215 15.7122L4.85713 19.0908L1.54929 19.1607C0.560727 17.3272 0 15.2294 0 13.0001C0 10.8443 0.524266 8.81147 1.45356 7.02148H1.45427L4.39918 7.56139L5.68923 10.4886C5.41922 11.2758 5.27206 12.1208 5.27206 13.0001C5.27216 13.9543 5.44502 14.8687 5.76215 15.7122Z" fill="#FBBB00"/>
						<path d="M25.7722 10.5715C25.9215 11.3579 25.9994 12.1701 25.9994 13.0001C25.9994 13.9308 25.9015 14.8387 25.7151 15.7144C25.0823 18.6944 23.4287 21.2965 21.138 23.138L21.1373 23.1373L17.428 22.948L16.903 19.6708C18.423 18.7794 19.6109 17.3844 20.2366 15.7144H13.2852V10.5715H20.338H25.7722Z" fill="#518EF8"/>
						<path d="M21.1374 23.1371L21.1381 23.1378C18.9103 24.9285 16.0802 26 12.9995 26C8.04883 26 3.74456 23.2329 1.54883 19.1607L5.76169 15.7122C6.85953 18.6421 9.68596 20.7279 12.9995 20.7279C14.4238 20.7279 15.7581 20.3428 16.9031 19.6707L21.1374 23.1371Z" fill="#28B446"/>
						<path d="M21.2974 2.99284L17.086 6.44069C15.901 5.69999 14.5003 5.27211 12.9996 5.27211C9.61098 5.27211 6.73168 7.45352 5.68884 10.4886L1.45384 7.02142H1.45312C3.61671 2.85 7.97527 0 12.9996 0C16.1538 0 19.046 1.12359 21.2974 2.99284Z" fill="#F14336"/>
						</g>
						<defs>
						<clipPath id="clip0_1382_2836">
						<rect width="26" height="26" fill="white"/>
						</clipPath>
						</defs>
						</svg> Sign Up with Google
					</button>
					<h6 class="login-title"><span>OR</span></h6>
				</div>
				<div class="form-group m-b15">
					<label class="form-label">Email*</label>
					<div class="input-group">
						<input name="dzEmail" required type="text" class="form-control" placeholder="Enter Your Email">
					</div>
				</div>
				<div class="form-group m-b30">
					<label class="form-label">Password*</label>
					<div class="input-group search-input">
						<input name="password" type="password" class="form-control dz-password" placeholder="Enter a Password">
						<div class="show-pass">
							<svg class="eye-close" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="#8ea5c8"><path d="M11 17.188a8.71 8.71 0 0 1-1.576-.147.69.69 0 0 1-.579-.678.7.7 0 0 1 .817-.676 7.33 7.33 0 0 0 1.339.127c4.073 0 7.61-3.566 8.722-4.812a18.51 18.51 0 0 0-2.434-2.274.69.69 0 0 1 .335-1.226.69.69 0 0 1 .268.019c.087.024.169.064.24.12a18.79 18.79 0 0 1 3.036 2.939.69.69 0 0 1 0 .848c-.185.234-4.581 5.763-10.167 5.763zm7.361-13.549a.69.69 0 0 0-.972 0l-2.186 2.186a10.68 10.68 0 0 0-2.606-.864c-.527-.099-1.061-.149-1.597-.149-5.585 0-9.982 5.528-10.166 5.763a.69.69 0 0 0 0 .848c.897 1.09 1.915 2.075 3.033 2.936.529.415 1.083.796 1.66 1.142l-1.888 1.887c-.066.063-.118.139-.154.223a.69.69 0 0 0 .145.757.67.67 0 0 0 .226.15c.085.034.175.052.266.051a.69.69 0 0 0 .265-.056c.084-.036.16-.088.223-.154l13.75-13.75a.69.69 0 0 0 0-.972zm-13.65 9.636A18.51 18.51 0 0 1 2.278 11C3.39 9.754 6.927 6.187 11 6.187a7.31 7.31 0 0 1 1.348.127 8.92 8.92 0 0 1 1.814.55L12.895 8.13c-.661-.437-1.453-.632-2.241-.552a3.44 3.44 0 0 0-2.085.989c-.56.56-.91 1.297-.989 2.085a3.44 3.44 0 0 0 .552 2.241l-1.601 1.604a14.43 14.43 0 0 1-1.82-1.222zm4.432-1.392c-.134-.275-.204-.577-.206-.883a2.07 2.07 0 0 1 .6-1.456 2.12 2.12 0 0 1 2.338-.392l-2.731 2.731z"></path></svg>
							<svg class="eye-open" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#8ea5c8"><path d="M19.873 9.611c-.179-.244-4.436-5.985-9.873-5.985S.305 9.367.127 9.611a.66.66 0 0 0 0 .778c.178.244 4.436 5.985 9.873 5.985s9.694-5.74 9.873-5.984a.66.66 0 0 0 0-.778zM10 15.055c-4.005 0-7.474-3.81-8.501-5.055C2.525 8.753 5.986 4.945 10 4.945c4.005 0 7.473 3.809 8.501 5.055-1.025 1.247-4.487 5.054-8.501 5.054zm0-9.011A3.96 3.96 0 0 0 6.044 10 3.96 3.96 0 0 0 10 13.956 3.96 3.96 0 0 0 13.956 10 3.96 3.96 0 0 0 10 6.044zm0 6.593A2.64 2.64 0 0 1 7.363 10 2.64 2.64 0 0 1 10 7.363 2.64 2.64 0 0 1 12.637 10 2.64 2.64 0 0 1 10 12.637z"></path></svg>
						</div>
					</div>
				</div>
				<button name="submit" value="submit" type="submit" class="btn btn-primary w-100 d-block btn-hover-2"><span>Sign In</span></button>
				<p class="text-center m-t30">Not registered?  
					<a class="register text-primary font-weight-500" data-bs-toggle="offcanvas" href="#offcanvasRegister" role="button" aria-controls="offcanvasRegister">Register here</a>
				</p>
			</div>
		</div>
	</div>
	
	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRegister">
		<div class="offcanvas-body">
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			<div class="offcanvas-form">
				<div class="login-head">
					<h4 class="title">Join Our Network</h4>
					<p>We’d love have you join our 100% remote network of creatord & freelance.</p>
					<button name="submit" value="submit" type="submit" class="btn google-btn w-100 d-block">
						<svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
						<g clip-path="url(#clip0_1383_2836)">
						<path d="M5.76215 15.7122L4.85713 19.0908L1.54929 19.1607C0.560727 17.3272 0 15.2294 0 13.0001C0 10.8443 0.524266 8.81147 1.45356 7.02148H1.45427L4.39918 7.56139L5.68923 10.4886C5.41922 11.2758 5.27206 12.1208 5.27206 13.0001C5.27216 13.9543 5.44502 14.8687 5.76215 15.7122Z" fill="#FBBB00"/>
						<path d="M25.7722 10.5715C25.9215 11.3579 25.9994 12.1701 25.9994 13.0001C25.9994 13.9308 25.9015 14.8387 25.7151 15.7144C25.0823 18.6944 23.4287 21.2965 21.138 23.138L21.1373 23.1373L17.428 22.948L16.903 19.6708C18.423 18.7794 19.6109 17.3844 20.2366 15.7144H13.2852V10.5715H20.338H25.7722Z" fill="#518EF8"/>
						<path d="M21.1374 23.1371L21.1381 23.1378C18.9103 24.9285 16.0802 26 12.9995 26C8.04883 26 3.74456 23.2329 1.54883 19.1607L5.76169 15.7122C6.85953 18.6421 9.68596 20.7279 12.9995 20.7279C14.4238 20.7279 15.7581 20.3428 16.9031 19.6707L21.1374 23.1371Z" fill="#28B446"/>
						<path d="M21.2974 2.99284L17.086 6.44069C15.901 5.69999 14.5003 5.27211 12.9996 5.27211C9.61098 5.27211 6.73168 7.45352 5.68884 10.4886L1.45384 7.02142H1.45312C3.61671 2.85 7.97527 0 12.9996 0C16.1538 0 19.046 1.12359 21.2974 2.99284Z" fill="#F14336"/>
						</g>
						<defs>
						<clipPath id="clip0_138_536">
						<rect width="26" height="26" fill="white"/>
						</clipPath>
						</defs>
						</svg> Sign Up with Google
					</button>
					<h6 class="login-title"><span>OR</span></h6>
				</div>
				<div class="form-group m-b15">
					<label class="form-label">Name*</label>
					<div class="input-group">
						<input name="dzName" required type="text" class="form-control" placeholder="Enter Your Name">
					</div>
				</div>
				<div class="form-group m-b15">
					<label class="form-label">Email*</label>
					<div class="input-group">
						<input name="dzEmail" required type="text" class="form-control" placeholder="Enter Your Email">
					</div>
				</div>
				<div class="form-group m-b30">
					<label class="form-label">Password*</label>
					<div class="input-group search-input">
						<input name="password" type="password" class="form-control dz-password" placeholder="Create a Password">
						<div class="show-pass">
							<svg class="eye-close" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="#8ea5c8"><path d="M11 17.188a8.71 8.71 0 0 1-1.576-.147.69.69 0 0 1-.579-.678.7.7 0 0 1 .817-.676 7.33 7.33 0 0 0 1.339.127c4.073 0 7.61-3.566 8.722-4.812a18.51 18.51 0 0 0-2.434-2.274.69.69 0 0 1 .335-1.226.69.69 0 0 1 .268.019c.087.024.169.064.24.12a18.79 18.79 0 0 1 3.036 2.939.69.69 0 0 1 0 .848c-.185.234-4.581 5.763-10.167 5.763zm7.361-13.549a.69.69 0 0 0-.972 0l-2.186 2.186a10.68 10.68 0 0 0-2.606-.864c-.527-.099-1.061-.149-1.597-.149-5.585 0-9.982 5.528-10.166 5.763a.69.69 0 0 0 0 .848c.897 1.09 1.915 2.075 3.033 2.936.529.415 1.083.796 1.66 1.142l-1.888 1.887c-.066.063-.118.139-.154.223a.69.69 0 0 0 .145.757.67.67 0 0 0 .226.15c.085.034.175.052.266.051a.69.69 0 0 0 .265-.056c.084-.036.16-.088.223-.154l13.75-13.75a.69.69 0 0 0 0-.972zm-13.65 9.636A18.51 18.51 0 0 1 2.278 11C3.39 9.754 6.927 6.187 11 6.187a7.31 7.31 0 0 1 1.348.127 8.92 8.92 0 0 1 1.814.55L12.895 8.13c-.661-.437-1.453-.632-2.241-.552a3.44 3.44 0 0 0-2.085.989c-.56.56-.91 1.297-.989 2.085a3.44 3.44 0 0 0 .552 2.241l-1.601 1.604a14.43 14.43 0 0 1-1.82-1.222zm4.432-1.392c-.134-.275-.204-.577-.206-.883a2.07 2.07 0 0 1 .6-1.456 2.12 2.12 0 0 1 2.338-.392l-2.731 2.731z"></path></svg>
							<svg class="eye-open" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#8ea5c8"><path d="M19.873 9.611c-.179-.244-4.436-5.985-9.873-5.985S.305 9.367.127 9.611a.66.66 0 0 0 0 .778c.178.244 4.436 5.985 9.873 5.985s9.694-5.74 9.873-5.984a.66.66 0 0 0 0-.778zM10 15.055c-4.005 0-7.474-3.81-8.501-5.055C2.525 8.753 5.986 4.945 10 4.945c4.005 0 7.473 3.809 8.501 5.055-1.025 1.247-4.487 5.054-8.501 5.054zm0-9.011A3.96 3.96 0 0 0 6.044 10 3.96 3.96 0 0 0 10 13.956 3.96 3.96 0 0 0 13.956 10 3.96 3.96 0 0 0 10 6.044zm0 6.593A2.64 2.64 0 0 1 7.363 10 2.64 2.64 0 0 1 10 7.363 2.64 2.64 0 0 1 12.637 10 2.64 2.64 0 0 1 10 12.637z"></path></svg>
						</div>
					</div>
				</div>
				<button name="submit" value="submit" type="submit" class="btn btn-primary w-100 d-block btn-hover-2">
					<span>Sign Up</span>
				</button>
				<p class="text-center m-t30">Already have an account?
					<a class="text-primary font-weight-500" data-bs-toggle="offcanvas" href="#offcanvasLogin" role="button" aria-controls="offcanvasLogin" >Login</a>
				</p>
			</div>
		</div>
	</div>
	<!-- Offcanvas Form End -->
	
	<div class="page-content bg-white">
		<!-- Banner -->
		<div class="main-bnr-one">
			<div class="slider-pagination">
				<div class="main-button-prev"><i class="icon-arrow-up"></i></div>
				<div class="main-slider-pagination"></div>
				<div class="main-button-next"><i class="icon-arrow-down"></i></div>
			</div>
			<div class="main-slider-1 swiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="banner-inner">
							<div class="container">
								<div class="row align-items-center">
									<div class="col-xl-7 col-lg-7 col-md-7">
										<div class="banner-content">
											<span class="sub-title wow fadeInUp" data-wow-delay="0.2s">High Quality Test Station </span>
											<h1 class="title  wow fadeInUp" data-wow-delay="0.4s">Choosing The<br> Best <span class="text-primary">Quality Food</span></h1>
											<p class="wow fadeInUp" data-wow-delay="0.6s">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
											<div class="banner-btn d-flex align-items-center wow fadeInUp" data-wow-delay="0.8s">
												<a href="#reservation" class="btn btn-primary btn-md shadow-primary m-r30 btn-hover-1"><span>Book a Table</span></a>
												<a href="about-us.php" class="btn btn-outline-primary btn-md shadow-primary btn-hover-1"><span>View More</span></a>
											</div>
										</div>
									</div>
									<div class="col-xl-5 col-lg-5 col-md-5">
										<div class="banner-media wow fadeInRight" data-wow-delay="1s">
											<img src="assets/images/main-slider/slider1/pic1.png" alt="/">
										</div>
									</div>
								</div>
							</div>
							<img src="assets/images/main-slider/slider1/img3.png" class="img1" alt="/">
							<img src="assets/images/main-slider/slider1/img1.png" class="img2" alt="/">
							<img src="assets/images/main-slider/slider1/img2.png" class="img3" alt="/">
						</div>
					</div>
					<div class="swiper-slide">
						<div class="banner-inner">
							<div class="container">
								<div class="row align-items-center">
									<div class="col-xl-7 col-lg-7 col-md-7">
										<div class="banner-content">
										<?php
											$query = "SELECT `description` FROM restaurant";
											$result = db::getRecords($query);

											if ($result) {
												foreach ($result as $row) {
													$description = $row['description'];
													$section = '<span class="sub-title wow fadeInUp" data-wow-delay="0.2s">'. $description .'</span>';
													echo $section;
												}
											} else {
												echo "No records found.";
											}
										?>
											<h1 class="title wow fadeInUp" data-wow-delay="0.4s">Where Food <br> Meets<span class="text-primary"> Best Passion</span></h1>
											<p class="wow fadeInUp" data-wow-delay="0.6s">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
											<div class="banner-btn d-flex align-items-center wow fadeInUp" data-wow-delay="0.8s">
												<a href="#reservation" class="btn btn-primary btn-md shadow-primary m-r30 btn-hover-1"><span>Book a Table</span></a>
												<a href="about-us.php" class="btn btn-outline-primary btn-md shadow-primary btn-hover-1"><span>View More</span></a>
											</div>
										</div>
									</div>
									<div class="col-xl-5 col-lg-5 col-md-5">
										<div class="banner-media wow fadeInRight" data-wow-delay="1s">
											<img src="assets/images/main-slider/slider1/pic1.png" alt="/">
										</div>
									</div>
								</div>
							</div>
							<img src="assets/images/main-slider/slider1/img3.png" class="img1" alt="/">
							<img src="assets/images/main-slider/slider1/img1.png" class="img2" alt="/">
							<img src="assets/images/main-slider/slider1/img2.png" class="img3" alt="/">
						</div>
					</div>
					<div class="swiper-slide">
						<div class="banner-inner">
							<div class="container">
								<div class="row align-items-center">
									<div class="col-xl-7 col-lg-7 col-md-7">
										<div class="banner-content">
											<span class="sub-title wow fadeInUp" data-wow-delay="0.2s">Exploring the Delicious World</span>
											<h1 class="title wow fadeInUp" data-wow-delay="0.4s">Delicious Eats <br> And  <span class="text-primary">Tasty Drinks</span></h1>
											<p class="wow fadeInUp" data-wow-delay="0.6s">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
											<div class="banner-btn d-flex align-items-center wow fadeInUp" data-wow-delay="0.8s">
												<a href="#reservation" class="btn btn-primary btn-md shadow-primary m-r30 btn-hover-1"><span>Book a Table</span></a>
												<a href="about-us.php" class="btn btn-outline-primary btn-md shadow-primary btn-hover-1"><span>View More</span></a>
											</div>
										</div>
									</div>
									<div class="col-xl-5 col-lg-5 col-md-5">
										<div class="banner-media wow fadeInRight" data-wow-delay="1s">
											<img src="assets/images/main-slider/slider1/pic1.png" alt="/">
										</div>
									</div>
								</div>
							</div>
							<img src="assets/images/main-slider/slider1/img3.png" class="img1" alt="/">
							<img src="assets/images/main-slider/slider1/img1.png" class="img2" alt="/">
							<img src="assets/images/main-slider/slider1/img2.png" class="img3" alt="/">
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="main-thumb1-area swiper-btn-lr wow fadeInUp" data-wow-delay="0.6s">
					<div class="swiper main-thumb1">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="food-card">
									<div class="dz-media">
										<img src="assets/images/main-slider/slider1/thumb/pic1.jpg" alt="/">									
									</div>
									<div class="dz-content">
										<h5 class="title">BreakFast</h5>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="food-card">
									<div class="dz-media">
										<img src="assets/images/main-slider/slider1/thumb/pic2.jpg" alt="/">									
									</div>
									<div class="dz-content">
										<h5 class="title">Lunch</h5>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="food-card">
									<div class="dz-media">
										<img src="assets/images/main-slider/slider1/thumb/pic3.jpg" alt="/">									
									</div>
									<div class="dz-content">
										<h5 class="title">Dinner</h5>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="thumb-button-prev btn-prev-1"><i class="fa-solid fa-angle-left"></i></div>
					<div class="thumb-button-next btn-next-1"><i class="fa-solid fa-angle-right"></i></div>
				</div>
			</div>
		</div>	
		<!-- Banner -->
		
		<!-- Image Box 2 -->
		<section class="content-inner bg-white section-wrapper-2 overflow-hidden">
			<div class="container">
				<div class="section-head text-center">
					<h2 class="title wow flipInX" data-wow-delay="0.2s">Special Menu</h2>
				</div>
				<div class="row">
				<?php
					// Fetch product details using the getRecords function from the db class
					$query = "SELECT * FROM products ORDER BY RAND() LIMIT 4";
					$productsData = db::getRecords($query);

					// Check if products data exists
					if ($productsData) {
						foreach ($productsData as $product) {
							echo '
							<div class="col-lg-3 col-md-6 col-sm-6 m-b30 wow fadeInUp" data-wow-delay="0.1s">
								<div class="dz-img-box style-2 box-hover">
									<div class="dz-media">
										<img src="' . $product['picture'] . '" alt="' . $product['name'] . '">
									</div>
									<div class="dz-content">
										<h4 class="dz-title"><a href="product-detail.html">' . $product['name'] . '</a></h4>
										<p>' . $product['description'] . '</p>
										<h5 class="dz-price text-primary">$' . $product['price'] . '</h5>
										<form method="POST" action="add_to_cart.php">
											<input type="hidden" name="product_id" value="' . $product['product_id'] . '">
											<input type="hidden" name="quantity" value="1">
											<button type="submit" name="add_to_cart" class="btn btn-primary btn-hover-2">Add To Cart</button>
										</form>
									</div>
								</div>
							</div>';
						}
					} else {
						echo "No products found";
					}
				?>
				</div>
			</div>
			<img class="bg1 dz-move-down" src="assets/images/background/pic2.png" alt="/">
			<img class="bg2 dz-parallax" data-parallax-speed="0.05" src="assets/images/background/pic3.png" alt="/">
		</section>
		<!-- Image Box-2 -->
		
		<!-- Image Box-3  -->
		<section class="content-inner-1 section-wrapper-3 overflow-hidden">
			<div class="container">
				<div class="section-head text-center">
					<h2 class="title wow flipInX" data-wow-delay="0.2s">Today's Menu</h2>
				</div>
				<div class="row inner-section-wrapper">
				<?php
				// Fetch top-selling products based on order count
				$query = "SELECT *
				FROM products
				ORDER BY total_sales DESC
				LIMIT 4"; // Limit to top 4 selling products

				$topSellingProducts = db::getRecords($query);

				// Displaying fetched products in the HTML structure
				foreach ($topSellingProducts as $product) {
					echo '
					<div class="col-lg-3 col-md-6 col-sm-6 m-b30 wow fadeInUp" data-wow-delay="0.2s">
						<div class="dz-img-box style-3 box-hover">
							<div class="dz-media">
								<img src="' . $product['picture'] . '" alt="' . $product['name'] . '">
							</div>
							<span class="dz-tag">TOP SELLER</span>
							<div class="dz-content">
								<h5 class="dz-title"><a href="our-menu-1.html">' . $product['name'] . '</a></h5>
								<p>' . $product['description'] . '</p>
							</div>
							<div class="dz-hover-content">
								<div class="dz-info">
									<h5 class="dz-title mb-0"><a href="our-menu-1.html">' . $product['name'] . '</a></h5>
									<span class="dz-price">$' . $product['price'] . '</span>
								</div>
								<form action="add_to_cart.php" method="post">
									<input type="hidden" name="product_id" value="' . $product['product_id'] . '">
									<input type="number" name="quantity" value="1" min="1" max="10">
									<button type="submit" name="add_to_cart" class="btn btn-cart btn-white text-primary btn-square">
										<i class="flaticon-shopping-cart"></i>
									</button>
								</form>
							</div>
						</div>
					</div>';
				}
				?>
				<div class="col-12 text-center m-t10">
					<a href="menu.php" class="btn btn-md btn-primary btn-hover-1"><span>See All Dishes</span></a>
				</div>
			</div>

				<div class="section-head text-center">
					<h2 class="title wow flipInX" data-wow-delay="0.2s">Quality Services</h2>
				</div>
				<!-- Icon Wrapper 1 -->
				<div class="icon-wrapper1">
					<div class="row wow fadeInUp" data-wow-delay="0.2s">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="icon-bx-wraper style-1 box-hover center" style="background-image: url(assets/images/gallery/grid/pic1.jpg)">
								<div class="inner-content">
									<div class="icon-bx m-b25"> 
										<span class="icon-cell icon-md">
											<i class="flaticon-restaurant"></i>
										</span> 
									</div>
									<div class="icon-content">
										<h5 class="dz-title">Restaurant</h5>
										<p>Lorem ipsum dolor sit amet, dipiscing elit, sed</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="icon-bx-wraper style-1 box-hover center" style="background-image: url(assets/images/gallery/grid/pic2.jpg)">
								<div class="inner-content">
									<div class="icon-bx m-b25"> 
										<span class="icon-cell icon-md">
											<i class="flaticon-martini"></i>
										</span> 
									</div>
									<div class="icon-content">
										<h5 class="dz-title">Bar</h5>
										<p>Lorem ipsum dolor sit amet, dipiscing elit, sed</p>
									</div>
								</div>
							</div>
					 
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="icon-bx-wraper style-1 box-hover center" style="background-image: url(assets/images/gallery/grid/pic3.jpg)">
								<div class="inner-content">
									<div class="icon-bx m-b25"> 
											<span class="icon-cell icon-md">
												<i class="flaticon-coffee-cup"></i>
											</span> 
										</div>
									<div class="icon-content">
										<h5 class="dz-title">Cafe</h5>
										<p>Lorem ipsum dolor sit amet, dipiscing elit, sed</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="icon-bx-wraper style-1 box-hover center" style="background-image: url(assets/images/gallery/grid/pic4.jpg)">
								<div class="inner-content">
									<div class="m-b25"> 
										<span class="icon-cell icon-md">
											<i class="flaticon-cake"></i>
										</span> 
									</div>
									<div class="icon-content">
										<h5 class="dz-title">Dessert</h5>
										<p>Lorem ipsum dolor sit amet, dipiscing elit, sed</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Icon Wrapper 1 -->
			</div>
			<img class="bg1 dz-parallax" data-parallax-speed="0.05" src="assets/images/background/pic3.png" alt="/">
			<img class="bg2 dz-parallax" data-parallax-speed="0.05" src="assets/images/background/pic4.png" alt="/">
		</section>
		<!-- Image Box-3 -->
		<?php
			$queryToUpdateDiscount = "UPDATE products
			SET discount = 30
			WHERE product_id IN (
				SELECT product_id
				FROM (
					SELECT product_id
					FROM products
					ORDER BY total_sales ASC
					LIMIT 3
				) AS lowest_sales_products
			)";
			$result = db::query($queryToUpdateDiscount);
		?>
			
		<!-- Our Blog  -->
		<section class="content-inner-1 overflow-hidden">
			<div class="container">
				<div class="section-head text-center">
					<h2 class="title wow flipInX" data-wow-delay="0.2s">Special Offer</h2>
				</div>
				<div class="swiper blog-swiper swiper-visible swiper-btn-lr">
					<div class="swiper-wrapper">
				<?php
					$query = "SELECT *
					FROM products
					WHERE discount > 0";
					$discountedProducts = db::getRecords($query);
				?>

<?php foreach ($discountedProducts as $product) : ?>
    <div class="swiper-slide">
        <div class="dz-card style-1 blog-half overlay-shine dz-img-effect zoom wow fadeInUp" data-wow-delay="0.4s">
            <div class="dz-media">
                <a href="blog-standard.html"><img src="<?php echo $product['picture']; ?>" alt="<?php echo $product['name']; ?>"></a>
            </div>
            <div class="dz-info">
                <div class="dz-meta">
                    <ul>
                        <li><a href="javascript:void(0);"><i class="flaticon-calendar-date"></i> <?php echo "NA"?></a></li>
                        <li class="dz-comment"><a href="javascript:void(0);"><i class="flaticon-chat-bubble"></i> <?php echo "NA"; ?></a></li>
                    </ul>
                </div> 
                <h5 class="dz-title"><a href="blog-standard.html"><?php echo $product['name']; ?></a></h5>
                <p><?php echo $product['description']; ?></p>

                <form method="POST" action="add_to_cart.php">
                    <span class="discount-tag"><?php echo $product['discount']; ?>% off</span>
                    <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>">
                    <input type="hidden" name="quantity" value="1">
                    <button type="submit" name="add_to_cart" class="btn btn-primary btn-hover-2">Add To Cart</button>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>

					</div>
					<div class="pagination mt-xl-0 m-t40">
						<div class="blog-button-prev btn-prev-long"><i class="fa-solid fa-arrow-left"></i></div>
						<div class="blog-button-next btn-next-long"><i class="fa-solid fa-arrow-right"></i></div>
					</div>
				</div>
			</div>
		</section>
		<!-- Our Blog End  -->


		<!-- Image Box-1  -->
		<!-- <section class="content-inner-1 bg-white overflow-hidden pt-sm-0">
			<div class="container">
				<div class="section-head text-center">
				<h2 class="title wow flipInX" data-wow-delay="0.2s">From Our Menu</h2>
				</div>
				<?php
				// Function to fetch random products from the database
				function getRandomProducts($limit = 6)
				{
					// Assuming you have a method to connect to the database
					// Fetch random products from the 'products' table
					// Modify the SQL query according to your database structure
					$query = "SELECT * FROM products ORDER BY RAND() LIMIT $limit";

					// Execute the query and fetch the products
					// Use your database connection method here (e.g., using mysqli or PDO)
					$result = db::getRecords($query);

					// Return the fetched products
					return $result;
				}

				// Call the function to get random products
				$randomProducts = getRandomProducts();

				// HTML structure to display the products
				echo '<div class="swiper-btn-lr">
					<div class="swiper portfolio-swiper">
						<div class="swiper-wrapper">';

				foreach ($randomProducts as $product) {
					echo '<div class="swiper-slide">
							<div class="dz-img-box style-1 wow fadeInUp" data-wow-delay="0.4s">
								<div class="dz-media">
									<img src="' . $product['picture'] . '" alt="">
								</div>
								<span class="dz-tag">TOP SELLER</span>
								<div class="dz-content">
									<div class="dz-info">
										<h5 class="dz-title mb-0"><a href="our-menu-1.html">' . $product['name'] . '</a></h5>
										<span class="dz-price">$' . $product['price'] . '</span>
									</div>
									<a href="shop-cart.html" class="btn btn-cart btn-white text-primary btn-square"><i class="flaticon-shopping-cart"></i></a>
								</div>
							</div>
						</div>';
				}

				echo '</div>
						</div>
						<div class="pagination mt-xl-0 m-t40">
							<div class="img-button-prev btn-prev-long"><i class="fa-solid fa-arrow-left"></i></div>
							<div class="img-button-next btn-next-long"><i class="fa-solid fa-arrow-right"></i></div>
						</div>
					</div>';
			?>
			</div>
		</section> -->
		<!-- Image Box-1 -->	
		
		<!-- Search Section-->
		<section class="content-inner-1 section-wrapper-1 bg-parallax" style="background-image:url('assets/images/background/pic1.png'); background-attachment: fixed;">
			<div class="container" id="reservation">
				<div class="section-head text-center">
					<h2 class="title text-white wow flipInX" data-wow-delay="0.2s">Reservation</h2>
				</div>	
				<form action="action.php" method="POST">
				<div class="row">
					<div class="col-lg-4 col-md-6 m-b30 m-sm-b50 wow fadeInUp" data-wow-delay="0.2s">
						<div class="input-group input-line">
							<div class="input-group-prepand">
								<i class="flaticon-user"></i>
							</div>
							<input name="dzName" required type="text" class="form-control" placeholder="Your Name">
						</div>
					</div>

					<!-- Second column -->
					<div class="col-lg-4 col-md-6 m-b30 m-sm-b50 wow fadeInUp" data-wow-delay="0.2s">
						<div class="input-group input-line">
							<div class="input-group-prepand">
								<i class="flaticon-phone-call"></i>
							</div>
							<input name="dzPhoneNumber" required type="text" class="form-control dz-number" placeholder="Phone Number">
						</div>
					</div>

					<!-- Third column -->
					<div class="col-lg-4 col-md-6 m-b30 m-sm-b50 wow fadeInUp" data-wow-delay="0.2s">
						<div class="input-group input-line">
							<div class="input-group-prepand">
								<i class="flaticon-email-1"></i>
							</div>
							<input name="dzEmail" required type="text" class="form-control" placeholder="Your Email">
						</div>
					</div>

					<!-- Fourth column -->
					<div class="col-lg-4 col-md-6 m-b30 m-sm-b50 wow fadeInUp" data-wow-delay="0.4s">
						<div class="input-group input-line">
							<div class="input-group-prepand">
								<i class="flaticon-two-people"></i>
							</div>
							<select name="numberOfPeople" class="form-select default-select" required>
								<option value="">Number Of People</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<!-- Add more options as needed -->
							</select>
						</div>
					</div>
						<div class="col-lg-4 col-md-6 m-b30 m-sm-b50 wow fadeInUp" data-wow-delay="0.4s">
							<div class="input-group input-line">
								<div class="input-group-prepand">
									<i class="flaticon-calendar-date"></i>
								</div>
								<input required type="text" name="date" class="form-control" id="datePickerOnly" placeholder="Date">
							</div>
						</div>
						<div class="col-lg-4 col-md-6 m-b30 m-sm-b50 wow fadeInUp" data-wow-delay="0.4s">
							<div class="input-group input-line">
								<div class="input-group-prepand">
									<i class="flaticon-clock"></i>
								</div>
								<input required type="text" name="time" class="form-control" id="timePickerOnly" placeholder="Time">
							</div>
						</div>
						<div class="col-lg-12 col-md-12 text-center">
						<button type="submit" name="submit" value="submit" class="btn btn-lg btn-white btn-hover-1">
							<span>Book a Table</span>
						</button>
					</div>
				</form>
			</div>
		</section>
		<!-- Search Section-->
	
		<!-- Map Iframe -->
		<div class="map-iframe style-1">
			<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d244934.17139458598!2d75.27787773507539!3d25.125368923263647!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1678086292169!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
		<!-- Map Iframe -->
		
	</div>

	<!--Footer-->
	<footer class="site-footer  style-1 bg-dark" id="footer">
		<div class="footer-top">
            <div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-5 col-md-12 wow fadeInUp" data-wow-delay="0.4s">
						<div class="dz-form-card bg-primary">
							<div class="section-head">
								<h4 class="title m-0">Contact us</h4>
								<p class="m-t10">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
							</div>
							<form class="dzForm dezPlaceAni" method="POST" action="">
								<input type="hidden" class="form-control" name="dzToDo" value="Contact">
								<input type="hidden" class="form-control" name="reCaptchaEnable" value="0" >
								<div class="dzFormMsg"></div>
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<div class="input-group input-line">
											<input name="dzName" required type="text" class="form-control" placeholder="Your Name">
										</div>
									</div>
									<div class="col-lg-12 col-md-12">
										<div class="input-group input-line">
											<input name="dzEmail" required type="text" class="form-control" placeholder="Email Address">
										</div>
									</div>
									<div class="col-lg-12 col-md-12">
										<div class="input-group input-line">
											<input name="dzOther[Subject]" required type="text" class="form-control" placeholder="Subject">
										</div>
									</div>
									<div class="col-sm-12 ">
										<div class="input-group input-line">
											<textarea name="dzMessage" required class="form-control" placeholder="Message"></textarea>
										</div>
									</div>
									<div class="col-sm-12">
										<button type="submit" name="submit" value="submit" class="btn btn-md btn-white btn-hover-1"><span>Send Message</span></button>	
									</div>
								</div>
							</form>	
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-5 wow fadeInUp" data-wow-delay="0.5s">
					<?php
						$query = "SELECT contact, `address`, email FROM restaurant WHERE restaurant_id = 1";

						// Get the records using the getRecord function from the db class in db.php
						$restaurantDetails = db::getRecord($query);

						// Display the retrieved contact, address, and email details in the HTML structure
						echo '
						<div class="widget widget_getintuch">
						<h5 class="footer-title">Contact</h5>
						<ul>
							<li>
								<i class="flaticon-placeholder"></i>
								<p>' . $restaurantDetails['address'] . '</p>
							</li>
							<li>
								<i class="flaticon-telephone"></i>
								<p>' . $restaurantDetails['contact'] . '</p>
							</li>
							<li>
								<i class="flaticon-email-1"></i>
								<p>' . $restaurantDetails['email'] . '</p>
							</li>
						</ul>
						</div>';
					?>
					</div>
					<div class="col-xl-2 col-lg-2 col-md-3 col-6 wow fadeInUp" data-wow-delay="0.6s">
						<div class="widget widget_services">
							<h5 class="footer-title">Our Links</h5>
							<ul>
								<li><a href="index.html"><span>Home</span></a></li>
								<li><a href="about-us.html"><span>About Us</span></a></li>
								<li><a href="services.html"><span>Services</span></a></li>
								<li><a href="team.html"><span>Team</span></a></li>
								<li><a href="blog-standard.html"><span>Blog</span></a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-lg-2 col-md-3 col-6 wow fadeInUp" data-wow-delay="0.7s">
						<div class="widget widget_services">
							<h5 class="footer-title">Help Center</h5>
							<ul>
								<li><a href="faq.html"><span>FAQ</span></a></li>
								<li><a href="shop-style-1.html"><span>Shop</span></a></li>
								<li><a href="shop-style-2.html"><span>Category Filter</span></a></li>
								<li><a href="testimonial.html"><span>Testimonials</span></a></li>
								<li><a href="contact-us.html"><span>Contact Us</span></a></li>
							</ul>
						</div>
					</div>
				</div>
            </div>
        </div>
        <!-- Footer Bottom Part -->
		<div class="container">
			<div class="footer-bottom">
				<div class="row">
					<div class="col-xl-6 col-md-6 text-md-start">
						<p>Copyright 2023 All rights reserved.</p>
					</div>
					<div class="col-xl-6 col-md-6 text-md-end">
						<span class="copyright-text">Powered by <a href="http://waqas-rashid.000webhostapp.com/" target="_blank">Waqas</a></span>
					</div>
				</div>
            </div>
        </div>
		<img class="bg1 dz-move" src="assets/images/background/pic5.png" alt="/">
		<img class="bg2 dz-move" src="assets/images/background/pic6.png" alt="/">
    </footer>
	
	<!-- Footer -->
	<div class="scroltop-progress scroltop-primary">
		<svg width="100%" height="100%" viewBox="-1 -1 102 102">
			<path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98"/>
		</svg>
	</div>
	
	
</div>
<!-- JAVASCRIPT FILES ========================================= -->
<script src="assets/js/jquery.min.js"></script><!-- JQUERY.MIN JS -->
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script><!-- BOOTSTRAP.MIN JS -->
<script src="assets/vendor/bootstrap-select/js/bootstrap-select.min.js"></script><!-- BOOTSTRAP SELEECT -->
<script src="assets/vendor/magnific-popup/magnific-popup.js"></script><!-- MAGNIFIC POPUP JS -->
<script src="assets/vendor/counter/waypoints-min.js"></script><!-- WAYPOINTS JS -->
<script src="assets/vendor/wow/wow.js"></script><!-- WOW JS -->
<script src="assets/vendor/counter/counterup.min.js"></script><!-- COUNTERUP JS -->
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script><!-- OWL-CAROUSEL -->
<script src="assets/vendor/popper/popper.js"></script><!-- Popper -->
<script src="assets/vendor/tempus-dominus/js/tempus-dominus.min.js"></script><!-- Tempus Dominus -->
<script src="assets/vendor/tilt/tilt.jquery.min.js"></script><!-- TILT -->
<script src="assets/js/dz.carousel.min.js"></script><!-- OWL-CAROUSEL -->
<script src="assets/js/dz.ajax.js"></script><!-- AJAX -->
<script src="assets/js/custom.min.js"></script><!-- CUSTOM JS -->
<script src="assets/vendor/rangeslider/rangeslider.js"></script>
<script src="assets/vendor/switcher/switcher.js"></script>
</body>

</html>