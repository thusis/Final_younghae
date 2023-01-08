<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>카테고리 선택</title>
<style>
	/* 영양제 성분 카테고리*/
	.featured__item {
		background-color: #DCFFE9;
		padding: auto;
		width: 300;
		height: 230;
		border-radius: 5%;
	}
	
	.featured__item p {
		text-align: center;
		line-height: 250px;
		font-weight: 600;
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
	
	.product__details__quantity_1 :hover{
		cursor: pointer;
	}
	
	.product__details__quantity :hover{
		cursor: pointer;
	}
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>

	<div class="container">
		<div class="bn_index mt-5">
			<ul>
				<li>영양제</li>
				<li><b>/</b></li>
				<li><a href="${contextPath }/category.su">성분 조회</a></li>
				<li><b>/</b></li>
				<li><a href="${ loc }">${ c.cateName }</a></li>
			</ul>
		</div>
	</div>

	<!-- Product Details Section Begin -->

	<section class="product-details spad">
		<div class="container"
			style="border: 2px solid #24E082; border-radius: 3em; padding: 5%;">
			<div class="row" style="width: 100%;">
				<div class="col-lg-12 col-md-12" style="width: 100%;">
					<div class="product__details__text">
						<i class="fa-solid fa-comment-medical"
							style="font-size: 225%; color: #24E082; margin-right: 1%;"></i>
						<h3 style="display: inline;" id="cateName">${ c.cateName }</h3>
						<br>
						<div class="product__details__rating">
							<i class="fa fa-star"></i>  <span>(리뷰 ${ reviewCount })</span>
						</div>
						<p>${ c.cateSummary }</p>
						<input type="hidden" value="${ c.cateNum }" id="cateNum">
						<div class="product__details__quantity" style="width: 100%;">
							<div class="product__details__quantity"
								style="border: 2px solid #24E082; border-radius: 5px; padding: 5%; width: 100%;">
								<c:if test="${ c.cateIcon ne null }">
									<c:forEach var="w" items="${ c.cateIcon }">
										<c:if test="${ fn:contains( w , '수술')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/knife.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">수술 전 후 지혈
												늦춰짐</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '생선')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<i class="fa-solid fa-fish-fins"></i>
											</div>
											<div class="product__details__price mr-5"
												style="font-size: 100%; display: inline;">생선 알레르기 주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '임산부')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/pregnant.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">임산부 관련 연구 부족</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '폐암')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/respiratory.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">장기간 고용량 복용시
												폐암 위험 증가</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '수유')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/baby_bottle.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">수유부 관련 연구 부족</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '갑각류')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/crustaceans.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">갑각류 알레르기 주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '신장')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/kidney.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">고용량 복용시
												고칼슘혈증으로 인해 신장 기능 저하</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '요로')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body_wraning.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">요로결석 주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '저혈압')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body_wraning.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">저혈압 주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '석류')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">석류 알레르기 주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '여성호르몬')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">여성호르몬 유사 작용
												주의</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '장기')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">장기간 섭취시 장기
												손상 우려</div>
													&nbsp;&nbsp;
											</c:if>
										<c:if test="${ fn:contains( w, '철')}">
											<div class="d-inline"
												style="font-size: 150%; color: #BC3838;">
												<img src="resources/img/warning/body_wraning.png"
													style="height: 30px;">
											</div>
											<div class="product__details__price"
												style="font-size: 100%; display: inline;">철 중독증 우려</div>
												&nbsp;&nbsp;
											</c:if>
										<%-- <c:if test="${ fn:contains( c.cateIcon, '임산부')}"></c:if> --%>
									</c:forEach>
								</c:if>
								<c:if test="${ c.cateIcon eq null }">
									<div class="product__details__price"
										style="font-size: 100%; display: inline;">아직 발견된 주의사항이 없네요!</div>
								</c:if>
							</div>
						</div>
						<ul>
							<li>
								<div class="mb-3" name="pillItem">
									<b style="display: inline; font-weight: 900; color: #24E082;">영양제
										추천</b>
									<button type="button"
										style="margin-left: 80%; color: #24E082; font-weight: 700;  background-color: white; border: none;"
										id="productMore">더보기 &gt; &gt;</button>
								</div>
							</li>
							<li>
								<div class="row">
									<c:forEach var="item" items="${ product }" begin="0" end="2"
										step="1" varStatus="status">
										<div class="product__details__quantity_1"
											style="border: 2px solid #24E082; border-radius: 10px; width: 30%; height: 380px; margin-right: 3.25%;">
											<input type="hidden" value="${ item.proNum }">
											<div style="text-align: center; padding-top: 5%;">
												<div name="getItemImg">
													<img src="${ item.proImage }"
														style="height: 150px; width: 200px;">
												</div>
												<div name="getItemName"
													class="text-left fs-5 font-weight-bold pl-2">&nbsp;
													${ item.proName }</div>
												<div class="fs-5 text-left pr-3 pt-1 mb-3" style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">&nbsp; ${ item.proEffect }
												</div>
												<div class="text-left pr-2">
													<div class="product__details__rating"
														style="float: left; padding-left: 5%;">
														<i class="fa fa-star"
															style="color: rgb(247, 247, 75); font-size: 130%;"></i>
													</div>
													<div name="reviewRank"
														style="float: left; padding-left: 1%; padding-top: 1.5%;">
														<p style="color: black; font-size: 130%;">${ item.proGrade }</p>
													</div>
													<div class="text-right font-weight-bold pr-2% pt--3 mb-1 mt-1">
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${ item.proPrice }" />&nbsp;원&nbsp;&nbsp;</div>
												</div>
												<br><br>
											</div>
										</div>
									</c:forEach>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab" style="padding-top: 5%;">
						<ul class="nav nav-tabs" role="tablist">
							<li><a class="nav-link active" data-toggle="tab"
								href="#tabs-1" role="tab" aria-selected="true">Reviews <span>(${ reviewCount })</span></a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<div class="mb-3" name="pillItem">
										<b style="display: inline; font-weight: 900; color: #24E082; margin-left: 10px;">리뷰</b>
										<button type="button"
											style="margin-left: 85%; color: #24E082; font-weight: 700;  background-color: white; border: none;"
											id="reviewMore">더보기 &gt; &gt;</button>
									</div>
									<c:forEach items="${ review }" var="re" end="2">
										<div class="product__details__quantity"
											style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300%; margin-right: 3%; padding: 3%; padding-bottom: 5%;">
											<div name="reviewDetail">
												<div class="row">
													<div name="reviewImg" style="float: left; padding-right: -20%; margin-left: 2%;">
														<img src="resources/img/profile_yh.png" style="height: 70px; width: 70px; margin-top: 10%;">
													</div>
													<div name="reviewNickName"
														style="float: left; padding-top: 3.5%; padding-left: 1%;">
														<p style="font-weight: 600;">${ re.member.userNickname }</p>
													</div>
													<div class="product__details__rating"
														style="float: left; padding-top: 3.5%; padding-left: 20%;">
														<i class="fa fa-star"
															style="color: rgb(247, 247, 75); font-size: 130%;"></i>
													</div>
													<div name="reviewRank"
														style="float: left; padding-top: 3.5%; padding-left: 1%;">
														<p style="color: black; font-size: 130%;">${ re.rvStar }</p>
													</div>
													<div class="product__details__rating_1"
														style="float: left; margin-top: 3.5%; margin-left: 20%;">
														<i class="bi bi-hand-thumbs-up"
															style="color: rgb(0, 0, 0); font-size: 130%;"></i>
														<input type="hidden" name="rvNum" value="${ re.rvNum }">
													</div>
													<div class="product__details__rating_1" name="reviewRank"
														style="float: left; padding-top: 3.5%; padding-left: 1%;">
														<p style="color: black; font-size: 130%;">${ re.rvRecommend }</p>
													</div>
												</div>
												<div class="row reviewContent" style="margin-top: 1%; padding-left: 2%;">
													<input type="hidden" name="productNum" value="${ re.rvNum }">
													<input type="hidden" name="userNum" value="${ re.member.userNum }">
													<c:if test="${ re.image  ne '없음' }">
														<div name="reviewContent" class="col-9 text-left">${ re.rvContent }</div>
														<div name="reviewImg" class="col-3">
															<img src="resources/uploadFiles/${ re.image }" style="height: 200px; width: 200px; float: right; margin-right: 3%; padding-top: 4%;" class=".img-fluid">
														</div>
													</c:if>
													<c:if test="${ re.image eq '없음' }">
														<div name="reviewContent" class="col-12 text-left">${ re.rvContent }</div>								
													</c:if>
												</div>
											</div>
										</div><br><br>
									</c:forEach>
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

