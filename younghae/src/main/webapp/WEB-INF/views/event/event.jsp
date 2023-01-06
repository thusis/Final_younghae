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
<title>이벤트 메인</title>

<!--Soyeon-->
<link rel="stylesheet" href="resources/css/soyeon.css" type="text/css">
<link rel="stylesheet" href="css/bn_style.css" type="text/css">

<style>
	.mb-4{
		margin-top: -20px; 
		color: gold;
	}
	.mt-xl-6{
		background: #24E082;	
		color: gold;
	}

</style>
</head>
<body>
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<!-- ============================================-->
	<!-- <section> begin ============================-->
 	<section class="pb-5 pt-8">

		<div class="eventDiv" id="eventFirst">
			<div class="row">
				<div class="col-12">
					<div class="card card-span mb-3 shadow-lg">
						<div class="card-body py-0">
							<div class="row justify-content-center">
								<div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-0 order-md-1">
									<img
										class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-end rounded-md-top-0"
										src="resources/img/event/review00.png" alt="..." />
								</div>
								<div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
									<h1 class="card-title mt-xl-5 mb-4">
										Review Event
									</h1>
									<p class="fs-1">
										영해와 함께하는 리뷰이벤트!<br> 리뷰가 처음이면 혜택이 2배<br> (2023.01.01
										- 2023.02.14)
									</p>
									<div class="d-grid bottom-0">
									<button type="button" class="btn btn-success" onclick="location.href='${contextPath}/reviewEvent.ev'">
					   							<i class="fas fa-chevron-right ms-2"></i> Event View details
					    			</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of .container-->

	</section> 
	<!-- <section> close ============================-->
	<!-- ============================================-->
	<br>
	<br>
	<br>
	<!-- ============================================-->
	<!-- <section> begin ============================-->
	<section class="py-0">

		<div class="eventDiv" id="eventLast" >
			<div class="row">
				<div class="col-12">
					<div class="card card-span mb-3 shadow-lg">
						<div class="card-body py-0">
							<div class="row justify-content-center">
								<div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-md-0">
									<img
										class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-start rounded-md-top-0"
										src="resources/img/event/attend3.png" alt="..." />
								</div>
								<div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
									<h1 class="card-title mt-xl-5 mb-4">
										Attendance Event
									</h1>
									<p class="fs-1">
										영해 OPEN 기념 출석체크 이벤트<br> 누적일에 따른 알약 포인트 증정!<br>
										(2023.01.01 - 2023.01.31)
									</p>
									<div class="d-grid bottom-0">
									<button type="button" class="btn btn-success" onclick="location.href='${contextPath}/attendanceEvent.ev'">
					   							<i class="fas fa-chevron-right ms-2"></i> Event View details
					    			</button>
<%-- 										<a class="btn btn-lg btn-primary mt-xl-6" href="#"  onclick="location.href='${contextPath}/attendanceEvent.ev'">Event
											View details<i class="fas fa-chevron-right ms-2"></i>
										</a> --%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of .container-->

	</section>
	<!-- <section> close ============================-->
	<!-- ============================================-->

	<br><br><br><br>
	<!-- ============================================-->
	<!-- <section> begin ============================-->
		<section class="pb-5 pt-8">

		<div class="eventDiv" >
			<div class="row">
				<div class="col-12">
					<div class="card card-span mb-3 shadow-lg">
						<div class="card-body py-0">
							<div class="row justify-content-center">
								<div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-0 order-md-1">
									<img
										class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-end rounded-md-top-0"
										src="resources/img/event/birth00.png"  style="height: 420px;" alt="..." />
								</div>
								<div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
									<h1 class="card-title mt-xl-5 mb-4">
										Birthday Event
									</h1>
									<p class="fs-1">
										이번달 생일인 영양단을 위한 이벤트!<br> 생일자라면 선물 받아가세요 :)<br>
										(2023.01.01 - 2023.01.31)
									</p>
									<div class="d-grid bottom-05">
									<button type="button" class="btn btn-success" onclick="location.href='${contextPath}/birthEvent.ev'" >
					   							<i class="fas fa-chevron-right ms-2"></i> Event View details
					    			</button>									
