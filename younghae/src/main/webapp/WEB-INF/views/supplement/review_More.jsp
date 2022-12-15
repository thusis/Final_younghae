<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>리뷰 더보기</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<style>
.bn_nav1 {
	background-color: #24E082;
}

.yh_header__menu {
	padding: 12px 0;
}

.yh_header__menu ul li {
	color: white;
	list-style: none;
	display: inline-block;
	margin-right: 50px;
	position: relative;
}

.yh_header__menu ul li .yh_header__menu__dropdown {
	position: absolute;
	left: 0;
	/* top: 50px; */
	background: #222222;
	width: max-content;
	/* z-index: 9; */
	padding: 5px 0;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
	opacity: 0;
	visibility: hidden;
}

.yh_header__menu ul li .yh_header__menu__dropdown li {
	margin-right: 0;
	display: block;
}

.yh_header__menu ul li .yh_header__menu__dropdown li:hover>a {
	color: #24E082;
}

.yh_header__menu ul li .yh_header__menu__dropdown li a {
	text-transform: capitalize;
	color: #ffffff;
	font-weight: 400;
	padding: 5px 15px;
}

.yh_header__menu ul li.active a {
	color: #24E082;
}

.yh_header__menu ul li:hover .yh_header__menu__dropdown {
	top: 30px;
	opacity: 1;
	visibility: visible;
}

.yh_header__menu ul li:hover>a {
	color: #FD9F28;
}

.yh_header__menu ul li:last-child {
	margin-right: 0;
}

.yh_header__menu ul li a {
	font-size: 14px;
	color: #252525;
	text-transform: uppercase;
	font-weight: 700;
	letter-spacing: 2px;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
	padding: 5px 0;
	display: block;
}

/* 검색창 */
#bn_navbar-search-input {
	border: 0;
	background-color: rgb(242, 242, 242);
	border-radius: 0px 20px 20px 0px;
}

.bn_navbar-select-input {
	border: 0;
	background-color: rgb(242, 242, 242);
	cursor: pointer;
	border-radius: 20px 0px 0px 20px;
	padding-left: 10px;
}

.bn_navbar-select-input option:checked, .bn_navbar-select-input option:hover
	{
	color: FD9F28;
}

.bn_btn_search {
	background-color: transparent;
	border: none;
	cursor: pointer;
	position: absolute;
	right: 5px;
	top: 50%;
	transform: translatey(-50%);
}

.btn btn-secondary trend {
	background-color: #24E082;
	border: none;
	border-radius: 30px;
	height: 25px;
	width: auto;
	font-weight: 600;
	font-size: 10px;
}

.product__item {
	width: 200px;
}

.btn_trend {
	background-color: #24E082;
	border: none;
	border-radius: 30px;
	height: 28px;
	width: auto;
	font-weight: 600;
	font-size: 12px;
	color: white;
}

.cate_img {
	width: 50px;
	height: 50px;
}

.cate_icon {
	width: 60px;
	height: 60px;
	margin-bottom: 20%;
}

li>a {
	text-decoration: none;
	color: rgb(37, 36, 36);
	font-size: 14px;
}

