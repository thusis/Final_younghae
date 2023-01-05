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
			<li><a href="${contextPath }/myPage.my" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
			<li>/</li>
			<li><a href="#">장바구니</a></li>
		</ul>
	</div>
	<section class="ftco-section">
		<div class="container">
			<div class="checkout__form mt-5">
				<h3 class="mb-4">장바구니</h3>
				<c:if test="${ empty cartViewList }">
		        	<section class="contact spad" style="width:60%; margin: auto; margin-top:-70px;">
			               <div class="section-title" style="padding: 5rem 5rem 5rem 5rem; border:0.5rem solid #24E082; ">
			                   <h2> 장바구니에 담긴 상품이<br>존재하지 않습니다<br></h2>
			                   <a href="${contextPath}/shoppingMain.sh">
			                   쇼핑을 통해 장바구니를 채워보세요<br>
			                   <img src="resources/img/logo_pill_white.svg" alt="흰로고">
			                   </a>
			               </div>
					</section>
				</c:if>	
				<c:if test="${ !empty cartViewList }">
				<form action="${contextPath }/payment.sh" method="post">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row" style="margin-botton: 1rem;">
								<div class="col-lg-6">
									<input type="checkbox" id="cartSelectAll" class="cartSelectAll" onclick="selectAll();">
									<label for="cartSelectAll" style="color:#828282; font-weight: bold; font-size: 1.5rem; display: inline;">&nbsp;모두선택</label>
								</div>
								<div class="col-lg-6">
									<button type="button" id="deleteSelectCart" class="deleteSelectCartBtn" style="margin-top: 10px;" onclick="deleteCart();" onclick="goToPay();">선택삭제</button>
								</div>
							</div>
							<hr><br>
							
							<!-- 장바구니 상품 -->
								<c:forEach items="${cartViewList}" var="c">
								<div class="row" style="margin-bottom: 1.5rem;">
									<div class="col-lg-1" style="margin-right: -1rem; margin-top:-5px;">
										<input type="checkbox" name="cartSelectEach" class="cartSelectEach" value=${c.proNum } onclick="selectOne();">
									</div>
									<div class="col-lg-11" style="margin-left: -1rem; width: 15rem;">
										<div class="container mb-4 carts" style="border: 1px solid #e5e3e3; border-radius: 0.5em; width: 45rem;">
											<div class="row cartHeader" style="height: 2rem;">
												<div class="col-6">
													<span style="font-weight: bold; color: #5B5B5B;">${ c.supplement.proCompany}</span>
												</div>
												<div class="col-6" style="text-align: right; color:#5B5B5B;">
													<span>배송비 <span class="eachDeliveryPrice">2,500원</span>
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
	<!-- 															<input type="hidden" id="cartQuantity" name="quantity" > -->
																<select class="selectDivs" style="border-color: #24E082; border-radius: 0.3em; text-align: center; width:3rem; ">
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
															<input type="hidden" value="${ c.proNum }">
															<input type="hidden" name="quantity" value="${ c.cartQuantity }">
														</div>
							                        </div><br>
							                        
							                        
													<div class = "eachPrice" style="font-size: 18px; color: gray; display:inline;">
														${ c.supplement.proPrice }
													</div><span style="font-size: 18px; color: gray;">원</span>
													
													<span style="font-weight: bold; font-size: 20px;float:right;">원</span>
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
									<li>총 상품 금액 <span>&nbsp;원</span><span id="cartTotalPrice">0</span></li>
									<li>배송비<span>&nbsp;원</span><span id="deliveryPrice">0</span></li>
								</ul>
								<div class="checkout__order__subtotal" style="height: 5rem;">
									최종 결제 금액
									<span>&nbsp;원</span><span id="payTotalPrice" style="color: #24E082;">0</span>
									<div style="margin-top: 0.5rem;">
										<span style="font-size: 0.6rem;margin-left:0.2rem;">적립 예정</span>
										<span style="font-size: 0.6rem; color:#24E082;">P</span>
										<span id="point" style="font-size: 0.6rem; color:#24E082;">0</span>
									</div>
								</div>

								<button type="submit" class="site-btn" onclick="goToPay();">
									<span id="payPriceBtn">0</span><span>원</span> 결제하기
								</button>
							</div>
						</div>
					</div>
					</div>
				</form>
				</c:if>
			</div>		
		</div>
	</section>
	
	<script>
		
