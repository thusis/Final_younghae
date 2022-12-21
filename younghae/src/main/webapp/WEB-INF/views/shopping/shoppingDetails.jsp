<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Shopping | Details</title>

    <style>
            /*  구글 폰트
    font-family: 'Hahmlet', serif;
    font-family: 'IBM Plex Sans KR', sans-serif;
    font-family: 'Nanum Gothic', sans-serif; 
    */

    @import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@100;200;300;400;500;600;700&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic:wght@400;700;800&display=swap');

        .yh_header__menu {
            padding: 12px 0;
        }
        
        .yh_header__menu ul li {
            color:white;
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
        #bn_navbar-search-input{
            border:0;
            background-color: rgb(242, 242, 242);
            border-radius: 0px 20px 20px 0px ;
        }

        .bn_navbar-select-input{
            border:0;
            background-color: rgb(242, 242, 242);
            cursor : pointer;
            border-radius: 20px 0px 0px 20px;
            padding-left: 10px;
            
        }

        .bn_navbar-select-input option:checked,
        .bn_navbar-select-input option:hover {
            color:FD9F28;
        }

        .bn_btn_search{
            background-color : transparent;
            border : none;
            cursor : pointer;
            position : absolute;
            right : 5px;
            top : 50%;
            transform : translatey(-50%);
        }

        .btn btn-secondary trend{
            background-color: #24E082; 
            border: none; 
            border-radius: 30px; 
            height: 25px; 
            width: auto; 
            font-weight: 600; 
            font-size: 10px;
        }

        .product__item{
            width: 200px;
        }

        .btn_trend{
            background-color: #24E082; 
            border: none; 
            border-radius: 30px; 
            height: 28px; 
            width: auto; 
            font-weight: 600; 
            font-size: 12px;
            color: white;
        }

        .cate_img{
            width: 50px;
            height: 50px;
        }

        .cate_icon{
            width: 60px; 
            height: 60px; 
            margin-bottom: 20%;
        }

        li>a{
            text-decoration: none;
            color: rgb(37, 36, 36);
            font-size: 14px;
        }

        li>a:hover{
            font-weight: bold;
            color: black;
            text-decoration: underline;
        }

        .btn_cart{
            border-color: rgb(0, 123, 255);
            color: rgb(0, 123, 255);
            font-size: 10px;
            width: 90px;
            height: 30px;
        }

        .btn_comment{
            border-color: rgb(0, 123, 255);
            color: rgb(0, 123, 255);
            font-size: 11px;
            width: 65px; 
            height: 30px;
        }

        .star{
            color: rgb(242, 232, 46);
        }

        .btn_buy{
            background-color: #24E082; 
            border: none; 
            border-radius: 10px; 
            height: 60px;
            width: 48%;
            font-weight: 600; 
            font-size: 24px;
            color: white;            
        }

        .btn_cart{
            background-color: white; 
            border-color: #24E082; 
            border-radius: 10px; 
            height: 60px;
            width: 48%; 
            font-weight: 600; 
            font-size: 24px;
            color: #24E082;                       
        }


        .btn_toBuy{
            background-color: #24E082; 
            border: none; 
            border-radius: 0.3em; 
            height: 2.5rem;
            width: 13rem;
            font-weight: bold; 
            font-size: 20px;
            color: white;            
        }

        .btn_toCart{
            background-color: white; 
            border-color: #24E082; 
            border-radius: 0.3em; 
            height: 2.5rem;
            width: 13rem;
            font-weight: bold; 
            font-size: 20px;
            color: #24E082;                       
        }

        .product_info{
            width: 100%;
            height: 80%;
            background: #DCFFE9;
        }

        .product_info_each{
            width: auto;
            height: 50px;
            border-radius: 1em;
            background-color: #93FFCE;
            text-align: center;
            font-size: 20px;
            color: #2f2f32;
            cursor: default;
            border: none;
            margin-right: 20px;
            padding : 10px;
        }

        /* component */

        .rating-count{
            margin-left: 2%;
            margin-right: 2%;
            display: inline-block;
            background-color: #24E082;
            width: 300px;
            height: 15px;
            border-radius: 1em;
        }

        .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 50px; /* Location of the box */
        left: 50%;
        top: 50%;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        transform: translate(-50%, -50%);
        }

        /* Modal Content */
        .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        }

        /* The Close Button */
        .close {
        color: #aaaaaa;
        /* float: right; */
        text-align: end;
        font-size: 28px;
        font-weight: bold;
        }

        .close:hover,
        .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
        }

        .compareTitle{
            width: 100%;
            /* height: 50px; */
            background: #DCFFE9;
            text-align: center;
            padding: 0.3rem;
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 2rem;

        }

        .cart_product{
            width: 11rem;
            height: 13rem;
            border: 1px solid #24E082;
            border-radius: 0.5em;
            margin: 2rem;
        }

        .cart_item_img{
            width: 7.5rem;
            height: 6rem;
            margin-top: 0.5rem;
        }

        /*목차*/
        .bn_index ul li{
            list-style: none;
            position: relative;
            display: inline-block;
        }
        
        .bn_index a {
            color: black;
            
        }
        
        .bn_index li:last-child a{
            font-weight: 800;
            color : #FD9F28;
        }

        .table th:first-child{
            background: #DCFFE9;
        }

    </style>   