li>a:hover {
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.btn_cart {
	border-color: rgb(0, 123, 255);
	color: rgb(0, 123, 255);
	font-size: 10px;
	width: 90px;
	height: 30px;
}

.btn_comment {
	border-color: rgb(0, 123, 255);
	color: rgb(0, 123, 255);
	font-size: 11px;
	width: 65px;
	height: 30px;
}

.star {
	color: rgb(242, 232, 46);
}

/*목차*/
.bn_index ul li {
	list-style: none;
	position: relative;
	display: inline-block;
}

.bn_index a {
	color: black;
}

.bn_index li:last-child a {
	font-weight: 800;
	color: #FD9F28;
}
</style>
</head>

<body>

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-1">
					<div class="header__logo">
						<a href="#"><img src="img/logo.svg" alt=""></a>
					</div>
				</div>
				<div class="col-lg-2"></div>
				<div class="col-lg">
					<div class="input-group mt-3">
						<select class="form-select form-select-sm bn_navbar-select-input">
							<option value="전체">전체</option>
							<option value="영양제">영양제</option>
							<option value="브랜드">브랜드</option>
						</select> <input type="text" class="form-control"
							id="bn_navbar-search-input" placeholder="영양제 이름이나 브랜드명 입력"
							aria-label="search" aria-describedby="search">
						<button class="btn bn_btn_search">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="header__cart">
						<ul>
							<li><a href="#">
									<p style="font-size: 12px; display: inline;">장바구니</p>&nbsp;&nbsp;<i
									class="fa fa-shopping-bag"></i><span>1</span>
							</a></li>
							<li><a href="#">
									<p style="font-size: 12px; display: inline;">마이페이지</p>&nbsp;&nbsp;<i
									class="bi bi-caret-down-fill"></i>
							</a></li>
							<li><a href="#">
									<p style="font-size: 12px; display: inline;">로그아웃</p>&nbsp;&nbsp;<i
									class="bi bi-person-dash"></i>
							</a></li>
						</ul>
						<!-- 로그인 안 했을 때 사용
                        <ul>
                            <li><a href="#"><p style="font-size: 12px; display: inline;">로그인</p>&nbsp;&nbsp;<i class="bi bi-person-check-fill"></i></a></li>
                            <li><a href="#"><p style="font-size: 12px; display: inline;">회원가입</p>&nbsp;&nbsp;<i class="bi bi-person-plus-fill"></i></a></li>
                        </ul> -->
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<nav class="bn_nav1">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<nav class="yh_header__menu">
						<ul>
							<li><a href="#">영양제</a>
								<ul class="yh_header__menu__dropdown">
									<li><a href="#">영양성분조회</a></li>
									<li><a href="#">영양제 검색</a></li>
								</ul></li>
							<li><a href="#">쇼핑</a></li>
							<li><a href="#">Q&A</a>
								<ul class="yh_header__menu__dropdown">
									<li><a href="#">둘러보기</a></li>
									<li><a href="#">질문하기</a></li>
									<li><a href="#">답변하기</a></li>
									<li><a href="#">전문가 찾기</a></li>
								</ul></li>
							<li><a href="#">콘텐츠</a></li>
							<li><a href="#">커뮤니티</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</nav>
	<!-- Header Section End -->

	<div class="container">
		<div class="bn_index mt-5">
			<ul>
				<li>영양 성분 조회</li>
				<li><b>/</b></li>
				<li><a href="#">제품 상세보기</a></li>
				<li><b>/</b></li>
				<li><a href="#">리뷰 더보기</a></li>
			</ul>
		</div>
	</div>

	<!-- Product Section Begin -->
	<section class="product spad" style="margin-top: -2%;">
		<div class="container">
			<div class="row row-cols-1">
				<div class="hero__search"
					style="float: left; position: relative; left: 1%;">
					<form action="#" style="width: 50%;">
						<div class="input-group mt-3">
							<label
								style="font-size: 180%; font-weight: 800; color: rgb(118, 128, 138); margin-right: 3%;">닥터린
								초임계 알티지 오메가3</label> <label
								style="font-size: 180%; font-weight: 800; color: #24E082; margin-right: 3%;">에
								대한 리뷰</label>
						</div>
					</form>
				</div>
			</div>
			<br>
			<div class="product__details__quantity"
				style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">
				<div name="reviewDetail">
					<div name="reviewImg" style="float: left; padding-right: -20%;">
						<i class="bi bi-person-circle"
							style="font-size: 350%; color: #24E082;"></i>
					</div>
					<div name="reviewNickName"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="font-weight: 600;">하하하하하하</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.5%; padding-left: 20%;">
						<i class="fa fa-star"
							style="color: rgb(247, 247, 75); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">2.3</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.2%; padding-left: 5%;">
						<i class="bi bi-hand-thumbs-up-fill"
							style="color: rgb(0, 0, 0); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">22</p>
					</div>
					<div name="reviewImg"
						style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
						<img src="img/product/details/product-details-1.jpg"
							class=".img-fluid">
					</div>
					<div name="reviewContent" style="padding-top: 9%;">나는 모든게 별로~
						내 맘의 별로~~</div>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="product__details__quantity"
				style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">
				<div name="reviewDetail">
					<div name="reviewImg" style="float: left; padding-right: -20%;">
						<i class="bi bi-person-circle"
							style="font-size: 350%; color: #24E082;"></i>
					</div>
					<div name="reviewNickName"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="font-weight: 600;">하하하하하하</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.5%; padding-left: 20%;">
						<i class="fa fa-star"
							style="color: rgb(247, 247, 75); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">2.3</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.2%; padding-left: 5%;">
						<i class="bi bi-hand-thumbs-up-fill"
							style="color: rgb(0, 0, 0); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">22</p>
					</div>
					<div name="reviewImg"
						style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
						<img src="img/product/details/product-details-1.jpg"
							class=".img-fluid">
					</div>
					<div name="reviewContent" style="padding-top: 9%;">나는 모든게 별로~
						내 맘의 별로~~</div>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="product__details__quantity"
				style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">
				<div name="reviewDetail">
					<div name="reviewImg" style="float: left; padding-right: -20%;">
						<i class="bi bi-person-circle"
							style="font-size: 350%; color: #24E082;"></i>
					</div>
					<div name="reviewNickName"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="font-weight: 600;">하하하하하하</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.5%; padding-left: 20%;">
						<i class="fa fa-star"
							style="color: rgb(247, 247, 75); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">2.3</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.2%; padding-left: 5%;">
						<i class="bi bi-hand-thumbs-up-fill"
							style="color: rgb(0, 0, 0); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">22</p>
					</div>
					<div name="reviewImg"
						style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
						<img src="img/product/details/product-details-1.jpg"
							class=".img-fluid">
					</div>
					<div name="reviewContent" style="padding-top: 9%;">나는 모든게 별로~
						내 맘의 별로~~</div>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="product__details__quantity"
				style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">
				<div name="reviewDetail">
					<div name="reviewImg" style="float: left; padding-right: -20%;">
						<i class="bi bi-person-circle"
							style="font-size: 350%; color: #24E082;"></i>
					</div>
					<div name="reviewNickName"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="font-weight: 600;">하하하하하하</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.5%; padding-left: 20%;">
						<i class="fa fa-star"
							style="color: rgb(247, 247, 75); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">2.3</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.2%; padding-left: 5%;">
						<i class="bi bi-hand-thumbs-up-fill"
							style="color: rgb(0, 0, 0); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">22</p>
					</div>
					<div name="reviewImg"
						style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
						<img src="img/product/details/product-details-1.jpg"
							class=".img-fluid">
					</div>
					<div name="reviewContent" style="padding-top: 9%;">나는 모든게 별로~
						내 맘의 별로~~</div>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="product__details__quantity"
				style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">
				<div name="reviewDetail">
					<div name="reviewImg" style="float: left; padding-right: -20%;">
						<i class="bi bi-person-circle"
							style="font-size: 350%; color: #24E082;"></i>
					</div>
					<div name="reviewNickName"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="font-weight: 600;">하하하하하하</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.5%; padding-left: 20%;">
						<i class="fa fa-star"
							style="color: rgb(247, 247, 75); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">2.3</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.2%; padding-left: 5%;">
						<i class="bi bi-hand-thumbs-up-fill"
							style="color: rgb(0, 0, 0); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">22</p>
					</div>
					<div name="reviewImg"
						style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
						<img src="img/product/details/product-details-1.jpg"
							class=".img-fluid">
					</div>
					<div name="reviewContent" style="padding-top: 9%;">나는 모든게 별로~
						내 맘의 별로~~</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<div class="product__pagination" style="text-align: center;">
			<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
				class="fa fa-long-arrow-right"></i></a>
		</div>
	</section>




	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./index.html"><img src="img/logo.png" alt=""></a>
						</div>
						<ul>
							<li>Address: 60-49 Road 11378 New York</li>
							<li>Phone: +65 11.188.888</li>
							<li>Email: hello@colorlib.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>Useful Links</h6>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">About Our Shop</a></li>
							<li><a href="#">Secure Shopping</a></li>
							<li><a href="#">Delivery infomation</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Our Sitemap</a></li>
						</ul>
						<ul>
							<li><a href="#">Who We Are</a></li>
							<li><a href="#">Our Services</a></li>
							<li><a href="#">Projects</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Innovation</a></li>
							<li><a href="#">Testimonials</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<h6>Join Our Newsletter Now</h6>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>document.write(new Date().getFullYear());</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>


	<script src="https://kit.fontawesome.com/25fd41a4c0.js"
		crossorigin="anonymous"></script>
</body>

</html>