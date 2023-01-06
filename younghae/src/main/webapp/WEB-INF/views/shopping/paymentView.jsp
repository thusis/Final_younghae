<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		padding-left : 5px;
	}
	
	.cartSelectAll{
		accent-color: #24E082; 
		color: white; 
		width: 15px; 
		height: 15px; 
		cursor: pointer;
	}	
	
	.cartSelectEach{
		accent-color: #24E082; 
		color: white; 
		width: 15px; 
		height: 15px; 
		cursor: pointer;
		margin-top: -10px;
	}
</style>
	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	<link rel="stylesheet" href="resources/css/hj_style.css" type="text/css">
	
<!-- 결제 API -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
				<form id="paymentForm" action="${ contextPath }/successPay.sh">
					<input type="hidden" id="orderCode" name="orderCode">
					<input type="hidden" id="orderDate" name="orderDate">
					<input type="hidden" id="orderPayAmount" name="orderPayAmount">
					<input type="hidden" id="orderPaymethod" name="orderPaymethod">
					<input type="hidden" id="orderCouponPrice" name="orderCouponPrice" value="0">
					<input type="hidden" id="orderImpCode" name="orderImpCode">
					<input type="hidden" id="orderStatus" name="orderStatus">
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
								<c:forEach items="${ basicAddress }" var="b">
								 <c:if test="${ b.addressBasic =='Y' }">
								 	<input type="hidden" name="addressNum" value="${ b.addressNum }">
									<div id="order_addressName" style="font-weight: bold; font-size: 1.3rem; margin-bottom:0.3rem;">
										${ b.addressName }
									</div>
									<div id="order_address" style="margin-bottom:0.3rem;"><span>${ b.addressBuilding }</span>, <span>${ b.addressDetail }</span></div>
									<div id="order_addressee" style="color: #828282; margin-bottom:1rem;">
										${ b.addressAddressee }
										<div id="order_addressPhone" style="display: inline;">${ b.addressPhone }</div>
									</div>
										<input type="hidden" id="order_zipcode" value="${ b.addressZipcode }">
								 </c:if>
								</c:forEach>
								<select class="inputBox" name="orderRequest" style="width:50%; padding-left: 5px;">
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
								<input type="hidden" name="userNum" value="${ loginUser.userNum }">
								<input type="hidden" name="userId" value="${ loginUser.userId }">
								<div class="mb-3">
									<label for="orderName" style="margin-right: 3rem">이름</label> 
									<input id ="orderName" class="inputBox" name="orderUserName" value="${ loginUser.userName }">
								</div>
	
	<!-- 							<div class="mb-3"> -->
	<!-- 								<label for="orderEmail" style="margin-right: 2rem">이메일</label> <input -->
	<!-- 									class="inputBox" name="oderEmail">&nbsp;&nbsp;@&nbsp;&nbsp; -->
	<!-- 								<input class="inputBox" name="oderEmailDomain"> -->
	<!-- 							</div> -->
	
								<div style="margin-bottom: 5em;">
									<label for="oderPhone" style="margin-right: 1rem">휴대전화</label> 
									<input type="tel" id="oderPhone" class="inputBox" name="orderPhone" value="${ loginUser.userPhone }">
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

							<c:forEach items="${ infoList }" var="i">
								<div class="container mb-4 supplementDiv"	style="border: 1px solid #e5e3e3; border-radius: 0.5em;">
									<input type="hidden" name="quantityList" value="${ i.cart.cartQuantity }">
									<div class="row" style="height: 2rem; background-color: #DCFFE9;; border-top-left-radius: 0.5em; border-top-right-radius: 0.5em; padding-top:0.3rem;">
										<div class="col-6">
											<span> ${ i.cart.supplement.proCompany } </span>
										</div>
										<div class="col-6" style="text-align: right;">
											<span> 배송비</span> 
											<span>
												<c:if test="${ i.cart.supplement.proPrice * i.cart.cartQuantity >= 50000}">
													0 원
												</c:if>
												<c:if test="${ i.cart.supplement.proPrice * i.cart.cartQuantity < 50000}">
													2,500 원
												</c:if>
											</span>
										</div>
									</div>
									<div class="row mt-3 mb-3">
										<div class="col-auto">
											<img style="width: 5rem;"
												src="${ i.cart.supplement.proImage }">
										</div>
										<div class="col" style="padding-top: 1rem;">
											<div style="color: gray; font-weight: bold; font-size: 15px;">
											${ i.cart.supplement.proName }</div>
											<input type="hidden" name="proName" value="${ i.cart.supplement.proName }">
											<input type="hidden" name="proNumList" value="${ i.cart.supplement.proNum }">
											<div style="font-weight: bold; font-size: 15px;">
												<div style="color: black; font-weight: bold; font-size: 15px;">수량 &nbsp;
													<span>${ i.cart.cartQuantity }</span><span>&nbsp;개</span>
												</div>
												<div class = "eachPrice" style="font-size: 15px; color: gray; display:inline;">
													<fmt:formatNumber value="${ i.cart.supplement.proPrice }" type="number"/>
												</div><span style="font-size: 15px; color: gray;">원</span>
												
												<span style="font-weight: bold; font-size: 20px;float:right;">원</span>
												<div class="eachTotalPrice" style="font-weight: bold; font-size: 20px;float:right; display:inline;">
													<fmt:formatNumber value="${ i.cart.supplement.proPrice * i.cart.cartQuantity }" type="number"/>
												</div>
											</div>
										</div>
									</div>
	
								</div>
							</c:forEach>
							<!-- /주문 상품 -->

							<!-- 쿠폰 -->
							<div class="row" style="margin-top: 5rem;">
								<div class="col-lg-6">
									<p style="font-weight: bold; font-size: 1.5rem; margin-bottom: -10px;">
										쿠폰
									</p>
								</div>
							</div>
							<hr>

							<select id="useCoupon" name="useCoupon" class="inputBox" style="width: 100%; padding-left: 5px;">
								<c:if test="${ empty couponList }">
									<option>사용가능한 쿠폰이 없습니다.</option>
								</c:if>
								<c:if test="${ !empty couponList }">
									<option value="0">쿠폰을 선택해주세요</option>
									<c:forEach items="${ couponList }" var="c">
										<option value=${ c.couNumber }>${ c.couIntro }</option>
									</c:forEach>
								</c:if>
							</select>
							<input type="hidden" name="couNum">
							<!-- /쿠폰 -->
							<!-- 포인트 -->
							<div class="row" style="margin-top: 5rem;">
								<div class="col">
									<p style="font-weight: bold; font-size: 1.5rem; margin-bottom: -10px;">
										포인트
									</p>
								</div>
							</div>
							<hr>
							
							<div class="row">
								<div class="col" style="margin-right: -5rem;">
									<input id="pointUse" class="inputBox" style="width: 80%; padding: 10px;" placeholder="0" >
								</div>
								<div class="col">
									<button type="button" id="allPointUse" class="btn_pointAll">전액사용</button>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div style="margin-top: 0.5rem;">
										사용 가능 포인트 
										<span style="color: #24E082;"><fmt:formatNumber value="${ loginUser.userPoint }" type="number"/>
										</span>P
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6" style="position:fixed; top: 20%; left: 65%; overflow:auto; ">
							<div class="checkout__order" style="height: 37rem;"> 
