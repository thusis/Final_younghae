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
    <title>카테고리 선택</title>

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
                <li>영양 성분 조회</li>
                <li> <b>/</b> </li>
                <li><a href="#">선택한 영양 성분 이름</a></li>
            </ul>
        </div>
    </div>

    <!-- Product Details Section Begin -->

    <section class="product-details spad" >
        <div class="container" style="border: 2px solid #24E082; border-radius: 3em; padding: 5%;">
            <div class="row" style="width: 100%;">
                <div class="col-lg-12 col-md-12" style="width: 100%; ">
                    <div class="product__details__text">
                        <i class="fa-solid fa-comment-medical" style="font-size: 225%; color: #24E082; margin-right: 1%;"></i>
                        <h3 style="display: inline;">지아잔틴</h3>
                        <br>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(리뷰 18)</span>
                        </div>
                            <p> &nbsp; 오메가3는 생선이나 해조류에서 추출한 여러 종류의 불포화지방산을 부르는 말이에요.
                            <br> &nbsp;그 중 가장 중요한 것은 EPA 와 DHA 에요.  EPA는 간에서 중성지방 합성을 줄여 혈중 지방 농도를 낮춰주고, 혈액 순환에 도움을 줘요.
                            DHA는 뇌, 신경 조직, 망막의 중요 구성 성분으로 뇌세포를 손상 시키는 물질을 감소시켜, 기억력을 높이는데 도움을 줄 수 있어요
                            또, 건조한 눈을 개선해줘요</p>
                            <div class="product__details__quantity" style="width: 100%;">
                                <div class="product__details__quantity" style="border: 2px solid #24E082; border-radius: 5px; padding: 5%; width: 100%;">
                                    <div class="d-inline" style="font-size: 150%; color: #BC3838;">
                                        <i class="fa-solid fa-fish-fins"></i>
                                    </div>
                                    <div class="product__details__price mr-5" style="font-size: 100%; display: inline;">생선 알레르기 주의</div>
                                    <div class="d-inline" style="font-size: 150%; color: #BC3838;">
                                        <img src="img/knife.png" style="height: 30px;">
                                    </div>
                                    <div class="product__details__price" style="font-size: 100%; display: inline;">수술 전 후 지혈 늦춰짐</div>
                                    
                                </div>
                            </div>
                        <ul>
                            <li>
                                <div class="mb-3" name="pillItem">
                                    <b style="display: inline; font-weight: 900; color: #24E082;">영양제 추천</b>
                                    <span style="margin-left: 80%; color: #24E082; font-weight: 700;">더보기 &gt; &gt;</span>
                                </div> 
                            </li>
                            <li>
                                <div class="row">
                                    <div class="product__details__quantity" style="border: 2px solid #24E082; border-radius: 10px; width: 30%; height: 380px; margin-right: 3.25%;">
                                        <div style="text-align: center; padding-top: 5%;">
                                            <div name="getItemImg">
                                                <img src="img/product/details/product-details-1.jpg" style="height: 5%; width: 50%;">
                                            </div>
                                            <div name="getItemName" class="text-left fs-5 font-weight-bold pl-2">
                                                &nbsp; 뉴트리코어 식물성 알티지 오메가3
                                            </div>
                                            <div class="fs-5 text-left pr-3 pt-3 mb-5">
                                                &nbsp; 눈 건강
                                            </div>
                                            <div class="text-left pr-2 pt-3">
                                                <div class="product__details__rating" style="float: left; padding-left: 5%;">
                                                    <i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                                </div>
                                                <div name="reviewRank" style="float: left; padding-left: 1%; padding-top: 1.5%;">
                                                    <p style="color: black; font-size: 130%;">4.8</p>
                                                </div>
                                                <div class="text-right font-weight-bold pr-2% pt--3">
                                                    52,100
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product__details__quantity" style="border: 2px solid #24E082; border-radius: 10px; width: 30%; height: 380px; margin-right: 3%;">
                                        <div style="text-align: center; padding-top: 4%;">
                                            <div name="getItemImg">
                                                <img src="img/product/details/product-details-1.jpg" style="height: 5%; width: 50%;">
                                            </div>
                                            <div name="getItemName" class="text-left fs-5 font-weight-bold pl-2">
                                                종근당건강 프로메가 알티지 오메가3 듀얼
                                            </div>
                                            <div class="fs-5 text-left pr-3 pt-3 mb-4">
                                                &nbsp; 눈 건강
                                            </div>
                                            <div class="text-left pr-2 pt-3">
                                                <div class="product__details__rating" style="float: left; padding-left: 5%;">
                                                    <i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                                </div>
                                                <div name="reviewRank" style="float: left; padding-left: 1%; padding-top: 1.5%;">
                                                    <p style="color: black; font-size: 130%;">4.8</p>
                                                </div>
                                                <div class="text-right font-weight-bold pr-2%">
                                                    52,100
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product__details__quantity" style="border: 2px solid #24E082; border-radius: 10px; width: 30%; height: 380px; margin-right: 3%;">
                                        <div style="text-align: center; padding-top: 4%;">
                                            <div name="getItemImg">
                                                <img src="img/product/details/product-details-1.jpg" style="height: 5%; width: 50%;">
                                            </div>
                                            <div name="getItemName" class="text-left fs-5 font-weight-bold pl-2">
                                                &nbsp; 뉴트리코어 식물성 알티지 오메가3
                                            </div>
                                            <div class="fs-5 text-left pr-3 pt-5 mb-4">
                                                &nbsp; 눈 건강
                                            </div>
                                            <div class="text-left pr-2 pt-3">
                                                <div class="product__details__rating" style="float: left; padding-left: 5%;">
                                                    <i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                                </div>
                                                <div name="reviewRank" style="float: left; padding-left: 1%; padding-top: 1.5%;">
                                                    <p style="color: black; font-size: 130%;">4.8</p>
                                                </div>
                                                <div class="text-right font-weight-bold pr-2%">
                                                    52,100
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab" style="padding-top: 5%;">
                        <ul class="nav nav-tabs" role="tablist">
                            <li>
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Reviews <span>(3)</span></a>
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
                                    <div class="product__details__quantity" style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 3%; padding-bottom: 5%;">
                                        <div name="reviewDetail">
                                            <div name="reviewImg" style="float: left; padding-right: -20%;">
                                                <i class="bi bi-person-circle" style="font-size: 350%; color: #24E082;"></i>
                                            </div>
                                            <div name="reviewNickName" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="font-weight: 600;">집가고싶당</p>
                                            </div>
                                            <div class="product__details__rating" style="float: left; padding-top: 3.5%; padding-left: 20%;">
                                                <i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">4.8</p>
                                            </div>
                                            <div name="reviewImg"  style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 4%;">
                                                <img src="img/product/details/product-details-1.jpg" class=".img-fluid" >
                                            </div>
                                            <div name="reviewContent" class="text-left" style="padding-top: 9%;">
                                                야채냠
                                            </div>
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="product__details__quantity" style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 3%; padding-bottom: 5%;">
                                        <div name="reviewDetail">
                                            <div name="reviewImg" style="float: left; padding-right: -20%;">
                                                <i class="bi bi-person-circle" style="font-size: 350%; color: #24E082;"></i>
                                            </div>
                                            <div name="reviewNickName" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="font-weight: 600;">좋아좋아</p>
                                            </div>
                                            <div class="product__details__rating" style="float: left; padding-top: 3.5%; padding-left: 20%;">
                                                <i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">2.3</p>
                                            </div>
                                            <div name="reviewImg"  style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 4%;">
                                                <img src="img/product/details/product-details-1.jpg" class=".img-fluid" >
                                            </div>
                                            <div name="reviewContent" style="padding-top: 9%;">
                                                오이 좋아
                                            </div>
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="product__details__quantity" style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%; padding-bottom: 5%;">
                                        <div name="reviewDetail">
                                            <div name="reviewImg" style="float: left; padding-right: -20%;">
                                                <i class="bi bi-person-circle" style="font-size: 350%; color: #24E082;"></i>
                                            </div>
                                            <div name="reviewNickName" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="font-weight: 600;">하하하하하하</p>
                                            </div>
                                            <div class="product__details__rating" style="float: left; padding-top: 3.5%; padding-left: 20%;">
                                                <i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i>
                                            </div>
                                            <div name="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;">
                                                <p style="color: black; font-size: 130%;">2.3</p>
                                            </div>
                                            <div name="reviewImg" style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 4%;">
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

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://kit.fontawesome.com/25fd41a4c0.js" crossorigin="anonymous"></script>


</body>

</html>