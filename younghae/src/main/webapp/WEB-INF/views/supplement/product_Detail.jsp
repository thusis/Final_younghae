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
        
       
       
  	  .star {
	    position: relative;
	    font-size: 2rem;
	    color: #ddd;
	  }
	  
	  .star input {
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    left: 0;
	    opacity: 0;
	    cursor: pointer;
	  }
	  
	  .star span {
	    width: 0;
	    position: absolute; 
	    left: 0;
	    color: yellow;
	    overflow: hidden;
	    pointer-events: none;
	  }
	  
	  .btn.btn-secondary.trend{
	  	cursor: inherit;
	  }
    </style>
</head>

<body>

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
<!--                         <div class="float-right" style="font-size: 150%; color: #24E082;"> -->
<!--                             <i class="bi bi-bookmark-plus-fill"></i> -->
<!--                         </div> -->
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            &nbsp;<span id="starIn">0</span>점
                        </div>
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
                                    <span id="rcount">(0)</span></a>
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
                                                <img src="resources/img/product_details/${ product.proNum }_1.png" style="padding-left: 150px; height: 1250px; width: 80%;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
<!--                                 리뷰 공간 -->
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
   		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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
										</div>
										<div class="d-inline">
											<div class="d-inline" name="reviewName" >
												<label
													style="font-size: 130%; font-weight: 800; padding-top: 10%; margin-left: 5%; float:left; width: 100%">${ product.proName }</label>
												<br><br><br><br><br><br><br>
												<div class="product__details__rating ml-3"
													style="font-size: 130%; display: inline; margin: 5%; color: rgb(236, 236, 55); text-align: left;">
													<span style="color: black; margin-right: 1.5%;">별점</span> 
												    <span class="star" style="display: inline-block;">
												        ★★★★★
												        <span>★★★★★</span>
												        <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
												    </span>
													<output for="star-input" style="display: inline-block;">
														<b id="rating" name="rating">0</b>점
														<input id="rateIn" type="hidden" name="rvStar" value="0">
													</output>
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
												<textarea name="rvContent" id="rvContent"
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
	<div id="myUpdateModal" class="modal">
		<div class="modal-content" style="width:65%;">
            <span class="close" style="align-content: right; padding-left:95%;">&times;</span>
            <div class="container">
                <div class="row g-0 text-center">
                    <div class="col-lg-12 col-md-12">
                        <div class="product__details__pic">
                            <div style="border: 2px solid #24E082; border-radius: 5em;">
								<form action="${ contextPath }/updateReview.su" method="post" id="updateReviewFrom" enctype="multipart/form-data">
									<input type="hidden" id="check" name="check" value="">
									<div class="row" style="margin-left: 5%; margin-top:3%; padding-right: 0px;  margin-bottom: -5%;">
										<div class="d-inline" name="reviewImg" style="margin-right: -20%;">
											<img src="${ product.proImage }"
												style="border: 1px solid #24E082; border-radius: 5%; margin: 1%; height: 80%; width: 55%; float: left; ">
												<input type="hidden" name="proNum" value="${ product.proNum }">
												<input type="hidden" name="userNum" value="${ loginUser.userNum }">
										</div>
										<div class="d-inline">
											<div class="d-inline" name="reviewName" >
												<label
													style="font-size: 130%; font-weight: 800; padding-top: 10%; margin-left: 5%; float:left; width: 100%">${ product.proName }</label>
												<br><br><br><br><br><br><br>
												<div class="product__details__rating ml-3"
													style="font-size: 130%; display: inline; margin: 5%; color: rgb(236, 236, 55); text-align: left;">
													<span style="color: black; margin-right: 1.5%;">별점</span> 
												    <span class="star update" style="display: inline-block;">
												        ★★★★★
												        <span>★★★★★</span>
												        <input type="range" oninput="drawStar1(this)" value="1" step="1" min="0" max="10">
												    </span>
													<output for="star-input" style="display: inline-block;">
														<b id="updaterating" name="rating">0</b>점
														<input id="updaterateIn" type="hidden" name="rvStar" value="0">
													</output>
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
													<button type="button"  id="updateBtn"
														style="text-align: center; height: 50px; width: 20%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;">리뷰
														수정</button>
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

	<input type="hidden" name="userNum" value="userNum">
	<script>
		 // 별점
	    const drawStar = (target) => {
		    document.querySelector('.star span').style.width = target.value * 10 + '%';
	        const rate = document.getElementById('rating');
	        rate.innerText = target.value/2;
	        
	        const rateIn = document.getElementById('rateIn');
	        rateIn.value = target.value/2;
	        
// 	        console.log(rateIn.value);
		}
	    
	    const drawStar1 = (target) => {
		    document.querySelector('.star.update span').style.width = target.value * 10 + '%';
	        const rate = document.getElementById('updaterating');
	        rate.innerText = target.value/2;
	        
	        const rateIn = document.getElementById('updaterateIn');
	        rateIn.value = target.value/2;
	        
// 	        console.log(rateIn.value);
		}
	    
        window.onload=()=>{
        	// 로그인 정보 가져오기
        	var login = "${ loginUser }";
    		var loginNum = "${ loginUser.userNum }";
    		
	        // 모달 가져오기
	        var modal = document.getElementById("myModal");
	        var updateModal = document.getElementById("myUpdateModal");
	        
	//         console.log($('#goReviewWrite').find('button').attr('id'));
	        
	        var btn = document.getElementById("modalBtn");
	        
	        if(${ loginUser ne null}){
		        // 리뷰쓰러가기 버튼
		        btn.onclick = function () {
		        	console.log("리뷰쓰러가기 버튼");
		        	
		        	// 처음쓰는 사용자 체크하고 넘어가는 곳
		        	
		            modal.style.display = "block";
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
	        
            // 파일 이름 등록
            $('#file').on('change', function(){
                var fileName = $("#file").val();
                $(".upload-name").val(fileName);
            });
            
            // 리뷰 작성 폼
            const form = document.getElementById('reviewFrom');
            document.getElementById('writeBtn').addEventListener('click', ()=>{
				 const file = document.getElementById('file'); 
				 console.log(file);
				 form.submit();
            });
         	
            // 댓글 리스트 가져오기
            $.ajax({
	        	url:'${ contextPath }/reviewList.su',
	        	data: {proNum: ${product.proNum}},
	        	success:(data)=>{
	        		
	        		const div = document.getElementById('tabs-2');
	        		div.innerHTML =  '';
	        		
	        		const count = document.getElementById('rcount');
        			const starIn = document.getElementById('starIn');
        			const rateIn = document.getElementById('rateIn');
        			
	        		if(data != null){
	        			var sum = 0;
	        			var a = 0;
	        			
	        			count.innerText = '(' + data.length + ')'; 
	        		
	        			for(const r of data){
		        			const form = document.createElement("div");
		        			
		        			sum += r.rvStar;
		        			a = sum/data.length;
		 					
		        			starIn.innerText = Math.floor(a*10)/10;
		        			rateIn.value = Math.floor(a*10)/10;
		            		
		            		var first = "";
		            		var loginCheck = "";
		            		var imageYN = "";
		            		
		            		first = '<br><br><div class="product__details__quantity_1" id="reviewDetail"  style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">'+
		            				'<div class="row" style="margin-left: 10px;"><div id="reviewImg" style="float: left; padding-right: -20%;">'+'<input type="hidden" id="usernum" name="userNum" value="'+ r.userNum +'">'+
		            				'<img src="resources/img/profile_yh.png" style="height: 70px; width: 70px; margin-top: 10%;"></div>'+
		            				'<div id="reviewNickName" style="float: left; padding-top: 3.5%; padding-left: 1%;"> <p style="font-weight: 600;">'+ r.userNickname + '</p></div>' +
		            				'<div class="product__details__rating" style="float: left; padding-top: 3.5%; padding-left: 20%;">'+
		            				'<i class="fa fa-star" style="color: rgb(247, 247, 75); font-size: 130%;"></i></div>'+
		            				'<div id="reviewRank star" style="float: left; padding-top: 3.5%; padding-left: 1%;"> <p style="color: black; font-size: 130%;">'+ r.rvStar +'</p></div>';
		            				
  							loginCheck = '<div class="product__details__rating 1" style="float: left; margin-top: 3.2%; margin-left: 5%;">'+
		            					 '<i name="reIcon" class="bi bi-hand-thumbs-up" style="color: rgb(0, 0, 0); font-size: 150%;"></i></div>'+
		            					 '<input type="hidden" name="rvNum" value="${ r.rvNum }">'
		            					 '<div name="reviewRank" style="float: left; padding-top: 3.5%; padding-left: 1%;">'+
		            					 '<p style="color: black; font-size: 130%;">'+ r.rvRecommend +'</p></div></div>';
		            		
		            		imageYN = '<div class="row" style="margin-top: 1%; padding-left: 2%;">';
		            		
		            		if(r.image != "없음"){
			            		imageYN = '<div name="reviewContent" class="col-9 text-left" >'+ r.rvContent +'</div>'+
			            				  '<div name="reviewImg" class="col-3"><img src="resources/uploadFiles/'+ r.image +'" style="height: 200px; width: 200px; float: right; margin-right: 3%; margin-top: -10%;" class=".img-fluid"></div><br><br>';
		            		}else{
		            			imageYN = '<div name="reviewContent" class="col-12 text-left" style="padiing-right: 5%;">'+ r.rvContent +'</div><br><br>';
		            		}
		            		
		            				
		            		form.innerHTML = first + loginCheck + imageYN;		
		            		
                            div.append(form);
                             
                            $.ajax({
             	            	url:'${ contextPath }/rateUpdate.su',
             		        	data: {proGrade: document.getElementById('starIn').innerText, proNum: ${ product.proNum }},
             		        	success:(data)=>{
//              		        		console.log(data);
             		        	},
             		        	error:(data)=>{
             		        		console.log(data);
             		        	}
             	            });
	        			}	
		        		
	        			const update  = document.getElementsByClassName('text-left');
		        		
			            for(const up of update){
			            	up.addEventListener('click' ,function(){
			            		// 별점
// 			            		console.log($(this).children().children()[4].innerText);
			            		console.log($(this).parent().children().children()[4].innerText);
			            		
			            		// 유저넘버
// 			            		console.log($(this).children().children()[0].value);
			            		console.log($(this).parent().children().children()[0].value);
			            		
// 			            		리뷰 내용
// 			            		console.log($(this).children().siblings()[6].innerText);
			            		console.log($(this).parent().children().siblings()[6].innerText);
			            		
			            		
			            		
			            		if(login != null){
				            		if( loginNum == $(this).parent().children().children()[0].value ){
			            				updateModal.style.display = "block";
				            			
	// 				            			닫기 버튼
				            	        var upspan = document.getElementsByClassName("close")[1];
				            	        
				            	        upspan.onclick = function () {
				            	        	updateModal.style.display = "none";
				            	        }
				            	        
				            	    	// modal 밖에 클릭했을 때 모달창 꺼지는 스크립트
				            	        window.onclick = function (event) {
				            	            if (event.target == modal) {
				            	                updateModal.style.display = "none";
				            	            }
				            	        }
				            	    	
				            	        const rating = document.getElementById("updaterating");
				            	        rating.innerText = $(this).parent().children().children()[4].innerText;
				            	        
										const content = document.getElementById('urvContent');
			            	        	content.value = $(this).parent().children().siblings()[6].innerText;
				            		}
			            		}
			            	});
			            }
			            if(login != null){
			            	const reco = document.getElementsByClassName('product__details__rating 1');
			                for(var re of reco){
			    	            re.addEventListener('click', function(){
			    	            	console.log(this);
			    	            	var check = '';
			    	            	
			    	            	if($(this).attr('class') != "bi bi-hand-thumbs-up-fill"){
			    	            		console.log($(this).parent);
				    	            	$(this).attr('class', 'bi bi-hand-thumbs-up-fill');
			    	            		check = 'R';
			    	            		console.log("눌렀담");
			    	            	}else{
			    	            		$(this).attr('class','bi bi-hand-thumbs-up');
			    	            		check = 'D';
			    	            		console.log("취소했담");
			    	            	}
			    	            	
// 			    	            	console.log(this);
			    	            	// rvNum
			    	            	console.log($(this).parent().children()[7].value);
// 			    	            	$.ajax({
// 			    	            		url: '${contextPath}/reco.su',
// 			    	            		data: {rvNum: $(this).parent().children()[7].value ,userNum: loginNum,
// 			    	            				check: check},
// 			    	            		success:(data)=>{
			    	            			
// 			    	            		},
// 			    	            		error:(data)=>{
// 			    	            			console.log(data);
// 			    	            		}
// 			    	            	});
			    	            });
			                }
			            }
	        		}
	        	},
	        	error: (data)=>{
	        		console.log(data);
	        	}
 	    	});
            
            const upform = document.getElementById('updateReviewFrom');
            document.getElementById('updateBtn').addEventListener('click', ()=>{
				 const file = document.getElementById('file'); 
				 console.log(file.value);
				 
				 var check = document.getElementById('check');
				 if(file.value != null){
					 check.value="N";
				 }else{
					 check.value="Y";
				 }
				 console.log(check);
// 				 upform.submit();
            });
            
            
            
        }
        
        
    </script>

</body>
</html>