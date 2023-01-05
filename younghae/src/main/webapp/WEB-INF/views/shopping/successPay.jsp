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

        	<section class="contact spad" style="width:60%; margin: auto; margin-top:-70px;">
	               <div class="section-title" style="padding: 5rem 5rem 5rem 5rem; border:0.5rem solid #24E082; ">
	                   <h2>주문이 완료되었습니다</h2>
<%-- 	                   ${ orderList.Orders.orderCode } --%>
<%-- 	                   <a href="${contextPath}/shoppingMain.sh"> --%>
<!-- 	                   쇼핑을 통해 장바구니를 채워보세요<br> -->
<!-- 	                   <img src="resources/img/logo_pill_white.svg" alt="흰로고"> -->
	                   </a>
	               </div>
			</section>

<!-- 			결제 완료페이지 -->
			
<%-- 			${ orderList } --%> 
		


</body>

</html>