<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 질문상세보기</title>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
	
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
	        <input type="text" placeholder="영양제 이름으로 검색">
	        <button type="button" class="btn bn_btn_search2"><i class="bi bi-search"></i></button>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">선택하지 않고 닫기</button>
	        <button type="button" class="btn btn-primary">선택</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<button type="button" class="btn bn_btn_search2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
	<i class="bi bi-capsule"></i>
</button>

    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> <b>/</b> </li>
                <li><a href="#">둘러보기</a></li>
                <li> <b>/</b> </li>
                <li><a href="#">게시글 상세보기</a></li>
            </ul>
        </div>

        <div class="row">
            <div class="col-lg-10">
                <div class="row justify-content-end ">
                    <div class="blog__details__widget">
                        <span style="font-size:0.5rem;">현재 페이지 공유하기</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="blog__details__social d-inline">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                            <a href="#"><i class="fa fa-envelope"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2"> <!--공란--> </div>
        </div>
        
        ${qresp }

        <div class="row">
            <div class="col-lg-10 bn_card-top"><!--영양제복용법질문======================================-->
                <div class="row">
                    <div class="col-lg-1 bn_txt_big"><h2>Q</h2></div>
                    <div class="col-lg-10">
                        <div class="row bn_txt_big">
                            <h3>${qresp.board.boardTitle}</h3>
                        </div>
                        <div class="row bn_content">
                        	${qresp.board.boardContent}
                        </div>

						<c:if test="${ !empty qresp.qattach.attachNum }">
							<img src="${contextPath }/resources/uploadFiles/${qresp.qattach.attachRename}" alt="" class="img-fluid">
						</c:if>
						<c:if test="${ empty qresp.qattach.attachNum }">없다</c:if>
                       	
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

                    <div class="dropdown col-lg-1 align-items-center justify-content-center">
                        <button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi lg bi-three-dots" style="font-size: 1.5rem; color:darkgray;"></i>
                        </button>
                        <ul class="dropdown-menu">
	                        <c:if test="${loginUser.userNum==qresp.board.userNum}">
	                            <li><a class="dropdown-item" href="#">수정하기</a></li>
	                            <li><a class="dropdown-item" onclick="deleteBoard();">삭제하기</a></li>
	                         </c:if>
	                        <c:if test="${loginUser.userNum!=qresp.board.userNum}">
	                            <li><a class="dropdown-item" onclick="openPopUp();" >신고하기</a></li>
	                        </c:if>
                        </ul>
                    </div>
                </div>

                <hr>

                <div class="row">
                    <div class="col-lg d-flex align-items-center" >
                      <h4 class="bn_txt_strong">댓글을 남기세요&nbsp;&nbsp;<i class="bi bi-chat-dots"></i></h4>
                    </div>
                  </div>
                <br>
                <div class="row">
                    <div class="col-lg">
                        <textarea name="comment" class="form-control" placeholder="Your Comment*" id="replyContent"></textarea>
                    </div>
                    <div class="col-lg-2"> 
                        <button class="btn bn_btn_search2" id="replySubmit" type="button">Post Comment</button>
                    </div>
                </div>
            </div>

            <div class="col-lg-2"><!--관련영양제-->
				<div>
					<c:if test="${ empty qresp.sresp }"> </c:if>
					<c:if test="${ !empty qresp.sresp }">
						<h4 style="font-family:'IBM Plex Sans KR', sans-serif; font-weight:800;">관련 영양제</h4>
						<a href="#">
							<img src="${qresp.sresp.proImage}" alt="${qresp.sresp.proName}">
							<span hidden="hidden">${qresp.sresp.proNum}</span>
							<h6>${qresp.sresp.proName}</h6>
						</a>
					</c:if>
				</div>
                <div class="mt-3">
                	<h5 style="font-family:'IBM Plex Sans KR', sans-serif;font-weight:600;">전문가세요? 관련 답변을 작성해보세요</h5>
                	<button class="text-left" style="border:0px; font-size:1rem;" onclick="location.href='${contextPath}/writeanswer.qa?boardNum='+'${qresp.board.boardNum}'">답변 등록</button>
                </div>
            </div>
            
            
        </div>

		<c:if test="${qresp.answerList eq '[]' }">
			<div class="row">
				<div class="col-lg-10 bn_card-bottom">
					<h5><i class="bi bi-x-square-fill"></i>아직 작성된 답변이 없어요!</h5>
					<span>전문가 회원이시라면 로그인해 첫 답변을 달아보세요.</span>
				</div>
			</div>
		</c:if>
		
		<c:forEach items="${qresp.answerList}" var="ans" varStatus="Astatus">
			<div class="row">
		       <div class="col-lg-10 bn_card-bottom"><!--영양제복용법답변 ===============-->
		           <div class="row">
		               <div class="col-lg-1 d-flex bn_txt_big"><h2>A</h2><h3>${Astatus.index+1}</h3></div>
		               <div class="col-lg-10">
		                   <div class="row bn_pro-box m-1"> <!--전문가칸-->
		                       <div class="col-lg-7  align-self-center">
		                           <h5 class="bn_pro-name">김가람&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">약사</span></h5>
		                           <span class="bn_pro-info">답변수 493개</span><br>
		                           <span class="bn_pro-info">전문과목 약학</span><br>
		                           <span class="bn_pro-info">소속 : 서울 중구 종로약국&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">병원 정보 보기</span></span><br>
		                       </div>
		
		                       <div class="col-3 align-self-center">
		                           <img src="img/pro_profile1.png" class="bn_pro-profile" alt="...">
		                       </div>
		                       <div class="col-2 align-self-center">
		                           <div class="bn_pro-icon"><i class="bi bi-list-ul"></i></div>
		                           <div class="bn_pro-icon"><i class="bi bi-send"></i></div>
		                       </div>
		                   </div>
		
		                   <div class="row bn_content">
		                       ${ans.board.boardContent}
		                   </div>
		                   
		                   <c:if test="${ !empty ans.aattach.attachNum }">
								<img src="${contextPath }/resources/uploadFiles/${ans.aattach.attachRename}" alt="" class="img-fluid">
		                   </c:if>
		
		                   <div class="row justify-content-end bn_board-meta">
		                       <i class="bi bi-chat-dots m-2"></i><span class=" m-2"><c:if test="${ empty ans.replyList }">0</c:if>${ans.replyList.size()}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                   </div>
		
		                   <hr>
		
		                   <div class="row">
		                       <div class="col-lg d-flex align-items-center" >
		                         <h4 class="bn_txt_strong">댓글을 남기세요&nbsp;&nbsp;<i class="bi bi-chat-dots"></i></h4>
		                       </div>
		                     </div>
		                   <br>
		                   <div class="row">
		
		                       <div class="col-lg">
		                           <textarea name="comment" class="form-control" placeholder="Your Comment*" id="replyContent"></textarea>
		                       </div>
		                       
		                       <div class="col-lg-2"> 
		                           <button class="btn bn_btn_search2" id="replySubmit" type="button">Post Comment</button>
		                       </div>
		                   </div>
		               </div>
		
		               <div class="dropdown col-lg-1 align-items-center justify-content-center">
		                   <button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		                       <i class="bi lg bi-three-dots" style="font-size: 1.5rem; color:darkgray;"></i>
		                   </button>
		                   <ul class="dropdown-menu">
		                       <li><a class="dropdown-item" href="#">수정하기</a></li>
		                       <li><a class="dropdown-item" onclick="deleteBoard();">삭제하기</a></li>
		                       <li><a class="dropdown-item" onclick="openPopUp();" >신고하기</a></li>
		                   </ul>
		               </div>
		           </div>
		       </div>
		
	            <div class="col-lg-2"><!--관련영양제-->
					<div>
						<c:if test="${ empty ans.sresp }"> </c:if>
						<c:if test="${ !empty ans.sresp }">
							<h4 style="font-family:'IBM Plex Sans KR', sans-serif;">이런 영양제는 어떠세요?</h4>
							<a href="#">
								<img src="${ans.sresp.proImage}" alt="${ans.sresp.proName}">
								<span hidden="hidden">${ans.sresp.proNum}</span>
								<h6>${ans.sresp.proName}</h6>
							</a>
						</c:if>
					</div>
	            </div>
			</div>
		</c:forEach>

<!-- 		영양제 선택 모달창 만들어야행 -->

        <div class="row">
            <div class="d-flex col-lg-10 row justify-content-between">
                <a style="text-decoration: none; color:#8496AE;" href="prev">이전글보기</a>
                <a style="text-decoration: none; color:#8496AE;" href="prev">다음글보기</a>
            </div>
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
	}

	$("#selectPillBtn").click(function(){ //영양제 선택 모달창 팝업
		$("#modalPillChoice").modal({backdrop:'static'});
		$('#modalPillChoice').modal("show");
	//영양제 검색 > 영양제이름으로만 검색결과 > 뷰 > 선택 > 유저에게 보이는 창에는 영양제이름이, 전달되는 값은 영양제제품번호만
	//모달이 아니고 팝업으로 구현 따로 창을 만들어야 함
	});


	
</script>
</body>
</html>