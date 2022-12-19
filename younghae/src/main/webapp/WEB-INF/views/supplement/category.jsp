<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>영양성분조회</title>

    <style>
        /* 영양제 성분 카테고리*/
        .featured__item{
            background-color: #DCFFE9;
            padding: auto;
            width: 300;
            height: 230;
            border-radius: 5%;
        }

        .featured__item p{
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

	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>성분 성분 조회</li>
            </ul>
        </div>
    </div>

    <!-- Featured Section Begin -->
    <section class="featured spad" style="margin-left: 18%; margin-right: 18%;">
        <div class="container">
            <div class="row" >
                <div class="col-lg-12">
                    <div class="section" style="padding-left: 25%;">
                        <input type="text" class="form-control" id="bn_navbar-search-input" placeholder="궁금한 영양 성분 검색" aria-label="search" aria-describedby="search"
                            style="width: 70%; border-radius: 30px;">
                        <button class="btn"
                            style="margin-left: 63%; transform : translatey(-95%);"
                        >
                            <i class="bi bi-search"></i>
                        </button>
                        <div class="row justify-content-center" style="margin: -3%; margin-left: -38%;">
                            <div>
                                <button type="button" class="btn btn-secondary" style="background-color: white; color: rgb(112, 109, 109); border: none; font-weight: bold; font-size: 18px;">실시간 트렌드</button>
                                <button type="button" class="btn btn-secondary trend" style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">레시틴</button> &nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-secondary trend" style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">밀크씨슬</button> &nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-secondary trend" style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">종합비타민</button> &nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-secondary trend" style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">비타민D</button> &nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-secondary trend" style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">보충제</button>
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <div class="section-title">
                        <h2 style="position: absolute; left: -5%;
                        right: 60%; height: 4px; width: 40%; background: #24E082;
                        content: ''; margin: 0 auto; display: inline; margin-top: 2%"></h2>
                        <h2 style="color: #24E082; display: inline;">영양성분</h2>
                        <h2 style="position: absolute; left: 60%;
                        right: -5%; height: 4px; width: 40%; background: #24E082;
                        content: ''; margin: 0 auto; display: inline; margin-top: 2%"></h2>
                    </div>
                    <!-- <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".oranges">Oranges</li>
                            <li data-filter=".fresh-meat">Fresh Meat</li>
                            <li data-filter=".vegetables">Vegetables</li>
                            <li data-filter=".fastfood">Fastfood</li>
                        </ul>
                    </div> -->
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <c:forEach items="${ list }" var="c">
	                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" >
	                            <p>${ c.cateName }</p>
	                            <!-- <ul class="featured__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul> -->
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
    </section>
    <!-- Featured Section End -->

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

</body>

</html>