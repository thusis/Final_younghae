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
        <link rel="icon" href="resources/img/younghae_icon.png"/>
	    <title>쇼핑 | 쇼핑 메인페이지</title>

	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"/>
    <style>
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

        .btn_viewZzim{
        	background-color : white;
        	border-radius : 0.2rem;
            border: 1px solid rgb(0, 123, 255);
            color: rgb(0, 123, 255);
            font-size: 10px;
            width: 80px;
            height: 30px;
        }
        
        .btn_viewZzim:hover{
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
        
        .featured__controls>ul>li>a>img:hover{
        	border: 3px solid #FD9F28;
        	color : #FD9F28;
        	border-radius: 0.5em;
        }
    </style> 
    <link rel="stylesheet" href="resources/css/hj_style.css" type="text/css">  
</head>


<body>


   <div class="container2">
      <div class="main-view">
         <ul>
            <li><a href="${contextPath }/birthEvent.ev"><img src="resources/img/shopping/review.png" style="width:100%; height:350%;"/></a></li>
            <li><a href="${contextPath }/reviewEvent.ev"><img src="resources/img/shopping/attend.png" style="width:100%; height:350%;" /></a></li>
            <li><a href="${contextPath }/attendanceEvent.ev"><img src="resources/img/shopping/birthday.png" style="width:100%; height:350%;"/></a></li>
         </ul>
      </div>
   </div>

    <!-- Product Section Begin -->
    <section class="product spad" style="margin-top: -5%;">
        <div class="container" >
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section" style="padding-left: 25%;">
							<input type="text" class="form-control"
								id="searchInput" placeholder="궁금한 영양 성분 검색"
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
									<c:forEach items="${cateTrend }" var="ct" end="3">
										<button type="button" class="btn btn-secondary trend"
											style="background-color: #24E082; border: none; border-radius: 30px; height: 28px; width: auto; font-weight: 600; font-size: 12px;">${ ct }</button>
										&nbsp;&nbsp;&nbsp;
									</c:forEach>
								</div>
							</div>
						</div>					
					</div>
				</div>
			</div><br><br><br><br>
 
			<!-- 전체 상품 섹션-->
			<div id="searchList">
            <div class="row">
                <p class="col" style="color: #24E082; font-weight: bold; font-size: 30px; display: inline;">전체 상품</p><br><br><br>
                <button class="text-end" style="color: #FD9F28; font-weight: bold; font-size: 15px; float:right; background-color: #ffffff; border: none;" onclick="location.href='${contextPath}/allView.sh'">더보기</button>
                <br>
                <div class="col-lg-12">
                    <div class="featured__controls">
                        <ul>
                            <li><a href="${ contextPath }/allView.sh"><img src="resources/img/categories/cate_all.png" class="cate_icon"><br>전체</a></li>
                            <li><a href="${ contextPath }/cateView.sh?proEffect=눈 건강"><img src="resources/img/categories/cate_eye.png" class="cate_icon"><br>눈 건강</a></li>
                            <li><a href="${ contextPath }/cateView.sh?proEffect=피부"><img src="resources/img/categories/cate_skin.png" class="cate_icon"><br>피부 건강</a></li>
                            <li><a href="${ contextPath }/cateView.sh?proEffect=항산화"><img src="resources/img/categories/cate_fatigue.png" class="cate_icon"><br>피로감</a></li>
                            <li><a href="${ contextPath }/cateView.sh?proEffect=장 건강"><img src="resources/img/categories/cate_intestine.png" class="cate_icon"><br>장 건강</a></li>
                            <li><a href="${ contextPath }/cateView.sh?proEffect=간 건강"><img src="resources/img/categories/cate_liver.png" class="cate_icon"><br>간 건강</a></li>
                            <li><a href="${ contextPath }/cateView.sh?proEffect=관절"><img src="resources/img/categories/cate_born.png" class="cate_icon"><br>관절 건강</a></li>
                            <li><a href="${ contextPath }/cateView.sh?proEffect=임산부"><img src="resources/img/categories/cate_pregnent.png" class="cate_icon"><br>임산부 </a></li>
                        </ul>
                    </div>
                </div>
            </div>
			
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
                         	<c:if test="${ empty loginUser }">
	                            <button class="btn btn_viewZzim"><i class="bi bi-heart"></i>&nbsp;&nbsp;&nbsp;찜하기</button>
                         	</c:if>
                         	<c:if test="${ !empty loginUser }">
                     			<c:if test="${ i.check eq 'Y'}">
		                            <button class="btn btn_viewZzim"><i class="bi bi-heart-fill"></i>&nbsp;&nbsp;&nbsp;찜하기</button>
                               	</c:if>
                               	<c:if test="${ i.check ne 'Y' }">
		                            <button class="btn btn_viewZzim"><i class="bi bi-heart"></i>&nbsp;&nbsp;&nbsp;찜하기</button>
                               	</c:if>
                         	</c:if>
                            <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;${i.reviewCount }</button>
                        </div>
	                </div>
                </c:forEach>
            </div><br><br>
           
            <!-- /전체 상품 섹션-->
            
            <!-- 스테디셀러 영양제 섹션 -->
            <div class="row" style="margin-top:2rem;">
                <p class="col" style="color: #24E082; font-weight: bold; font-size: 30px; display: inline;">베스트셀러</p>
                <button class="text-end" style="color: #FD9F28; font-weight: bold; font-size: 15px; float:right; background-color: #ffffff; border: none;" onclick="location.href='${contextPath}/bestsellerView.sh'">더보기</button>
            </div>

			<div class="row">
               	<c:forEach items="${ bestsellerList }" end="4" var="i">
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
                            <c:if test="${ empty loginUser }">
	                            <button class="btn btn_viewZzim"><i class="bi bi-heart"></i>&nbsp;&nbsp;&nbsp;찜하기</button>
                         	</c:if>
                         	<c:if test="${ !empty loginUser }">
                     			<c:if test="${ i.check eq 'Y'}">
		                            <button class="btn btn_viewZzim"><i class="bi bi-heart-fill"></i>&nbsp;&nbsp;&nbsp;찜하기</button>
                               	</c:if>
                               	<c:if test="${ i.check ne 'Y' }">
		                            <button class="btn btn_viewZzim"><i class="bi bi-heart"></i>&nbsp;&nbsp;&nbsp;찜하기</button>
                               	</c:if>
                         	</c:if>
                            <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;${i.reviewCount }</button>
                        </div>
	                </div>
                </c:forEach>
            </div><br><br>

            <!-- /스테디셀러 영양제 섹션 --> 

            <!-- 실시간트렌드 섹션 -->
            
            <div class="row" style="margin-top:2rem;">
                <p class="col" style="color: #24E082; font-weight: bold; font-size: 30px; display: inline;">실시간 트렌드</p>
                <button class="text-end" style="color: #FD9F28; font-weight: bold; font-size: 15px; float:right; background-color: #ffffff; border: none;" onclick="location.href='${contextPath}/trendView.sh'">더보기</button>
            </div>
            
			<div class="row">
               	<c:forEach items="${ trendList }" end="4" var="i">
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
	                            <h6 style="margin-top : 1rem; color: #1a19197e; height: 2rem; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${ i.proEffect }</h6>
	                        </div>
	                    </div>
                        <div>
                         	<input type="hidden" class="proNum" value="${ i.proNum }">
                         	<c:if test="${ empty loginUser }">
	                            <button class="btn btn_viewZzim"><i class="bi bi-heart"></i>&nbsp;&nbsp;&nbsp;찜하기</button>
                         	</c:if>
                         	<c:if test="${ !empty loginUser }">
                     			<c:if test="${ i.check eq 'Y'}">
		                            <button class="btn btn_viewZzim"><i class="bi bi-heart-fill"></i>&nbsp;&nbsp;&nbsp;찜하기</button>
                               	</c:if>
                               	<c:if test="${ i.check ne 'Y' }">
		                            <button class="btn btn_viewZzim"><i class="bi bi-heart"></i>&nbsp;&nbsp;&nbsp;찜하기</button>
                               	</c:if>
                         	</c:if>
                            <button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;${i.reviewCount }</button>
                        </div>
	                </div>
                </c:forEach>
            </div><br><br>
            <!-- /실시간트렌드 섹션 --> 
            </div>
        </div>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   	<script>
		window.onload =()=>{
			const dives = document.getElementsByClassName('product__item');
			for(const div of dives){
				div.addEventListener('click',function(){
					console.log($(this).siblings().children()[0].value);
					const proNum = $(this).siblings().children()[0].value;
					location.href='${contextPath}/supplementDetail.sh?proNum=' + proNum;
				});
			}
			
// 			const listCartBtns = document.getElementsByClassName('btn_viewZzim');
// 			for(const cartBtn of listCartBtns){
// 				cartBtn.addEventListener('click',function(){
// 					var loginUser = "${loginUser.userNum}";
// 					if(loginUser == ""){
// 						alert('로그인 후 이용해주세요');
// 					}else{
// 	    				$.ajax({
// 	    		    		url: '${contextPath}/insertCart.sh',
// 				    		data: {userNum : loginUser,
// 			    				proNum: $(this).siblings()[0].value,
// 			    				cartQuantity : 1},
// 	    	    			success:(data)=>{
// 	    	    				if(data == 'YES'){
// 	    	    					alert('이미 장바구니에 있는 상품입니다');
// 	    	    				}else{
// 		    	    				alert('상품이 장바구니에 추가되었습니다.');
// 	    	    				}
// 	    	    			}
// 	    				})
// 					}
// 				});
// 			}
			
	        $('#searchInput').on('keyup', ()=>{
				$.ajax({
					url:'${ contextPath }/searchCategory.sh',
					data: {search:$('#searchInput').val()},
					success:(data)=>{
						console.log(data);
						
						const div = document.getElementById('searchList');
						div.innerHTML = '';
						const row = document.createElement("div");
						row.setAttribute('class', 'row');
						row.setAttribute('style', 'margin-bottom:5rem;');
						row.innerHTML = '<p class="col-6" style="color: #24E082; font-weight: bold; font-size: 30px;">검색 결과</p>'+
 						                '<button id="beforeBtn" class="col-6 text-end" style="color: #FD9F28; font-weight: bold; font-size: 15px; float:right; background-color: #ffffff; border: none; text-align:right;">이전페이지</button>';
						div.append(row);
				        document.getElementById('beforeBtn').addEventListener('click',function(){
				        	location.href = '${contextPath}/shoppingMain.sh';
				        });
						
						for(const c of data){
							const content = document.createElement("div");
							content.setAttribute('class', 'col-lg-3 col-md-4 col-sm-6');
							content.setAttribute('style', 'width: 50px;');
							
							content.innerHTML = '<div class="product_search_item" style="margin-bottom: -10px; cursor: pointer;">'+
							                        '<div class="product__item__pic set-bg" style="margin-bottom: -40px;">'+
							                            '<img src="'+c.proImage+'"style="margin-top: 30px;">'+
							                        '</div>'+
							                        '<div class="product__item__text" style="text-align: left;">'+
							                            '<span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;'+c.proGrade+'</span>'+
							                            '<h6 style="display: inline-block;">'+c.proCompany+'</h6>'+
							                            '<h5 style="height: 2rem;">'+c.proName+'</h5>'+
							                            '<h5 style="margin-top : 1rem;" id="price">'+ c.formatPrice +'원</h5>'+
							                            '<h6 style="margin-top : 1rem; color: #1a19197e; height: 2rem; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'+c.proEffect+'</h6>'+
							                        '</div>'+
								                '</div>'+
							                    '<div id="djkf">'+
						                         	'<input type="hidden" class="proNum" value="'+c.proNum+'">'+
// 						                            '<button class="btn btn_viewZzim"><i class="bi bi-heart"></i>&nbsp;&nbsp;&nbsp;찜하기</button>&nbsp;&nbsp;'+
// 						                            '<button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>'+
								                '</div>';
							row.append(content);
							const searchDives = document.getElementsByClassName('product_search_item');
							for(const divs of searchDives){
								divs.addEventListener('click',function(){
									const proNum = $(this).siblings().children()[0].value;
									location.href='${contextPath}/supplementDetail.sh?proNum=' + proNum;
								});
							}
						}
					},
					error: (data)=>{
						console.log(data);
					}
				});
			});
	        
	        var cateTrend = document.getElementsByClassName('trend');
	        for(const cateBtn of cateTrend){
	        	cateBtn.addEventListener('click',function(){
	        		console.log(this.innerText);
	        		$.ajax({
						url:'${ contextPath }/searchIngredient.sh',
						data: {search: this.innerText },
						success:(data)=>{
							console.log(data);
							
							const div = document.getElementById('searchList');
							div.innerHTML = '';
							const row = document.createElement("div");
							row.setAttribute('class', 'row');
							row.setAttribute('style', 'margin-bottom:5rem;');
							row.innerHTML = '<p class="col-6" style="color: #24E082; font-weight: bold; font-size: 30px;">검색 결과</p>'+
	 						                '<button id="beforeBtn" class="col-6 text-end" style="color: #FD9F28; font-weight: bold; font-size: 15px; float:right; background-color: #ffffff; border: none; text-align:right;">이전페이지</button>';
							div.append(row);
					        document.getElementById('beforeBtn').addEventListener('click',function(){
					        	location.href = '${contextPath}/shoppingMain.sh';
					        });
							
							for(const c of data){
								const content = document.createElement("div");
								content.setAttribute('class', 'col-lg-3 col-md-4 col-sm-6');
								content.setAttribute('style', 'width: 50px;');
								
								content.innerHTML = '<div class="product_search_item" style="margin-bottom: -10px; cursor: pointer;">'+
								                        '<div class="product__item__pic set-bg" style="margin-bottom: -40px;">'+
								                            '<img src="'+c.proImage+'"style="margin-top: 30px;">'+
								                        '</div>'+
								                        '<div class="product__item__text" style="text-align: left;">'+
								                            '<span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;'+c.proGrade+'</span>'+
								                            '<h6 style="display: inline-block;">'+c.proCompany+'</h6>'+
								                            '<h5 style="height: 2rem;">'+c.proName+'</h5>'+
								                            '<h5 style="margin-top : 1rem;" id="price">'+ c.formatPrice +'원</h5>'+
								                            '<h6 style="margin-top : 1rem; color: #1a19197e; height: 2rem; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'+c.proEffect+'</h6>'+
								                        '</div>'+
									                '</div>'+
								                    '<div id="djkf">'+
							                         	'<input type="hidden" class="proNum" value="'+c.proNum+'">'+
// 							                            '<button class="btn btn_viewZzim"><i class="bi bi-heart"></i>&nbsp;&nbsp;&nbsp;찜하기</button>&nbsp;&nbsp;'+
// 							                            '<button class="btn btn_comment"><i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193</button>'+
									                '</div>';
								row.append(content);
								const searchDives = document.getElementsByClassName('product_search_item');
								for(const divs of searchDives){
									divs.addEventListener('click',function(){
										const proNum = $(this).siblings().children()[0].value;
										location.href='${contextPath}/supplementDetail.sh?proNum=' + proNum;
									});
								}
							}
						},
						error: (data)=>{
							console.log(data);
						}
					});
	        		
	        		
	        	})
	        }
	        
	        const viewZzim = document.getElementsByClassName('btn_viewZzim');
	        for(const zzim of viewZzim){
	        	zzim.addEventListener('click',function(){
	        		console.log($(this).children());
	        		var loginUser = "${loginUser.userNum}";
					if(loginUser == ""){
						alert('로그인 후 이용해주세요');
					}else{
	                	var check = 'N';
	                    if($(this).children().attr("class") != "bi bi-heart-fill"){
	                        // 스크랩 버튼 활성화 됐을 때
	                        $(this).children().attr("class", "bi bi-heart-fill");
	                        check = 'Y';
	                    }else{
	                        // 스크랩 버튼 비활성화
	                       $(this).children().attr("class", "bi bi-heart");
	                        check = 'N';
	                    }
	    				$.ajax({
	    		    		url: '${contextPath}/insertZzim.sh',
				    		data: {userNum : loginUser,
			    				proNum: $(this).siblings()[0].value,
			    				check: check},
	    	    			success:(data)=>{
	    	    				console.log(data);
	    	    			},
	    	    			error:(data)=>{
	    	    				console.log(data);
	    	    			}
	    				})
					}
	        	})
	        }
	        
		}
	</script> 

</body>

</html>