</body>
	<script>
		window.onload=()=>{
			const productmore = document.getElementById("productMore");
			productmore.addEventListener('click', ()=>{
				const cateNum = document.getElementById('cateNum').value;
				const cateName = document.getElementById('cateName').innerText;
				
                location.href = '${contextPath}/productMore.su?cateNum=' + cateNum + '&cateName=' + cateName;
			});
			
			const reviewMore = document.getElementById('reviewMore');
			reviewMore.addEventListener('click', ()=>{
				const cateNum = document.getElementById('cateNum').value;
				const cateName = document.getElementById('cateName').innerText;
				
                location.href = '${contextPath}/reviewMore.su?cateNum=' + cateNum + '&cateName=' + cateName + '&page=' + 1;
			});
			
			const product = document.getElementsByClassName('product__details__quantity_1');
			for(const pro of product){
				pro.addEventListener('click', function(){
					const productSelect = this.children[0].value;
					console.log(productSelect);
					
					location.href = '${contextPath}/selectProduct.su?proNum='+productSelect;
				});
			}
			
			const good = document.getElementsByClassName('product__details__rating_1');
			for(const g of good){
				g.addEventListener('click', function(){
					console.log($(this).parents().find('div[class="row reviewContent"]').children()[1]);
					
					// 제품번호
					const pnum = $(this).children()[1].value;
					
					// 유저번호
					const unum = $(this);
				});
			}
			
		}
	</script>
</html>