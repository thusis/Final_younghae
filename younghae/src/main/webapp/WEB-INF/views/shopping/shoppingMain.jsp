<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

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

    </style>   
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/image_young.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <div class="breadcrumb__option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->


    <!-- Product Section Begin -->
    <section class="product spad" style="margin-top: -2%;">
        <div class="container" >
            <div class="row row-cols-1">
                <div class="hero__search" style="float: left; position: relative; left: 25%;">
                    <form action="#" style="width: 50%;">
                        <div class="input-group mt-3">
                            <input type="text" class="form-control" id="bn_navbar-search-input" placeholder="궁금한 영양 성분 검색" aria-label="search" aria-describedby="search" style="border-radius: 20px; padding-left: 5%">
                            <button class="btn bn_btn_search"><i class="bi bi-search"></i></button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row justify-content-center" style="margin: -2%; vertical-align: middle;">
                <div>
                    <button type="button" class="btn " style="background-color: white; color: rgb(112, 109, 109); border: none; font-weight: bold; font-size: 18px;">실시간 트렌드</button>
                    <button type="button" class="btn btn_trend">레시틴</button> &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn_trend">밀크씨슬</button> &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn_trend">종합비타민</button> &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn_trend">비타민D</button> &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn_trend">보충제</button>
                </div>
            </div>
            <br><br><br><br>


            <!-- 실시간트렌드 섹션 -->
            <div class="row">
                <p class="col" style="color: #24E082; font-weight: bold; font-size: 30px; display: inline;">실시간 트렌드</p>
                <button class="text-end" style="color: #FD9F28; font-weight: bold; font-size: 15px; float:right; background-color: #ffffff; border: none;">더보기</button>
            </div>

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


            <!-- 스테디셀러 영양제 섹션 -->
            <div class="row">
                <p class="col" style="color: #24E082; font-weight: bold; font-size: 30px; display: inline;">스테디셀러 영양제</p>
                <button class="text-end" style="color: #FD9F28; font-weight: bold; font-size: 15px; float:right; background-color: #ffffff; border: none;">더보기</button>
            </div>

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
            <!-- /스테디셀러 영양제 섹션 --> 


            <!-- 전체 상품 섹션-->
            <div class="row">
                <p class="col" style="color: #24E082; font-weight: bold; font-size: 30px; display: inline;">전체 상품</p><br><br><br>
                <button class="text-end" style="color: #FD9F28; font-weight: bold; font-size: 15px; float:right; background-color: #ffffff; border: none;">더보기</button>
                <br>
                <div class="col-lg-12">
                    <div class="featured__controls">
                        <ul>
                            <li data-filter="*"><a href="#"><img src="resources/img/categories/cate_all.png" class="cate_icon"><br>전체</a></li>
                            <li data-filter=".oranges"><a href="#"><img src="resources/img/categories/cate_eye.png" class="cate_icon"><br>눈 건강</a></li>
                            <li data-filter=".fresh-meat"><a href="#"><img src="resources/img/categories/cate_skin.png" class="cate_icon"><br>피부 건강</a></li>
                            <li data-filter=".vegetables"><a href="#"><img src="resources/img/categories/cate_fatigue.png" class="cate_icon"><br>피로감</a></li>
                            <li data-filter=".fastfood"><a href="#"><img src="resources/img/categories/cate_intestine.png" class="cate_icon"><br>장 건강</a></li>
                            <li data-filter=".fastfood"><a href="#"><img src="resources/img/categories/cate_liver.png" class="cate_icon"><br>간 건강</a></li>
                            <li data-filter=".fastfood"><a href="#"><img src="resources/img/categories/cate_born.png" class="cate_icon"><br>관절 건강</a></li>
                            <li data-filter=".fastfood"><a href="#"><img src="resources/img/categories/cate_pregnent.png" class="cate_icon"><br>임산부 </a></li>
                        </ul>
                    </div>
                </div>
            </div>

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
            <!-- /전체 상품 섹션-->
            
            <div class="product__pagination">
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
                            <a href="./index.html"><img src="resources/img/logo.png" alt=""></a>
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
                        <div class="footer__copyright__payment"><img src="resources/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>

    </footer>
</body>

</html>