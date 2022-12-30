<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>컬럼 수정 and 삭제</title>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<!-- 써머노트때문에 위로 올라감 -->
<jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>


<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<style>
.bn_nav1 {
	background-color: #24E082;
}

.yh_header__menu {
	padding: 12px 0;
}

.yh_header__menu ul li {
	color: white;
	list-style: none;
	display: inline-block;
	margin-right: 50px;
	position: relative;
}

.yh_header__menu ul li .yh_header__menu__dropdown {
	position: absolute;
	left: 0;
	/* top: 50px; */
	background: #222222;
	width: max-content;
	/* z-index: 9; */
	padding: 5px 0;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
	opacity: 0;
	visibility: hidden;
}

.yh_header__menu ul li .yh_header__menu__dropdown li {
	margin-right: 0;
	display: block;
}

.yh_header__menu ul li .yh_header__menu__dropdown li:hover>a {
	color: #24E082;
}

.yh_header__menu ul li .yh_header__menu__dropdown li a {
	text-transform: capitalize;
	color: #ffffff;
	font-weight: 400;
	padding: 5px 15px;
}

.yh_header__menu ul li.active a {
	color: #24E082;
}

.yh_header__menu ul li:hover .yh_header__menu__dropdown {
	top: 30px;
	opacity: 1;
	visibility: visible;
}

.yh_header__menu ul li:hover>a {
	color: #FD9F28;
}

.yh_header__menu ul li:last-child {
	margin-right: 0;
}

.yh_header__menu ul li a {
	font-size: 14px;
	color: #252525;
	text-transform: uppercase;
	font-weight: 700;
	letter-spacing: 2px;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
	padding: 5px 0;
	display: block;
}

/* 검색창 */
#bn_navbar-search-input {
	border: 0;
	background-color: rgb(242, 242, 242);
	border-radius: 0px 20px 20px 0px;
}

.bn_navbar-select-input {
	border: 0;
	background-color: rgb(242, 242, 242);
	cursor: pointer;
	border-radius: 20px 0px 0px 20px;
	padding-left: 10px;
}

.bn_navbar-select-input option:checked, .bn_navbar-select-input option:hover
	{
	color: FD9F28;
}

.bn_btn_search {
	background-color: transparent;
	border: none;
	cursor: pointer;
	position: absolute;
	right: 5px;
	top: 50%;
	transform: translatey(-50%);
}

/* 첨부파일 관련 CSS*/
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
	border-radius: 1em;
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

#detail {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

/* input 스타일  헤헤 */
input {
	border: none;
	border-radius: 3px;
	height: 30px;
}

input:focus {
	outline: none !important;
	border-color: rgb(106, 140, 153);
	box-shadow: 0 0 10px rgb(180, 185, 187);
}

textarea:focus {
	outline: none !important;
	border-color: rgb(106, 140, 153);
	box-shadow: 0 0 10px rgb(180, 185, 187);
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
</style>
</head>
<body>

	<div class="container">
		<div class="bn_index mt-5">
			<ul>
				<li>건강해지는 이야기</li>
				<li><b>/</b></li>
				<li><a href="${ contextPath }/storyList.st?page=${ page }">건강해지는 이야기 상세보기</a></li>
				<li><b>/</b></li>
				<li>건강해지는 이야기 수정하기</li>
			</ul>
		</div>
	</div>

	<!-- 스토리 작성하는 부분 -->
	<section class="featured spad"
		style="margin-left: 20%; margin-right: 20%;">
		<div class="row align-items-center">
			<div class="col-lg-12 col-md-12"
				style="border: 2px solid #24E082; padding: 3%; border-radius: 2em;">
				<form action="${ contextPath }/updateStory.st" method="post" id="formmm">
					<input type="hidden" id="thumbnail" name="thumbnail" value="">
					<input type="hidden" name="userNum" value="${ loginUser.userNum }">
					<div id="storyTitle">
						<label
							style="font-size: 25px; color: #24E082; font-weight: 700; padding-left: 1%; padding-top: 1.5%; padding-right: 1%; border: none;"
							for="">제목</label> <input type="text" placeholder="제목을 입력하세요"
							required style="width: 60%; padding: 0.5%;">
					</div>
					<div id="storyFile">
						<label
							style="font-size: 25px; color: #24E082; font-weight: 700; padding-left: 1%; padding-top: 1.5%; padding-right: 1%; border: none;"
							for="">첨부파일</label> <input type="text" placeholder="파일 이름"
							required style="width: 60%; padding: 0.5%;" readonly>
						<div class="text-right float-right" id="fileBtn"
							style="margin-top: 2%; margin-right: 20%;">
							<button type="button"
								style="height: 30px; width: 150%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;">찾아보기</button>
						</div>
					</div>
					<div class="text-center" id="column">
						<br>
						<textarea id="summernote" name="editordata"></textarea>
					</div>
					<div class="text-center" id="Btn" style="margin-top: 2%;">
						<input type="hidden" id="check" name="check" value="">S
						<button type="button" id="updateBtn"
							style="height: 40px; width: 13%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;">수정</button>
						&emsp;&emsp;&emsp;&emsp;&emsp;
						<button type="button" id="deleteBtn"
							style="height: 40px; width: 13%; background-color: #FD9F28; border: none; border-radius: 5em; color: #ffffff;">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</section>



	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./index.html"><img src="img/logo.png" alt=""></a>
						</div>
						<ul>
							<li>Address: 60-49 Road 11378 New York</li>
							<li>Phone: +65 11.188.888</li>
							<li>Email: hello@colorlib.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>Useful Links</h6>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">About Our Shop</a></li>
							<li><a href="#">Secure Shopping</a></li>
							<li><a href="#">Delivery infomation</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Our Sitemap</a></li>
						</ul>
						<ul>
							<li><a href="#">Who We Are</a></li>
							<li><a href="#">Our Services</a></li>
							<li><a href="#">Projects</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Innovation</a></li>
							<li><a href="#">Testimonials</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						-o Colorlib can't be removed. Template is licensed under CC BY
						3.0. --> Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
					<div class="footer__copyright__payment">
						<img src="img/payment-item.png" alt="">
					</div>
				</div>
			</div>
		</div>
		</div>
	</footer>
	<!-- Footer Section End -->


	<script>
		$('#summernote').summernote({
	        placeholder: 'Hello stand alone ui',
	        tabsize: 2,
	        height: 500,
	        disableResizeEditor: true,
	        toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture']],
				    ['view', ['fullscreen', 'codeview' ,'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
				
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
	      });
		
		window.onload=()=>{
			const form = document.getElementById("formmm");
			document.getElementById("deleteBtn").addEventListener('click', ()=>{
				document.getElementById("check").value = "D";
				
// 				form.commit();
			});
			
			document.getElementById("updateBtn").addEventListener('click', ()=>{
				document.getElementById("check").value = "U";
				
// 				form.commit();
			});
		}
		
	</script>
</body>
</html>

<!-- 텍스트 줄임말 https://doriri.tistory.com/45 -->