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
<title>내가쓴글상세보기</title>
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
			<li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
			<li>/</li>
			<li><a href="#" onclick="location.href='${contextPath}/myWriteView.my'">내 게시글 관리</a></li>
			<li>/</li>
			<li><a href="#">상세보기</a></li>
		</ul>
	</div>
	<div class="container">
		<div class="section-title"
			style="padding: 30px 0 10px 0; margin-bottom: 0px;">
			<h4>내 게시물 관리</h4>
			<div style="display: block;">
				<hr style="width: 50vw; background-color: #24E082;">
			</div>
		</div>
		<div class="col-lg-12">
			<div class="product__details__tab" style="padding-top: 0px;">
				<div class="tab-content">
					<div class="tab-pane active" id="tabs" role="tabpanel">
						<div class="product__details__tab__desc" style="padding-top: 0px;">
							내가 작성한 게시물
							<div class="bn_boardlist mt-2">
								<table class="table">
									<thead>
										<tr class="text-teal-100">
											<th scope="col" class="col-lg-1">글번호</th>
											<th scope="col" class="col-lg-6">제목</th>
											<th scope="col" class="col-lg-2">작성일자</th>
											<th scope="col" class="col-lg-2">수정일자</th>
											<th scope="col" class="col-lg-1">조회수</th>
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
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
												Thornton</td>
											<td>@fat</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>3</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>4</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>5</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>6</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>7</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>8</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>9</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td>10</td>
											<td
												style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Larry
												the Bird</td>
											<td>@twitter</td>
											<td>1</td>
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