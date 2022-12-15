<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>리뷰 이벤트</title>

    <!--jQuery-->
    <script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/bn_style.css" type="text/css">
    
    <!-- 부트 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   
   <!-- 폰트 어썸 -->
    <script src="https://kit.fontawesome.com/7a738a6e1a.js" crossorigin="anonymous"></script>
    
    <!--Soyeon-->
    <link rel="stylesheet" href="css/soyeon.css" type="text/css">

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
                <div class="col-lg">
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
                            <li><a href="#">건강콘텐츠</a></li>
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">이벤트</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </nav>
    <!-- Header Section End -->
    <br><br>
    <h4 id="eventTitle">
        ✨📚 영해의 리뷰 이벤트 📚✨
        
    </h4>
    
    <hr width="80%" style="border: 2px solid #24E082;" noshade/>
    <br><br>
    <div class="attendance"><img src="img/event/Review.png" style="width:800px; height:800px;"></div>

    <br><br>
    <div id="eventReviewBtn">
        <a href="#" class="btn-3d yellow">리뷰 쓰러가기</a>
        <a href="#" class="btn-3d yellow">보상받기</a>
    </div>
    <br><br>
       <!-- Footer Section Begin -->
       <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="#"><img src="img/logo.svg" alt=""></a>
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


    <!-- 버튼 JS-->
    <script>
          $('a').click(function(event){
            event.preventDefault(); 
            });
    </script>
</body>
</html>