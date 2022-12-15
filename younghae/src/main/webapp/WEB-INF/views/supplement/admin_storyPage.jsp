<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 리뷰 관리</title>

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

    <script src="js/jquery-3.3.1.min.js"></script>

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

        th, td{
            text-align: center;
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
                    <li>관리자 페이지</li>
                    <li> <b>/</b> </li>
                    <li><a href="#">리뷰 관리</a></li>
                </ul>
            </div>
            <br>
            <div class="reviewTable">
                <label for="" style="color: #24E082; font-weight: 700;">리뷰 관리</label>
            </div>
            <div class="bn_boardlist mt-2">
                <div class="col-lg-12" style="border: 1px solid #24E082; height: 90px; padding: 2%;">
                    <label style="font-size: 20px; font-weight: 600;">총 리뷰 수</label>
                        <input type="text" value="1354" 
                        style="height: 40px; width: 150px; text-align:center; font-size: 30px;
                        border: none; padding-top: 1%;" readonly>
                    <label style="font-size: 20px; font-weight: 600;">개</label>
                </div>
                <br>
                <table class="table">
                    <thead>
                        <tr class="text-teal-100">
                            <td scope="col" colspan="12">
                                <select style="width: 100px;" onchange="selectedopntion();">
                                    <option value="productNumber">제품 번호 순</option>
                                    <option value="productName">제품 이름 순</option>
                                    <option value="productGood">추천 순</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="text-teal-100">
                            <th scope="col" class="col-lg-2">제품번호</th>
                            <th scope="col" class="col-lg-5">리뷰 내용</th>
                            <th scope="col" class="col-lg-2">작성자</th>
                            <th scope="col" class="col-lg-2">작성일</th>
                            <th scope="col" class="col-lg-1">상태</th>
                        </tr>
                    </thead>
                    <tbody id="selectTbody">
                        <!-- <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${ product.productNum }</td>
                            <td>${ review.content }</td>
                            <td>${ review.writer }</td>
                            <td>${ review.modifyDate }</td>
                            <td>
                                <c:if test="${ review.status eq 'N'} ">
                                    <i class="bi bi-x-circle" style="color: red;"></i>
                                </c:if>
                                <c:if test="${ review.status eq 'Y'} ">
                                    <i class="bi bi-circle" style="color: #24E082;"></i>
                                </c:if>
                            </td>
                        </tr> -->
                        <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">1</td>
                            <td>비타비타</td>
                            <td>yamyam</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-circle" style="color: #24E082;"></i>
                            </td>
                        </tr>
                        <!-- <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">2</td>
                            <td>하루종일 콜라겐</td>
                            <td>allDay</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-x-circle" style="color: red;"></i>
                            </td>
                        </tr>
                        <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">3</td>
                            <td>내 몸에 SOS</td>
                            <td>Vita</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-x-circle" style="color: red;"></i>
                            </td>
                        </tr>
                        <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">4</td>
                            <td>한미프로캅</td>
                            <td>yummy</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-circle" style="color: #24E082;"></i>
                            </td>
                        </tr>
                        <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">5</td>
                            <td>몸 튼튼 아연!</td>
                            <td>ummmm</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-circle" style="color: #24E082;"></i>
                            </td>
                        </tr>
                        <tr>
                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">6</td>
                            <td>고칼슘 튼튼</td>
                            <td>wlqrkwk</td>
                            <td>2022-12-06</td>
                            <td>
                                <i class="bi bi-circle" style="color: #24E082;"></i>
                            </td>
                        </tr> -->
                    </tbody>
                </table>
            </div>
            <div class="col-lg-12 text-center" style="margin-top: 3%;">
                <div class="product__pagination blog__pagination">
                    <a href="#"><i class="fa fa-long-arrow-left"></i></a>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
                <br><br><br>
            </div>
        </div>


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

        <script>
            window.onload=()=>{
                function reviewLisg(){
                    // reviewList 출력
                    const tbody = document.getElementById('selectTbody');
                    console.log(tbody);
                    const tds = tbody.querySelectorAll('td');
                    console.log(tds);
                    // for(const td of tds){
                    //     td.addEventListener('click', function() {
                    //         const trTds = this.parentElement.querySelectorAll('td');
                    //         const reviewNum = trTds[0].innerText;
                    //         const reviewWriter = trTds[2].innerText;
    
                    //         location.href  = '${contextPath}/selectBoard.bo?reviewNum='+ reviewNum+ "&reviewWriter=" + reviewWriter + "&page=" + ${pi.currentPage};
                    //     });
                    // }
                }
            }


            function selectedopntion(){
                // 카테고리에 따라 정렬
                const span = document.getElementsByClassName('nice-select')[1].firstChild;
                console.log(span.innerText);
            }

            
        </script>
</body>
</html>