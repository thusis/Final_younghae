<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
/*    		첨부파일 */
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
                                src="${ product.proImage }" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3 class="d-inline">${ product.proName }</h3>
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
                                    <img src="resources/img/supplement/ingredient.png" style="height: 40px;">
                                </div>
                                <label style="font-size: 115%; font-weight: 800;">원재료 및 함량</label>
                            </div>
                            <div class="text-left pl-5">
                                <p>${ product.proIngredient }</p>
                            </div>
                            <div name="mouth">
                                <div class="d-inline" name="ingredientImg">
                                    <img src="resources/img/supplement/mouth.png" style="height: 50px;">
                                </div>
                                <label style="font-size: 115%; font-weight: 800;">복용방법</label>
                            </div>
                            <div class="text-left pl-5">
                            	<c:set var="intake" value="${ fn:split(product.proIntake, '/')}"/>
                                <p>총 ${ intake[1] },  ${ intake[3] } ${ intake[0] } 복용하세요.</p>
                            </div>
                        </div>
                        <div class="product__details__quantity">
                            <div class="pl-5">
                            	<c:set var="effect" value="${ fn:split(product.proEffect, ',')}"/>
		                            <c:forEach items="${ effect }"  var="e">
		                                <button type="button" class="btn btn-secondary trend"
		                                    style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px; margin-top: 10px;">${ e }</button>
		                                &nbsp;&nbsp;&nbsp;
		                            </c:forEach>
                            </div>
                        </div>
                        <br><br><br><br><br><br><br><br>
                    </div>
                </div>

                <!-- 구매하러가기  버튼 -->
                <c:if test="${ product.proSaleStatus eq 'Y' }">
	                <div name="goShop" style="margin-left: 
	                <c:if test='${ loginUser ne null }'>25%</c:if>
	                <c:if test='${ loginUser eq null }'>45%</c:if>
	                ; margin-top: 2%;">
	                    <button type="button"
	                        style="display: inline; margin-left: -25%; height: 170%; width: 200%; background-color: #FD9F28; border: none; border-radius: 5em; color: #ffffff;">
	                        구매하러 가기</button>
	                </div>
                </c:if>
                
                <!-- 로그인 한 상태로 리뷰를 쓴 내용이 있으면 수정하기로 변환 -->
                <c:if test="${ loginUser ne null }">
	                <div id="goReviewWrite" style="margin-left: 25%; margin-top: 2%;">
		                    <button type="button" name="reviewWriteBtn"
		                        style="margin-left: -25%; height: 170%; width: 250%; background-color: #FD9F28; border: none; border-radius: 5em; color: #ffffff;"
		                        id="modalBtn">리뷰 쓰기</button>
	                </div>
                </c:if>
                
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
                                                <img src="resources/img/supplement/body.png" style="height: 60px;">
                                            </div>
                                            <label style="font-size: 115%; font-weight: 900;">영양정보</label>
                                        </div>
                                        <div class="text-left pl-5">
                                            <div class="d-inline" name="ingredientImg">
                                                <img src="resources/img/product_details/${ product.proNum }_1.png" style="height: 300px;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