// 		전체선택 체크박스 (.checked)
		const cartSelectAll = document.getElementById("cartSelectAll");
// 		개별 선택 체크박스 배열 (.checked value는 카트넘)
		const cartSelectEach = document.getElementsByClassName("cartSelectEach");

// 		총 상품금액
		const cartTotalPrice = document.getElementById('cartTotalPrice');
// 		최종 배송비		
		var cartDeliveryPrice = document.getElementById('deliveryPrice');
// 		적립 포인트
		var pointSpan = document.getElementById('point');
// 		최종 결제 금액
		var payTotalPrice = document.getElementById('payTotalPrice');
		
// 		개별 배송비 배열
		var ed = document.getElementsByClassName('eachDeliveryPrice');
// 		수량 배열 (.value 값)
		var tq = document.getElementsByClassName('selectDivs');
// 		개별 가격 배열 (.innerText 값)
		var ep = document.getElementsByClassName('eachPrice');
		
// 		개별 토탈 가격 (.innerText 값)
		var tp = document.getElementsByClassName('eachTotalPrice');
// 		버튼 가격
		var payPriceBtn = document.getElementById('payPriceBtn');
	
		function selectAll(){
// 			개별상품 가격
			var eachPrice = [];
// 			개별 상품 총액 배열
			var eachTotalPrice = [];
// 			상품 총액 변수 
			var allTotalPrice = 0;
// 			배송비 변수
			var deliveryPrice = 0;
			var eachDeliveryPrice = [];
// 			포인트 변수
			var point = 0;
// 			최종결제 금액 변수
			var payTotal = 0;
			
			for(var i = 0; i < tq.length; i++){
// 				개별 가격 출력
				eachPrice[i] = Number((ep[i].innerText).replace(/\D/g, ''));
				ep[i].innerText = eachPrice[i].toLocaleString();
	
// 				개별 가격 총합 계산
				eachTotalPrice[i] = Number(tq[i].value) * Number((ep[i].innerText).replace(/\D/g, ''));
				tp[i].innerText = eachTotalPrice[i].toLocaleString(); 
				
// 				개별 배송비 계산
	 			eachDeliveryPrice[i] = Number((ed[i].innerText).replace(/\D/g, ''));
				if(eachTotalPrice[i] > 50000){
					eachDeliveryPrice[i] = 0;
				}else{
					eachDeliveryPrice[i] = 2500;
				}
				ed[i].innerText = (Number(eachDeliveryPrice[i])).toLocaleString();
				
// 				전체선택 YN-------------------------------------------
				if(cartSelectAll.checked){
					cartSelectEach[i].checked = true;
					
// 		 			가격 토탈 계산					
					allTotalPrice += eachTotalPrice[i];
					
// 		 			배송비 설정
					if(allTotalPrice > 50000){
						deliveryPrice = 0;
					}else{
						deliveryPrice = 2500;
					}
							
// 					포인트 설정
					point = Math.round(allTotalPrice * 0.01);
	
// 					최종 결제금액
					payTotal = allTotalPrice + deliveryPrice;
						
				}else{
					cartSelectEach[i].checked = false;
					allTotalPrice = 0;
					deliveryPrice = 0;
					point = 0;
					payTotal = 0;
				}
	
				cartDeliveryPrice.innerText = (Number(deliveryPrice)).toLocaleString();
				cartTotalPrice.innerText = (Number(allTotalPrice)).toLocaleString();
				pointSpan.innerText = (Number(point)).toLocaleString();
				payTotalPrice.innerText = (Number(payTotal)).toLocaleString();
				payPriceBtn.innerText = (Number(payTotal)).toLocaleString();
			}
		}
	
	function selectOne(){
		var eachPrice = [];
		var eachTotalPrice = [];
		var allTotalPrice = 0;
		var deliveryPrice = 0;
		var eachDeliveryPrice = [];
		var point = 0;
		var payTotal = 0;

		let count = 0;
		for(var i = 0; i < cartSelectEach.length; i++){
			eachPrice[i] = Number((ep[i].innerText).replace(/\D/g, ''));
			ep[i].innerText = eachPrice[i].toLocaleString();

			eachTotalPrice[i] = Number(tq[i].value) * Number((ep[i].innerText).replace(/\D/g, ''));
			tp[i].innerText = eachTotalPrice[i].toLocaleString(); 
			
 			eachDeliveryPrice[i] = Number((ed[i].innerText).replace(/\D/g, ''));
			if(eachTotalPrice[i] > 50000){
				eachDeliveryPrice[i] = 0;
			}else{
				eachDeliveryPrice[i] = 2500;
			}
			ed[i].innerText = (Number(eachDeliveryPrice[i])).toLocaleString();
			
			if(cartSelectEach[i].checked){
				count++;
				allTotalPrice += eachTotalPrice[i];
				
				if(allTotalPrice > 50000){
					deliveryPrice = 0;
				}else{
					deliveryPrice = 2500;
				}
						
				point = Math.round(allTotalPrice * 0.01);

				payTotal = allTotalPrice + deliveryPrice;
			}
		}
		
		cartDeliveryPrice.innerText = (Number(deliveryPrice)).toLocaleString();
		cartTotalPrice.innerText = (Number(allTotalPrice)).toLocaleString();
		pointSpan.innerText = (Number(point)).toLocaleString();
		payTotalPrice.innerText = (Number(payTotal)).toLocaleString();
		payPriceBtn.innerText = (Number(payTotal)).toLocaleString();
		
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
					cartDiv.innerHTML = '<input type="hidden" name="proNumList" value='+cartSelectEach[i].value+'>'+
					cartNumDiv[i].append(cartDiv);
				}else{
					cartNumDiv[i]='';
				}
			}
		}
		
	window.onload=function(){
		cartSelectAll.checked = true;
		selectAll();

		const selectInputs = document.getElementsByClassName("selectInputDivs");
		for(const selectInput of selectInputs){
			selectInput.addEventListener('change',function(){
				let quantity = 0;
				let changeProNum = ($(this).siblings()[0].value);
				if(Number($(this).children()[0].value) < 10){
					quantity = $(this).children()[0].value;
				}else{
					if($(this).children()[0].value =='10+'){
						const tenInput = document.createElement("div");
						selectInput.innerHTML = '';
						tenInput.innerHTML = '<input type="text" name="cartQuantity"'+ 
											'style="width:3rem; height: 2.1rem;border: 1px solid #24E082; border-radius: 0.3em; text-align: center; font-size: 1rem;" placeholder="입력";>';
						selectInput.append(tenInput);
					}else{
						quantity = $(this).children().children()[0].value;
					}
				}
				$(this).siblings()[1].value = quantity;
				
				if(quantity !=''){
					$.ajax({
						url:'${contextPath}/updateCartQuantity.sh',
						data:{cartQuantity: quantity,
							proNum: changeProNum},
						success:(data)=>{
							selectOne();
						}
					})
				}
			})
		}
		
		document.getElementById('deleteSelectCart').addEventListener('click',function(){			
            var deleteSelectList = [];
            
            $('input[name="cartSelectEach"]:checked').each(function(i){//체크된 리스트 저장
            	deleteSelectList.push($(this).val());
            });
			console.log(deleteSelectList);
			
			$.ajax({
				url : '${contextPath}/deleteSelectCart.sh',
				data: {"deleteSelectList" : deleteSelectList},
				success : (data)=>{
					console.log(data);
					location.reload();
				}
			})
		})
	}
    </script>
</body>
</html>