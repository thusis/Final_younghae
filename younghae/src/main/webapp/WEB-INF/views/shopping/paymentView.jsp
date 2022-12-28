<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>결제페이지</title>

<style>
	/*  구글 폰트
	    font-family: 'Hahmlet', serif;
	    font-family: 'IBM Plex Sans KR', sans-serif;
	    font-family: 'Nanum Gothic', sans-serif; 
	    */
	@import
		url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@100;200;300;400;500;600;700&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic:wght@400;700;800&display=swap')
		;
	
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
	
	.table th:first-child {
		background: #DCFFE9;
	}
	
	.testSelect {
		display: block;
		width: 500px;
	}
	
	.testSelect li {
		display: block;
		width: 500px !important;
	}
	
/* 	/common style --------------------------------------------------------- */

/* 	버튼 */
	.btn_pointAll {
		background-color: white;
		border-color: #24E082;
		border-radius: 0.3em;
		height: 2.2rem;
		width: 5rem;
		font-weight: bold;
		font-size: 12px;
		color: #24E082;
	}
	
	.hj_btn_deleteAddress {
		border: 1px solid #24E082;
		color: #24E082;
		font-size: 12px;
		width: 65px;
		height: 30px;
		background-color: white;
		border-radius: 0.4em;
	}
	
	.hj_btn_findAddress {
		border: 1px solid #24E082;
		color: #24E082;
		font-size: 12px;
		width: 65px;
		height: 30px;
		background-color: white;
		border-radius: 0.4em;
	}
	
	
/* 폰트 */
 	.hj_addressBtnFont{ 
 		border: none;  
 		background-color: white;  
 		float: right; color: #24E082;  
 		font-weight: bold;  
 		font-size: 1.3rem;
 	} 
	
	
/* 요소 */
	.inputBox {
		border: 1px solid #ced4da;
		border-radius: 0.2em;
		height: 2.2rem;
		width: 17rem;
	}
	
	
</style>
	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	<link rel="stylesheet" href="resources/css/hj_style.css" type="text/css">
</head>