<!-- 							<div class="checkout__order" style="height: 30rem;">  -->
								<h4 style="margin-top:-5px;">결제 금액</h4>
								<ul style="margin-top:-10px;">
									<li>총 상품 금액 <span name=""><fmt:formatNumber value="${ totalPrice }" type="number"/> 원</span></li>
									<li>배송비
										<c:if test="${ totalPrice > 50000 }">
											<span>0 원</span>
										</c:if>
										<c:if test="${ totalPrice <= 50000 }">
											<span>2,500 원</span>
										</c:if>
									</li>
									<li>쿠폰 사용<span><span>&nbsp;원</span><span id="useCouponPrice">0</span></span></li>
									<li>포인트 사용<span>&nbsp;원</span><span id="totalUsePoint">0</span></li>
								</ul>
								<div class="checkout__order__subtotal" style="height: 5rem;">최종 결제 금액 
									<span><span>&nbsp;원</span><span id="totalPayPrice" style="color: #24E082;">
										<fmt:formatNumber value="${ totalPrice }" type="number"/></span></span><br>
									<span style="font-size: 0.6rem;">P적립 예정&nbsp;</span>
									<span id="savePoint" style="font-size: 0.6rem; color: #24E082; font-weight: 500;">
										<fmt:parseNumber value="${ totalPrice * 0.01}" integerOnly="true"/>
									</span>
								</div>
								<input type="hidden" name="orderTotalPrice" value="${ totalPrice }">
								<input type="hidden" id="orderPayAmount" name="orderPayAmount">
								

								<div>
									<input type="checkbox" id="allAgree" class="cartSelectAll" onclick="selectAll();" required>
									<label for="allAgree" style="color:#828282; font-size: 1rem; display: inline; margin-left:5px; cursor: pointer;">아래 내용에 모두 동의합니다.(필수) </label>
								</div>
								<div class="container">
									<p>본인은 만 14세 이상이며, 주문 내용을 확인하였습니다.</p>
									<div >
										<input type="checkbox" id="eachAgree1" class="cartSelectEach" onclick="selectOne();" required>
										<label for="eachAgree1" style="margin-top: -10px; color:#828282; cursor: pointer;"> 개인정보 수집 이용 및 제 3자 제공 동의(필수)</label>
									</div>										
									<div>
										<input type="checkbox" id="eachAgree2" class="cartSelectEach" onclick="selectOne();" required>
										<label for="eachAgree2" style="margin-top: -10px; color:#828282; cursor: pointer;"> 결제대행 서비스 이용약관 동의(필수) </label>
									</div>
								</div>
								<button type="button" class="site-btn" onclick="requestPay()">
									<span id = "totalPayBtn"><fmt:formatNumber value="${ totalPrice }" type="number"/></span>원 결제하기
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
	<div id="addressListModal" class="hj_modal" style="z-index:999;">
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
	<div id="addAdressModal" class="hj_modal" style="z-index:999;">
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
							placeholder="(-)없이 입력">
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
	<div id="changeAddressModal" class="hj_modal" style="z-index:999;">
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
                   
                   
//		결제 금액 영역
		
