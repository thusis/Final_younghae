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
					<input type="hidden" name="boardNum" value="${ story.boardNum }">
					<input type="hidden" name="boardView" value="${ story.boardView }">
					<div id="storyTitle">
						<label
							style="font-size: 25px; color: #24E082; font-weight: 700; padding-left: 1%; padding-top: 1.5%; padding-right: 1%; border: none;"
							for="">제목</label> <input name="boardTitle" type="text" required style="width: 60%; padding: 0.5%;" value="${ story.boardTitle }">
					</div>
					<div class="text-center" id="column">
						<br>
						<textarea id="summernote" name="boardContent">
							${ story.boardContent }
						</textarea>
					</div>
					<div class="text-center" id="Btn" style="margin-top: 2%;">
						<input type="hidden" id="check" name="check" value="">
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
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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
				},
				focus : true,
				lang : 'ko-KR'
	      });
			
		function sendFile(file, el) {
	  		var form_data = new FormData();
	        	form_data.append('file', file);
	        	$.ajax({
		          	data: form_data,
		          	type: "POST",
		          	url: '${ contextPath }/summernoteImage.st',
		          	cache: false,
		          	contentType: false,
		          	enctype: 'multipart/form-data',
		          	processData: false,
		          	success: function(img_name) {
							$(".spinner-border").css("display","none");
							
							console.log(img_name);
							
							// 외부 경로 저장소 tomcat server.xml 에서 수정 후 /summerNote/로 경로 붙이기
		            		$(el).summernote('editor.insertImage', "/summerNote/"+ img_name);
		            		
		          	}
	       		});
	      }
		
		
		window.onload=()=>{
			const form = document.getElementById("formmm");
			
			document.getElementById("deleteBtn").addEventListener('click', ()=>{
				document.getElementById("check").value = "D";
				//summernote 내용 가져오기
				  const img = $('#summernote').summernote('code');
				  
				  var thumbnail = img.substring(img.indexOf('/summer'), img.indexOf('src="')+44);
				  console.log("얍"+thumbnail);
				  
				  document.getElementById('thumbnail').value = thumbnail;
				  console.log(document.getElementById('thumbnail').value);
				
				form.submit();
			});
			
			document.getElementById("updateBtn").addEventListener('click', ()=>{
				document.getElementById("check").value = "U";
				//summernote 내용 가져오기
				  const img = $('#summernote').summernote('code');
				  
				  var thumbnail = img.substring(img.indexOf('/summer'), img.indexOf('src="')+44);
				  console.log("얍"+thumbnail);
				  
				  document.getElementById('thumbnail').value = thumbnail;
				  console.log(document.getElementById('thumbnail').value);
				
				form.submit();
			});
		}
		
	</script>
</body>
</html>

<!-- 텍스트 줄임말 https://doriri.tistory.com/45 -->