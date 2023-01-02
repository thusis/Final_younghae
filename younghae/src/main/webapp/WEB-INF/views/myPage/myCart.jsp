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
<title>나의장바구니</title>
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
</style>
</head>
<body>
	<div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
		<ul>
			<li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
			<li>/</li>
			<li><a href="#">장바구니</a></li>
		</ul>
	</div>
	<div class="section-title" style="padding: 30px 0 10px 0;">
		<h3>장바구니</h3>
	</div>
	<div class="section-title">
		<hr style="width: 50vw; background-color: #24E082;">
	</div>
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="table-wrap">
					<table class="table">
						<thead class="thead-primary">
							<tr>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>상품명</th>
								<th>가격</th>
								<th>상품 갯수</th>
								<th>총가격</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<tr class="alert" role="alert">
								<td><label class="checkbox-wrap checkbox-primary">
										<input type="checkbox" name="check">
								</label></td>
								<td>
									<div class="img"
										style="background-image: url(images/prod-1.jpg);"></div>
								</td>
								<td>
									<div class="email">
										<span>Jim Beam Kentucky Straight</span> <span>Fugiat
											voluptates quasi nemo, ipsa perferendis</span>
									</div>
								</td>
								<td>$44.99</td>
								<td class="quantity">
									<div class="input-group">
										<input type="text" name="quantity"
											class="quantity form-control input-number" value="2" min="1"
											max="100">
									</div>
								</td>
								<td>$89.98</td>
								<td>
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true"><i class="fa fa-close"></i></span>
									</button>
								</td>
							</tr>

							<tr class="alert" role="alert">
								<td><label class="checkbox-wrap checkbox-primary">
										<input type="checkbox" name="check"> <span
										class="checkmark"></span>
								</label></td>
								<td>
									<div class="img"
										style="background-image: url(images/prod-2.jpg);"></div>
								</td>
								<td>
									<div class="email">
										<span>Jim Beam Kentucky Straight</span> <span>Fugiat
											voluptates quasi nemo, ipsa perferendis</span>
									</div>
								</td>
								<td>$30.99</td>
								<td class="quantity">
									<div class="input-group">
										<input type="text" name="quantity"
											class="quantity form-control input-number" value="1" min="1"
											max="100">
									</div>
								</td>
								<td>$30.99</td>
								<td>
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true"><i class="fa fa-close"></i></span>
									</button>
								</td>
							</tr>

							<tr class="alert" role="alert">
								<td><label class="checkbox-wrap checkbox-primary">
										<input type="checkbox" name="check"> <span
										class="checkmark"></span>
								</label></td>
								<td>
									<div class="img"
										style="background-image: url(images/prod-3.jpg);"></div>
								</td>
								<td>
									<div class="email">
										<span>Jim Beam Kentucky Straight</span> <span>Fugiat
											voluptates quasi nemo, ipsa perferendis</span>
									</div>
								</td>
								<td>$35.50</td>
								<td class="quantity">
									<div class="input-group">
										<input type="text" name="quantity"
											class="quantity form-control input-number" value="1" min="1"
											max="100">
									</div>
								</td>
								<td>$35.50</td>
								<td>
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true"><i class="fa fa-close"></i></span>
									</button>
								</td>
							</tr>

							<tr class="alert" role="alert">
								<td><label class="checkbox-wrap checkbox-primary">
										<input type="checkbox" name="check"> <span
										class="checkmark"></span>
								</label></td>
								<td>
									<div class="img"
										style="background-image: url(images/prod-4.jpg);"></div>
								</td>
								<td>
									<div class="email">
										<span>Jim Beam Kentucky Straight</span> <span>Fugiat
											voluptates quasi nemo, ipsa perferendis</span>
									</div>
								</td>
								<td>$76.99</td>
								<td class="quantity">
									<div class="input-group">
										<input type="text" name="quantity"
											class="quantity form-control input-number" value="1" min="1"
											max="100">
									</div>
								</td>
								<td>$76.99</td>
								<td>
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true"><i class="fa fa-close"></i></span>
									</button>
								</td>
							</tr>

							<tr class="alert" role="alert">
								<td class="border-bottom-0"><label
									class="checkbox-wrap checkbox-primary"> <input
										type="checkbox" name="check"> <span class="checkmark"></span>
								</label></td>
								<td class="border-bottom-0">
									<div class="img"
										style="background-image: url(images/prod-5.jpg);"></div>
								</td>
								<td class="border-bottom-0">
									<div class="email">
										<span>Jim Beam Kentucky Straight</span> <span>Fugiat
											voluptates quasi nemo, ipsa perferendis</span>
									</div>
								</td>
								<td class="border-bottom-0">$40.00</td>
								<td class="quantity border-bottom-0">
									<div class="input-group">
										<input type="text" name="quantity"
											class="quantity form-control input-number" value="1" min="1"
											max="100">
									</div>
								</td>
								<td class="border-bottom-0">$40.00</td>
								<td class="border-bottom-0">
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true"><i class="fa fa-close"></i></span>
									</button>
								</td>
							</tr>
							<tr class="alert" role="alert">
								<td class="border-bottom-0"><label
									class="checkbox-wrap checkbox-primary"> <input
										type='checkbox' name='animal' value='selectall'
										onclick='selectAll(this)'> <span class="checkmark"></span>
								</label></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row justify-content-end">
				<div
					class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate fadeInUp ftco-animated">
					<div class="cart-total mb-3">
						<h3>총 결제액</h3>
						<br>
						<p class="d-flex">
							<span>총물품금액</span> <span>$20.60</span>
						</p>
						<p class="d-flex">
							<span>배송금액</span> <span>$0.00</span>
						</p>
						<p class="d-flex">
							<span>포인트사용</span> <span>$3.00</span>
						</p>
						<p class="d-flex">
							<span>할인쿠폰</span> <span>$3.00</span>
						</p>
						<hr>
						<p class="d-flex total-price">
							<span>최종결제금액</span> <span>$17.60</span>
						</p>
					</div>
					<p class="text-center">
						<a href="checkout.html" class="btn btn-primary py-3 px-4">결제하기</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<script>
        function selectAll(selectAll) {
            const checkboxes
                = document.getElementsByName('check');

            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            })
        }
    </script>
</body>
</html>