<body>
	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">

			<div class="bn_index mt-n2">
				<ul>
					<li><a href="#">쇼핑</a></li>
					<li><b>/</b></li>
					<li><a href="#">영양제 상세보기</a></li>
					<li><b>/</b></li>
					<li><a href="#">상품 결제하기</a></li>
				</ul>
			</div>

			<div class="checkout__form mt-5">
				<h3 class="mb-5">주문/결제</h3>
				<form action="#">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row" style="margin: -1rem;">
								<div class="col-lg-6">
									<p style="font-weight: bold; font-size: 1.5rem;">배송지</p>
								</div>
								<div class="col-lg-6">
									<button type="button" id="addressListbtn" class="hj_addressBtnFont">변경</button>
								</div>
							</div>
							<hr>
							<div class="checkout__input" style="margin-bottom: 5rem;">
								<div id="order_addressName" name="userZipcode" style="font-weight: bold; font-size: 1.3rem; margin-bottom:0.3rem;">
									KH종로지원
								</div>
								<div id="order_address" name="userAddress" style="margin-bottom:0.3rem;"><span>서울 중구 남대문로 120</span>, <span>그레이츠 청계</span></div>
								<div id="order_addressee" style="color: #828282; margin-bottom:1rem;">
									영양단<div id="order_addressPhone" style="display: inline;"> 010-2775-1170</div>
								</div>

								<select class="testSelect">
									<option>배송시 요청사항을 선택해주세요</option>
									<option>부재시 문앞에 놓아주세요</option>
									<option>배송전에 미리 연락주세요</option>
									<option>부재시 경비실에 맡겨주세요</option>
									<option>부재시 전화주시거나 문자 남겨 주세요</option>
								</select>
							</div>

							<!-- 주문자 -->
							<div class="row" style="margin: -1rem;">
								<div class="col">
									<p style="font-weight: bold; font-size: 1.5rem;">주문자</p>
								</div>
							</div>
							<hr>
							
							<div>
								<div class="mb-3">
									<label for="orderName" style="margin-right: 3rem">이름</label> 
									<input class="inputBox" name="orderName" value="${ loginUser.userName }">
								</div>
	
	<!-- 							<div class="mb-3"> -->
	<!-- 								<label for="orderEmail" style="margin-right: 2rem">이메일</label> <input -->
	<!-- 									class="inputBox" name="oderEmail">&nbsp;&nbsp;@&nbsp;&nbsp; -->
	<!-- 								<input class="inputBox" name="oderEmailDomain"> -->
	<!-- 							</div> -->
	
								<div style="margin-bottom: 5em;">
									<label for="oderPhone" style="margin-right: 1rem">휴대전화</label> 
									<input class="inputBox" name="oderPhone" value="${ loginUser.userPhone }">
								</div>
							</div>
							<!-- /주문자 -->

							<!-- 주문 상품 -->
							<div class="row" style="margin: -1rem;">
								<div class="col">
									<p style="font-weight: bold; font-size: 1.5rem;">주문상품</p>
								</div>
							</div>
							<hr>

							<div class="container mb-4"	style="border: 1px solid #e5e3e3; border-radius: 0.5em;">
								<div class="row" style="height: 1.8rem; background-color: #F5F5F5; border-top-left-radius: 0.5em; border-top-right-radius: 0.5em;">
									<div class="col-6">
										<span> 나우푸드 </span>
									</div>
									<div class="col-6" style="text-align: right;">
										<span> 배송비 <span>0원</span>
										</span>

									</div>
								</div>
								<div class="row mt-3 mb-3">
									<div class="col-auto">
										<img style="width: 5rem;"
											src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01841/v/26.jpg">
									</div>
									<div class="col" style="padding-top: 1rem;">
										<div style="color: gray; font-weight: bold; font-size: 15px;">울트라
											오메가3</div>
										<div style="font-weight: bold; font-size: 15px;">
											35,600 &nbsp;&nbsp;<span
												style="color: gray; font-size: 14px; font-weight: bold;">3개</span>
										</div>
									</div>
								</div>
							</div>
							<div class="container mb-4"
								style="border: 1px solid #e5e3e3; border-radius: 0.5em;">
								<div class="row"
									style="height: 1.8rem; background-color: #F5F5F5; border-top-left-radius: 0.5em; border-top-right-radius: 0.5em;">
									<div class="col-6">
										<span> 나우푸드 </span>
									</div>
									<div class="col-6" style="text-align: right;">
										<span> 배송비 <span>2,500원</span>
										</span>

									</div>
								</div>
								<div class="row mt-3 mb-3">
									<div class="col-auto">
										<img style="width: 5rem;"
											src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg">
									</div>
									<div class="col" style="padding-top: 1rem;">
										<div style="color: gray; font-weight: bold; font-size: 15px;">슈퍼
											울트라 오메가3</div>
										<div style="font-weight: bold; font-size: 15px;">
											30,600 &nbsp;&nbsp;<span
												style="color: gray; font-size: 14px; font-weight: bold;">3개</span>
										</div>
									</div>
								</div>
							</div>
							<!-- /주문 상품 -->

							<!-- 쿠폰 -->
							<div class="row" style="margin-top: 5rem;">
								<div class="col">
									<p
										style="font-weight: bold; font-size: 1.5rem; margin-bottom: -10px;">
										쿠폰<span style="float: right; font-size: 0.8rem;">사용 가능한
											쿠폰이 없습니다.</span>
									</p>
								</div>
							</div>
							<hr>

							<input class="inputBox" style="width: 100%; padding: 10px;"
								placeholder="쿠폰 선택">
							<!-- /쿠폰 -->

							<!-- 포인트 -->
							<div class="row" style="margin-top: 5rem;">
								<div class="col">
									<p
										style="font-weight: bold; font-size: 1.5rem; margin-bottom: -10px;">
										포인트<span style="float: right; font-size: 0.8rem;">3만원
											이상 구매시 사용 가능 (배송비 제외)</span>
									</p>
								</div>
							</div>
							<hr>

							<div class="row">
								<div class="col" style="margin-right: -5rem;">
									<input class="inputBox" style="width: 80%; padding: 10px;"
										placeholder="0">
								</div>
								<div class="col">
									<button class="btn_pointAll">전액사용</button>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div>
										사용 가능 포인트 <span style="color: #24E082;">46P</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>결제 금액</h4>
								<ul>
									<li>총 상품 금액 <span>68,600원</span></li>
									<li>배송비<span>2,500원</span></li>
									<li>쿠폰 사용<span>0원</span></li>
									<li>포인트 사용<span>0원</span></li>
								</ul>
								<div class="checkout__order__subtotal">
									최종 결제 금액 <span style="color: #24E082;">71,100 원</span> <br>
									<span style="font-size: 0.6rem;">P적립 예정</span><span
										style="font-size: 0.6rem;">80</span>
								</div>

								<div class="checkout__input__checkbox">
									<label for="acc-or"> 아래 내용에 모두 동의합니다.(필수) <input
										type="checkbox" id="acc-or"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="container">
									<p>본인은 만 14세 이상이며, 주문 내용을 확인하였습니다.</p>
									<div class="checkout__input__checkbox">
										<label for="payment"> 개인정보 수집 이용 및 제 3자 제공 동의(필수) <input
											type="checkbox" id="payment"> <span class="checkmark"></span>
										</label>
									</div>
									<div class="checkout__input__checkbox">
										<label for="paypal"> 결제대행 서비스 이용약관 동의(필수) <input
											type="checkbox" id="paypal"> <span class="checkmark"></span>
										</label>
									</div>
								</div>
								<button type="submit" class="site-btn">
									<span>71,100</span>원 결제하기
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->


	<!-- Modal1(배송지 리스트 출력) -->
	<div id="addressListModal" class="hj_modal">
		<!-- Modal content -->
		<div class="modal-content" style="height: 90%; width: 28%">
			<div class="modal-header" style="height: 10%; border-bottom-color: white; margin-top: -15px; text-align: center">
				<div class="modal-title fs-5" id="exampleModalLabel" style="margin-left: 28%; font-size: 1.5rem; font-weight: bold;">
					배송지 선택
				</div>
				<span class="close" style="align-content: right; font-size: 2rem;">&times;</span>
			</div>
			<div id="addressListDiv" class="modal-body" style="overflow: auto;">
