<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>카테고리 선택</title>
<style>
	/* 영양제 성분 카테고리*/
	.featured__item {
		background-color: #DCFFE9;
		padding: auto;
		width: 300;
		height: 230;
		border-radius: 5%;
	}
	
	.featured__item p {
		text-align: center;
		line-height: 250px;
		font-weight: 600;
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
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>

	<div class="container">
		<div class="bn_index mt-5">
			<ul>
				<li>영양제</li>
				<li><b>/</b></li>
				<li><a href="#">건강해지는 이야기 상세보기</a></li>
				<li><b>/</b></li>
				<li><a href="#">건강해지는 이야기 수정하기</a></li>
			</ul>
		</div>
	</div>

	<!-- Product Details Section Begin -->

	<section class="product-details spad">
		<div class="container"
			style="border: 2px solid #24E082; border-radius: 3em; padding: 5%;">
			<div class="row" style="width: 100%;">
				<div class="col-lg-12 col-md-12" style="width: 100%;">
					<div class="product__details__text">
						<i class="fa-solid fa-comment-medical"
							style="font-size: 225%; color: #24E082; margin-right: 1%;"></i>
						<h3 style="display: inline;" id="cateName">${ c.cateName }</h3>
						<br>
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half-o"></i> <span>(리뷰 18)</span>
						</div>
						<p>${ c.cateSummary }</p>
						<input type="hidden" value="${ c.cateNum }" id="cateNum">
						<div class="product__details__quantity" style="width: 100%;">
							<div class="product__details__quantity"
								style="border: 2px solid #24E082; border-radius: 5px; padding: 5%; width: 100%;">
								<c:if test="${ c.cateIcon ne null }">
									<c:forEach var="w" items="${ c.cateIcon }">
										<c:if test="${ fn:contains( w , '수술')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/knife.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">수술 전 후 지혈
												늦춰짐</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '생선')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<i class="fa-solid fa-fish-fins"></i>
											</div>
											<div class="product__details__price mr-5"
												style="font-size: 100%; display: inline;">생선 알레르기 주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '임산부')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/pregnant.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">임산부 관련 연구 부족</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '폐암')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/respiratory.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">장기간 고용량 복용시
												폐암 위험 증가</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '수유')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/baby_bottle.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">수유부 관련 연구 부족</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '갑각류')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/crustaceans.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">갑각류 알레르기 주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( c.cateIcon, '신장')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/kidney.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">고용량 복용시
												고칼슘혈증으로 인해 신장 기능 저하</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( c.cateIcon, '요로')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body_wraning.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">요로결석 주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( c.cateIcon, '저혈압')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body_wraning.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">저혈압 주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( c.cateIcon, '석류')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">석류 알레르기 주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( c.cateIcon, '여성호르몬')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">여성호르몬 유사 작용
												주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( c.cateIcon, '장기')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">장기간 섭취시 장기
												손상 우려</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( c.cateIcon, '철')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body_wraning.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">철 중독증 우려</div>
												&nbsp;&nbsp;
											</c:if>
										<%-- <c:if test="${ fn:contains( c.cateIcon, '임산부')}"></c:if> --%>
									</c:forEach>
								</c:if>
								<c:if test="${ c.cateIcon eq null }">
									<div class="product__details__price"
										style="font-size: 100%; display: inline;">아직 발견된 주의사항이
										없네요!</div>
								</c:if>
							</div>
						</div>
						<ul>
							<li>
								<div class="mb-3" name="pillItem">
									<b style="display: inline; font-weight: 900; color: #24E082;">영양제
										추천</b>
									<button type="button"
										style="margin-left: 80%; color: #24E082; font-weight: 700;  background-color: white; border: none;"
										id="productMore">더보기 &gt; &gt;</button>
								</div>
							</li>
							<li>
								<div class="row">
									<c:forEach var="item" items="${ product }" begin="0" end="2"
										step="1" varStatus="status">
										<div class="product__details__quantity"
											style="border: 2px solid #24E082; border-radius: 10px; width: 30%; height: 380px; margin-right: 3.25%;">
											<input type="hidden" value="${ item.proNum }">
											<div style="text-align: center; padding-top: 5%;">
												<div name="getItemImg">
													<img src="${ item.proImage }"
														style="height: 5%; width: 50%;">
												</div>
												<div name="getItemName"
													class="text-left fs-5 font-weight-bold pl-2">&nbsp;
													${ item.proName }</div>
												<div class="fs-5 text-left pr-3 pt-1 mb-3">&nbsp; ${ item.proEffect }
												</div>
												<div class="text-left pr-2">
													<div class="product__details__rating"
														style="float: left; padding-left: 5%;">
														<i class="fa fa-star"
															style="color: rgb(247, 247, 75); font-size: 130%;"></i>
													</div>
													<div name="reviewRank"
														style="float: left; padding-left: 1%; padding-top: 1.5%;">
														<p style="color: black; font-size: 130%;">${ item.proGrade }</p>
													</div>
													<div class="text-right font-weight-bold pr-2% pt--3 mb-1 mt-1">
														${ item.proPrice }</div>
												</div>
												<br>
												<br>
											</div>
										</div>
									</c:forEach>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab" style="padding-top: 5%;">
						<ul class="nav nav-tabs" role="tablist">
							<li><a class="nav-link active" data-toggle="tab"
								href="#tabs-1" role="tab" aria-selected="true">Reviews <span>(3)</span></a>
							</li>
							<!-- <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Description</a>
                            </li> -->
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>리뷰</h6>
									<c:forEach items="${ review }" var="re">
										<div class="product__details__quantity"
											style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 3%; padding-bottom: 5%;">
											<div name="reviewDetail">
												<div name="reviewImg"
													style="float: left; padding-right: -20%;">
													<i class="bi bi-person-circle"
														style="font-size: 350%; color: #24E082;"></i>
												</div>
												<div name="reviewNickName"
													style="float: left; padding-top: 3.5%; padding-left: 1%;">
													<p style="font-weight: 600;">집가고싶당</p>
												</div>
												<div class="product__details__rating"
													style="float: left; padding-top: 3.5%; padding-left: 20%;">
													<i class="fa fa-star"
														style="color: rgb(247, 247, 75); font-size: 130%;"></i>
												</div>
												<div name="reviewRank"
													style="float: left; padding-top: 3.5%; padding-left: 1%;">
													<p style="color: black; font-size: 130%;">4.8</p>
												</div>
												<div name="reviewImg"
													style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 4%;">
													<img src="resources/img/product/details/product-details-1.jpg"
														class=".img-fluid">
												</div>
												<div name="reviewContent" class="text-left"
													style="padding-top: 9%;">야채냠</div>
											</div>
										</div>
									<br>
									<br>
									
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->



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
	<script>
		window.onload=()=>{
			const more = document.getElementById("productMore");
			more.addEventListener('click', ()=>{
				const cateNum = document.getElementById('cateNum').value;
				const cateName = document.getElementById('cateName').innerText;
// 				console.log(cateNum);
// 				console.log(cateName);
                location.href = '${contextPath}/productMore.su?cateNum=' + cateNum + '&cateName=' + cateName;
			});
			
			const product = document.getElementsByClassName('product__details__quantity');
			for(const pro of product){
				pro.addEventListener('click', function(){
					const productSelect = this.children[0].value;
					console.log(productSelect);
					
					location.href = '${contextPath}/selectProduct.su?proNum='+productSelect;
				});
				
			}
		}
	</script>
</html>