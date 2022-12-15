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
    <title>메뉴바</title>

    <!--jQuery-->
    <script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
    
    <!-- Google Font : (1)오가니 (2)봉은추가 font-family: 'IBM Plex Sans KR', sans-serif; 추천 -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100;200;300;400;500;600;700&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${contextPath}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css/style.css" type="text/css">

    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <!--fontawesome 아이콘-->
    <script src="https://kit.fontawesome.com/25fd41a4c0.js" crossorigin="anonymous"></script>

</head>
<body>
    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-1">
                    <div class="header__logo">
                        <a href="#"><img src="${contextPath }/img/logo.svg" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-2"></div>
                <div class="col-lg">
                    <div class="input-group mt-3">
                        <select class="form-select bn_navbar-select-input" style="height:50px;">
                            <option value="전체">전체</option>
                            <option value="영양제">영양제</option>
                            <option value="브랜드">브랜드</option>
                        </select>
                        <input type="text" class="form-control" id="bn_navbar-search-input" style="height:42px;" placeholder="영양제 이름이나 브랜드명 입력" aria-label="search" aria-describedby="search">
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

    
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>

    <!-- JavaScript Bundle with Popper -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    
    <!-- 추가 -->
    <script src="js/bootstrap.bundle.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        
    
</body>
</html>