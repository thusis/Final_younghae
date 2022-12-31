<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>나의장바구니</title>
<style>
/* 	설정 style ---------------------------- */
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
	
/* 	버튼 style ---------------------------- */
	
	.deleteSelectCartBtn{
		background-color:white;
		border: none;
		font-size: 1rem;
		float: right;
		color: #828282;
	}
	.deleteSelectCartBtn:hover{
		font-weight: bold;
		cursor: pointer;
	}
	
	.cartSelectAll{
		accent-color: #24E082; 
		color: white; 
		width: 20px; 
		height: 20px; 
		margin-top: 10px;
		cursor: pointer;
	}
	
	.cartSelectEach{
		accent-color: #24E082; 
		color: white; 
		width: 20px; 
		height: 20px; 
		margin-top: 10px;
		cursor: pointer;
	}
	
	label:hover{
		cursor: pointer;
	}
	
	.cartHeader{
		height: 1.8rem; 
		background-color: #DCFFE9; 
		border-top-left-radius: 0.5em; 
		border-top-right-radius: 0.5em;
		padding-top: 5px;
	}
	
	
</style>
	<link rel="stylesheet" href="resources/css/hj_style.css" type="text/css">
</head>
<body>
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
		<ul>
			<li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
			<li>/</li>
			<li><a href="#">장바구니</a></li>
		</ul>
	</div>
	<section class="ftco-section">
		<div class="container">
			<div class="checkout__form mt-5">
				<h3 class="mb-4">장바구니</h3>
				<form action="${contextPath }/payment.sh" method="post">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row" style="margin-botton: 1rem;">
								<div class="col-lg-6">
									<input type="checkbox" id="cartSelectAll" class="cartSelectAll" onclick="selectAll();">
									<label for="cartSelectAll" style="color:#828282; font-weight: bold; font-size: 1.5rem; display: inline;">&nbsp;모두선택</label>
								</div>
								<div class="col-lg-6">
									<button type="button" id="deleteSelectCart" class="deleteSelectCartBtn" style="margin-top: 10px;">선택삭제</button>
								</div>
							</div>
							<hr><br>

							<!-- 장바구니 상품 -->
							<c:forEach items="${cartViewList}" var="c">
							<div class="row" style="margin-bottom: 1.5rem;">
								<div class="col-lg-1" style="margin-right: -1rem;">
									<input type="checkbox" class="cartSelectEach" onclick="selectOne();" value=${c.cartNum }>
									<input type="hidden" class="cartProPrices" name="cartProPrice" value="${ c.supplement.proPrice }" />
								</div>
								<div class="col-lg-11" style="margin-left: -1rem; width: 15rem;">
									<div class="container mb-4 carts" style="border: 1px solid #e5e3e3; border-radius: 0.5em; width: 45rem;">
										<div class="row cartHeader">
											<div class="col-6">
												<span style="font-weight: bold; color: #5B5B5B;">${ c.supplement.proCompany}</span>
											</div>
											<div class="col-6" style="text-align: right; color:#5B5B5B;">
												<span>배송비 <span>2,500원</span>
												</span>
											</div>
										</div>
										<div class="row mt-3 mb-3">
											<div class="col-auto" style="vertical-align : middle;">
												<img style="width: 5rem; margin-top: 10px;" src="${ c.supplement.proImage }">
											</div>
											<div class="col" style="padding-top: 0.8rem;">
												<div style="color: black; font-weight: bold; font-size: 15px; margin-bottom:0.5rem;">${ c.supplement.proName }</div>
												<div style="color: black; font-weight: bold; font-size: 15px; display:inline-block; margin-bottom:0.5rem;">수량 &nbsp;&nbsp;&nbsp;</div>
						                        <div class="product__details__quantity" style="display: inline; margin-right: 2%;">
													<div class="btn-group" role="group" aria-label="Basic example">
														<div class="selectInputDivs">
															<select class="selectDivs" name="quantity" style="border-color: #24E082; border-radius: 0.3em; text-align: center; width:3rem; ">
																<c:forEach begin="1" end="9" var="i">
																	<c:if test="${ c.cartQuantity == i}">
																		<option selected>${ i }</option>
																	</c:if>
																	<c:if test="${ c.cartQuantity != i}">
																		<option>${ i }</option>
																	</c:if>
																</c:forEach>	
																	<option value="10+">10+</option>
																	<c:if test="${ c.cartQuantity > 9}">
																		<option selected>${ c.cartQuantity }</option>
																	</c:if>
															</select>
														</div>
														<input type="hidden" name="proNummm" value="${ c.proNum }">
														<input type="hidden" name="changeQuantity" value="${ c.cartQuantity }">
													</div>
						                        </div><br>
												<div class = "eachPrice" style="font-size: 18px; color: gray; display:inline;">
													${ c.supplement.proPrice }
												</div>
												<div class="eachTotalPrice" style="font-weight: bold; font-size: 20px;float:right; display:inline;">
													${ c.supplement.proPrice }
												</div>
												<div class="cartNumListDivs">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>

							<!-- /주문 상품 -->
						
							
						<div class="col-lg-4 col-md-6" style="position:fixed; top: 20%; left: 65%; overflow:auto;">
							<div class="checkout__order" style="width: 80%">
								<h4>결제 금액</h4>
								<ul>
									<li>총 상품 금액 <span id="cartTotalPrice">68,600원</span>원</li>
									<li>배송비<span id="deliveryPrice">2,500원</span></li>
								</ul>
								<div class="checkout__order__subtotal">
									최종 결제 금액 <span id="payTotalPrice" style="color: #24E082;">71,100 원</span> <br>
									<span style="font-size: 0.6rem;">P적립 예정</span><span
										style="font-size: 0.6rem;">80</span>
								</div>

								<button type="submit" class="site-btn" onclick="goToPay();">
									<span>71,100</span>원 결제하기
								</button>
							</div>
						</div>
					</div>
					</div>
				</form>
			</div>		
		</div>
	</section>
	
	<script>
		const cartSelectAll = document.getElementById("cartSelectAll");
		const cartSelectEach = document.getElementsByClassName("cartSelectEach");
		const cartProPrices = document.getElementsByClassName("cartProPrices");
		const cartTotalPrice = document.getElementById('cartTotalPrice');
		let allTotalPrice = 0;
		var payTotal = document.getElementById('cartTotalPrice');
		var pt = 0;
		var payTotalPrice = document.getElementById('payTotalPrice');
		
		function loadView(){
			var tq = document.getElementsByClassName('selectDivs');
			var ep = document.getElementsByClassName('eachPrice');
			var tp = document.getElementsByClassName('eachTotalPrice');
			
			for(var i = 0; i < tq.length; i++){
				tp[i].innerText = (Number(ep[i].innerText) * Number(tq[i].value)).toLocaleString() ;
				pt += Number(ep[i].innerText) * Number(tq[i].value);
				ep[i].innerText = (Number(ep[i].innerText)).toLocaleString();
			}
			payTotal.innerText = pt.toLocaleString();
		}
		
		function selectAll(){
 			if(cartSelectAll.checked){
				for(const cartEach of cartSelectEach){
					cartEach.checked=true;
				}
				for(const cartProPrice of cartProPrices){
					allTotalPrice += Number(cartProPrice.value);
					cartTotalPrice.innerText = allTotalPrice.toLocaleString();
				}
				
			}else{
				for(const cartEach of cartSelectEach){
					cartEach.checked=false;
					allTotalPrice = 0;
					cartTotalPrice.innerText = allTotalPrice;
				}

			}	
		}
		
		function selectOne(){
			let count = 0;
			for(const cartEach of cartSelectEach){
				if(cartEach.checked){
					count++;
				}
			}
			if(count != cartSelectEach.length){
				cartSelectAll.checked = false;
			}else{
				cartSelectAll.checked = true;
			}
		}
		
		function goToPay(){
			var cartNumDiv = document.getElementsByClassName('cartNumListDivs');
			for(var i = 0; i < cartSelectEach.length; i++){
				if(cartSelectEach[i].checked){
					const cartDiv= document.createElement("div");
					cartDiv.innerHTML = '<input type="hidden" name="cartNumList" value='+cartSelectEach[i].value+'>'+
					cartNumDiv[i].append(cartDiv);
				}else{
					cartNumDiv[i]='';
				}
			}
		}
		

		
		
		window.onload=function(){
			cartSelectAll.checked = true;
			selectAll();
			loadView();

			const selectInputs = document.getElementsByClassName("selectInputDivs");
			for(const selectInput of selectInputs){
				selectInput.addEventListener('change',function(){
					let changeQuantity = 0;
					let changeProNum = ($(this).siblings()[0].value);
					if(Number($(this).children()[0].value) < 10){
						changeQuantity = $(this).children()[0].value;
					}else{
						if($(this).children()[0].value =='10+'){
							const tenInput = document.createElement("div");
							selectInput.innerHTML = '';
							tenInput.innerHTML = '<input type="text" name="cartQuantity"'+ 
												'style="width:3rem; height: 2.1rem;border: 1px solid #24E082; border-radius: 0.3em; text-align: center; font-size: 1rem;" placeholder="입력";>';
							selectInput.append(tenInput);
						}else{
							changeQuantity = $(this).children().children()[0].value;
						}
					}
					$(this).siblings()[1].value = changeQuantity;
					
					if(changeQuantity !=''){
						$.ajax({
							url:'${contextPath}/updateCartQuantity.sh',
							data:{cartQuantity: changeQuantity,
								proNum: changeProNum},
							success:(data)=>{
							}
						})
					}
				})
			}
			
			let totalPrice = 0;
			for(const cartEach of cartSelectEach){
				cartEach.addEventListener('click',function(){
					let totalQuantity = Number($(this).parent().siblings().children().find('input')[1].value);
					console.log(totalQuantity);
					
					if(cartEach.checked){
						totalPrice += (Number($(this).siblings().val()) * totalQuantity);
						cartTotalPrice.innerText = totalPrice.toLocaleString();
					}else{
						totalPrice -= (Number($(this).siblings().val()) * totalQuantity);
						cartTotalPrice.innerText = totalPrice.toLocaleString();
					}
				})
			}
			
			var deliveryPrice = document.getElementById('deliveryPrice');
			console.log(pt);
			if(pt > 50000){
				deliveryPrice.innerText = '0 원';
			}else{
				deliveryPrice.innerText = '2,500 원';
			}
			
		}
    </script>
</body>
</html>