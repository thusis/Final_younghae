<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>리뷰 더보기</title>

<style>

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
	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
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
							<input type="hidden" value="${ cateNum }" id="cateNum">
							<label
								style="font-size: 180%; font-weight: 800; color: rgb(118, 128, 138); margin-right: 3%;">${ cateName }</label> <label
								style="font-size: 180%; font-weight: 800; color: #24E082; margin-right: 3%;">에 대한 리뷰</label>
						</div>
					</form>
				</div>
			</div>
			<br>
			<c:forEach items="${ review }" var="r">
			<div class="product__details__quantity"
				style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">
				<div name="reviewDetail">
					<div name="reviewImg" style="float: left; padding-right: -20%;">
						<i class="bi bi-person-circle"
							style="font-size: 350%; color: #24E082;"></i>
					</div>
					<div name="reviewNickName"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="font-weight: 600;">유저 이름</p>
					</div>
					<div class="product__details__rating"
						style="float: left; padding-top: 3.5%; padding-left: 20%;">
						<i class="fa fa-star"
							style="color: rgb(247, 247, 75); font-size: 130%;"></i>
					</div>
					<div name="reviewRank"
						style="float: left; padding-top: 3.5%; padding-left: 1%;">
						<p style="color: black; font-size: 130%;">${ r.rvStar }</p>
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
						<img src="resources/uploadFiles/${ r.image }"
							class=".img-fluid">
					</div>
					<div name="reviewContent" style="padding-top: 9%;">${ r.rvContent }</div>
				</div>
			</div>
			<br>
			<br>
			<br>
			</c:forEach>
			
		<!-- 페이징 -->
			<div class="col-lg-12 text-center" style="margin-top: 8%;">
				<div class="product__pagination blog__pagination">
					<c:url var="goBack" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
						<c:param name="cateNum" value="${ cateNum }"/>
						<c:param name="cateName" value="${ cateName }"/>
					</c:url>
					<c:if test="${ pi.currentPage > 1 }">
						<a href="${ goBack }" aria-label="Previous"><i class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:url var="goNum" value="${ loc }">
							<c:param name="page" value="${p}"></c:param>
							<c:param name="cateNum" value="${ cateNum }"/>
							<c:param name="cateName" value="${ cateName }"/>
						</c:url>
						<a href="${ goNum }">${ p }</a>
					</c:forEach>
					<c:url var="goNext" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
						<c:param name="cateNum" value="${ cateNum }"/>
						<c:param name="cateName" value="${ cateName }"/>
					</c:url>
					<c:if test="${ pi.currentPage <= 1 }">
					<a href="${ goNext }"><i class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>
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

</body>

</html>