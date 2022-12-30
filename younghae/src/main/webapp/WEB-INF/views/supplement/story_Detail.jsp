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
    <title>컬럼 디테일</title>

    <style>
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
                <li><a href="${ contextPath }/storyList.st?page=${ page }">건강해지는 이야기</a></li>
                <li> <b>/</b> </li>
                <li>건강해지는 이야기 상세보기</li>
            </ul>
        </div>
    </div>

    <section class="featured spad" style="margin-left: 20%; margin-right: 20%;">
        <div class="row align-items-center">
            <div class="text-left" >
                <label style="font-size: 180%;  font-weight: 800;  padding-bottom: 10%; color: #24E082;">건강해지는 이야기</label>
            </div>
            <div class="col-lg-12 col-md-12" style="border: 2px solid #24E082; padding: 3%; border-radius: 2em;">
                <div class="text-center" id="column">
                	<h3>${ board.boardTitle }</h3>
                	<br><br>
                    <!-- <textarea name="storyContent" id="storyContent" cols="145"
                        rows="10">내용이 어쩌구 저쩌구 그렇습니다 그래서욥</textarea> -->
<!--                     <img src="resources/img/storyContent.jpg" style="width: 650px;" alt=""> -->
                    <!-- 썸머노트 도입할 예정 -->
                    	${ board.boardContent }
                    <br><br>
                </div>
                <div class="text-center" id="Btn" style="margin-top: 2%;">
                    <button type="button"
                    style="height: 50px; width: 20%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;"
                    onclick="toGoList()">목록</button>
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
    <script>
		const toGoList = () =>{
			location.href="${ contextPath }/storyList.st?page="+${ page };
		}
    </script>
</body>

</html>

<!-- https://doriri.tistory.com/45 -->