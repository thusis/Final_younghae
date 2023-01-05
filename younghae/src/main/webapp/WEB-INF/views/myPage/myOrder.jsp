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
<title>나의 주문</title>
<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
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

.product__details__tab .nav-tabs:before {
	position: absolute;
	left: 0;
	top: 0;
	height: 0;
	width: 0px;
	background: #ebebeb;
	content: "";
}

.product__details__tab .nav-tabs:after {
	position: absolute;
	left: 0;
	top: 0;
	height: 0;
	width: 0px;
	background: #ebebeb;
	content: "";
}
</style>
</head>

<body>
	<div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
		<ul>
			<li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
			<li>/</li>
			<li><a href="#">주문내역조회</a></li>
		</ul>
	</div>
	<div class="container">
		<div class="section-title" style="padding: 30px 0 10px 0;">
			<h4>주문 내역 조회</h4>
			<hr style="width: 50vw; background-color: #24E082;">
		</div>
		<div class="col-lg-12">
			<div class="product__details__tab" style="margin-top: -100px;">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">주문내역조회</a>
					</li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tabs-2" role="tab" aria-selected="false">취소/교환/환불</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tabs-3" role="tab" aria-selected="false">이전주문내역</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="product__details__tab__desc">
							<div class="bn_boardlist mt-2">
								<table class="table">
									<thead>
										<tr class="text-teal-100">
											<th scope="col" class="col-lg-2">주문일자</th>
											<th scope="col" class="col-lg-6">상품정보</th>
											<th scope="col" class="col-lg-2">상품구매금액</th>
											<th scope="col" class="col-lg-2">주문처리상태</th>
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
								<table class="table">
									<thead>
										<tr class="text-teal-100">
											<th scope="col" class="col-lg-2">주문일자</th>
											<th scope="col" class="col-lg-6">상품정보</th>
											<th scope="col" class="col-lg-2">상품구매금액</th>
											<th scope="col" class="col-lg-2">주문처리상태</th>
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
					<div class="tab-pane" id="tabs-3" role="tabpanel">
						<div class="product__details__tab__desc">
							<div class="bn_boardlist mt-2">
								<table class="table">
									<thead>
										<tr class="text-teal-100">
											<th scope="col" class="col-lg-2">주문일자</th>
											<th scope="col" class="col-lg-6">상품정보</th>
											<th scope="col" class="col-lg-2">상품구매금액</th>
											<th scope="col" class="col-lg-2">주문처리상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Ot3to
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>