<%-- 										<a class="btn btn-lg btn-primary mt-xl-6" href="#"  onclick="location.href='${contextPath}/birthEvent.ev'">Event
											View details<i class="fas fa-chevron-right ms-2"></i>
										</a> --%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of .container-->

	</section>
	
<%-- 	<section class="pb-5 pt-8">

		<div class="eventDiv">
			<div class="row">
				<div class="col-12">
					<div class="card card-span mb-3 shadow-lg">
						<div class="card-body py-0">
							<div class="row justify-content-center">
								<div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-md-0">
									<img
										class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-start rounded-md-top-0"
										src="resources/img/event/birth0.PNG" alt="..." />
								</div>
								<div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
									<h1 class="card-title mt-xl-5 mb-4">
										Birthday<span class="text-primary"> Event</span>
									</h1>
									<p class="fs-1">
										이번달 생일인 영양단을 위한 이벤트!<br> 생일자라면 선물 받아가세요 :)<br>
										(2023.01.01 - 2023.01.31)
									</p>
									<div class="d-grid bottom-0">
										<a class="btn btn-lg btn-primary mt-xl-6" href="#"  onclick="location.href='${contextPath}/birthEvent.ev'">Event
											View details<i class="fas fa-chevron-right ms-2"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of .container-->

	</section> --%>
	<!-- <section> close ============================-->
	<!-- ============================================-->


	<!-- ============================================-->
	<!-- <section> begin ============================-->
	<br>
	<br>
	<br>
	
	
	<%-- 	<section class="py-0">

		<div class="eventDiv" id="eventLast">
			<div class="row">
				<div class="col-12">
					<div class="card card-span mb-3 shadow-lg">
						<div class="card-body py-0">
							<div class="row justify-content-center">
								<div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-md-0">
									<img
										class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-start rounded-md-top-0"
										src="resources/img/event/replyMain.png" style="height: 420px;" alt="..." />
								</div>
								<div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
									<h1 class="card-title mt-xl-5 mb-4">
										Reply Event
									</h1>
									<p class="fs-1">
										컬럼에 댓글 달면 혜택이 팡 ! 팡 !<br> (2023.01.01 - 2023.01.31)
									</p>
									<div class="d-grid bottom-0">
									<button type="button" class="btn btn-success" onclick="location.href='${contextPath}/birthEvent.ev'">
					   							<i class="fas fa-chevron-right ms-2"></i> Event View details
					    			</button>															
										<a href="#" class="btn btn-lg btn-primary mt-xl-6"   onclick="location.href='${contextPath}/replyEvent.ev'">Event
											View details<i class="fas fa-chevron-right ms-2"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of .container-->

	</section> --%>
	
	
<%-- 	<section class="py-0">

		<div class="eventDiv" id="eventLast">
			<div class="row">
				<div class="col-12">
					<div class="card card-span mb-3 shadow-lg">
						<div class="card-body py-0">
							<div class="row justify-content-center">
								<div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-md-0">
									<img
										class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-start rounded-md-top-0"
										src="resources/img/event/replyMain.png" alt="..." />
								</div>
								<div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
									<h1 class="card-title mt-xl-5 mb-4">
										Reply <span class="text-primary">Event</span>
									</h1>
									<p class="fs-1">
										컬럼에 댓글 달면 혜택이 팡 ! 팡 !<br> (2023.01.01 - 2023.01.31)
									</p>
									<div class="d-grid bottom-0">
										<a class="btn btn-lg btn-primary mt-xl-6" href="#"  onclick="location.href='${contextPath}/replyEvent.ev'">Event
											View details<i class="fas fa-chevron-right ms-2"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of .container-->

	</section> --%>
	<!-- <section> close ============================-->
	<!-- ============================================-->
	<br>
	<br>

 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<!-- 	<link
		href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap"
		rel="stylesheet"> -->


</body>
</html>