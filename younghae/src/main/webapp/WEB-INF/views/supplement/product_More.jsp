<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
            <link rel="icon" href="resources/img/younghae_icon.png"/>
	    	<title>영양제 | 제품 더보기</title>

<style>
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
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	<!-- Header Section End -->
	<div class="container">
		<div class="bn_index mt-5">
			<ul>
				<li>영양 성분 조회</li>
				<li><b>/</b></li>
				<li><a href="#">성분 이름</a></li>
				<li><b>/</b></li>
				<li><a href="#">영양제 더보기</a></li>
			</ul>
		</div>
	</div>

	<!-- Product Section Begin -->
	<section class="product spad" style="margin-top: -2%;">
		<div class="container">
			<div class="row row-cols-1">
				<div class="hero__search"
					style="float: left; position: relative; left: 1%;">
					<form action="#" style="width: 50%;">
						<div class="input-group mt-3">
							<label
								style="font-size: 180%; font-weight: 800; color: rgb(118, 128, 138); margin-right: 3%;">${ cateName }</label>
							<label
								style="font-size: 180%; font-weight: 800; color: #24E082; margin-right: 3%;">제품
								더보기</label>
						</div>
					</form>
				</div>
			</div>
			<br> <br>

			<div class="row">
				<c:forEach items="${ product }" var="pd">
					<div class="col-lg-2 col-md-4 col-sm-6" style="margin-right: 38px;">
						<div class="product__item" style="margin-bottom: -10px; cursor: pointer;">
							<div class="product__item__pic set-bg" style="margin-bottom: -40px;">
								<img src="${ pd.proImage }"  style="margin-top: 30px;">
							</div>
		             		<div class="product__item__text" style="text-align: left;">
                				<span style="float: right; font-size: 18px; margin-top: -1%;"><i class="fa-solid fa-star star"></i>&nbsp;&nbsp;${ pd.proGrade }</span>
               					<h6 style="display: inline-block;">${ pd.proCompany }</h6>
								<h5 style="height: 2rem;">${ pd.proName }</h5>
								<h5 style="margin-top : 1rem;" id="price"><fmt:formatNumber value="${ pd.proPrice }" type="number"/>원</h5>
								<h6 style="margin-top : 1rem; color: #1a19197e; height: 2rem; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"">${ pd.proEffect }</h6>
							</div>
						</div>
						<div>
							<input type="hidden" class="proNum" value="${ pd.proNum }">
							<c:if test="${ empty loginUser }">
								<button class="btn_viewZzim">
									<i class="bi bi-heart"></i>&nbsp;&nbsp;&nbsp;찜하기
								</button>
							</c:if>
							<c:if test="${ !empty loginUser }">
								<c:if test="${ pd.check eq 'Y'}">
									<button class="btn btn_viewZzim">
										<i class="bi bi-heart-fill"></i>&nbsp;&nbsp;&nbsp;찜하기
									</button>
								</c:if>
								<c:if test="${ pd.check ne 'Y' }">
									<button class="btn btn_viewZzim">
										<i class="bi bi-heart"></i>&nbsp;&nbsp;&nbsp;찜하기
									</button>
								</c:if>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
			<br> <br>
			<!-- /실시간트렌드 섹션 -->

		</div>
		<br><br><br><br>
		<!-- 페이징 -->
		<div class="col-lg-12 text-center" style="margin-top: 8%;">
			<div class="product__pagination blog__pagination">
				<c:url var="goBack" value="${ loc }">
					<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
					<c:param name="cateNum" value="${ cateNum }" />
					<c:param name="cateName" value="${ cateName }" />
				</c:url>
				<c:if test="${ pi.currentPage > 1 }">
					<a href="${ goBack }" aria-label="Previous"><i
						class="fa fa-long-arrow-left"></i></a>
				</c:if>
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:url var="goNum" value="${ loc }">
						<c:param name="page" value="${p}"></c:param>
						<c:param name="cateNum" value="${ cateNum }" />
						<c:param name="cateName" value="${ cateName }" />
					</c:url>
					<a href="${ goNum }">${ p }</a>
				</c:forEach>
				<c:url var="goNext" value="${ loc }">
					<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
					<c:param name="cateNum" value="${ cateNum }" />
					<c:param name="cateName" value="${ cateName }" />
				</c:url>
				<c:if test="${ pi.currentPage < pi.endPage }">
					<a href="${ goNext }"><i class="fa fa-long-arrow-right"></i></a>
				</c:if>
			</div>
		</div>
	</section>



	<!-- Footer Section Begin -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Footer Section End -->
</body>
<script>
		const Allproduct = document.getElementsByClassName("col-lg-2 col-md-4 col-sm-6");
        for(const product of Allproduct){
            product.addEventListener('click', function(){
                console.log( $(this).siblings().children()[0].value;);
                
                const proNum =  $(this).siblings().children()[0].value;
                console.log(proNum);
                
//                 location.href = '${contextPath}/selectProduct.su?proNum='+proNum+'&page='+${pi.currentPage};
            });
        }
	</script>
</html>