<!-- 			divs 들어가는 곳 -->
			</div>
			<div class="modal-footer"
				style="border-top-color: white; margin-bottom: -10px;">
				<button type="button" id="goModal2" class="hj_btn_addAddress"
					style="font-size: 20px;">배송지 추가</button>
			</div>
		</div>
	</div>
	<!-- /Modal1(배송지 리스트 출력) -->


	<!-- Modal2(배송지 추가) -->
	<div id="addAdressModal" class="hj_modal">
		<!-- Modal content -->
		<div class="modal-content" style="height: 90%; width: 28%">
			<div class="modal-header" style="height:10%; border-bottom-color: white; margin-top:-15px;">
				<button id="goModal1" class="hj_btn_closeAddressModal" style="margin-top: 5px; color: #828282;">
					<i class="bi bi-arrow-left" style="width: 20px; height: 20px;"></i>
				</button>
				<div class="modal-title fs-5" id="exampleModalLabel" style="margin-left: 21%; font-size: 1.5rem; font-weight: bold;">
					배송지 추가
				</div>
				<span class="close" style="align-content: right; font-size: 2rem;">&times;</span>
			</div>
			<form action="${ contextPath }/insertAddress.sh" id="addressForm" method="post">
				<div class="modal-body">
					<div style="margin-bottom: 0.5rem;">
						<label for="addressName"
							style="margin-right: 1rem; color: #5B555C; margin-top: 5px;">배송지명</label>
						<input type="text" name="addressName" id="addressName"
							style="width: 70%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right;" required>
					</div>
					<div style="margin-bottom: 0.5rem;">
						<label for="addressAddressee"
							style="margin-right: 1rem; color: #5B555C; margin-top: 5px;">받는사람</label>
						<input type="text" name="addressAddressee" id="addressAddressee"
							style="width: 70%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right;" required>
					</div>
					<div>
						<label for="addressPhone"
							style="margin-right: 1rem; color: #5B555C; margin-top: 5px;">연락처</label>
						<input type="text" name="addressPhone" id="addressPhone"
							style="width: 70%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right;"
							placeholder="ex)&nbsp;010-1234-5678">
					</div>
					<div style="margin-bottom: 0.5rem;">
						<label for="addressZipcode"
							style="margin-right: 1rem; color: #5B555C; margin-top: 5px; margin-right: 3.4rem;">주소</label><br>
						<button type="button" id="findAddress" class="hj_btn_findAddress"
							style="height: 2.1rem; width: 28%; font-weight: bold">주소찾기</button>
						<input type="text" name="addressZipcode" id="addressZipcode"
							style="width: 70%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right; margin-bottom: 0.5rem;"
							readonly> <input type="text" name="addressBuilding"
							id="addressBuilding"
							style="width: 100%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right; margin-bottom: 0.5rem;"
							readonly> <input type="text" name="addressDetail"
							id="addressDetail"
							style="width: 100%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right; margin-bottom: 0.5rem;" required>
					</div>
					<div style="margin-bottom: 2px;">
						<input type="checkbox" id="addressBasic" name="addressBasic"
							style="accent-color: #24E082; color: white; width: 15px; height: 15px; margin-top: 10px;">
						<label for="addressBasic" style="color: #5B555C;">&nbsp;&nbsp;기본
							배송지로 저장</label>
					</div>
					<div style="background-color: #F5F5F5;">
						<div style="color: #5B555C; font-size: 13px;">개인정보 수집 및 이용
							동의</div>
						<div
							style="overflow: auto; height: 45px; color: #5B555C; font-size: 10px;">
							1. 개인정보 수집 목적 : 신규 배송지 추가, 배송정보 관리, 맞춤형 콘텐츠 및 서비스 등 제공 또는 추천<br>
							2. 수집 항목 : 배송지정보(이름, 연락처, 주소)<br> 3. 보유기간 : 동의 철회시까지<br>
							• 개인정보 수집에 동의를 거부할 수 있으나 거부 시 추가하는 배송지로의 상품 배송이 제한됩니다.<br> •
							위 개인정보 수집 동의 내용을 확인하고 저장합니다.
						</div>
					</div>
				</div>
			</form>
			<div class="modal-footer"
				style="border-top-color: white; margin-bottom: -10px; height: 20%">
				<button type="button" id="saveAddress" class="hj_btn_addAddress"
					style="font-size: 20px;">저장</button>
			</div>
		</div>
	</div>
	<!-- /Modal2(배송지 추가) -->


	<!-- Modal3(배송지 수정) -->
	<div id="changeAddressModal" class="hj_modal">
		<!-- Modal content -->
		<div class="modal-content" style="height: 90%; width: 28%">
			<div class="modal-header" style="height: 10%; border-bottom-color: white; margin-top: -15px;">
				<button id="goModalBefore" class="hj_btn_closeAddressModal"
					style="margin-top: 5px; color: #828282;">
					<i class="bi bi-arrow-left" style="width: 20px; height: 20px;"></i>
				</button>
				<div class="modal-title fs-5" id="exampleModalLabel"
					style="margin-left: 21%; font-size: 1.5rem; font-weight: bold;">배송지
					수정</div>
				<span class="close" style="align-content: right; font-size: 2rem;">&times;</span>
			</div>
			<form id="updateAddressForm" method="post">
				<div class="modal-body">
					<div style="margin-bottom: 0.5rem;">
						<label for="changeAddressName"
							style="margin-right: 1rem; color: #5B555C; margin-top: 5px;">배송지명</label>
						<input type="text" name="addressName" id="changeAddressName"
							style="width: 70%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right;">
					</div>
					<div style="margin-bottom: 0.5rem;">
						<label for="changeAddressAddressee"
							style="margin-right: 1rem; color: #5B555C; margin-top: 5px;">받는사람</label>
						<input type="text" name="addressAddressee"
							id="changeAddressAddressee"
							style="width: 70%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right;">
					</div>
					<div>
						<label for="changeAddressPhone"
							style="margin-right: 1rem; color: #5B555C; margin-top: 5px;">연락처</label>
						<input type="text" name="addressPhone" id="changeAddressPhone"
							style="width: 70%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right;"
							placeholder="ex)&nbsp;010-1234-5678">
					</div>
					<div style="margin-bottom: 0.5rem;">
						<label for="changeAddressZipcode"
							style="margin-right: 1rem; color: #5B555C; margin-top: 5px; margin-right: 3.4rem;">주소</label><br>
						<button type="button" id="changeFindAddress"
							class="hj_btn_findAddress"
							style="height: 2.1rem; width: 28%; font-weight: bold">주소찾기</button>
						<input type="text" name="addressZipcode" id="changeAddressZipcode" style="width: 70%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right; margin-bottom: 0.5rem;" readonly> 
						<input type="text" name="addressBuilding" id="changeAddressBuilding" style="width: 100%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right; margin-bottom: 0.5rem;" readonly> 
						<input type="text" name="addressDetail"	id="changeAddressDetail" style="width: 100%; height: 20%; border: 1px solid #D9D9D9; border-radius: 0.3em; float: right; margin-bottom: 0.5rem;">
					</div>
					<div style="margin-bottom: 2px;">
						<input type="checkbox" id="changeAddressBasic" name="addressBasic"
							style="accent-color: #24E082; color: white; width: 15px; height: 15px; margin-top: 10px;">
						<label for="changeAddressBasic" style="color: #5B555C;">&nbsp;&nbsp;기본 배송지로 저장</label>
					</div>
				</div>
			</form>
			<div class="modal-footer"
				style="border-top-color: white; margin-bottom: -10px;">
				<button type="button" id="updateAddressBtn"
					class="hj_btn_addAddress" style="font-size: 20px;">저장</button>
			</div>
		</div>
	</div>
	<!-- Modal3(배송지 수정) -->


	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
	
	window.onload = () =>{
	// 모달1 ------------------------------------------------------------------------------
		// Get the modal
		var addressListModal = document.getElementById("addressListModal");
		// Get the button that opens the modal
		var addressListbtn = document.getElementById("addressListbtn");
		// Get the <span> element that closes the modal
		var closeSpan1 = document.getElementsByClassName("close")[0];
		
		// When the user clicks the button, open the modal 
		addressListbtn.onclick = function() {
			addressListModal.style.display = "block";
// 			배송지 리스트 출력
			$.ajax({
				url:'${contextPath}/selectAddressList.sh',
				data:{userNumber: 1 
				},
				success:(data)=>{
					const addressListDivs = document.getElementById("addressListDiv");
					addressListDivs.innerHTML = '';
					
					for(const a of data){
						const addressDiv= document.createElement("div");
						addressDiv.innerHTML = '<div style="width:100%; height:auto; background-color: white; border-radius: 0.5em; padding:1rem; border:2px solid #24E082; margin-bottom: 1rem;">'+
							'<div name="ListAddressName" style="font-weight:bold; font-size:1.2rem; margin-bottom:0.2rem;">'+a.addressName+'</div>'+
							'<div style="margin-bottom:0.2rem;"><span name="ListAddressBuilding">'+a.addressBuilding+'</span><span name="ListAddressDetail">'+a.addressDetail+'</span></div>'+
							'<div style="margin-bottom:0.7rem; color: gray;"><span name="ListAddressAddressee">'+a.addressAddressee+'</span>&nbsp;&nbsp;<span name="ListAddressPhone">'+a.addressPhone+'</span></div>'+
							'<input type="hidden" name="listAddressZipcode" value="'+a.addressZipcode+'">'+
							'<input type="hidden" name="listAddressBasic" value="'+a.addressBasic+'">'+
							'<input type="hidden" id="listAddressNum" name="ListAddressNum" value="'+ a.addressNum +'">'+
							'<button type="button" class="hj_btn_deleteAddress">삭제</button>'+
							' <button type="button" class="hj_btn_changeAddress">수정</button><button type="button" class="hj_btn_selectAddress" style="float:right;">선택</button></div>'
							
							addressListDivs.append(addressDiv);
					}
					
//  				배송지 목록 중 배송지 선택 => 주문 페이지
					const selectAddressBtn = document.getElementsByClassName("hj_btn_selectAddress");
					for(selectAddress of selectAddressBtn){
			  			selectAddress.addEventListener('click',function(){
			  				addressListModal.style.display = "none";
			  				const selectedAddressName = $(this).siblings()[0].innerText;
			  				const selectedAddressBuilding = $(this).siblings()[1].innerText;
			  				const selectedAddressAddressee = $(this).siblings()[2].innerText;
			  				document.getElementById("order_addressName").innerHTML = selectedAddressName;
			  				document.getElementById("order_address").innerHTML = selectedAddressBuilding;
			  				document.getElementById("order_addressee").innerHTML = selectedAddressAddressee;
			  			});
				  	}
					
// 					배송지 수정 페이지
					const changeAddressBtn = document.getElementsByClassName("hj_btn_changeAddress");
		        	for(const changeAddress of changeAddressBtn){
		        		changeAddress.addEventListener('click',function(){
		        			console.log(changeAddress);
		        			addressListModal.style.display = "none";
		        			changeAddressModal.style.display = "block";
			        		
							document.getElementById("changeAddressName").value = $(this).siblings()[0].innerHTML;
							document.getElementById("changeAddressAddressee").value= $(this).siblings()[2].children[0].innerText;
							document.getElementById("changeAddressPhone").value= $(this).siblings()[2].children[1].innerText;
							document.getElementById("changeAddressBuilding").value = $(this).siblings()[1].children[0].innerText;
							document.getElementById("changeAddressDetail").value = $(this).siblings()[1].children[1].innerText;
							document.getElementById("changeAddressZipcode").value = $(this).siblings()[3].value;
							document.getElementById("listAddressNum").value = $(this).siblings()[5].value;
		        			console.log($(this).siblings()[5].value);
							if($(this).siblings()[4].value == 'Y'){
								document.getElementById("changeAddressBasic").checked = true;
							};
							if($(this).siblings()[4].value == 'N'){
								document.getElementById("changeAddressBasic").checked = false;
							};
		        		});
		       		}

			       	document.getElementById("updateAddressBtn").addEventListener("click",function(){
						let changeAddressNum = document.getElementById("listAddressNum");
						let changeAddressName = document.getElementById("changeAddressName");
						let changeAddressAddressee = document.getElementById("changeAddressAddressee");
						let changeAddressPhone = document.getElementById("changeAddressPhone");
						let changeAddressZipcode = (Number)(document.getElementById("changeAddressZipcode").value);
						let changeAddressBuilding = document.getElementById("changeAddressBuilding");
						let changeAddressDetail = document.getElementById("changeAddressDetail");
						let changeAddressCheckbox = document.getElementById("changeAddressBasic");
						let changeAddressBasic = null;
						
						if(changeAddressCheckbox.checked){
							changeAddressBasic = 'Y';
						}else{
							changeAddressBasic = 'N';
						}
						
						$.ajax({
							type: 'post',
							url:'${contextPath}/updateAddress.sh',
							data: {addressNum: changeAddressNum.value,
								addressName: changeAddressName.value,
								addressAddressee:changeAddressAddressee.value,
								addressPhone: changeAddressPhone.value,
								addressZipcode: changeAddressZipcode,
								addressBuilding: changeAddressBuilding.value,
								addressDetail: changeAddressDetail.value,
								addressBasic:changeAddressBasic
							},
							success: (data)=>{
								console.log('확인');
								console.log(data);
								changeAddressModal.style.display = "none";
							},
							error:(data)=>{
								console.log(data);
							}
						});
					});
			       	
// 			       	배송지 삭제
					const deleteAddressBtn = document.getElementsByClassName("hj_btn_deleteAddress");
		        	for(const deleteAddress of deleteAddressBtn){
		        		deleteAddress.addEventListener('click',function(){
		        			console.log($(this).siblings());
		        			let deleteAddressNum = $(this).siblings()[5].value;
		        			$.ajax({
		        				url: '${contextPath}/deleteAddress.sh',
		        				data: {addressNum: deleteAddressNum},
		        				success: (data)=>{
		        					console.log("삭제 성공 : " + data);
		        					changeAddressModal.style.display = "none";
		        					addressListbtn.onclick();
		        				},
		        				error:(data)=>{
		        					console.log("삭제 실패 : " + data);
		        				}
		        			});
		        			
		        		});
		        	}
			       	
				},
				error :(data)=>{
					console.log("에러발생 :" + data);
				}
			});	
			
		}
		
		// When the user clicks on <span> (x), close the modal
		closeSpan1.onclick = function() {
			addressListModal.style.display = "none";
		}
		
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == addressListModal) {
			  addressListModal.style.display = "none";
		  }
		  if (event.target == addAdressModal) {
			  addAdressModal.style.display = "none";
		  }
		  if (event.target == changeAddressModal) {
			  changeAddressModal.style.display = "none";
		  }
		}
		
	// 모달2 ------------------------------------------------------------------------------
		var goModal2 = document.getElementById("goModal2");
		var goModal1 = document.getElementById("goModal1");
		
		var addAdressModal = document.getElementById("addAdressModal");
		
		var closeSpan2 = document.getElementsByClassName("close")[1];
		
		goModal2.onclick = function() {
			addressListModal.style.display = "none";
			addAdressModal.style.display = "block";
		}
		
		closeSpan2.onclick = function() {
			addAdressModal.style.display = "none";
		}
		
		goModal1.onclick = function() {
			addAdressModal.style.display = "none";
			addressListModal.style.display = "block";
		}
		
		
	// 모달3 ------------------------------------------------------------------------------
		var goModalBefore= document.getElementById("goModalBefore");
		
		var changeAddressModal = document.getElementById("changeAddressModal");
		
		var closeSpan3 = document.getElementsByClassName("close")[2];
		
		goModalBefore.onclick = function() {
			addressListModal.style.display = "block";
			changeAddressModal.style.display = "none";
		}
		
		closeSpan3.onclick = function() {
			changeAddressModal.style.display = "none";
		}

