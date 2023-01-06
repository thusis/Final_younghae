<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>게시글 작성</title>


    <script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"crossorigin="anonymous"></script>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
    
    <!-- 써머 노트 :CDN방식 -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
   
<!--Soyeon-->
<!-- <link rel="stylesheet" href="resources/css/soyeon.css" type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css"> -->
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
/*  input::file-selector-button {
    font-weight: bold;
    color: dodgerblue;
    padding: 0.5em;
    border: thin solid grey;
    border-radius: 3px;
    background: #24E082;
} 
 */
 #boardContent{
 	margin-top: -5px;
 	margin-left:-10px;
 }
 	.ll{
		color:black;
		font-size: 17px;
		padding-bottom: 10px; 
	}
	.ll:hover{
		color:#24E082;
		cursor: pointer;
	}
	.boardselect{
		cursor: pointer;
	}	
	.order-1 {
		text-align: center;
	}
	
</style>
</head>
<body>
	<nav>
	</nav>
	<div class="container">
		<div class="bn_index mt-5">
			<ul>
				<li>건강 이야기</li>
				<li><b>/</b></li>
				<li><a href="#">게시글 수정</a></li>
			</ul>
		</div>
		</div>
		<!-- Blog Section Begin -->

<!-- 		<section class="blog spad"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-lg-4 col-md-5">
					<div class="blog__sidebar">
						<div class="blog__sidebar__search">
							<form action="#">
                            <select class="boardselect">
							  <option value="1">작성자</option>
							  <option value="2">제목</option>
							  <option value="3">내용</option>
							  <option value="4">해시태그</option>
							</select>
								<br> 
								<input type="text" placeholder="Search...">
								<button type="submit">
									<br>
									<br>
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</form>
						</div>
						<div class="blog__sidebar__item">
							<h4 style="color: #ffc53e;">Categories</h4>
                            <ul>
                                <li class="ll 11">운동 (32)</li>
                                <li class="ll 12">식단 (21)</li>
                                <li class="ll 13">영양제 (54)</li>
                                <li class="ll 14">자유 (47)</li>
                            </ul> 
						</div>
						<div class="blog__sidebar__item">
							<h4 style="color: #ffc53e;">TOP5 게시글</h4>
							<div class="blog__sidebar__recent">
								<a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="resources/img/blog/sidebar/sr-1.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											09 Kinds Of Vegetables<br /> Protect The Liver
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="resources/img/blog/sidebar/sr-2.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											Tips You To Balance<br /> Nutrition Meal Day
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="resources/img/blog/sidebar/sr-3.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											4 Principles Help You Lose <br />Weight With Vegetables
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="resources/img/blog/sidebar/sr-3.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											4 Principles Help You Lose <br />Weight With Vegetables
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="resources/img/blog/sidebar/sr-3.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											4 Principles Help You Lose <br />Weight With Vegetables
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a>
							</div>
						</div>
						<div class="blog__sidebar__item">
							<h4 style="color: #ffc53e;">Search By</h4>
							<div class="blog__sidebar__item__tags">
								<a href="#">PT</a> <a href="#">단백질 보충제</a> <a href="#">샐러드</a> <a
									href="#">필라테스</a> <a href="#">오운완</a> <a href="#">헬린이</a>
							</div>
						</div>
					</div>
				</div> -->
<%--  				<form id="boardWriteDiv" action=" ${contextPath }/insertBoard.bo">  --%>
					
	<!-- 게시글 수정 -->
	<section class="featured spad" style="margin-left: 20%; margin-right: 20%;">
        <div class="row align-items-center">
            <div class="col-lg-12 col-md-12" style="border: 2px solid #24E082; padding: 3%; border-radius: 2em;">
					<form action="${contextPath}/boardEdit.bo" method="POST" enctype="multipart/form-data"  id="boardEditForm">
						<input type="hidden" id="thumbnail" name="thumbnail" value="">
						<input type="hidden" id="userNum" name="userNum" value="${loginUser.userNum}">
						<input type="hidden" id="boardNum" name="boardNum" value="${b.boardNum}">
						<input type="hidden" id="boardView" name="boardView" value="${b.boardView}">
						<input type="hidden" id="boardType" name="boardType" value="${b.boardType}">
						<div class="row justify-content-between">
								<select name="category"  id="category" class="category" style="margin-left: 30px; background: #afffd7; border-radius: 10px;">
										<option disabled selected value="no">선택</option>
										<option value="11">🏓운동</option>
										<option value="12">🥗식단</option>
										<option value="13">💊영양제</option>
										<option value="14">😀자유</option>
								</select>
								<br>
								
                        <label
                        style="font-size: 20px; color: #24E082; font-weight: 700; margin-left: 140px; margin-top: 3px; "
                        for="title">제목</label>
                        <input type="text" name="boardTitle" id="boardTitle" placeholder="제목을 입력하세요" value="${b.boardTitle}" required style="width: 60%; padding: 0.5%;  border: none; ">
                        
					</div>
					<hr style="border: 1px solid #c9ffe4;" noshade />
					<br>
                  <div class="text-center" id="column">
                        <br>
                    <textarea id="summernote" name="boardContent">
                    ${b.boardContent }
                    </textarea>
                  </div>
                  <div class="text-center" id="Btn" style="margin-top: 2%;">
 						<button class="btn bn_btn_search2"  type="button"  id="editBoardBtn" >수정하기</button>
                  </div>
					<div class="col-lg-6">
						<div class="blog__details__widget">
						</div>
						<br>
						<br>
					</div>
					</form>
			</div>
        </div>
    </section>
	<!-- board Detail End -->
	
	<br>
	<br>
	
	<!-- Blog Section End -->


 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script>
	
	window.onload = () =>{
		const form = document.getElementById('boardEditForm');
		
		document.getElementById('editBoardBtn').addEventListener('click', ()=> {
			const img = $('#summernote').summernote('code');
			var thumbnail = img.substring(img.indexOf('/summer'), img.indexOf('src="')+44);
			console.log("보드에딧 써머노트 테스트 : " + thumbnail);
			
			 document.getElementById('thumbnail').value = thumbnail;
			 console.log(document.getElementById('thumbnail').value);
			
			form.submit();
		});
	}
	
	
	
	/** 파일관련 */
/* 		function onClickUpload() {
			let fileUpload = document.getElementById("fileUpload");
			fileUpload.click();
		} */
	/**파일관련 모달*/
/* 	const form = document.getElementById('boardWriteForm');
	document.getElementById('boardWriteBtn').addEventListener('click', ()=> {
		const files = document.getElementsByName('file');
		let isEmpty = true;
		for(const f of files) {
			if(f.value != '') {
				isEmpty = false;
			}
		}
		if(isEmpty) {
			alert('사진을 첨부하지 않았습니다');
		} else {
			form.submit();
		}
	}); */

		<!-- 카테고리 -->
		   const categorys = document.getElementsByClassName('ll');
		   for(const category of categorys){
			   category.addEventListener('click', function(){
				   const boardCategory = category.className.substr(2);
 				   location.href='${contextPath}/boardList.bo?boardCategory=' + boardCategory;
				   console.log(boardCategory);
			   });
		   }
		   
		   <!-- 써머노트 -->
		   
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
		   
		   function sendFile(file, el) {
		        var form_data = new FormData();
		           form_data.append('file', file);
		           $.ajax({
		                data: form_data,
		                type: "POST",
		                url: '${ contextPath }/summernoteImage.bo',
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
		   
	</script>
	
</body>
</html>