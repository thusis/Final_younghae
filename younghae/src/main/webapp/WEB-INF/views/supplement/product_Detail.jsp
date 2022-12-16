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

    <style>
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

	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
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
                                src="resources/img/product/details/product-details-1.jpg" alt="">
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
                                    <img src="resources/img/ingredient.png" style="height: 40px;">
                                </div>
                                <label style="font-size: 115%; font-weight: 800;">원재료 및 함량</label>
                            </div>
                            <div class="text-left pl-5">
                                <p>EPA 및 DHA 함유유지 [영국산 정제어유,d-토코페롤(혼합형)], d-a토코페롤, 혼합제제(비타민D3, 팜유, d-a토코페롤),레몬오일(천연향료)
                                </p>
                            </div>
                            <div name="mouth">
                                <div class="d-inline" name="ingredientImg">
                                    <img src="resources/img/mouth.png" style="height: 50px;">
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
                                                <img src="resources/img/body.png" style="height: 60px;">
                                            </div>
                                            <label style="font-size: 115%; font-weight: 900;">영양정보</label>
                                        </div>
                                        <div class="text-left pl-5">
                                            <div class="d-inline" name="ingredientImg">
                                                <img src="resources/img/image1.png" style="height: 300px;">
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
                                                <img src="resources/img/product/details/product-details-1.jpg" class=".img-fluid">
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
                                                <img src="resources/img/product/details/product-details-1.jpg" class=".img-fluid">
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
                                                <img src="resources/img/product/details/product-details-1.jpg" class=".img-fluid">
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

</body>
</html>