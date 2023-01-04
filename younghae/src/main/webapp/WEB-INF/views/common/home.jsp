<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
    <style>

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

        .btn_cart{
            border-color: rgb(0, 123, 255);
            color: rgb(0, 123, 255);
            font-size: 10px;
            width: 90px;
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
		    .main-view ul{width:calc(100% * 3);display:flex;animation:slide 12s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
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

        .btn_viewCart{
        	background-color : white;
        	border-radius : 0.2rem;
            border: 1px solid rgb(0, 123, 255);
            color: rgb(0, 123, 255);
            font-size: 10px;
            width: 90px;
            height: 30px;
        }
        
        .btn_viewCart:hover{
            border: 2px solid rgb(0, 123, 255);
            color: rgb(0, 123, 255);
            font-weight: bold;
        }
        
        .btn_comment{
        	background-color : white;
        	border-radius : 0.2rem;
            border: 1px solid rgb(0, 123, 255);
            color: rgb(0, 123, 255);
            font-size: 11px;
            width: 65px; 
            height: 30px;        
        }
        
        .btn_comment:hover{
            border: 2px solid rgb(0, 123, 255);
            color: rgb(0, 123, 255);
            font-weight: bold;
        }
    </style> 
    <link rel="stylesheet" href="resources/css/hj_style.css" type="text/css">  
</head>


<body>


   <div class="container2">
      <div class="main-view">
         <ul>
            <li><a href="${contextPath }/reviewEvent.ev"><img src="resources/img/event/Review1.PNG" style="width:100%; height:350%;" /></a></li>
            <li><a href="${contextPath }/attendanceEvent.ev"><img src="resources/img/event/attend3.png" style="width:100%; height:350%;"/></a></li>
            <li><a href="${contextPath }/birthEvent.ev"><img src="resources/img/event/birth0.PNG" style="width:100%; height:350%;"/></a></li>



<%-- 			<c:if test="${ loginUser != null && loginUser.userCNumber eq 1 }"> --%>
<%--             <li><a href="${contextPath }/open.ch"><div style="background-color: #24E082; width:100%; height:350%;"><img src="resources/img/qna/chat.png"></div></a></li> --%>
<%--             </c:if> --%>
            
	                    
            
            
            
         </ul>
      </div>
   </div>

    <!-- Product Section Begin -->
    <section class="product spad" style="margin-top: -5%;">
        <div class="container" >
			            <!-- 영양제/검색 -->
            <div class="row">
				<div class="col-lg-12">
					<div class="section" style="padding-left: 25%;">
						<input type="text" class="form-control"
							id="bn_navbar-search-input_1" placeholder="궁금한 영양 성분 검색"
							aria-label="search" aria-describedby="search"
							style="width: 70%; border-radius: 30px;">
						<button class="btn"
							style="margin-left: 63%; transform: translatey(-95%);">
							<i class="bi bi-search"></i>
						</button>
						<div class="row justify-content-center"
							style="margin: -3%; margin-left: -38%;">
							<div>
								<button type="button" class="btn btn-secondary"
									style="background-color: white; color: rgb(112, 109, 109); border: none; font-weight: bold; font-size: 18px;">실시간
									트렌드</button>
								<button type="button" class="btn btn-secondary trend"
									style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">레시틴</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-secondary trend"
									style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">밀크씨슬</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-secondary trend"
									style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">종합비타민</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-secondary trend"
									style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">비타민D</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-secondary trend"
									style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">보충제</button>
							</div>
						</div>
					</div>
					<br>
					<br>
					<div class="section-title">
						<h2 style="position: absolute; left: -5%; right: 60%; height: 4px; width: 40%; background: #24E082; content: ''; margin: 0 auto; display: inline; margin-top: 2%"></h2>
						<h2 style="color: #24E082; display: inline;">영양성분</h2>
						<h2 style="position: absolute; left: 60%; right: -5%; height: 4px; width: 40%; background: #24E082; content: ''; margin: 0 auto; display: inline; margin-top: 2%"></h2>
					</div>
				</div>
			</div>
			
			<div class="row featured__filter" id="cate">
				<c:forEach items="${ jhSupplmentList }" var="c" begin="0" end="5">
					<div class="col-lg-2 col-md-3 col-sm-3 mix fastfood vegetables">
						<div class="featured__item">
							<div class="featured__item__pic set-bg" style="height:165px; text-align:center;" >
								<input type="hidden" value="${ c.cateNum }">
								<p>${ c.cateName }</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>









			<br><br><br><br>
 
			<!-- 전체 상품 섹션-->
			<div id="searchList">
            <div class="row">
                <p class="col" style="color: #24E082; font-weight: bold; font-size: 30px; display: inline;">전체 상품</p><br><br><br>
                <button class="text-end" style="color: #FD9F28; font-weight: bold; font-size: 15px; float:right; background-color: #ffffff; border: none;" onclick="location.href='${contextPath}/allView.sh'">더보기</button>
                <br>
                
                <!-- 건강고민별 제품섹션 -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="featured__controls"> -->
<!--                         <ul> -->
<!--                             <li data-filter="*"><a href="#"><img src="resources/img/categories/cate_all.png" class="cate_icon"><br>전체</a></li> -->
<!--                             <li data-filter=".oranges"><a href="#"><img src="resources/img/categories/cate_eye.png" class="cate_icon"><br>눈 건강</a></li> -->
<!--                             <li data-filter=".fresh-meat"><a href="#"><img src="resources/img/categories/cate_skin.png" class="cate_icon"><br>피부 건강</a></li> -->
<!--                             <li data-filter=".vegetables"><a href="#"><img src="resources/img/categories/cate_fatigue.png" class="cate_icon"><br>피로감</a></li> -->
<!--                             <li data-filter=".fastfood"><a href="#"><img src="resources/img/categories/cate_intestine.png" class="cate_icon"><br>장 건강</a></li> -->
<!--                             <li data-filter=".fastfood"><a href="#"><img src="resources/img/categories/cate_liver.png" class="cate_icon"><br>간 건강</a></li> -->
<!--                             <li data-filter=".fastfood"><a href="#"><img src="resources/img/categories/cate_born.png" class="cate_icon"><br>관절 건강</a></li> -->
<!--                             <li data-filter=".fastfood"><a href="#"><img src="resources/img/categories/cate_pregnent.png" class="cate_icon"><br>임산부 </a></li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </div> -->
                <!-- 건강고민별 제품섹션 -->
            </div>
			
            <!-- 쇼핑/전체 상품 섹션 시작-->
 			<div class="row">
               	<c:forEach items="${ supplementList }" end="4" var="i">
	                <div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 38px;">
	                    <div class="product__item" style="margin-bottom: -10px; cursor: pointer;">
	                        <div class="product__item__pic set-bg" style="margin-bottom: -40px;">
	                            <img src=${ i.proImage } style="margin-top: 30px;">
	                        </div>
	                        <div class="product__item__text" style="text-align: left;">
	                            <span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;${ i.proGrade }</span>
	                            <h6 style="display: inline-block;">${ i.proCompany }</h6>
	                            <h5 style="height: 2rem;">${ i.proName }</h5>
	                            <h5 style="margin-top : 1rem;" id="price"><fmt:formatNumber value="${ i.proPrice }" type="number"/>원</h5>
	                            <h6 style="margin-top : 1rem; color: #1a19197e; height: 2rem; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"">${ i.proEffect }</h6>
	                        </div>
	                    </div>
                        <div>
                         	<input type="hidden" class="proNum" value="${ i.proNum }">
                            <button class="btn btn_viewCart"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니</button>
                            <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>
                        </div>
	                </div>
                </c:forEach>
            </div><br><br>
            <!-- 쇼핑/전체 상품 섹션 끝-->
            

			


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
			//=혜진==------------------------------------------------------------------------------------------
			const dives = document.getElementsByClassName('product__item');
			for(const div of dives){
				div.addEventListener('click',function(){
					console.log($(this).siblings().children()[0].value);
					const proNum = $(this).siblings().children()[0].value;
					location.href='${contextPath}/supplementDetail.sh?proNum=' + proNum;
				});
			}
			
			const listCartBtns = document.getElementsByClassName('btn_viewCart');
			for(const cartBtn of listCartBtns){
				cartBtn.addEventListener('click',function(){
					var loginUser = "${loginUser.userNum}";
					if(loginUser == ""){
						alert('로그인 후 이용해주세요');
					}else{
	    				$.ajax({
	    		    		url: '${contextPath}/insertCart.sh',
				    		data: {userNum : loginUser,
			    				proNum: $(this).siblings()[0].value,
			    				cartQuantity : 1},
	    	    			success:(data)=>{
	    	    				if(data == 'YES'){
	    	    					alert('이미 장바구니에 있는 상품입니다');
	    	    				}else{
		    	    				alert('상품이 장바구니에 추가되었습니다.');
	    	    				}
	    	    			}
	    				})
					}
				});
			}
			
			//=주희==------------------------------------------------------------------------------------------
	        $('#bn_navbar-search-input_1').on('keyup', ()=>{
				console.log($('#bn_navbar-search-input_1').val());
				$.ajax({
					url:'${ contextPath }/searchCategory.su',
					data: {search:$('#bn_navbar-search-input_1').val()},
					success:(data)=>{
						console.log(data);
						
						const div = document.getElementById('cate');
						
						div.innerHTML = '';
						
						for(const d of data){
							const content = document.createElement("div");
							
							content.setAttribute('class', 'col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables');
							
							content.innerHTML = '<div class="featured__item"><div class="featured__item__pic set-bg" style="height:165px;text-align:center;">'+
												'<input type="hidden" value="'+ d.cateNum +'"><p>'+ d.cateName +'</p>'+
												'</div></div>';
												
							div.append(content);
						}
					},
					error: (data)=>{
						console.log(data);
					}
				});
			});
	        
	        const Allcategory = document.getElementsByClassName("featured__item__pic set-bg");
	        
	        $(document).on("click", ".featured__item__pic.set-bg", function(){
	                console.log(this);
	                const cateNum = this.children[0].value;
	                const cateName = this.children[1].innerText;
	                console.log(cateNum);
	                console.log(cateName);
	                
	                location.href = '${contextPath}/selectCategory.su?cateName='+cateName+'&cateNum='+cateNum;
	        });

	        
		}
	</script> 

</body>

</html>