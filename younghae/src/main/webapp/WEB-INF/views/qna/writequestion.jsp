<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>질문게시판 - 질문상세보기</title>

    <script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"crossorigin="anonymous"></script>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
    
    <!-- 써머 노트 :CDN방식 -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    
	<style>
		#selectPillModal{
			width: 50vw;
			max-width: none;
			height: 50%;
		}
		
		.bn_txtElipsis{
			width:15rem;
	    	overflow:hidden;
	    	text-overflow:ellipsis;
	    	white-space:nowrap;
		}
	</style>
</head>
<body>
	<!-- 		영양제 선택 모달창 만들어야행 -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title fs-5" id="staticBackdropLabel">영양제 선택</h4>
	        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close"><i class="bi bi-x-circle"></i></button>
	      </div>
	      
		<div class="modal-body">
			<input type="text" id="searchSrespInput" name="keyword" placeholder="영양제 이름으로 검색">
			<button type="button" id="searchSrespBtn" class="btn bn_btn_search2"><i class="bi bi-search"></i></button>
			<div id="resultBox"></div>
       	</div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">선택하지 않고 닫기</button>
	        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">선택</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	

    <div class="container">
    
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> <b>/</b> </li>
                <li><a href="#">둘러보기</a></li>
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
					<button type="button" class="btn bn_btn_search2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						<i class="bi bi-capsule"></i>
					</button>
					<input type="text" class="inline" id="selectPill" placeholder="영양제 선택" style="border:0px; background-color: transparent;" disabled>
					<input type="hidden" id="selectPillHidden" name="supplement">
				</div>

                <div class="filebox row m-3">
                    <button type="button" class="site-btn bn_btn_search2" id="addFile"><i class="bi bi-paperclip"></i></button>
                    <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
                    <label for="file">파일찾기</label> 
                    <input type="file" id="file" name="attachment">
                </div>

		       <div id="column">
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
// 				var fileName = $("#file").val();
				var fileName = $("#file").val();
				$(".upload-name").val(fileName);
			});
			
			//============================영양제검색====================================
			document.getElementById('searchSrespBtn').addEventListener('click', ()=>{
				document.getElementById('resultBox').innerHTML='';
				
				$.ajax({
					url: '${contextPath}/searchSupplement.qa',
					data: { keyword: document.getElementById('searchSrespInput').value},
					success: (sresp)=>{
						document.getElementById('searchSrespInput').value='';
						document.getElementById('resultBox').innerHTML='';
						console.log(sresp);
						
						str = '<div class="container" style="font-family: '+'IBM Plex Sans KR'+', sans-serif;"><div class="row justify-content-between">'
						
						$.each(sresp , function(i){
							str += '<div class="col-5 srespEach" style="border: 1px solid #e5e3e3; margin:1rem; border-radius: 0.5em; cursor:pointer;" onmouseover="selectProNum();">'
			                +'<div class="row" style="height: 1.8rem ; background-color: #F5F5F5; border-top-left-radius: 0.5em; border-top-right-radius: 0.5em;"><span class="bn_txtElipsis">'+sresp[i].proName+'</span>'
							+'<input type="hidden" class="proNum" value="'+sresp[i].proNum+'">'							
							+'</div><div style="text-align: center;">'
							+'<img width="50px" src="'+sresp[i].proImage+'">' 
							+'</div><div style="color: gray; text-align: center;"><span>제조사:'
							+sresp[i].proCompany+'</span></div></div>';
						});
						
						str += '</div></div>';
						$('#resultBox').append(str);
					},
					error: (sresp)=>{alert("실패!");},
				});
			})
			
		}
		
		function selectProNum(){
			var sresps = document.getElementsByClassName('srespEach');
			
			for(const srespEach of sresps){
				srespEach.addEventListener('click', function(){
					console.log(this);
					const proNum = this.querySelectorAll('div')[0].querySelector('input').value;
					const proName =  this.querySelectorAll('div')[0].querySelector('span').innerText;
					console.log(proNum); // 이거 여러개 출력하는 거 막고 싶다.
					console.log(proName);
					
					document.getElementById('selectPillHidden').value = proNum;
					document.getElementById('selectPill').value = proName;
					return proNum;
				})
			}
		}

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
