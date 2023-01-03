<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>YOUNGHAE|SHOPPING</title>

	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
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

        .btn_viewCart{
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
        
        .main-view{
		   margin-left: -40px;
		   text-align: center;
		}
		.main-view{height:400px;overflow:hidden;}
		    .main-view ul{width:calc(100% * 3);display:flex;animation:slide 20s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
		    .main-view li{width:calc(100% / 3);height:100px;}
		    
		    @keyframes slide {
		      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
		      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
		      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
		      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
		      50% {margin-left:-200%;}
		      60% {margin-left:-200%;}
		      100% {margin-left:0;}
		}

    </style>
    <link rel="stylesheet" href="resources/css/hj_style.css" type="text/css">     
</head>


<body>


   <div class="container2">
      <div class="main-view">
         <ul>
            <li><img src="resources/img/event/Review1.PNG" width="100%" height="300%" /></li>
            <li><img src="resources/img/event/생일00.PNG" width="100%" height="300%" /></li>
            <li><img src="resources/img/event/attend0.png" width="100%" height="300%"  /></li>
         </ul>
      </div>
   </div>

    <!-- Product Section Begin -->
    <section class="product spad" style="margin-top: -10%;">
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
					<button type="button" class="btn btn-secondary" style="background-color: white; color: rgb(112, 109, 109); border: none; font-weight: bold; font-size: 18px;">실시간 트렌드</button>
                    <button type="button" class="btn btn-secondary trend" style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">레시틴</button> &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-secondary trend" style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">밀크씨슬</button> &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-secondary trend" style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">종합비타민</button> &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-secondary trend" style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">비타민D</button> &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-secondary trend" style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">보충제</button>
                </div>
            </div>
            <br><br><br><br>

            <!-- 실시간트렌드 섹션 -->
            <div class="row">
               <button class="col-lg-2" style="color: #FD9F28; font-weight: bold; font-size: 25px; background-color: white; border: none;" onclick="location.href='${contextPath}/allView.sh'">전체 상품</button>
               <button class="col-lg-2" style="color: #24E082; font-weight: bold; font-size: 25px; background-color: white; border: none;" onclick="location.href='${contextPath}/bestsellerView.sh'">베스트셀러</button>
               <button class="col-lg-2" style="color: #24E082; font-weight: bold; font-size: 25px; background-color: white; border: none;" onclick="location.href='${contextPath}/trendView.sh'">실시간트렌드</button>
            </div>
			<br><br>
			
			<div class="row">
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
               	<c:forEach items="${ allList }" var="i">
	                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 38px;">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" style="margin-bottom: -40px;">
	                            <img src=${ i.proImage } style="margin-top: 30px;">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text" style="text-align: left;">
	                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;${ i.proGrade }</span>
	                            <h6 style="display: inline-block;">${ i.proCompany }</h6>
	                            <h5 style="height: 2rem;">${ i.proName }</h5>
	                            <h5 style="margin-top : 1rem;" id="price">${ i.formatPrice }원</h5>
	                            <h6 style="margin-top : 1rem; color: #1a19197e; height: 2rem; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"">${ i.proEffect }</h6>
	                            <div>
	                                <button class="btn btn_viewCart" ><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
	                                <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
	                            </div>
	                            <input type="hidden" class="proNum" value="${ i.proNum }">
	                        </div>
	                        
	                    </div>
	                </div>
                </c:forEach>
            </div><br><br>
            <!-- /실시간트렌드 섹션 --> 


            
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
    
	<script>
		window.onload =()=>{
			const dives = document.getElementsByClassName('product__item');

			for(const div of dives){
				div.addEventListener('click',function(){
					const proNum = this.querySelector('.proNum').value;
					console.log(proNum);
					location.href='${contextPath}/supplementDetail.sh?proNum=' + proNum;
				});
			}

		}
	</script>
</body>

</html>