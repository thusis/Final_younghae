<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>제품 디테일</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">

    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <style>
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

        .bn_navbar-select-input option:checked,
        .bn_navbar-select-input option:hover {
            color: FD9F28;
        }

        .bn_btn_search {
            background-color: transparent;
            border: none;
            cursor: pointer;
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translatey(-50%);
        }

        /* 첨부파일 관련 CSS*/
        .filebox .upload-name {
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid transparent;
            width: 78%;
            color: #999999;
        }

        .filebox label {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            vertical-align: middle;
            background-color: #24E082;
            border-radius: 1em;
            cursor: pointer;
            /* height: 78%; */
            margin-left: 10px;
        }

        .filebox input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 50px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 10px;
            border: 1px solid #888;
            width: 55%;
            height: 93%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
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
    </style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-1">
                    <div class="header__logo">
                        <a href="#"><img src="img/logo.svg" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-2"></div>
                <div class="col-lg">
                    <div class="input-group mt-3">
                        <select class="form-select form-select-sm bn_navbar-select-input">
                            <option value="전체">전체</option>
                            <option value="영양제">영양제</option>
                            <option value="브랜드">브랜드</option>
                        </select>
                        <input type="text" class="form-control" id="bn_navbar-search-input"
                            placeholder="영양제 이름이나 브랜드명 입력" aria-label="search" aria-describedby="search">
                        <button class="btn bn_btn_search"><i class="bi bi-search"></i></button>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#">
                                    <p style="font-size: 12px; display: inline;">장바구니</p>&nbsp;&nbsp;<i
                                        class="fa fa-shopping-bag"></i><span>1</span>
                                </a></li>
                            <li><a href="#">
                                    <p style="font-size: 12px; display: inline;">마이페이지</p>&nbsp;&nbsp;<i
                                        class="bi bi-caret-down-fill"></i>
                                </a></li>
                            <li><a href="#">
                                    <p style="font-size: 12px; display: inline;">로그아웃</p>&nbsp;&nbsp;<i
                                        class="bi bi-person-dash"></i>
                                </a></li>
                        </ul>
                        <!-- 로그인 안 했을 때 사용
                        <ul>
                            <li><a href="#"><p style="font-size: 12px; display: inline;">로그인</p>&nbsp;&nbsp;<i class="bi bi-person-check-fill"></i></a></li>
                            <li><a href="#"><p style="font-size: 12px; display: inline;">회원가입</p>&nbsp;&nbsp;<i class="bi bi-person-plus-fill"></i></a></li>
                        </ul> -->
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <nav class="bn_nav1">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <nav class="yh_header__menu">
                        <ul>
                            <li><a href="#">영양제</a>
                                <ul class="yh_header__menu__dropdown">
                                    <li><a href="#">영양성분조회</a></li>
                                    <li><a href="#">영양제 검색</a></li>
                                </ul>
                            </li>
                            <li><a href="#">쇼핑</a></li>
                            <li><a href="#">Q&A</a>
                                <ul class="yh_header__menu__dropdown">
                                    <li><a href="#">둘러보기</a></li>
                                    <li><a href="#">질문하기</a></li>
                                    <li><a href="#">답변하기</a></li>
                                    <li><a href="#">전문가 찾기</a></li>
                                </ul>
                            </li>
                            <li><a href="#">콘텐츠</a></li>
                            <li><a href="#">커뮤니티</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </nav>
    <!-- Header Section End -->

    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>제품</li>
                <li> <b>/</b> </li>
                <li><a href="#">제품 상세보기</a></li>
            </ul>
        </div>
    </div>

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="img/product/details/product-details-1.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3 class="d-inline">닥터지 초임계 알티지 오메가3</h3>
                        <div class="float-right" style="font-size: 150%; color: #24E082;">
                            <i class="bi bi-bookmark-plus-fill"></i>
                        </div>
                        <!-- <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div> -->
                        <!-- 넣을까 말까 고민중 -->
                        <br><br>
                        <div name="productInfo" class="mt-3">
                            <div name="ingredient">
                                <div class="d-inline mr-2" name="ingredientImg">
                                    <img src="img/ingredient.png" style="height: 40px;">
                                </div>
                                <label style="font-size: 115%; font-weight: 800;">원재료 및 함량</label>
                            </div>
                            <div class="text-left pl-5">
                                <p>EPA 및 DHA 함유유지 [영국산 정제어유,d-토코페롤(혼합형)], d-a토코페롤, 혼합제제(비타민D3, 팜유, d-a토코페롤),레몬오일(천연향료)
                                </p>
                            </div>
                            <div name="mouth">
                                <div class="d-inline" name="ingredientImg">
                                    <img src="img/mouth.png" style="height: 50px;">
                                </div>
                                <label style="font-size: 115%; font-weight: 800;">복용방법</label>
                            </div>
                            <div class="text-left pl-5">
                                <p>1일 1회, 1회 1정 캡슐을 물과 함께 섭취하십시오.</p>
                            </div>
                        </div>
                        <div class="product__details__quantity">
                            <div class="pl-5">
                                <button type="button" class="btn btn-secondary trend"
                                    style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">혈행개선</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-secondary trend"
                                    style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">골다공증
                                    예방</button> &nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-secondary trend"
                                    style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">눈
                                    건강</button> &nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-secondary trend"
                                    style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">세포
                                    보호</button> &nbsp;&nbsp;&nbsp;
                            </div>
                        </div>
                        <br><br><br><br><br><br><br><br>
                    </div>
                </div>

                <!-- 구매하러가기  버튼 -->
                <div name="goShop" style="margin-left: 25%; margin-top: 2%;">
                    <button type="button"
                        style="display: inline; margin-left: -25%; height: 170%; width: 200%; background-color: #FD9F28; border: none; border-radius: 5em; color: #ffffff;">구매하러
                        가기</button>
                </div>
                <div name="goReviewWrite" style="margin-left: 25%; margin-top: 2%;">
                    <button type="button"
                        style="margin-left: -25%; height: 170%; width: 250%; background-color: #FD9F28; border: none; border-radius: 5em; color: #ffffff;"
                        id="modalBtn">리뷰
                        쓰기</button>
                </div>
                <!-- 리뷰 -->
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">영양정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="false">리뷰
                                    <span>(3)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <div class="text-left" style="margin-left: 3%;">
                                        <div name="Productbody">
                                            <div class="d-inline" name="ingredientImg">
                                                <img src="img/body.png" style="height: 60px;">
                                            </div>
                                            <label style="font-size: 115%; font-weight: 900;">영양정보</label>
                                        </div>
                                        <div class="text-left pl-5">
                                            <div class="d-inline" name="ingredientImg">
                                                <img src="img/image1.png" style="height: 300px;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <div class="product__details__quantity"
                                        style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">
                                        <div name="reviewDetail">
                                            <div name="reviewImg" style="float: left; padding-right: -20%;">
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
                                            <div class="product__details__rating"
                                                style="float: left; padding-top: 3.2%; padding-left: 5%;">
                                                <i class="bi bi-hand-thumbs-up-fill"
                                                    style="color: rgb(0, 0, 0); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank"
                                                style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">10</p>
                                            </div>
                                            <div name="reviewImg"
                                                style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
                                                <img src="img/product/details/product-details-1.jpg" class=".img-fluid">
                                            </div>
                                            <div name="reviewContent" class="text-left" style="padding-top: 9%;">
                                                야채냠
                                            </div>
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="product__details__quantity"
                                        style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">
                                        <div name="reviewDetail">
                                            <div name="reviewImg" style="float: left; padding-right: -20%;">
                                                <i class="bi bi-person-circle"
                                                    style="font-size: 350%; color: #24E082;"></i>
                                            </div>
                                            <div name="reviewNickName"
                                                style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="font-weight: 600;">좋아좋아</p>
                                            </div>
                                            <div class="product__details__rating"
                                                style="float: left; padding-top: 3.5%; padding-left: 20%;">
                                                <i class="fa fa-star"
                                                    style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank"
                                                style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">2.3</p>
                                            </div>
                                            <div class="product__details__rating"
                                                style="float: left; padding-top: 3.2%; padding-left: 5%;">
                                                <i class="bi bi-hand-thumbs-up-fill"
                                                    style="color: #24E082; font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank"
                                                style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">50</p>
                                            </div>
                                            <div name="reviewImg"
                                                style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
                                                <img src="img/product/details/product-details-1.jpg" class=".img-fluid">
                                            </div>
                                            <div name="reviewContent" style="padding-top: 9%;">
                                                오이 좋아
                                            </div>
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="product__details__quantity"
                                        style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">
                                        <div name="reviewDetail">
                                            <div name="reviewImg" style="float: left; padding-right: -20%;">
                                                <i class="bi bi-person-circle"
                                                    style="font-size: 350%; color: #24E082;"></i>
                                            </div>
                                            <div name="reviewNickName"
                                                style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="font-weight: 600;">하하하하하하</p>
                                            </div>
                                            <div class="product__details__rating"
                                                style="float: left; padding-top: 3.5%; padding-left: 20%;">
                                                <i class="fa fa-star"
                                                    style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank"
                                                style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">2.3</p>
                                            </div>
                                            <div class="product__details__rating"
                                                style="float: left; padding-top: 3.2%; padding-left: 5%;">
                                                <i class="bi bi-hand-thumbs-up-fill"
                                                    style="color: rgb(0, 0, 0); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank"
                                                style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">22</p>
                                            </div>
                                            <div name="reviewImg"
                                                style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">
                                                <img src="img/product/details/product-details-1.jpg" class=".img-fluid">
                                            </div>
                                            <div name="reviewContent" style="padding-top: 9%;">
                                                나는 모든게 별로~ 내 맘의 별로~~
                                            </div>
                                        </div>
                                    </div>
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
                        <div class="footer__copyright__text">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;
                                <script>document.write(new Date().getFullYear());</script> All rights reserved | This
                                template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a
                                    href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- 리뷰쓰기 Modal -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="container">
                <div class="row g-0 text-center">
                    <div class="col-lg-12 col-md-12">
                        <div class="product__details__pic">
                            <div style="border: 2px solid #24E082; border-radius: 5em;">
                                <div class="row" style="margin: 3%;">
                                    <div class="d-inline margin-left: 5%;" name="reviewImg">
                                        <img src="/img/product/product-12.jpg"
                                            style="border: 1px solid #24E082; border-radius: 5%; margin: 3%">
                                    </div>
                                    <div class="d-inline">
                                        <div class="d-inline ml-5" name="reviewName">
                                            <label style="font-size: 180%;  font-weight: 800;  padding-top: 10%;">닥터린
                                                초임계
                                                알티지 오메가3</label>
                                            <br><br><br><br><br><br><br>
                                            <div class="product__details__rating ml-5"
                                                style="font-size: 130%; display: inline; margin: 20%; color: rgb(236, 236, 55);">
                                                <span style="color: black; margin-right: 1.5%;">별점</span>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin: 3%;">
                                    <div class="d-block" name="fileInput" style="width: 10%; padding-left: 2%;">
                                        <label
                                            style="padding-left: 3%; font-size: 110%; padding-top: 5%; font-weight: 800; color: #24E082;">첨부파일</label>
                                    </div>
                                    <div class="filebox" style="width: 60%; text-align: center;">
                                        <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
                                        <label for="file" style="display: inline;">파일찾기</label>
                                        <input type="file" id="file">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-11" style="margin-left: 3.5%; margin-bottom: 3%;">
                                        <div style="border: 2px solid #24E082; border-radius: 1em;"
                                            name="reviewContentBorder">
                                            <textarea type="text" name="reviewContent"
                                                style="border: none; margin: 1%; height: 200px; width: 97%; border: 1px solid black; resize: none;"></textarea>
                                        </div>
                                        <div>
                                            <div name="writeReview" style="margin-left: 1.5%; margin-top: 2%;">
                                                <button type="button"
                                                    style="text-align: center; height: 50px; width: 20%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;">리뷰
                                                    작성</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 리뷰수정폼 Modal -->
    <!-- <div id="myUdpateModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="container">
                <div class="row g-0 text-center">
                    <div class="col-lg-12 col-md-12">
                        <div class="product__details__pic">
                            <div style="border: 2px solid #24E082; border-radius: 5em;">
                                <div class="row" style="margin: 3%;">
                                    <div class="d-inline margin-left: 5%;" name="reviewImg">
                                        <img src="/img/product/product-12.jpg"
                                            style="border: 1px solid #24E082; border-radius: 5%; margin: 3%">
                                    </div>
                                    <div class="d-inline">
                                        <div class="d-inline ml-5" name="reviewName">
                                            <label style="font-size: 180%;  font-weight: 800;  padding-top: 10%;">닥터린
                                                초임계
                                                알티지 오메가3</label>
                                            <br><br><br><br><br><br><br>
                                            <div class="product__details__rating ml-5"
                                                style="font-size: 130%; display: inline; margin: 20%; color: rgb(236, 236, 55);">
                                                <span style="color: black; margin-right: 1.5%;">별점</span>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin: 3%;">
                                    <div class="d-block" name="fileInput" style="width: 10%; padding-left: 2%;">
                                        <label
                                            style="padding-left: 3%; font-size: 110%; padding-top: 5%; font-weight: 800; color: #24E082;">첨부파일</label>
                                    </div>
                                    <div class="filebox" style="width: 60%; text-align: center;">
                                        <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
                                        <label for="file" style="display: inline;">파일찾기</label>
                                        <input type="file" id="file">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-11" style="margin-left: 3.5%; margin-bottom: 3%;">
                                        <div style="border: 2px solid #24E082; border-radius: 1em;"
                                            name="reviewContentBorder">
                                            <textarea type="text" name="reviewContent"
                                                style="border: none; margin: 1%; height: 200px; width: 97%; border: 1px solid black; resize: none;"></textarea>
                                        </div>
                                        <div>
                                            <div name="writeReview" style="margin-left: 1.5%; margin-top: 2%;">
                                                <button type="button"
                                                    style="text-align: center; height: 50px; width: 10%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;">수정하기</button>
                                                &emsp;&emsp;&emsp;&emsp;
                                                <button type="button"
                                                    style="text-align: center; height: 50px; width: 10%; background-color: #FD9F28; border: none; border-radius: 5em; color: #ffffff;">삭제하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->


    <script>
        // 모달 가져오기
        var modal = document.getElementById("myModal");
        var updateModal = document.getElementById("myUpdateModal");

        // 리뷰쓰러가기 버튼
        var btn = document.getElementById("modalBtn");
        
        btn.onclick = function () {
            modal.style.display = "block";
            // updateModal.style.display = "block";
        }


        // 닫기 버튼
        var span = document.getElementsByClassName("close")[0];
        
        span.onclick = function () {
            modal.style.display = "none";
        }

        // modal 밖에 클릭했을 때 모달창 꺼지는 스크립트
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        window.onload=()=>{
            // 파일 이름 등록
            $('#file').on('change', function(){
                var fileName = $("#file").val();
                $(".upload-name").val(fileName);
            });
        }
    </script>

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>


</body>
</html>