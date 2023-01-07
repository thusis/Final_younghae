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
<title>컬럼 쓰기</title>

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
<!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->


    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>건강해지는 이야기</li>
                <li> <b>/</b> </li>
                <li><a href="#">건강해지는 이야기 상세보기</a></li>
                <li> <b>/</b> </li>
                <li><a href="#">건강해지는 이야기 작성하기</a></li>
            </ul>
        </div>
    </div>

    <!-- 스토리 작성하는 부분 -->
    <section class="featured spad" style="margin-left: 20%; margin-right: 20%;">
        <div class="row align-items-center">
            <div class="col-lg-12 col-md-12" style="border: 2px solid #24E082; padding: 3%; border-radius: 2em;">
                <form action="${ contextPath }/insertStory.st" method="post" id="writeForm">
<%--                 	<input type="hidden" name="userNum" value="${ loginUser.userNum }"> --%>
<!--                 	<input type="hidden" name="userNum" value="8"> -->
                	<input type="hidden" id="thumbnail" name="thumbnail" value="">
                    <div id="storyTitle">
                        <label
                        style="font-size: 25px; color: #24E082; font-weight: 700; padding-left: 1%; padding-top: 1.5%; padding-right: 1%;"
                        for="">제목</label>
                        <input type="text" name="boardTitle" placeholder="제목을 입력하세요" required style="width: 60%; padding: 0.5%;  border: none;">
                    </div>
                    <div class="text-center" id="column">
                        <br>
                        <textarea id="summernote" name="boardContent"></textarea>
                    </div>
                    <div class="text-center" id="Btn" style="margin-top: 2%;">
                        <button type="button" id="write"
                            style="height: 50px; width: 20%; background-color: #24E082; border: none; border-radius: 5em; color: #ffffff;">작성하기</button>
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
        placeholder: '글 내용을 입력해주세요! 첫번쨰 이미지가 썸네일이 됩니다.',
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
      
      const form = document.getElementById('writeForm');
      document.getElementById('write').addEventListener('click', ()=>{
		  //summernote 내용 가져오기
		  const img = $('#summernote').summernote('code');
		  
		  var thumbnail = img.substring(img.indexOf('/summer'), img.indexOf('src="')+44);
		  console.log("얍"+thumbnail);
		  
		  document.getElementById('thumbnail').value = thumbnail;
		  console.log(document.getElementById('thumbnail').value);
		  
    	  form.submit();
      });
      
      
    </script>
    
</body>
</html>