</head>

<body>
	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	<!--네비 상세-->
	<div class="container">
		<div class="bn_index mt-5">
			<ul>
				<li><a href="#">쇼핑</a></li>
				<li><b>/</b></li>
				<li><a href="#">영양제 상세보기</a></li>
			</ul>
		</div>
		<!--/네비 상세-->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <!-- 상품이미지 -->
                <div class="col-lg-6 col-md-6" style="margin-bottom: 50px;">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src=${ supplementDetail.proImage } alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl=${ supplementDetail.proImage }
                                src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01841/v/26.jpg" alt="">
                            <img data-imgbigurl="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg"
                                src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg" alt="">
                            <img data-imgbigurl="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nor/nor03770/l/43.jpg"
                                src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nor/nor03770/l/43.jpg" alt="">
                            <img data-imgbigurl="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/car/car01733/v/16.jpg""
                                src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/car/car01733/v/16.jpg" alt="">
                        </div>
                    </div>
                </div>
                <!-- /상품이미지 -->
                <div class="col-lg-6 col-md-6" >
                    <div class="product__details__text">
                        <h5 style="color: gray;">${ supplementDetail.proCompany }</h5>
                        <h3 style="display: inline;">${ supplementDetail.proName }</h3>
                        <div style="display: inline; float: right; font-size: 150%;">
                            <i class="fa-regular fa-heart"></i>&nbsp;
                            <i class="bi bi-share"></i>
                        </div><br><br>
                        <div class="product__details__rating" style="display: inline; font-size: 150%;">
                            <i class="fa-solid fa-star star"></i>&nbsp;&nbsp;${ supplementDetail.proGrade }
                        </div>
                        <div class="product__details" style="display: inline; font-size: 100%; float: right; margin-top: 2.5%;">
                            <span style="color: orange; text-decoration: underline;">153개의 리뷰&nbsp;&nbsp;<i class="fa-regular fa-square-plus"></i></span>&nbsp;&nbsp;&nbsp;
                            <span id="compareproduct" style="color: rgb(242, 67, 230); text-decoration: underline;">상품 비교&nbsp;&nbsp;<i class="fa-regular fa-square-plus"></i></span>
                        </div>

                        <div style="font-size: 250%; font-weight: 600;">${ supplementDetail.formatPrice }원</div>
                        <hr>
                        <h6 style="padding: 3%;">흡수율 높은 글루콘산 아연과 항산화 비타민C의 황금배합에 무설탕 천연 포도맛을 더했습니다.</h6>
                        <hr>

                        <table style="width: 150%;">
                            <tr>
                                <th>혜택</th>
                                <td>${ supplementDetail.proPrice }적립</td>
                            </tr>
                            <tr>
                                <th>배송</th>
                                <td>2,500원</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>(50,000원 이상 구매 시 무료배송)</td>
                            </tr>
                        </table>
                        <hr>

                        <h5 style="font-weight: bold; color: black;">${ supplementDetail.proName }</h5><br>


                        <h6 style="display: inline-block; font-weight: bold; color: black; margin-top: 2%;">수량</h6>
                        <div class="product__details__quantity" style="display: inline; float: right; margin-right: 10%; " >
                            <div class="quantity">
                                <div class="pro-qty"  style="width: 150%; border-radius: 5em">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div><br><br>

                        <hr>
                        
                        <h5 style="font-weight: bold; display: inline;">주문 금액</h5>
                        <h5 style="font-weight: bold; display: inline; float: right;">33,000원</h5><br><br><br>
                        
                        <button type="button" class="btn btn_cart" id="btn_cart" style="margin-right: 2%;">장바구니</button>
                        <button type="button" class="btn btn_buy">바로구매</button> &nbsp;&nbsp;&nbsp;
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" href="#tabs-1" 
                                    aria-selected="true">영양제효과</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#tabs-2" 
                                    aria-selected="false">상품 정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#tabs-3" 
                                    aria-selected="false">리뷰<span>(1)</span></a>
                            </li>
                        </ul><br><br>
                        
                        <div class="tab-content">
                            <!-- 상품정보 탭 -->
                            <div class="" id="tabs-1" role="tabpanel">
                                <div class="col-lg-12" style="margin-bottom: 5%;">
                                    <div class="col" style="color: #24E082; font-weight: bold; font-size: 30px; display: inline; margin-bottom: 50px;">영양제 효과</div>
                                    <div class="product_info" style=" border-radius: 1em; padding: 5%;">
                                        <div style="font-size: 20px; font-weight: bold; color: #5B555C; margin-bottom: 5px;">주요기능</div>
                                        <button class="product_info_each">뼈와 치아 형성</button>
                                        <button class="product_info_each">신경과 근육 유지 기능</button>
                                        <button class="product_info_each">면역 기능</button>
                                    </div>
                                </div>
                            </div>
                            <!-- /상품정보 탭 -->

                            <!-- 상품상세사진 탭 -->
                            <div class="" id="tabs-2" role="tabpanel" style="margin-bottom: 10%;">
                                <div class="col-lg-12" style="margin-bottom: 5%;">
                                    <div class="col" style="color: #24E082; font-weight: bold; font-size: 30px; display: inline; margin-bottom: 50px;">상품 정보</div><br><br>
                                    <div style="text-align: center;">
                                        <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01665/l/11.jpg" style="width: 500px; margin: auto; display: block; margin-bottom: 10%;">
                                        <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01665/l/17.jpg" style="width: 500px; margin: auto; display: block;">
                                    </div>
                                </div>
                            </div>
                            <!-- /상품상세사진 탭 -->

                            <!-- 리뷰 -->
                            <div class="" id="tabs-3" role="tabpanel">
                                <div style="color: #24E082; font-weight: bold; font-size: 30px; display: inline; margin-bottom: 50px;">리뷰&nbsp;<span>153</span></div>
                                <div style="color: #FD9F28; font-weight: bold; font-size: 20px; display: inline; float: right; margin-right: 35px;">리뷰작성</div><br><br>

                                <div class="col-lg-12" style="margin-bottom: 10%; text-align: center; margin-left: -1.5%;">
                                    <div class="product_info" style=" border-radius: 1em; padding: 5%; margin-bottom: 5%;">
                                        <table style="text-align: center; width: 100%;">
                                            <tr>
                                                <td style="font-size: 30px;">
                                                    <i class="fa-solid fa-star star"><i class="fa-solid fa-star star"><i class="fa-solid fa-star star"><i class="fa-solid fa-star star"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32
                                                </td>
                                                <td style="font-size: 20px;">
                                                    <div>
                                                        <div style="display: inline;">5점</div><div class="rating-count"></div><div style="display: inline;">15</div><br>
                                                        <div style="display: inline;">4점</div><div class="rating-count"></div><div style="display: inline;">18</div><br>
                                                        <div style="display: inline;">3점</div><div class="rating-count"></div><div style="display: inline;">10</div><br>
                                                        <div style="display: inline;">2점</div><div class="rating-count"></div><div style="display: inline;">10</div><br>
                                                        <div style="display: inline;">1점</div><div class="rating-count"></div><div style="display: inline;">11</div><br>
                                                    </div>

                                                </td>
                                            </tr>
                                        </table>
                                    </div> 


                                    <div class="product__details__quantity" style="border: 2px solid #24E082; border-radius: 10px; width: 100%;  margin-bottom: 3%; height: 300px; padding: 2%;">
                                        <div name="reviewDetail">
                                            <div name="reviewImg" style="float: left; padding-right: -20%;">
                                                <i class="bi bi-person-circle" style="font-size: 350%; color: #24E082;"></i>
                                            </div>
                                            <div name="reviewNickName" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="font-weight: 600;">학원이너무좋다</p>
                                            </div>
                                            <div class="product__details__rating" style="float: left; padding-top: 3.5%; padding-left: 20%;">
                                                <i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">4.8</p>
                                            </div>
                                            <div class="product__details__rating" style="float: left; padding-top: 3.2%; padding-left: 5%;">
                                                <i class="bi bi-hand-thumbs-up-fill" style="color: rgb(0, 0, 0); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">10</p>
                                            </div>
                                            <div name="reviewImg"  style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
                                                <img src="https://s3-eu-west-1.amazonaws.com/ugc-images.images-iherb.com/ugc/20221119/7377cf67-da5e-4008-b194-67aaafdcf321/l.jpeg" class=".img-fluid" style="margin: 5%;">
                                            </div>
                                            <div name="reviewContent" class="text-left" style="padding-top: 9%;">
                                                안 좋은 콜레스테롤을 낮춰 혈관 건강, 심장 질환, 눈 건강에도 좋다고 하여 구매하여 온 가족이 먹고 있어요, 품질 좋은 생선 오일을 식품으로 채우려면 비용도 많이 들고 한계가 있는데 저렴하게 효능 좋은 제품 먹을 수 있어 좋습니다. 생물학 박사님이 필수로 챙겨 먹는 영양제 중 하나가 오메가3 라고 추천해 주셔서 믿고 먹고 있습니다. 다 먹으면 재구매 할 거에요
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product__details__quantity" style="border: 2px solid #24E082; border-radius: 10px; width: 100%;  margin-bottom: 3%; height: 300px; padding: 2%;">
                                        <div name="reviewDetail">
                                            <div name="reviewImg" style="float: left; padding-right: -20%;">
                                                <i class="bi bi-person-circle" style="font-size: 350%; color: #24E082;"></i>
                                            </div>
                                            <div name="reviewNickName" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="font-weight: 600;">코딩너무좋다</p>
                                            </div>
                                            <div class="product__details__rating" style="float: left; padding-top: 3.5%; padding-left: 20%;">
                                                <i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">4.8</p>
                                            </div>
                                            <div class="product__details__rating" style="float: left; padding-top: 3.2%; padding-left: 5%;">
                                                <i class="bi bi-hand-thumbs-up-fill" style="color: rgb(0, 0, 0); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">10</p>
                                            </div>
                                            <div name="reviewImg"  style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
                                                <img src="https://s3-eu-west-1.amazonaws.com/ugc-images.images-iherb.com/ugc/20220929/f7b13f35-8481-4662-996c-ff1ccef87f67/l.jpeg" class=".img-fluid" style="margin: 5%;">
                                            </div>
                                            <div name="reviewContent" class="text-left" style="padding-top: 9%;">
                                                자주 먹던 오메가3가 품절이라 대안으로 구매했습니다. 성분이 나쁘지 않고 믿을만한 회사라 주문했습니다. 개별 포장이면 더 좋겠지만, 직구 제품은 대부분 이런 형태라 아쉽긴 합니다. 하지만 가성비 생각하면 아주 최고!
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product__details__quantity" style="border: 2px solid #24E082; border-radius: 10px; width: 100%;  margin-bottom: 3%; height: 300px; padding: 2%;">
                                        <div name="reviewDetail">
                                            <div name="reviewImg" style="float: left; padding-right: -20%;">
                                                <i class="bi bi-person-circle" style="font-size: 350%; color: #24E082;"></i>
                                            </div>
                                            <div name="reviewNickName" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="font-weight: 600;">코딩천재깡혜찐</p>
                                            </div>
                                            <div class="product__details__rating" style="float: left; padding-top: 3.5%; padding-left: 20%;">
                                                <i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">4.8</p>
                                            </div>
                                            <div class="product__details__rating" style="float: left; padding-top: 3.2%; padding-left: 5%;">
                                                <i class="bi bi-hand-thumbs-up-fill" style="color: rgb(0, 0, 0); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">10</p>
                                            </div>
                                            <div name="reviewImg"  style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
                                                <img src="https://s3-eu-west-1.amazonaws.com/ugc-images.images-iherb.com/ugc/20220926/c9eeb673-082a-43cd-a6d5-a46b99c0c9aa/l.jpeg" class=".img-fluid" style="margin: 5%;">
                                            </div>
                                            <div name="reviewContent" class="text-left" style="padding-top: 9%;">
                                                2021.8.1 (일) 주문. 8.5 (목) 배송받음. 180정 이라서 오늘까지 다 먹었습니다. 오메가-3 는 꼭 챙겨 먹기에 아주 잘 먹었습니다. 비린내는 나지 않고 알약 사이즈가 커서 목 넘김이 쫌 불편하긴 합니다. 잘못 먹으면 목에 걸리기도 합니다. 꾸준히 영양제 잘 챙겨 먹겠습니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 리뷰 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- 상품비교 모달창 -->
    <div id="myModal" class="modal" >
        <!-- Modal content -->
        <div class="modal-content" style="width: 1000px; height: 750px;">
            <p class="close">&times;</p>

            <div class="compareTitle">
                현재 보고계신 상품과 1:1 비교
            </div>
            <table class="table" style="text-align: center; vertical-align: middle; width: 100%; height: 90%">
                <thead>
                  <tr class="text-teal-100">
                    <th scope="col" class="col-lg-2"></th>
                    <th scope="col" class="col-lg-3">현재 보는 상품</th>
                    <th scope="col" class="col-lg-3">비교 상품</th>
                  </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>이미지</th>
                        <td><img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01841/v/26.jpg" style="width: 150px; height: 150px;">
                            <br><h6 style="color: gray;">나우푸드</h6><h5>울트라 오메가3</h5>
                        </td>
                        <td><img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg" style="width: 150px; height: 150px;">
                            <br><h6 style="color: gray;">캘리포니아골드뉴트리션</h6><h5>골드C 비타민C 1000mg</h5>
                        </td>
                    </tr>
                    <tr>
                        <th>원재료 및 함량</th>
                        <td>정제어유[정제어유(멸치,정어리) 99.8%, d-토코페롤(혼합형) 0.2%, 독일], (캡슐기제)풀루란, d-소비톨, 자일리톨 글리세린, 홍화황색소, 카라기난, 덱스트로스</td>
                        <td>정제어유[정제어유(멸치,정어리) 99.8%, d-소비톨, 자일리톨 글리세린, 홍화황색소, 카라기난, 덱스트로스</td>
                    </tr>
                    <tr>
                        <th>기능</th>
                        <td>혈행개선, 골다공증 예방, 눈 건강, 세포 보호</td>
                        <td>혈행개선, 골다공증 예방, 눈 건강</td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td>33,000원</td>
                        <td>35,000원</td>
                    </tr>
                    <tr>
                        <th>제품용량</th>
                        <td>1개월분</td>
                        <td>2개월분</td>
                    </tr>
                    <tr>
                        <th>1일 총 섭취량</th>
                        <td>1캡슐</td>
                        <td>2캡슐</td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>
    <!-- /상품비교 모달창 -->


    <!-- 장바구니 모달창 -->
    <div id="cartModal" class="modal" >
        <!-- Modal content -->
        <div class="modal-content" style="width: 1000px; height: 720px; overflow: auto;">
            <p class="close">&times;</p>

            <div class="compareTitle">
                장바구니 목록
            </div>

            <div style="font-size: 1.3rem;">총<span style="color: #24E082;">2</span>개</div>
            <div class="container">
                <div class="row" style="margin-bottom: -5%;">
                    <div class="col cart_product" style="text-align: center;">
                        <img class="cart_item_img" src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nor/nor03770/l/43.jpg">
                        <div class="product__item__text" style="text-align: left;">
                            <div style="color: gray; font-size: 13px;">나우푸드</div>
                            <div style="font-weight: bold; font-size: 15px;">울트라 오메가3</div>
                            <div style="font-weight: bold; font-size: 15px;">35,600</div>
                            <div style="color: gray; font-size: 14px; font-weight: bold;">수량 : <span style="color: gray; font-size: 14px; font-weight: bold;">3개</span></div>
                        </div>
                    </div>
                    <div class="col cart_product" style="text-align: center;">
                        <img class="cart_item_img" src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg"">
                        <div class="product__item__text" style="text-align: left;">
                            <div style="color: gray; font-size: 13px;">나우푸드</div>
                            <div style="font-weight: bold; font-size: 15px;">울트라 오메가3</div>
                            <div style="font-weight: bold; font-size: 15px;">35,600</div>
                            <div style="color: gray; font-size: 14px; font-weight: bold;">수량 : <span style="color: gray; font-size: 14px; font-weight: bold;">3개</span></div>
                        </div>
                    </div>
                    <div class="col cart_product" style="text-align: center;">
                        <img class="cart_item_img" src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/blb/blb01012/v/29.jpg">
                        <div class="product__item__text" style="text-align: left;">
                            <div style="color: gray; font-size: 13px;">나우푸드</div>
                            <div style="font-weight: bold; font-size: 15px;">울트라 오메가3</div>
                            <div style="font-weight: bold; font-size: 15px;">35,600</div>
                            <div style="color: gray; font-size: 14px; font-weight: bold;">수량 : <span style="color: gray; font-size: 14px; font-weight: bold;">3개</span></div>
                        </div>
                    </div>
                    <div class="col cart_product" style="text-align: center;">
                        <img class="cart_item_img" src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01841/v/26.jpg">
                        <div class="product__item__text" style="text-align: left;">
                            <div style="color: gray; font-size: 13px;">나우푸드</div>
                            <div style="font-weight: bold; font-size: 15px;">울트라 오메가3</div>
                            <div style="font-weight: bold; font-size: 15px;">35,600</div>
                            <div style="color: gray; font-size: 14px; font-weight: bold;">수량 : <span style="color: gray; font-size: 14px; font-weight: bold;">3개</span></div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom: -2%;">
                    <div class="col cart_product" style="text-align: center;">
                        <img class="cart_item_img" src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nor/nor03770/l/43.jpg">
                        <div class="product__item__text" style="text-align: left;">
                            <div style="color: gray; font-size: 13px;">나우푸드</div>
                            <div style="font-weight: bold; font-size: 15px;">울트라 오메가3</div>
                            <div style="font-weight: bold; font-size: 15px;">35,600</div>
                            <div style="color: gray; font-size: 14px; font-weight: bold;">수량 : <span style="color: gray; font-size: 14px; font-weight: bold;">3개</span></div>
                        </div>
                    </div>
                    <div class="col cart_product" style="text-align: center;">
                        <img class="cart_item_img" src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg"">
                        <div class="product__item__text" style="text-align: left;">
                            <div style="color: gray; font-size: 13px;">나우푸드</div>
                            <div style="font-weight: bold; font-size: 15px;">울트라 오메가3</div>
                            <div style="font-weight: bold; font-size: 15px;">35,600</div>
                            <div style="color: gray; font-size: 14px; font-weight: bold;">수량 : <span style="color: gray; font-size: 14px; font-weight: bold;">3개</span></div>
                        </div>
                    </div>
                    <div class="col" style="margin:2rem;"></div>
                    <div class="col" style="margin:2rem;"></div>
                </div>
                
                <hr>
                <div style="text-align: center;">
                    <button type="button" class="btn btn_toCart" id="btn_toCart" style="margin-right: 2%;">쇼핑 계속하기</button>
                    <button type="button" class="btn btn_toBuy">장바구니 가기</button>
                </div>
            </div>

        </div>
    </div>
    <!-- /장바구니 모달창 -->
</div>

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
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    // $('#exampleModalbtn').click(function(){
    //     $('#exampleModal').modal();
    // })

<script>
    // Get the modal
    var modal1 = document.getElementById("myModal");
    
    // Get the button that opens the modal
    var btn1 = document.getElementById("compareproduct");
    
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    
    // When the user clicks the button, open the modal 
    btn1.onclick = function() {
      modal1.style.display = "block";
    }
    
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal1.style.display = "none";
    }
    
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal1.style.display = "none";
      }
    }
    </script>


<script>
    // Get the modal
    var modal = document.getElementById("cartModal");
    
    // Get the button that opens the modal
    var btn = document.getElementById("btn_cart");
    
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[1];
    
    var btn_toCart = document.getElementById("btn_toCart");

    // When the user clicks the button, open the modal 
    btn.onclick = function() {
      modal.style.display = "block";
    }
    
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }

    btn_toCart.onclick = function() {
      modal.style.display = "none";
    }
    
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
    </script>

    <script src="https://kit.fontawesome.com/25fd41a4c0.js" crossorigin="anonymous"></script>

</body>

</html>