<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>게시판 메인</title>
<!--Soyeon-->
<link rel="stylesheet" href="resources/css/soyeon.css" type="text/css">

</head>
<body>
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<!-- Blog Section Begin -->

	<section class="blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-5">
					<div class="blog__sidebar">
						<div class="blog__sidebar__search">
							<form action="#">
								<select>
									<option>작성자</option>
									<option>제목</option>
									<option>내용</option>
								</select> <br>
								<br> <input type="text" placeholder="Search...">
								<button type="submit">
									<br>
									<br>
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</form>
						</div>
						<div class="blog__sidebar__item">
							<h4 style="color: #ffc53e;">Categories</h4>
							<ul>
								<li><a href="#">운동(32)</a></li>
								<li><a href="#">식단 (20)</a></li>
								<li><a href="#">영양제 (5)</a></li>
								<li><a href="#">자유 (9)</a></li>
							</ul>
						</div>
						<div class="blog__sidebar__item">
							<h4 style="color: #ffc53e;">TOP5 게시글</h4>
							<div class="blog__sidebar__recent">
								<a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="resources/img/blog/sidebar/sr-1.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											09 Kinds Of Vegetables<br /> Protect The Liver
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="resources/img/blog/sidebar/sr-2.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											Tips You To Balance<br /> Nutrition Meal Day
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="resources/img/blog/sidebar/sr-3.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											4 Principles Help You Lose <br />Weight With Vegetables
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="resources/img/blog/sidebar/sr-3.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											4 Principles Help You Lose <br />Weight With Vegetables
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="resources/img/blog/sidebar/sr-3.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											4 Principles Help You Lose <br />Weight With Vegetables
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a>
							</div>
						</div>
						<div class="blog__sidebar__item">
							<h4 style="color: #ffc53e;">Search By</h4>
							<div class="blog__sidebar__item__tags">
								<a href="#">PT</a> <a href="#">단백질 보충제</a> <a href="#">샐러드</a> <a
									href="#">필라테스</a> <a href="#">오운완</a> <a href="#">헬린이</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8 col-md-7">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-2.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">오늘 운동 완료(오운완 :D)</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-3.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">Visit the clean farm in the US</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-1.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">Cooking tips make cooking simple</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-4.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">Cooking tips make cooking simple</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-4.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">The Moment You Need To Remove Garlic From The
											Menu</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic">
									<img src="resources/img/blog/blog-6.jpg" alt="">
								</div>
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
										<li><i class="fa fa-comment-o"></i> 5</li>
										<li><i class="fa-regular fa-heart"></i> 17</li>
										<li><i class="fa-regular fa-eye"></i> 78</li>
									</ul>
									<h5>
										<a href="#">Cooking tips make cooking simple</a>
									</h5>
									<p>Sed quia non numquam modi tempora indunt ut labore et
										dolore magnam aliquam quaerat</p>
									<a href="#" class="blog__btn">READ MORE <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="product__pagination blog__pagination">
								<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a
									href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#"><i
									class="fa fa-long-arrow-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="#"><img src="resources/img/logo.svg" alt=""></a>
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
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="resources/img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

</body>
</html>