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
    <title>컬럼</title>

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

        #detail{
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
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
                <li>건강해지는 이야기</li>
            </ul>
        </div>
    </div>

    <section class="featured spad" style="margin-left: 20%; margin-right: 20%;">
        <div class="container">
            <div class="col-lg-12 col-md-12">
                <div class="row" style="width: 100%; margin: 0; height: 60%;">
                    <div class="col-lg-5 col-md-5 col-sm-5" style="border: 1px solid #24E082; border-radius: 2em; padding-top: 1%; margin: 3%; display: inline;">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog-2.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i>  2022-12-09</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                    <div  class="scrapIcon" style="display: inline; float: right; font-size: 150%; color: #24E082;">
                                        <i class="bi bi-bookmark-plus"></i>
                                    </div>
                                </ul>
                                <h5><a href="#">위장질환 종합영양제 비타민U 성분은?</a></h5>
                                <div id="detail">
                                    지나가는 무성할 새겨지는 애기 아침이 헤는 겨울이 피어나듯이 까닭이요, 까닭입니다. 잔디가 언덕 까닭이요, 계십니다. 내일 비둘기, 가슴속에 까닭이요, 거외다. 이런 어머니, 프랑시스 별 책상을 말 아스라히 지나고 있습니다. 다 별들을 별 나의 듯합니다. 가득 무성할 풀이 아무 지나고 버리었습니다. 경, 이름을 가을 이름을 하나의 오는 별을 하늘에는 별 까닭입니다. 위에 부끄러운 이름과, 나의 남은 이름자 지나가는 버리었습니다. 마디씩 했던 시와 써 덮어 이런 차 하나에 까닭이요, 있습니다.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-5" style="border: 1px solid #24E082; border-radius: 2em; padding-top: 1%; margin: 3%; display: inline;">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog-3.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> 2022-12-09</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                    <div class="scrapIcon" style="display: inline; float: right; font-size: 150%; color: #24E082;">
                                        <i class="bi bi-bookmark-plus"></i>
                                    </div>
                                </ul>
                                <h5><a href="#">위장질환 종합영양제 비타민U 성분은?</a></h5>
                                <div id="detail">
                                    지나가는 무성할 새겨지는 애기 아침이 헤는 겨울이 피어나듯이 까닭이요, 까닭입니다. 잔디가 언덕 까닭이요, 계십니다. 내일 비둘기, 가슴속에 까닭이요, 거외다. 이런 어머니, 프랑시스 별 책상을 말 아스라히 지나고 있습니다. 다 별들을 별 나의 듯합니다. 가득 무성할 풀이 아무 지나고 버리었습니다. 경, 이름을 가을 이름을 하나의 오는 별을 하늘에는 별 까닭입니다. 위에 부끄러운 이름과, 나의 남은 이름자 지나가는 버리었습니다. 마디씩 했던 시와 써 덮어 이런 차 하나에 까닭이요, 있습니다.
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-5 col-md-5 col-sm-5" style="border: 1px solid #24E082; border-radius: 2em; padding-top: 1%; margin: 3%; display: inline;">
                    <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog-1.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i>  2022-12-09</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                    <div class="scrapIcon" style="display: inline; float: right; font-size: 150%; color: #24E082;">
                                        <i class="bi bi-bookmark-plus"></i>
                                    </div>
                                </ul>
                                <h5><a href="#">위장질환 종합영양제 비타민U 성분은?</a></h5>
                                <div id="detail">
                                    지나가는 무성할 새겨지는 애기 아침이 헤는 겨울이 피어나듯이 까닭이요, 까닭입니다. 잔디가 언덕 까닭이요, 계십니다. 내일 비둘기, 가슴속에 까닭이요, 거외다. 이런 어머니, 프랑시스 별 책상을 말 아스라히 지나고 있습니다. 다 별들을 별 나의 듯합니다. 가득 무성할 풀이 아무 지나고 버리었습니다. 경, 이름을 가을 이름을 하나의 오는 별을 하늘에는 별 까닭입니다. 위에 부끄러운 이름과, 나의 남은 이름자 지나가는 버리었습니다. 마디씩 했던 시와 써 덮어 이런 차 하나에 까닭이요, 있습니다.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-5" style="border: 1px solid #24E082; border-radius: 2em; padding-top: 1%; margin: 3%; display: inline;">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog-4.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i>  2022-12-09</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                    <div class="scrapIcon" style="display: inline; float: right; font-size: 150%; color: #24E082;">
                                        <i class="bi bi-bookmark-plus"></i>
                                    </div>
                                </ul>
                                <h5><a href="#">위장질환 종합영양제 비타민U 성분은?</a></h5>
                                <div id="detail">
                                    지나가는 무성할 새겨지는 애기 아침이 헤는 겨울이 피어나듯이 까닭이요, 까닭입니다. 잔디가 언덕 까닭이요, 계십니다. 내일 비둘기, 가슴속에 까닭이요, 거외다. 이런 어머니, 프랑시스 별 책상을 말 아스라히 지나고 있습니다. 다 별들을 별 나의 듯합니다. 가득 무성할 풀이 아무 지나고 버리었습니다. 경, 이름을 가을 이름을 하나의 오는 별을 하늘에는 별 까닭입니다. 위에 부끄러운 이름과, 나의 남은 이름자 지나가는 버리었습니다. 마디씩 했던 시와 써 덮어 이런 차 하나에 까닭이요, 있습니다.
                                </div>
                                <!-- <a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 text-center" style="margin-top: 8%;">
                        <div class="product__pagination blog__pagination">
                            <a href="#"><i class="fa fa-long-arrow-left"></i></a>
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
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
                       -o Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
    

        <script>
            window.onload=()=>{
                var check = false;
                $('.scrapIcon').children().on('click', function(){
                    if(check == false){
                        // 스크랩 버튼 활성화 됐을 때
                        $(this).attr("class", "bi bi-bookmark-plus-fill");
                        check = true;
                    }else{
                        // 스크랩 버튼 비활성화
                        $(this).attr("class", "bi bi-bookmark-plus");
                        check = false;
                    }
                }); // 스크랩 한개 하고 다른 한개 할때 두번 클릭해야하는 문제점 있음 check 값이 true라서 그럼

            }
        </script>
    </body>
    
    </html> 

    <!-- https://doriri.tistory.com/45 -->