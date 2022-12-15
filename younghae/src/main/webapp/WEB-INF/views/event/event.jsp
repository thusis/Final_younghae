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
    <title>이벤트 메인</title>

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


      <!-- ============================================-->
      <!-- <section> begin ============================-->
      <section class="pb-5 pt-8">

        <div class="eventDiv" id="eventFirst">
          <div class="row">
            <div class="col-12">
              <div class="card card-span mb-3 shadow-lg">
                <div class="card-body py-0">
                  <div class="row justify-content-center">
                    <div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-0 order-md-1"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-end rounded-md-top-0" src="img/event/Review1.PNG" alt="..." /></div>
                    <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                      <h1 class="card-title mt-xl-5 mb-4">Review<span class="text-primary"> Event</span></h1>
                      <p class="fs-1">
                        영해와 함께하는 리뷰이벤트!<br>
                        리뷰가 처음이면 혜택이 2배<br>
                        (2023.01.01 - 2023.02.14)
                      </p>
                      <div class="d-grid bottom-0"><a class="btn btn-lg btn-primary mt-xl-6" href="#!">Event View details<i class="fas fa-chevron-right ms-2"></i></a></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div><!-- end of .container-->

      </section>
      <!-- <section> close ============================-->
      <!-- ============================================-->
<br><br><br>
      <!-- ============================================-->
      <!-- <section> begin ============================-->
        <section class="py-0">

          <div class="eventDiv" id="eventLast">
            <div class="row">
              <div class="col-12">
                <div class="card card-span mb-3 shadow-lg">
                  <div class="card-body py-0">
                    <div class="row justify-content-center">
                      <div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-md-0"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-start rounded-md-top-0" src="img/event/출석00.PNG" alt="..." /></div>
                      <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                        <h1 class="card-title mt-xl-5 mb-4">Attendance <span class="text-primary">Event</span></h1>
                        <p class="fs-1">
                        영해 10주년 기념 출석체크 이벤트<br>
                        누적일에 따른 알약 포인트 증정!<br>
                        (2023.01.01 - 2023.01.31)
                        </p>
                        <div class="d-grid bottom-0"><a class="btn btn-lg btn-primary mt-xl-6" href="#!">Event View details<i class="fas fa-chevron-right ms-2"></i></a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- end of .container-->
  
        </section>
      <!-- <section> close ============================-->
      <!-- ============================================-->

<br><br>
      <!-- ============================================-->
      <!-- <section> begin ============================-->
        <section class="pb-5 pt-8">

          <div class="eventDiv">
            <div class="row">
              <div class="col-12">
                <div class="card card-span mb-3 shadow-lg">
                  <div class="card-body py-0">
                    <div class="row justify-content-center">
                      <div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-0 order-md-1"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-end rounded-md-top-0" src="img/event/생일00.PNG" alt="..." /></div>
                      <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                        <h1 class="card-title mt-xl-5 mb-4">Birthday<span class="text-primary"> Event</span></h1>
                        <p class="fs-1">
                          이번달 생일인 영양단을 위한 이벤트!<br>
                          생일자라면 선물 받아가세요 :)<br>
                          (2023.01.01 - 2023.01.31)
                        </p>
                        <div class="d-grid bottom-0"><a class="btn btn-lg btn-primary mt-xl-6" href="#!">Event View details<i class="fas fa-chevron-right ms-2"></i></a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- end of .container-->
  
        </section>  
      <!-- <section> close ============================-->
      <!-- ============================================-->


      <!-- ============================================-->
      <!-- <section> begin ============================-->
        <br><br><br>
        <section class="py-0">

          <div class="eventDiv" id="eventLast">
            <div class="row">
              <div class="col-12">
                <div class="card card-span mb-3 shadow-lg">
                  <div class="card-body py-0">
                    <div class="row justify-content-center">
                      <div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-md-0"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-start rounded-md-top-0" src="img/event/replyMain.png" alt="..." /></div>
                      <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                        <h1 class="card-title mt-xl-5 mb-4">Reply <span class="text-primary">Event</span></h1>
                        <p class="fs-1">
                          컬럼에 댓글 달면 혜택이 팡 ! 팡 !<br>
                          (2023.01.01 - 2023.01.31)
                        </p>
                        <div class="d-grid bottom-0"><a class="btn btn-lg btn-primary mt-xl-6" href="#!">Event View details<i class="fas fa-chevron-right ms-2"></i></a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- end of .container-->
  
        </section>
        <!-- <section> close ============================-->
        <!-- ============================================-->
          <br><br>  
        
          <!-- Footer Section Begin -->
    <footer class="footer spad">
      <div class="container">
          <div class="row">
              <div class="col-lg-3 col-md-6 col-sm-6">
                  <div class="footer__about">
                      <div class="footer__about__logo">
                          <a href="./index.html"><img src="img/logo.svg" alt=""></a>
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

    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">

    
</body>
</html>