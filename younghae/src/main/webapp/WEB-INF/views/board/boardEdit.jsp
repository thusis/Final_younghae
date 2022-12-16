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
<title>게시글 수정</title>
<!--Soyeon-->
<link rel="stylesheet" href="resources/css/soyeon.css" type="text/css">

<script src="https://kit.fontawesome.com/7a738a6e1a.js"
	crossorigin="anonymous"></script>
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
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<div class="container">
		<div class="bn_index mt-5">
			<ul>
				<li>자유 게시판</li>
				<li><b>/</b></li>
				<li><a href="#">게시글 수정</a></li>
			</ul>
		</div>
		<!-- Blog Section Begin -->

		<section class="blog spad">
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
							<h4>Categories</h4>
							<ul>
								<li><a href="#">운동(32)</a></li>
								<li><a href="#">식단 (20)</a></li>
								<li><a href="#">영양제 (5)</a></li>
								<li><a href="#">자유 (9)</a></li>
							</ul>
						</div>
						<div class="blog__sidebar__item">
							<h4>TOP5 게시글</h4>
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
							<h4>Search By</h4>
							<div class="blog__sidebar__item__tags">
								<a href="#">PT</a> <a href="#">단백질 보충제</a> <a href="#">샐러드</a> <a
									href="#">필라테스</a> <a href="#">오운완</a> <a href="#">헬린이</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-8 col-md-7 order-md-1 order-1">
					<table>
						<thead>
							<tr style="text-align: center;">

								<td width="50px"><select name="category" id="category"
									style="color: #24E082;">
										<option>선택</option>
										<option>운동</option>
										<option>식단</option>
										<option>영양제</option>
										<option>자유</option>
								</select></td>

								<th width="55px" style="color: #24E082;">제목</th>
								<td><input type="text" name="boardTitle" size="70"
									id="boardTitle"></td>
							</tr>
						</thead>
					</table>

					<hr width="80%" style="border: 1px solid #c9ffe4;" noshade />
					<input type="file" style="float: right;" id="fileUpload">
					<button type="button" class="btn btn-outline-warning" id="addFile"
						name="file" onclick="onClickUpload();">파일 추가</button>
					<br>
					<textarea class="container" id="boardContent"
						style="border: 2px solid #24E082; border-radius: 3%;">
                        
                   		</textarea>

					<div class="col-lg-6">
						<button class="btn bn_btn_search2" id="boardWriteBtn"
							type="button">SUBMIT</button>
						<div class="blog__details__widget">
							<div style="margin-top: 40px; margin-left: 40px;" class="content">
								<div style="display: flex;">
									<input type="text" id="tag" size="20" placeholder="HashTag">
								</div>
								<ul id="tag-list">
								</ul>
							</div>
						</div>
						<br>
						<br>
					</div>
				</div>


			</div>
	</div>
	<!-- board Detail End -->
	<br>
	<br>
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

	<script>
		function onClickUpload() {
			let fileUpload = document.getElementById("fileUpload");
			fileUpload.click();
		}

		/**해시태그*/
		$(document)
				.ready(
						function() {

							var tag = {};
							var counter = 0;

							// 태그추가
							function addTag(value) {
								tag[counter] = value;
								counter++;
							}

							function marginTag() {
								return Object.values(tag).filter(
										function(word) {
											return word !== "";
										});
							}

							$("#tag")
									.on(
											"keyup",
											function(e) {
												var self = $(this);
												console.log("keypress");

												// input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
												if (e.key === "Enter"
														|| e.keyCode == 32) {

													var tagValue = self.val(); // 값 가져오기

													// 값이 없으면 동작 안합니다.
													if (tagValue !== "") {

														// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
														var result = Object
																.values(tag)
																.filter(
																		function(
																				word) {
																			return word === tagValue;
																		})

														// 태그 중복 검사
														if (result.length == 0) {
															$("#tag-list")
																	.append(
																			"<li class='tag-item'>"
																					+ tagValue
																					+ "<span class='del-btn' idx='" + counter + "'>x</span></li>");
															addTag(tagValue);
															self.val("");
														} else {
															alert("태그값이 중복됩니다.");
														}
													}
													e.preventDefault();
												}
											});

							// 삭제 버튼
							$(document).on("click", ".del-btn", function(e) {
								var index = $(this).attr("idx");
								tag[index] = "";
								$(this).parent().remove();
							});
						})
	</script>
</body>
</html>