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
<title>영양성분조회</title>

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

span {
	/*         	color: 24E082; */
	background-color: 24E082;
}

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

.label1{
	padding-left: 3%; 
	font-size: 150%; 
	padding-top: 5%; 
	font-weight: 800; 
	color: #24E082;
	margin-right: 3%;
}

.input1{
	height: 40px;
	width: 80%;
	border: 1px solid #24E082;
	border-radius: 0.5em;
}

</style>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
	<div class="container">
		<div class="bn_index mt-5">
			<ul>
				<li><a href="${ contesyPath }/insertPage.su">영양제 관리</a></li>
			</ul>
		</div>
	</div>
	<!-- Featured Section Begin -->
	<section class="featured spad"
		style="margin-left: 18%; margin-right: 18%;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form action="${ contextPath }/insertProduct.su" method="post" id="goInsert">
						<div>
							<label class="label1">제품 썸네일 사진</label>
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
						</div>
						<div>
							<label class="label1">제품 명 </label><input class="input1" type="text" name="productName" required>
						</div>
						<div>
							<label class="label1">회사 명 </label><input  class="input1" type="text" name="proCompany" required>
						</div>
						<div>
							<label class="label1">제품 카테고리</label>
							<input type="hidden" id="cateNum" name="cateNum" value="">
							<select id="selectBtn" name="op" style="width: 150px;" onchange="selectedopntion(this);">
								<option value="omega">오메가3</option>
								<option value="gia">지아잔틴</option>
								<option value="zinc">아연</option>
								<option value="vitaminC">비타민C</option>
								<option value="vitaminB1">비타민B1</option>
								<option value="vitaminD">비타민D</option>
								<option value="probiotics">프로바이오틱스(유산균)</option>
								<option value="xanthizen">잔티젠</option>
								<option value="calcium">칼슘</option>
								<option value="co">코엔자임Q10</option>
								<option value="octa">옥타코사놀</option>
								<option value="banana">바나바잎 추출물</option>
								<option value="acid">엽산</option>
								<option value="milk">밀크씨슬</option>
								<option value="glue">글루코사민</option>
								<option value="mg">마그네슘</option>
								<option value="iron">철분</option>
								<option value="hyaluronic">히알루론산</option>
							</select>
						</div>
						<div>
							<label class="label1">금액 </label><input  class="input1" type="number" name="proPrice" required style="width: 150px;" min="100" max="1000000" step="100"><label style="font-size: 130%;">&nbsp;원</label>
						</div>
						<div>
							<label class="label1">성분 </label><input  class="input1" type="text" name="proIngredient" required>
						</div>
						<div>
							<label class="label1">효능 </label><input  class="input1" type="text" name="proEffect" required>
						</div>
						<div>
							<label class="label1">섭취량 </label><input  class="input1" type="text" name="proIntake" required>
						</div>
						<div>
							<label class="label1">제품 상세보기 사진</label>
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
						</div>
						<div>
							<label class="label1">제품 영양성분 사진</label>
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
						</div>
						<div>
							<label class="label1">판매 여부</label> <input style="font-size: 100%;" type="radio" name="proSaleStatus"
								value="판매 + 등록"><label style="font-size: 500;">판매 + 등록 </label><input type="radio"
								name="proSaleStatus" value="등록"><label>등록</label>
						</div>
						<button type="button" name="reviewWriteBtn"
		                        style="margin-left: 45%; height: 50px; width: 130px; background-color: #FD9F28; border: none; border-radius: 5em; color: #ffffff;"
		                        id="modalBtn">제품 등록</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Footer Section End -->

</body>
<script>
	window.onload=()=>{
		const form = document.getElementById('goInsert');
		const btn = document.getElementById('modalBtn');
		btn.addEventListener('click',()=>{
			
			form.submit();
		});
	}
    function selectedopntion(op){
    	const cateInput = document.getElementById('cateNum');
    	console.log("op" + op.value);
    	
    	switch(op.value){
	    	case "omega":
				cateInput.value = 1;
				break;
			case "gia":
				cateInput.value = 2;
				break;
			case "zinc":
				cateInput.value = 3;
				break;
			case "vitaminC":
				cateInput.value = 4;
				break;
			case "vitaminB1":
				cateInput.value = 5;
				break;
			case "vitaminD":
				cateInput.value = 6;
				break;
			case "probiotics":
				cateInput.value = 7;
				break;
			case "xanthizen":
				cateInput.value = 8;
				break;
			case "calcium":
				cateInput.value = 9;
				break;
			case "co":
				cateInput.value = 10;
				break;
			case "octa":
				cateInput.value = 11;
				break;
			case "banana":
				cateInput.value = 12;
				break;
			case "acid":
				cateInput.value = 13;
				break;
			case "milk":
				cateInput.value = 14;
				break;
			case "glue":
				cateInput.value = 15;
				break;
			case "mg":
				cateInput.value = 16;
				break;
			case "iron":
				cateInput.value = 17;
				break;
			case "hyaluronic":
				cateInput.value = 18;
				break;
    	}
    }
</script>
</html>