// 		배송지 추가
		document.getElementById("saveAddress").addEventListener("click",function(){
		console.log("저장 클릭");
// 		document.getElementById("addressForm").submit;
		let addressName = document.getElementById("addressName");
		let addressAddressee = document.getElementById("addressAddressee");
		let addressPhone = document.getElementById("addressPhone");
		let addressZipcode = (Number)(document.getElementById("addressZipcode").value);
		let addressBuilding = document.getElementById("addressBuilding");
		let addressDetail = document.getElementById("addressDetail");
		let addressCheckbox = document.getElementById("addressBasic");
		let addressBasic = null;
				
		if(addressCheckbox.checked){
			addressBasic = 'Y';
		}else{
			addressBasic = 'N';
		}
		
		$.ajax({
			type: 'post',
			url:'${contextPath}/insertAddress.sh',
			data: {addressName: addressName.value,
				addressAddressee:addressAddressee.value,
				addressPhone: addressPhone.value,
				addressZipcode: addressZipcode,
				addressBuilding: addressBuilding.value,
				addressDetail: addressDetail.value,
				addressBasic:addressBasic
			},
			success: (data)=>{
				console.log(data);
				addAdressModal.style.display = "none";
				addressListbtn.onclick();
				document.getElementById("order_addressName").innerHTML = addressName.value;
				document.getElementById("order_address").innerHTML = addressBuilding.value + ", " + addressDetail.value;
				document.getElementById("order_addressee").innerHTML = addressAddressee.value + " "+ addressPhone.value;
				addressName.value = '';
				addressAddressee.value = '';
				addressPhone.value = '';
				document.getElementById("addressZipcode").value = '';
				addressBuilding.value = '';
				addressDetail.value = '';
				addressCheckbox.checked = false;
			},
			error:(data)=>{
				console.log(data);
			}
		});
	});
                   
                   
//      주소찾기API
		let width = 400;
		let height = 500;
		document.getElementById("findAddress").addEventListener("click",function(){
		    new daum.Postcode({
		    	width: width,
		    	height: height,
		        oncomplete: function(data) {
		        	document.getElementById("addressZipcode").value = data.zonecode;
		        	addressBuilding.value = data.address + " "+ data.buildingName;
		
		        }
		    }).open({
		    	left: (window.screen.width / 2) - (width / 2),
		        top: (window.screen.height / 2) - (height / 2)		    	
		    });
		});

//      주소찾기2
		document.getElementById("changeFindAddress").addEventListener("click",function(){
			new daum.Postcode({
				width: width,
		    	height: height,
				oncomplete: function(data) {
				document.getElementById("changeAddressZipcode").value = data.zonecode;
               	changeAddressBuilding.value = data.address + " "+ data.buildingName;
				}
			}).open({
		    	left: (window.screen.width / 2) - (width / 2),
		        top: (window.screen.height / 2) - (height / 2)				
			});
		});
	}
	

    </script>




</body>

</html>