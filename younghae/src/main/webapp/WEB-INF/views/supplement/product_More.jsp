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
    <title>Ogani | Template</title>

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
        .bn_nav1{
            background-color: #24E082;
        }
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
                        <input type="text" class="form-control" id="bn_navbar-search-input" placeholder="영양제 이름이나 브랜드명 입력" aria-label="search" aria-describedby="search">
                        <button class="btn bn_btn_search"><i class="bi bi-search"></i></button>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><p style="font-size: 12px; display: inline;">장바구니</p>&nbsp;&nbsp;<i class="fa fa-shopping-bag"></i><span>1</span></a></li>
                            <li><a href="#"><p style="font-size: 12px; display: inline;">마이페이지</p>&nbsp;&nbsp;<i class="bi bi-caret-down-fill"></i></a></li>
                            <li><a href="#"><p style="font-size: 12px; display: inline;">로그아웃</p>&nbsp;&nbsp;<i class="bi bi-person-dash"></i></a></li>
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
                <li><a href="#">성분 이름</a></li>
                <li> <b>/</b> </li>
                <li><a href="#">영양제 더보기</a></li>
            </ul>
        </div>
    </div>

    <!-- Product Section Begin -->
    <section class="product spad" style="margin-top: -2%;">
        <div class="container" >
            <div class="row row-cols-1">
                <div class="hero__search" style="float: left; position: relative; left: 1%;">
                    <form action="#" style="width: 50%;">
                        <div class="input-group mt-3">
                            <label style="font-size: 180%; font-weight: 800; color: rgb(118, 128, 138); margin-right: 3%;">오메가3</label>
                            <label style="font-size: 180%; font-weight: 800; color: #24E082; margin-right: 3%;">제품 더보기</label>
                        </div>
                    </form>
                </div>
            </div>
            <br><br><br><br>



            <div class="row">
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01841/v/26.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/blb/blb01012/v/29.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nor/nor03770/l/43.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/car/car01733/v/16.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
            </div><br><br>
            <!-- /실시간트렌드 섹션 --> 



            <div class="row">
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01841/v/26.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/blb/blb01012/v/29.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nor/nor03770/l/43.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/car/car01733/v/16.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
            </div><br><br>

            <div class="row">
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now01841/v/26.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/blb/blb01012/v/29.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nrt/nrt10151/y/53.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 40px;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/nor/nor03770/l/43.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img src="https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/car/car01733/v/16.jpg" style="margin-top: 30px;">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text" style="text-align: left;">
                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;4.32</span>
                            <h6 style="display: inline-block;">나우푸드</a></h6>
                            <h5>울트라 오메가3</h5>
                            <h5>35,600</h5>
                            <br>
                            <span style="float: right; font-size: 13px; margin-top: -1%; color: #1a19197e;">몸에 좋은 오메가3입니다. 츄라이츄라이해보세요</span>
                            <div>
                                <button class="btn btn_cart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
            </div><br><br>
            
            <div class="product__pagination" style="text-align: center;">
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#"><i class="fa fa-long-arrow-right"></i></a>
            </div>


        </div>
    </section>



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