// 		할인율
		var couDiscount = 0;
// 		쿠폰 할인 금액
		var useCouponAmount = 0;
// 		사용 포인트
		var usePoint = 0;
// 		쿠폰 & 포인트 사용 후 총 결제 금액
		var totalPayPrice = 0;
// 		사용 포인트
		var usePointAmount = 0;
		var totalPayPriceSpan = document.getElementById('totalPayPrice');
		var useCoupon = document.getElementById("useCoupon");
		var totalPayBtn = document.getElementById("totalPayBtn");
		
		useCoupon.addEventListener('change',function(){
			var couNum = this.value;
			$.ajax({
				url: '${contextPath}/useCoupon.sh',
				data: {couNum : couNum},
				success :(data)=>{
					console.log(data);
					couDiscount = data;
					
					useCouponAmount = Math.round(couDiscount * ${ totalPrice } / 100);
					console.log("useCouponAmount : " + useCouponAmount);
					document.getElementById('useCouponPrice').innerText = useCouponAmount.toLocaleString();
					
					totalPayPrice = ${ totalPrice } - useCouponAmount - usePointAmount
					console.log("최최최종 금액 :" +totalPayPrice);
					totalPayPriceSpan.innerText = totalPayPrice.toLocaleString();
					totalPayBtn.innerText = totalPayPrice.toLocaleString();
				},
				error: (data)=>{
					console.log(data);
				}
			})
		document.getElementById('orderCouponPrice').value= useCouponAmount;

		})
		
		
// 		포인트 전액사용 버튼
		var allPointBtn = document.getElementById('allPointUse');
// 		포인트 인풋
		var pointUse = document.getElementById('pointUse');
// 		보유 포인트
		var userPoint =  ${loginUser.userPoint};
// 		결제 포인트 영역
		var totalUsePoint = document.getElementById('totalUsePoint');

// 		전액사용 버튼 이벤트
		allPointBtn.addEventListener('click', function(){
			pointUse.value = userPoint;
			usePointAmount = pointUse.value;
			totalUsePoint.innerText = usePointAmount.toLocaleString();
			totalPayPrice = ${ totalPrice } - useCouponAmount - usePointAmount
			console.log("최최최종 금액 :" +totalPayPrice);
			totalPayPriceSpan.innerText = totalPayPrice.toLocaleString();
			totalPayBtn.innerText = totalPayPrice.toLocaleString();
		})

		pointUse.addEventListener("keyup", function (e) {
			usePointAmount = 0;
			usePointAmount = this.value;
			totalUsePoint.innerText = usePointAmount.toLocaleString();
			totalPayPrice = ${ totalPrice } - useCouponAmount - usePointAmount
			console.log("최최최종 금액 :" +totalPayPrice);
			totalPayPriceSpan.innerText = totalPayPrice.toLocaleString();
			totalPayBtn.innerText = totalPayPrice.toLocaleString();
		});
		
		
		
		
		
		
		
