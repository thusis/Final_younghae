<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

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
						<div class="product__item">
							<div class="product__item__pic set-bg"
								style="margin-bottom: -40px;">
								<img src="${ pd.proImage }" style="margin-top: 30px;">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text" style="text-align: left;">
								<span style="float: right; font-size: 18px; margin-top: -1%;"><i
									class="fa-solid fa-star star" style="color: yellow;"></i>&nbsp;&nbsp;${ pd.proGrade }</span>
								<h6 style="display: inline-block;">
									<a>${ pd.proCompany }</a>
								</h6>
								<input type="hidden" value="${ pd.proNum }" id="productNum">
								<h5>${ pd.proName }</h5>
								<h6>${ pd.proPrice }</h6>
								<br> <span
									style="width: 100%; float: right; font-size: 13px; margin-top: -1%; color: #1a19197e; text-overflow: ellipsis; overflow: hidden;">${ pd.proEffect }</span>
								<div>
									<button class="btn btn_cart">
										<i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;장바구니
									</button>
									<button class="btn btn_comment">
										<i class="fa-solid fa-comment"></i>&nbsp;&nbsp;&nbsp;193
									</button>
								</div>
							</div>
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
                console.log(this);
                const proNum = this.childNodes[1].childNodes[3].childNodes[5].value;
                console.log(proNum);
                
                location.href = '${contextPath}/selectProduct.su?proNum='+proNum+'&page='+${pi.currentPage};
            });
        }
	</script>
</html>