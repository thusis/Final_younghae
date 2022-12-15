<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>컬럼 쓰기</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<!-- 써머 노트 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<!-- 밑 코드 사용하면 toolbar가 일을 안해,,,
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> -->

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

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
	
	.bn_navbar-select-input option:checked, .bn_navbar-select-input option:hover
		{
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
	
	#detail {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	
	/*목차*/
	.bn_index ul li {
		list-style: none;
		position: relative;
		display: inline-block;
	}
	
	.bn_index a {
		color: black;
	}
	
	.bn_index li:last-child a {
		font-weight: 800;
		color: #FD9F28;
	}
</style>
</head>
<body>
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
                <li> <b>/</b> </li>
                <li><a href="#">건강해지는 이야기 상세보기</a></li>
                <li> <b>/</b> </li>
                <li><a href="#">건강해지는 이야기 작성하기</a></li>
            </ul>
        </div>
    </div>

    <!-- 스토리 작성하는 부분 -->
    <section class="featured spad" style="margin-left: 20%; margin-right: 20%;">
        <div class="row align-items-center">
            <div class="col-lg-12 col-md-12" style="border: 2px solid #24E082; padding: 3%; border-radius: 2em;">
                <form action="" method="post">
                    <div id="storyTitle">
                        <label
                        style="font-size: 25px; color: #24E082; font-weight: 700; padding-left: 1%; padding-top: 1.5%; padding-right: 1%;"
                        for="">제목</label>
                        <input type="text" placeholder="제목을 입력하세요" required style="width: 60%; padding: 0.5%;">
                    </div>
                    <div id="storyFile">
                        <label
                        style="font-size: 25px; color: #24E082; font-weight: 700; padding-left: 1%; padding-top: 1.5%; padding-right: 1%;"
                        for="">첨부파일</label>
                        <input type="text" placeholder="파일 이름" required style="width: 60%; padding: 0.5%;">
                        <div class="text-right float-right" id="fileBtn" style="margin-top: 2%; margin-right: 20%;">
                            <button type="button"
                                style="height: 30px; width: 150%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;">찾아보기</button>
                        </div>
                    </div>
                    <div class="text-center" id="column">
                        <br>
                        <textarea id="summernote" name="editordata"></textarea>
                        <!-- ${ info.storyContent } -->
                    </div>
                    <div class="text-center" id="Btn" style="margin-top: 2%;">
                        <button type="button"
                            style="height: 50px; width: 20%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;">목록</button>
                    </div>
                </form>
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
    <!-- <script src="js/jquery-3.3.1.min.js"></script> 써머노트 사용시 jQuery 충돌 문제로 사용 불가-->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

    <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
      });
    </script>
    
</body>
</html>