<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 질문하기</title>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
    
	<!-- jQuery -->	
<!--     <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script> -->

    <!-- 써머 노트 :CDN방식 -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

	<style>
		#selectPillModal{
			width: 50vw;
			max-width: none;
			height: 50%;
		}
	</style>
</head>
<body>

	
    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> <b>/</b> </li>
                <li><a href="#">질문하기</a></li>
            </ul>
        </div>

        <div class="section-title" style="padding: 30px 0 10px 0;">
            <h2>질문하기</h2>
            <hr style="width:50vw; border:2px solid #24E082; background-color: #24E082;">
        </div>

        <form action="${contextPath}/insertquestion.qa" method="post" enctype="multipart/form-data" >
        
            <div class="mb-5">
                <label for="boardTitle" class="form-label bn_txt_strong">제목</label>
                <input type="text" class="form-control m-3" id="title" name="boardTitle" placeholder="제목을 입력하세요">
            </div>

            <div class="mb-3">
                <label for="content" class="form-label bn_txt_strong">내용</label>
                <div class="row m-3">
                    <button type="button" class="site-btn" id="selectPillBtn"><i class="bi bi-capsule"></i></button>
                    <input type="text" class="inline" id="selectPill" placeholder=" 영양제 선택" name="supplement" style="border:0px; background-color: transparent;" disabled>
                </div>

                <div class="filebox row m-3">
                    <button type="button" class="site-btn" id="addFile"><i class="bi bi-paperclip"></i></button>
                    <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
                    <label for="file">파일찾기</label> 
                    <input type="file" id="file" name="attachment">
                </div>

		       <div class="text-center" id="column">
		           <br>
		           <textarea id="summernote" name="boardContent"></textarea>
		       </div>
            </div>
        
	        <div class="row float-right">
	            <button class="btn bn_btn_search2" style="background-color: white; color:black; border: 1px solid #24E082;" >취소</button>
	            <button type="submit" class="btn bn_btn_search2">등록</button>
	        </div>
        </form>

    </div>

	<br>
	<br>
	<br>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalPillChoice" aria-hidden="false" style="background-color: white;">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	            <div class="modal-body p-4 text-center">
	                <!--영양제 목록 보여줄건데 이건 include 해야 할 것 같다!-->
<!-- 	                <div class="row"> -->
<!-- 	                    <div class="col-lg-4 col-md-6 col-sm-6"> -->
<!-- 	                        <div class="product__item"> -->
<!-- 	                            <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg"> -->
<!-- 	                                <ul class="product__item__pic__hover"> -->
<!-- 	                                    <li><a href="#"><i class="fa fa-heart"></i></a></li> -->
<!-- 	                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li> -->
<!-- 	                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li> -->
<!-- 	                                </ul> -->
<!-- 	                            </div> -->
<!-- 	                            <div class="product__item__text"> -->
<!-- 	                                <h6><a href="#">Crab Pool Security</a></h6> -->
<!-- 	                                <h5>$30.00</h5> -->
<!-- 	                            </div> -->
<!-- 	                        </div> -->
<!-- 	                    </div> -->
<!-- 	                    <div class="col-lg-4 col-md-6 col-sm-6"> -->
<!-- 	                        <div class="product__item"> -->
<!-- 	                            <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg"> -->
<!-- 	                                <ul class="product__item__pic__hover"> -->
<!-- 	                                    <li><a href="#"><i class="fa fa-heart"></i></a></li> -->
<!-- 	                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li> -->
<!-- 	                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li> -->
<!-- 	                                </ul> -->
<!-- 	                            </div> -->
<!-- 	                            <div class="product__item__text"> -->
<!-- 	                                <h6><a href="#">Crab Pool Security</a></h6> -->
<!-- 	                                <h5>$30.00</h5> -->
<!-- 	                            </div> -->
<!-- 	                        </div> -->
<!-- 	                    </div> -->
<!-- 	                    <div class="col-lg-4 col-md-6 col-sm-6"> -->
<!-- 	                        <div class="product__item"> -->
<!-- 	                            <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg"> -->
<!-- 	                                <ul class="product__item__pic__hover"> -->
<!-- 	                                    <li><a href="#"><i class="fa fa-heart"></i></a></li> -->
<!-- 	                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li> -->
<!-- 	                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li> -->
<!-- 	                                </ul> -->
<!-- 	                            </div> -->
<!-- 	                            <div class="product__item__text"> -->
<!-- 	                                <h6><a href="#">Crab Pool Security</a></h6> -->
<!-- 	                                <h5>$30.00</h5> -->
<!-- 	                            </div> -->
<!-- 	                        </div> -->
<!-- 	                    </div> -->
<!-- 					</div> -->
				<h5>영양제 선택</h5>
				<form action="${contextPath}/searchSupplement.qa" method="post">
					<input type="text" name="keyword">
				</form>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">검색하지 않고 닫기</button>
		        <button type="submit" class="btn btn-primary">검색하기</button>
		      </div>
	        </div>
	    </div>
	</div>
<%-- 	<%@ include file="supplementModal.jsp" %> --%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script>
		window.onload=()=>{
			$("#file").on('change',function(){ //첨부파일
				var fileName = $("#file").val();
				$(".upload-name").val(fileName);
			});
		}
		  

		$("#selectPillBtn").click(function(){ //영양제 선택 모달창 팝업
			$("#modalPillChoice").modal({backdrop:'static'});
			$('#modalPillChoice').modal("show");
		//영양제 검색 > 영양제이름으로만 검색결과 > 뷰 > 선택 > 유저에게 보이는 창에는 영양제이름이, 전달되는 값은 영양제제품번호만
		//모달이 아니고 팝업으로 구현 따로 창을 만들어야 함
		});
		  
		$('#summernote').summernote({
			placeholder: '내용을 작성하세요',
			tabsize: 2,
			height: 360,
			toolbar: [
				// [groupName, [list of button]]
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				['color', ['forecolor','color']],
// 				['height', ['height']],
// 				['insert',['picture','link','video']],
// 				['view', ['fullscreen', 'help']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});

		
	</script>
	</body>
</html>
