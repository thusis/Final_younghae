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
    <title>게시글 상세보기</title>

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

    <!-- Blog Section Begin -->
    <section class="blog spad">
        
        <div class="container">
            
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <select>
                                    <option>작성자</option>
                                    <option>제목</option>
                                    <option>내용</option>
                                </select>
                                <br><br>
                                <input type="text" placeholder="Search...">
                                <button type="submit"><br><br><i class="fa-solid fa-magnifying-glass"></i></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4 style="color: #ffc53e;">Categories</h4>
                            <ul>
                                <li><a href="#">운동(32)</a></li>
                                <li><a href="#">식단 (20)</a></li>
                                <li><a href="#">영양제 (5)</a></li>
                                <li><a href="#">자유 (9)</a></li>
                            </ul>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4 style="color: #ffc53e;">TOP5 게시글</h4>
                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-1.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>09 Kinds Of Vegetables<br /> Protect The Liver</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-2.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Tips You To Balance<br /> Nutrition Meal Day</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4 style="color: #ffc53e;">Search By</h4>
                            <div class="blog__sidebar__item__tags">
                                <a href="#">PT</a>
                                <a href="#">단백질 보충제</a>
                                <a href="#">샐러드</a>
                                <a href="#">필라테스</a>
                                <a href="#">오운완</a>
                                <a href="#">헬린이</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                    <div class="col-lg-8 col-md-7 order-md-1 order-1">
                        <div id="boardTitle">
                            <h4>오늘 PT 매우 성공적이야</h4>
                        </div>
                        <hr width="80%" style="border: 1px dashed #c9ffe4;" noshade/>
                        <div class="container" style="border: 2px solid #24E082; border-radius: 3%; padding: 8%;">
                        <div class="blog__details__text">
                            <img src="img/blog/details/details-pic.jpg" alt="">
                            <p>Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
                                dui. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit
                                aliquet elit, eget tincidunt nibh pulvinar a. Vivamus magna justo, lacinia eget consectetur
                                sed, convallis at tellus. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada.
                                Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus.
                                Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis
                                quis ac lectus. Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada
                                feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p>
                            <h3>The corner window forms a place within a place that is a resting point within the large
                                space.</h3>
                            <p>The study area is located at the back with a view of the vast nature. Together with the other
                                buildings, a congruent story has been managed in which the whole has a reinforcing effect on
                                the components. The use of materials seeks connection to the main house, the adjacent
                                stables</p>
                        </div>
                    </div>
                    <br><br>
                        <div class="blog__details__content">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="blog__details__author">
                                        <div class="blog__details__author__pic">
                                            <img src="img/blog/details/프로필.jpg" alt="">
                                        </div>
                                        <div class="blog__details__author__text">
                                            <h6>튼튼한 위장</h6>
                                            <span>회원</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="blog__details__widget">
                                        <ul>
                                            <li><span>Categories:</span> 운동</li>
                                            <li><span>Tags:</span>  PT, 오운완, 버핏테스트, 인바디</li>
                                        </ul>
                                        <div class="blog__details__social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                            <a href="#"><i class="fa fa-envelope"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    

            </div>
        </div>
            <!-- board Detail End -->
    <br><br>
    <!-- Reply Zone Start -->
            <div class="row">

                <div class="col-lg-10">
                    <div class="row justify-content-end bn_board-meta">
                        <i class="bi bi-heart"></i><span class=" m-2">12</span>&nbsp;&nbsp;
                        <i class="fa-regular fa-eye"></i><span class=" m-2">56</span>&nbsp;&nbsp;
                        <i class="bi bi-chat-dots m-2"></i><span class=" m-2">19</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>

                </div>
                <div class="dropdown col-lg-1 align-items-center justify-content-center">
                    <button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi lg bi-three-dots" style="font-size: 1.5rem; color:darkgray;"></i>
                    </button>
                </div>

                <hr width="80%" style="border: 0.5px solid #e0e0e0;" noshade/>
            </div>
            <div class="row">
                <div class="replyComment" >
                  <h4 class="bn_txt_strong">댓글을 남기세요&nbsp;&nbsp;<i class="bi bi-chat-dots"></i></h4>
                </div>
            </div>
            <br>
            <div id="replyContent">
                <textarea id="replyTextarea"></textarea>
                &nbsp;&nbsp;
                <button class="btn bn_btn_search2" id="replySubmit" type="button">SUBMIT</button>
            </div>


    <!-- Reply Zone End -->
    </section>
    <!-- Blog Section End -->


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

    <!--소셜공유-->
    

</body>
</html>