<!--                                     <div class="product__details__quantity" id="reviewDetail" -->
<!--                                         style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;"> -->
<!--                                             <div id="reviewImg" style="float: left; padding-right: -20%;"> -->
<!--                                                 <i class="bi bi-person-circle" -->
<!--                                                     style="font-size: 350%; color: #24E082;"></i> -->
<!--                                             </div> -->
<!--                                             <div id="reviewNickName" -->
<!--                                                 style="float: left; padding-top: 3.5%; padding-left: 1%;"> -->
<!--                                                 <p style="font-weight: 600;">집가고싶당</p> -->
<!--                                             </div> -->
<!--                                             <div class="product__details__rating" -->
<!--                                                 style="float: left; padding-top: 3.5%; padding-left: 20%;"> -->
<!--                                                 <i class="fa fa-star" -->
<!--                                                     style="color: rgb(247, 247, 75); font-size: 130%;"></i> -->
<!--                                             </div> -->
<!--                                             <div id="reviewRank" -->
<!--                                                 style="float: left; padding-top: 3.5%; padding-left: 1%;"> -->
<!--                                                 <p style="color: black; font-size: 130%;">4.8</p> -->
<!--                                             </div> -->
<!--                                             <div class="product__details__rating" -->
<!--                                                 style="float: left; padding-top: 3.2%; padding-left: 5%;"> -->
<!--                                                 <i class="bi bi-hand-thumbs-up-fill" -->
<!--                                                     style="color: rgb(0, 0, 0); font-size: 130%;"></i> -->
<!--                                             </div> -->
<!--                                             <div id="reviewRank" -->
<!--                                                 style="float: left; padding-top: 3.5%; padding-left: 1%;"> -->
<!--                                                 <p style="color: black; font-size: 130%;">10</p> -->
<!--                                             </div> -->
<!--                                             <div id="reviewImg" -->
<!--                                                 style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;"> -->
<!--                                                 <img src="resources/img/product/details/product-details-1.jpg" class=".img-fluid"> -->
<!--                                             </div> -->
<!--                                             <div id="reviewContent" class="text-left" style="padding-top: 9%;"> -->
<!--                                                 야채냠 -->
<!--                                         	</div> -->
<!--                                     </div> -->
                                    <br><br>
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
        <div class="modal-content" style="width:65%;">
            <span class="close" style="align-content: right; padding-left:95%;">&times;</span>
            <div class="container">
                <div class="row g-0 text-center">
                    <div class="col-lg-12 col-md-12">
                        <div class="product__details__pic">
                            <div style="border: 2px solid #24E082; border-radius: 5em;">
								<form action="${ contextPath }/insertReview.su" method="post" id="reviewFrom" enctype="multipart/form-data">
									<div class="row" style="margin-left: 5%; margin-top:3%; padding-right: 0px;  margin-bottom: -5%;">
										<div class="d-inline" name="reviewImg" style="margin-right: -20%;">
											<img src="${ product.proImage }"
												style="border: 1px solid #24E082; border-radius: 5%; margin: 1%; height: 80%; width: 55%; float: left; ">
												<input type="hidden" name="proNum" value="${ product.proNum }">
												<input type="hidden" name="userNum" value="${ loginUser.userNum }">
<%-- 												<input type="hidden" id="productNum" value="${ 유저번호 }"> --%>
										</div>
										<div class="d-inline">
											<div class="d-inline" name="reviewName" >
												<label
													style="font-size: 130%; font-weight: 800; padding-top: 10%; margin-left: 5%; float:left; width: 100%">${ product.proName }</label>
												<br><br><br><br><br><br><br>
												<div class="product__details__rating ml-3"
													style="font-size: 130%; display: inline; margin: 5%; color: rgb(236, 236, 55); text-align: left;">
													<span style="color: black; margin-right: 1.5%;">별점</span> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> 
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> 
														<i class="fa fa-star-half-o"></i>
<!-- 														별점 넣는거 필요 -->
												</div>
											</div>
										</div>
									</div>
									<div class="row" style="margin: 3%;">
										<div class="d-block" name="fileInput"
											style="width: 10%; padding-left: 2%;">
											<label
												style="padding-left: 3%; font-size: 110%; padding-top: 5%; font-weight: 800; color: #24E082;">첨부파일</label>
										</div>
										<div class="filebox" style="width: 65%; text-align: center;">
											<input class="upload-name" value="첨부파일" placeholder="첨부파일"
												readonly> <label for="file" style="display: inline;">파일찾기</label>
											<input type="file" id="file" name="file">
										</div>
									</div>
									<div class="row">
										<div class="col-11"
											style="margin-left: 3.5%; margin-bottom: 3%;">
											<div style="border: 2px solid #24E082; border-radius: 1em;"
												name="rvContent">
												<textarea name="rvContent" id="urvContent"
													style="border: none; margin: 1%; height: 200px; width: 97%;resize: none;"></textarea>
											</div>
											<div>
												<div name="writeReview"
													style="margin-left: 1.5%; margin-top: 2%;">
													<button type="button"  id="writeBtn"
														style="text-align: center; height: 50px; width: 20%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;">리뷰
														작성</button>
												</div>
											</div>
										</div>
									</div>
								</form>
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
										<img src="${ product.proImage }"
											style="border: 1px solid #24E082; border-radius: 5%; margin: 3%">
									</div>
									<div class="d-inline">
										<div class="d-inline ml-5" name="reviewName">
											<label
												style="font-size: 180%; font-weight: 800; padding-top: 10%;">${ product.proName }</label>
											<br> <br> <br> <br> <br> <br> <br>
											<div class="product__details__rating ml-5"
												style="font-size: 130%; display: inline; margin: 20%; color: rgb(236, 236, 55);">
												<span style="color: black; margin-right: 1.5%;">별점</span> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star-half-o"></i>
											</div>
										</div>
									</div>
								</div>
								<div class="row" style="margin: 3%;">
									<div class="d-block" name="fileInput"
										style="width: 10%; padding-left: 2%;">
										<label
											style="padding-left: 3%; font-size: 110%; padding-top: 5%; font-weight: 800; color: #24E082;">첨부파일</label>
									</div>
									<div class="filebox" style="width: 60%; text-align: center;">
										<input class="upload-name" value="첨부파일" placeholder="첨부파일"
											readonly> <label for="file" style="display: inline;">파일찾기</label>
										<input type="file" id="file">
									</div>
								</div>
								<div class="row">
									<div class="col-11"
										style="margin-left: 3.5%; margin-bottom: 3%;">
										<div style="border: 2px solid #24E082; border-radius: 1em;"
											name="reviewContentBorder">
											<textarea type="text" name="reviewContent"
												style="border: none; margin: 1%; height: 200px; width: 97%; border: 1px solid black; resize: none;"></textarea>
										</div>
										<div>
											<div name="writeReview"
												style="margin-left: 1.5%; margin-top: 2%;">
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
        
