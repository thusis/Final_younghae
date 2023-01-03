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
                <li> / </li>
                <li><a href="#">게시글 상세보기</a></li>
                <li> <b>/</b> </li>
                <li><a href="#">답변하기</a></li>
            </ul>
        </div>

        <div class="row mt-5">
            <div class="col-lg-10 bn_card-top">
                <div class="row">
                    <div class="col-lg-1 bn_txt_big"><h2>Q</h2></div>
                    <div class="col-lg-10">
                        <div class="row bn_txt_big">
                            <h3>${qresp.board.boardTitle}</h3>
                        </div>
                        <div class="row bn_content">
                        	${qresp.board.boardContent}
                        </div>
                        <div class="row">
                            <div class="col-2"><span>${qresp.writerInfo}</span></div>
                            <div class="col"><span>${qresp.board.boardCreateDate}</span></div>
                            <div class="col d-flex align-items-center justify-content-end bn_board-meta text-end">
                                <i class="view fa-solid fa-eye m-2"></i><span class=" m-2">${qresp.board.boardView}</span>
                                <i class="bi bi-clipboard-plus-fill"></i><span class=" m-2"><c:if test="${ empty qresp.answerList }">0</c:if><c:if test="${ !empty qresp.answerList }">${qresp.answerList.size()}</c:if></span>
                                <i class="bi bi-chat-dots m-2"></i><span class=" m-2"><c:if test="${ empty qresp.replyList }">0</c:if>${qresp.replyList.size()}</span>
                                <i class="save fa-regular fa-bookmark m-2"></i><span class=" m-2"><c:if test="${ empty qresp.scrapList }">0</c:if>${qresp.scrapList.size()}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-lg-2"><!--관련영양제-->
				<div>
					<h4 style="font-family:'IBM Plex Sans KR', sans-serif; font-weight:800;">관련 영양제</h4>
					<a href="#">
						<img src="${qresp.sresp.proImage}" alt="${qresp.sresp.proName}">
						<span hidden="hidden">${qresp.sresp.proNum}</span>
						<h6>${qresp.sresp.proName}</h6>
					</a>
				</div>
            </div>
            
        </div>
		
<%-- 		${qresp } --%>
        <div class="col-lg-10 ">
            <div class="bn_txt_big" style="padding: 30px 0 10px 0;">
                <h3>답변하기</h3>
                <hr style="border:2px solid #24E082; background-color: #24E082;">
            </div>
            
            <c:if test="${ alert eq true }">
	           	<div class="bn_txt_big" style="padding: 30px 0 10px 0;">
	                <h5>이미 답변한 게시글입니다🤔<h3>
	            </div>
	            <br>
	            <a href="javascript:history.back();">뒤로 가기</a>
            </c:if>
            
            <c:if test="${ alert eq false }">
            <form action="${contextPath}/insertanswer.qa" method="post" enctype="multipart/form-data" >
                
                <div class="mb-3">
                    <div class="row m-3">
						<button type="button" class="btn bn_btn_search2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						  <i class="bi bi-capsule"></i>
						</button>
						<input type="text" class="inline" id="selectPill" placeholder="영양제 선택" style="border:0px; background-color: transparent;" disabled>
						<input type="hidden" id="selectPillHidden" name="supplement">
                    </div>
                    
                    <div class="filebox row m-3">
                        <button type="button" class="btn bn_btn_search2" id="addFile"><i class="bi bi-paperclip"></i></button>
                        <input class="upload-name col-lg-6" value="첨부파일" placeholder="첨부파일" readonly>
                        <label for="file">파일찾기</label> 
                        <input type="file" id="file" name="attachment">
                    </div>
                
                	<input type="hidden" name="boardTitle" value="${qresp.board.boardNum}">
					<div id="column"><br>
		           		<textarea id="summernote" name="boardContent"></textarea>
		       		</div>
                </div>

            <div class="row justify-content-end bn_board-meta mb-5">
                <button class="btn bn_btn_search2" style="background-color: white; color:black; border: 1px solid #24E082;" >취소</button>
                <button type="submit" class="btn bn_btn_search2">답변등록</button>
            </div>

            </form>

           	</c:if>
        
            
        </div>

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

   
<script>
	window.onload=()=>{
		$("#file").on('change',function(){ //첨부파일
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
		placeholder: 
			'답변 작성 시 서비스 운영정책을 지켜주세요.<br>광고주로부터 소정의 경제적 대가를 받고 특정 상품에 대한 추천 또는 후기글을 올리는 경우, <br>이러한 광고주와의 경제적 이해관계를 소비자들이 쉽게 알 수 있도록 <br>글 제목 또는 답변의 첫 부분 또는 끝 부분 등 적적란 위치에 공개하여야 합니다.<br>',
		tabsize: 2,
		height: 360,
		toolbar: [
			// [groupName, [list of button]]
			['fontname', ['fontname']],
			['fontsize', ['fontsize']],
			['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			['color', ['forecolor','color']],
//				['height', ['height']],
//				['insert',['picture','link','video']],
//				['view', ['fullscreen', 'help']]
		],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});


	
</script>
</body>
</html>