// 		totalPayPrice = ${ totalPrice } - useCouponAmount - usePointAmount
		
// 			totalUsePoint.innerText = $(this).val();
// 			var numberTotalUse = Number(($(this).val()).replace(/\D/g, ''));
// 			var totalPointPrice = ${ totalPrice } - numberTotalUse; 
// 			console.log(totalPointPrice);
// 			var savePoint2 = Math.round(totalPointPrice / 100);
// 			document.getElementById('totalPayPrice').innerText = totalPointPrice.toLocaleString();
// 			document.getElementById('savePoint').innerText = savePoint2.toLocaleString();

// var savePoint = Math.round(totalPayPrice / 100);
// 			document.getElementById('savePoint').innerText = savePoint.toLocaleString();
		


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
	
//	전체선택 체크박스 (.checked)
	const cartSelectAll = document.getElementById("allAgree");
	const cartSelectEach = document.getElementsByClassName("cartSelectEach");

	function selectAll(){
		for(var i = 0; i < cartSelectEach.length; i++){
			if(cartSelectAll.checked){
				cartSelectEach[i].checked = true;
			}else{
				cartSelectEach[i].checked = false;
			}
		}
	}

	function selectOne(){
		let count = 0;
		for(var i = 0; i < cartSelectEach.length; i++){
			if(cartSelectEach[i].checked){
				count++;
			}
			if(count != cartSelectEach.length){
				cartSelectAll.checked = false;
			}else{
				cartSelectAll.checked = true;
			}
		}
	}
	
//  결제 API ----------------------------------------------------------------------------
	var key = "imp73521438";
	const IMP = window.IMP;
    IMP.init(key); 
    
    const products = document.getElementsByClassName("supplementDiv");
    const productLength = products.length - 1;
    if(productLength == 0){
    	overProduct = '';
    }else{
    	overProduct = ' 외 ' + productLength + '개';
    }
    
    const orderName = document.getElementById('orderName');
    const oderPhone = document.getElementById('oderPhone');
    const orderAddress = document.getElementById('order_address');
    const oderZipcode = document.getElementById('order_zipcode');
    let today = new Date(); 
    
    console.log(orderName.value);
    console.log(oderPhone.value);
    console.log(orderAddress.innerText);
    console.log(oderZipcode.value);
    
    const orderCode = document.getElementById('orderCode');
    const orderDate = document.getElementById('orderDate');
    const orderPayAmount = document.getElementById('orderPayAmount');
    const orderPaymethod = document.getElementById('orderPaymethod');
    const orderImpCode = document.getElementById('orderImpCode');
    const orderStatus = document.getElementById('orderStatus');
    orderDate.value = today.toLocaleString();
    
    function requestPay() {
	    var totalPayPriceSpan2 = Number(document.getElementById('totalPayPrice').innerText.replace(/\D/g, ''));
	    console.log("totalPayPriceSpan2" + totalPayPriceSpan2);
 	      IMP.request_pay({ // param
 	          pg: "html5_inicis",
 	          merchant_uid: 'YOUNG_' + new Date().getTime(),
 	          name: "${ infoList[0].cart.supplement.proName }" + overProduct,
 	          amount: totalPayPriceSpan2,
 	          buyer_email: "${loginUser.email}" ,
 	          buyer_name: orderName.value ,
 	          buyer_tel: oderPhone.value ,
 	          buyer_addr: orderAddress.value,
 	          buyer_postcode: oderZipcode.value
 	      }, function (rsp) { // callback
 	          if (rsp.success) {
				console.log("성공");
				console.log(rsp);
				
				orderCode.value = rsp.merchant_uid;
				orderPayAmount.value = rsp.paid_amount;
				orderPaymethod.value = rsp.pay_method;
				orderImpCode.value = rsp.imp_uid;
				orderStatus.value = '결제완료';

                $('#paymentForm').submit();
				
 	          } else {
				console.log("실패 :" + rsp);
//  	              ...,
 	              // 결제 실패 시 로직,
//  	              ...
 	          }
 	      });
    }

	</script>

</body>

</html>