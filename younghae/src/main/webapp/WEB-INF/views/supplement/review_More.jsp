<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>리뷰 더보기</title>


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
				<li>영양 성분 조회</li>
				<li><b>/</b></li>
				<li><a href="#">제품 상세보기</a></li>
				<li><b>/</b></li>
				<li><a href="#">리뷰 더보기</a></li>
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
							<input type="hidden" value="${ cateNum }" id="cateNum">
							<label
								style="font-size: 180%; font-weight: 800; color: rgb(118, 128, 138); margin-right: 3%;">${ cateName }</label> <label
								style="font-size: 180%; font-weight: 800; color: #24E082; margin-right: 3%;">에 대한 리뷰</label>
						</div>
					</form>
				</div>
			</div>
			<br>
			<c:forEach items="${ review }" var="r">
			<div class="product__details__quantity"
				style="border: 2px solid #24E082; border-radius: 10px; width: 100%; height: 300px; margin-right: 3%; padding: 2%;">
				<div name="reviewDetail">
					<div class="row" style="margin-left: 10px;">
						<div name="reviewImg" style="float: left; padding-right: -20%;">
							<img src="resources/img/profile_yh.png" style="height: 70px; width: 70px; margin-top: 10%;">
						</div>
						<div name="reviewNickName"
							style="float: left; padding-top: 3.5%; padding-left: 1%;">
							<p style="font-weight: 600;">${ r.member.userNickname }</p>
						</div>
						<div class="product__details__rating"
							style="float: left; padding-top: 3.5%; padding-left: 20%;">
							<i class="fa fa-star"
								style="color: rgb(247, 247, 75); font-size: 130%;"></i>
						</div>
						<div name="reviewRank"
							style="float: left; padding-top: 3.5%; padding-left: 1%;">
							<p style="color: black; font-size: 130%;">${ r.rvStar }</p>
						</div>
						<c:if test="${ loginUser ne null}">
							<div class="product__details__rating"
								style="float: left; padding-top: 3.2%; padding-left: 5%;">
								<i class="bi bi-hand-thumbs-up"
									style="color: rgb(0, 0, 0); font-size: 130%;"></i>
								<input type="hidden" name="rvNum" value="${ r.rvNum }">
							</div>
							<div name="reviewRank"
								style="float: left; padding-top: 3.5%; padding-left: 1%;">
								<p style="color: black; font-size: 130%;">${ r.rvRecommend }</p>
							</div>
						</c:if>
					</div>
					<div class="row" style="margin-top: 1%; padding-left: 2%;">
						<c:if test="${ r.image  ne '없음' }">
								<div name="reviewContent" class="col-9 text-left" >${ r.rvContent }</div>
								<div name="reviewImg" class="col-3">
									<img src="resources/uploadFiles/${ r.image }" style="height: 200px; width: 200px; float: right; margin-right: 3%; margin-top: -10%;" class=".img-fluid">
								</div>
						</c:if>
						<c:if test="${ r.image eq '없음' }">
								<div name="reviewContent" class="col-12 text-left" style="padiing-right: 5%;">${ r.rvContent }</div>								
						</c:if>
					</div>
				</div>
			</div>
			<br><br><br>
			</c:forEach>
			
		<!-- 페이징 -->
			<div class="col-lg-12 text-center" style="margin-top: 8%;">
				<div class="product__pagination blog__pagination">
					<c:url var="goBack" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
						<c:param name="cateNum" value="${ proNum }"/>
						<c:param name="cateName" value="${ cateName }"/>
					</c:url>
					<c:if test="${ pi.currentPage > 1 }">
						<a href="${ goBack }" aria-label="Previous"><i class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:url var="goNum" value="${ loc }">
							<c:param name="page" value="${p}"></c:param>
							<c:param name="cateNum" value="${ cateNum }"/>
							<c:param name="cateName" value="${ cateName }"/>
						</c:url>
						<a href="${ goNum }">${ p }</a>
					</c:forEach>
					<c:url var="goNext" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
						<c:param name="cateNum" value="${ cateNum }"/>
						<c:param name="cateName" value="${ cateName }"/>
					</c:url>
					<c:if test="${ pi.currentPage < pi.endPage }">
					<a href="${ goNext }"><i class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>
			</div>
		</div>
	</section>

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
													style="border: none; margin: 1%; height: 200px; width: 97%;resize: none;">1</textarea>
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


	<!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Footer Section End -->

</body>
<script>
	window.onload=()=>{
		var login = "${ loginUser }";
		var loginNum = "${ loginUser.userNum }";
		
		const reviews = document.getElementsByClassName('product__details__quantity');
		for(const r of reviews){
			r.addEventListener('click', function(){
				// 추천
				console.log($(this).children().children()[4]);
				
				//
			});
			
		}
		
		// 추천 누르기
		const reco = document.getElementsByClassName('bi bi-hand-thumbs-up');
		for(const re of reco){
			re.addEventListener('click', function(){
				if($(this).attr('class') != "bi bi-hand-thumbs-up"){
					$(this).attr('class', 'bi bi-hand-thumbs-up');
					check = 'R';
					console.log("누름");
				}else{
					$(this).attr('class', 'bi bi-hand-thumbs-up-fill');
					check = 'D';
					console.log("누른거 취소");
				}
				
				console.log($(this).parent().children()[1].value);
				console.log(loginNum);
// 				$.ajax({
//             		url: '${contextPath}/reco.su',
//             		data: {rvNum: $(this).parent().children()[1].value ,userNum: loginNum,
//             				check: check},
//             		success:(data)=>{
//             			console.log(data);
//             		},
//             		error:(data)=>{
//             			console.log(data);
//             		}
//             	});
			});
		}
	}
</script>
</html>