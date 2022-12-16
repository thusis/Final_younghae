<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>나의 쿠폰</title>
<style>
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
	<nav>
		<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	</nav>
	<div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
		<ul>
			<li><a href="#">마이페이지</a></li>
			<li>/</li>
			<li><a href="#">내 쿠폰 관리</a></li>
		</ul>
	</div>
	<div class="container">
		<div class="section-title"
			style="padding: 30px 0 10px 0; margin-bottom: 0px;">
			<h4>내 쿠폰 관리</h4>
			<div style="margin-left: 900px; display: block;">
				<input type="text">
				<button type="button" style="border: 0;">등록</button>
			</div>
			<div style="display: block;">
				<hr style="width: 50vw; background-color: #24E082;">
			</div>
		</div>
		<div class="col-lg-12">
			<div class="product__details__tab" style="padding-top: 0px;">
				<div>
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">사용가능한쿠폰</a>
						</li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false">사용된 쿠폰</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="product__details__tab__desc">
							<div class="bn_boardlist mt-2">
								<button style="float: right; border: 0; margin-bottom: 5px;"
									onclick="location.href='#'">이벤트</button>
								<table class="table">
									<thead>
										<tr class="text-teal-100">
											<th scope="col" class="col-lg-1">쿠폰번호</th>
											<th scope="col" class="col-lg-4">쿠폰명</th>
											<th scope="col" class="col-lg-3">쿠폰혜택</th>
											<th scope="col" class="col-lg-4">사용기간</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Ot1to
											</td>
											<td>@mdo</td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
												Thornton</td>
											<td>@fat</td>
											<td>1</td>
										</tr>
										<tr>
											<td>3</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
										</tr>
										<tr>
											<td>4</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
										</tr>
										<tr>
											<td>5</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
										</tr>
										<tr>
											<td>6</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">왜
												border-bottom 생겨서 날 괴롭게 해?</td>
											<td>@twitter</td>
											<td>1</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div
								class="product__pagination blog__pagination d-flex justify-content-center mt-3 ">
								<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a
									href="#"><i class="fa fa-long-arrow-right"></i></a>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tabs-2" role="tabpanel">
						<div class="product__details__tab__desc">
							<div class="bn_boardlist mt-2">
								<button style="float: right; border: 0; margin-bottom: 5px;"
									onclick="location.href='#'">이벤트</button>
								<table class="table">
									<thead>
										<tr class="text-teal-100">
											<th scope="col" class="col-lg-1">쿠폰번호</th>
											<th scope="col" class="col-lg-4">쿠폰명</th>
											<th scope="col" class="col-lg-3">쿠폰혜택</th>
											<th scope="col" class="col-lg-4">사용기간</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Ot2to
											</td>
											<td>@mdo</td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
												Thornton</td>
											<td>@fat</td>
											<td>1</td>
										</tr>
										<tr>
											<td>3</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
										</tr>
										<tr>
											<td>4</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
										</tr>
										<tr>
											<td>5</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
										</tr>
										<tr>
											<td>6</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">왜
												border-bottom 생겨서 날 괴롭게 해?</td>
											<td>@twitter</td>
											<td>1</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div
								class="product__pagination blog__pagination d-flex justify-content-center mt-3 ">
								<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a
									href="#"><i class="fa fa-long-arrow-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