//         console.log($('#goReviewWrite').find('button').attr('id'));
        
        var btn = document.getElementById("modalBtn");
        
        if(${ loginUser ne null}){
	        // 리뷰쓰러가기 버튼
	        btn.onclick = function () {
	            modal.style.display = "block";
	            // updateModal.style.display = "block";
	        }
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
            
            const form = document.getElementById('reviewFrom');
            document.getElementById('writeBtn').addEventListener('click', ()=>{
				 const file = document.getElementById('file'); 
				 console.log(file);
				 form.submit();
            });
         	
            $.ajax({
	        	url:'${ contextPath }/reviewList.su',
	        	data: {proNum: ${product.proNum}},
	        	success:(data)=>{
	        		console.log(data);
	        		
	        		const div = document.getElementById('tabs-2');
	        		div.innerHTML =  '';
	        		if(data != null){
	        			
	        			for(const r of data){
		        			const form = document.createElement("div");
		        			
		        			if(r.image == "없음"){
		        				form.innerHTML  = '<br><div class="product__details__quantity" id="reviewDetail"  style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">'+
								  				  '<div id="reviewImg" style="float: left; padding-right: -20%;">'+
                  			  					  '<i class="bi bi-person-circle" style="font-size: 350%; color: #24E082;"></i></div>'+
                  			  					  '<div id="reviewNickName" style="float: left; padding-top: 3.5%; padding-left: 1%;"> <p style="font-weight: 600;">'+ r.userNickname +
                  			  					  '</p></div><div class="product__details__rating" style="float: left; padding-top: 3.5%; padding-left: 20%;">'+
					                  			  '<i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i></div>'+
					                  			  '<div id="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;"> <p style="color: black; font-size: 130%;">'+ r.rvStar +
					                  			  '</p></div><div class="product__details__rating" style="float: left; padding-top: 3.2%; padding-left: 5%;">'+ 
					                  			  '<i class="bi bi-hand-thumbs-up-fill" style="color: rgb(0, 0, 0); font-size: 130%;"></i>'+
					                  			  '</div><div id="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;"><p style="color: black; font-size: 130%;">10</p>'+
					                  			  '</div><div id="reviewContent" class="text-left" style="padding-top: 9%;">'+ r.rvContent +'</div></div><br><br>';
		        			}else{
		        				form.innerHTML  = '<br><div class="product__details__quantity" id="reviewDetail"  style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">'+
		        								  '<div id="reviewImg" style="float: left; padding-right: -20%;">'+
	                                			  '<i class="bi bi-person-circle" style="font-size: 350%; color: #24E082;"></i></div>'+
	                                			  '<div id="reviewNickName" style="float: left; padding-top: 3.5%; padding-left: 1%;"> <p style="font-weight: 600;">'+ r.userNickname +
	                                			  '</p></div><div class="product__details__rating" style="float: left; padding-top: 3.5%; padding-left: 20%;">'+
	                                			  '<i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i></div>'+
	                                			  '<div id="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;"> <p style="color: black; font-size: 130%;">'+ r.rvStar +
	                                			  '</p></div><div class="product__details__rating" style="float: left; padding-top: 3.2%; padding-left: 5%;">'+ 
	                                			  '<i class="bi bi-hand-thumbs-up-fill" style="color: rgb(0, 0, 0); font-size: 130%;"></i>'+
	                                			  '</div><div id="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;"><p style="color: black; font-size: 130%;">10</p>'+
	                                			  '</div><div id="reviewImg" style="height: 200px; width: 200px; float: right; margin-right: 1%; padding-top: 5%;">'+
	                                			  '<img src="resources/uploadFiles/'+r.image+'" class=".img-fluid"></div>'+
	                                			  '<div id="reviewContent" class="text-left" style="padding-top: 9%;">'+ r.rvContent +'</div></div><br><br>';
		        				
		        			}
                             div.append(form);
	        			}
	        		}else{
	        			
	        		}
	        	},
	        	error: (data)=>{
	        		console.log(data);
	        	}
 	    });
        }
        
        
    </script>

</body>
</html>