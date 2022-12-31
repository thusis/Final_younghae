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
<title>출석 이벤트</title>

<!--Soyeon-->
<link rel="stylesheet" href="resources/css/soyeon.css" type="text/css">

</head>
<body>
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<br>
	<br>
	<h4 id="eventTitle">✨🎯1월 출석체크 이벤트! !🎯✨</h4>

	<hr width="80%" style="border: 2px solid #24E082;" noshade />
	<br>
	<br>
	<div class="attendance">
		<img src="resources/img/event/attend1.png"
			 usemap="#attendanceMap" class="attendanceImg"/>
<!-- 			 <h2 class="attendanceCount">7</h2> 출석횟수 -->
		<map name="attendanceMap" id="attendanceMap" >
		<area shape="rect" coords="361, 854, 723, 946" style="cursor:pointer;" onclick="location.href='${contextPath}/insertAttendance.ev'">
		</map>
	</div>
	<div class="attendance">
		<img src="resources/img/event/attend2.png"
			style="width: 1080px; height: 600px;">
	</div>

	<br>
	<br>
	<div id="eventAttendanceBtn">
		<a href="#" class="btn-3d purple"  data-bs-toggle="modal" data-bs-target="#reportMo" id="atAward">출석 보상받기</a>
	</div>
	
	     <!-- model -->
        <div class="modal fade" id="reportMo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> </h5>
                    </div>
                    <div class="modal-body">                                     
                        <img src="resources/img/event/firecracker.png" style="width: 150px; margin-left: 160px;" ><br><br>
                        <b style="margin-left: 100px; color:#24E082;">알약 포인트 지급이 완료되었습니다</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
	
	<br>
	<br>

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

	<!-- 버튼 -->
	<script>
		$('a').click(function(event) {
			event.preventDefault();
		});
		
		document.getElmentById('atAward').addEventListener('click', function() {
			$.ajax({
				 url:'${contextPath}/attendanceEventAward.ev',
				 data: {key : 1},
				 success: 
				 error:
					 alert("조건을 충족하지 않습니다")
			});
		})
	</script>

	
</body>
</html>