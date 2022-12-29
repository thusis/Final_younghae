<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>나의 스크랩</title>
<style>
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
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
		<ul>
			<li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
			<li>/</li>
			<li><a href="#">내 스크랩 관리</a></li>
		</ul>
	</div>
	<section class="product spad" style="margin-top: -2%;">
		<div class="container">
			<!-- 실시간트렌드 섹션 -->
			<div class="section-title"
				style="padding: 30px 0 10px 0; margin-bottom: 0px;">
				<h4>내 스크랩 관리</h4>
				<div style="display: block;">
					<hr style="width: 50vw; background-color: #24E082;">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img
								src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01841/v/26.jpg"
								style="margin-top: 30px;">
						</div>
						<div class="product__item__text" style="text-align: left;">
							<span style="float: right; font-size: 18px; margin-top: -1%;"><i
								class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
							<h6 style="display: inline-block;">
								나우푸드</a>
							</h6>
							<h5>울트라 오메가3</h5>
							<h5>35,600</h5>
							<br> <span
								style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에
								좋은 오메가3입니다. 츄라이츄라이해보세요</span>
						</div>

					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img
								src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/blb/blb01012/v/29.jpg"
								style="margin-top: 30px;">
						</div>
						<div class="product__item__text" style="text-align: left;">
							<span style="float: right; font-size: 18px; margin-top: -1%;"><i
								class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
							<h6 style="display: inline-block;">
								나우푸드</a>
							</h6>
							<h5>울트라 오메가3</h5>
							<h5>35,600</h5>
							<br> <span
								style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에
								좋은 오메가3입니다. 츄라이츄라이해보세요</span>
						</div>

					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img
								src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg"
								style="margin-top: 30px;">
						</div>
						<div class="product__item__text" style="text-align: left;">
							<span style="float: right; font-size: 18px; margin-top: -1%;"><i
								class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
							<h6 style="display: inline-block;">
								나우푸드</a>
							</h6>
							<h5>울트라 오메가3</h5>
							<h5>35,600</h5>
							<br> <span
								style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에
								좋은 오메가3입니다. 츄라이츄라이해보세요</span>
						</div>

					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img
								src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nor/nor03770/l/43.jpg"
								style="margin-top: 30px;">
						</div>
						<div class="product__item__text" style="text-align: left;">
							<span style="float: right; font-size: 18px; margin-top: -1%;"><i
								class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
							<h6 style="display: inline-block;">
								나우푸드</a>
							</h6>
							<h5>울트라 오메가3</h5>
							<h5>35,600</h5>
							<br> <span
								style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에
								좋은 오메가3입니다. 츄라이츄라이해보세요</span>
						</div>

					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img
								src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/car/car01733/v/16.jpg"
								style="margin-top: 30px;">
						</div>
						<div class="product__item__text" style="text-align: left;">
							<span style="float: right; font-size: 18px; margin-top: -1%;"><i
								class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
							<h6 style="display: inline-block;">
								나우푸드</a>
							</h6>
							<h5>울트라 오메가3</h5>
							<h5>35,600</h5>
							<br> <span
								style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에
								좋은 오메가3입니다. 츄라이츄라이해보세요</span>
						</div>

					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img
								src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01841/v/26.jpg"
								style="margin-top: 30px;">
						</div>
						<div class="product__item__text" style="text-align: left;">
							<span style="float: right; font-size: 18px; margin-top: -1%;"><i
								class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
							<h6 style="display: inline-block;">
								나우푸드</a>
							</h6>
							<h5>울트라 오메가3</h5>
							<h5>35,600</h5>
							<br> <span
								style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에
								좋은 오메가3입니다. 츄라이츄라이해보세요</span>
						</div>

					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img
								src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/blb/blb01012/v/29.jpg"
								style="margin-top: 30px;">
						</div>
						<div class="product__item__text" style="text-align: left;">
							<span style="float: right; font-size: 18px; margin-top: -1%;"><i
								class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
							<h6 style="display: inline-block;">
								나우푸드</a>
							</h6>
							<h5>울트라 오메가3</h5>
							<h5>35,600</h5>
							<br> <span
								style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에
								좋은 오메가3입니다. 츄라이츄라이해보세요</span>
						</div>

					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img
								src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg"
								style="margin-top: 30px;">
						</div>
						<div class="product__item__text" style="text-align: left;">
							<span style="float: right; font-size: 18px; margin-top: -1%;"><i
								class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
							<h6 style="display: inline-block;">
								나우푸드</a>
							</h6>
							<h5>울트라 오메가3</h5>
							<h5>35,600</h5>
							<br> <span
								style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에
								좋은 오메가3입니다. 츄라이츄라이해보세요</span>
						</div>

					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img
								src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nor/nor03770/l/43.jpg"
								style="margin-top: 30px;">
						</div>
						<div class="product__item__text" style="text-align: left;">
							<span style="float: right; font-size: 18px; margin-top: -1%;"><i
								class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
							<h6 style="display: inline-block;">
								나우푸드</a>
							</h6>
							<h5>울트라 오메가3</h5>
							<h5>35,600</h5>
							<br> <span
								style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에
								좋은 오메가3입니다. 츄라이츄라이해보세요</span>
						</div>

					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg">
							<img
								src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/car/car01733/v/16.jpg"
								style="margin-top: 30px;">
						</div>
						<div class="product__item__text" style="text-align: left;">
							<span style="float: right; font-size: 18px; margin-top: -1%;"><i
								class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
							<h6 style="display: inline-block;">
								나우푸드</a>
							</h6>
							<h5>울트라 오메가3</h5>
							<h5>35,600</h5>
							<br> <span
								style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에
								좋은 오메가3입니다. 츄라이츄라이해보세요</span>
						</div>

					</div>
				</div>

			</div>
			<br>
			<br>
			<div class="product__pagination" style="text-align: center;">
				<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
					class="fa fa-long-arrow-right"></i></a>
			</div>


		</div>
	</section>

</body>

</html>