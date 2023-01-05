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
	
	<style>
		a{text-decoration:none;}
		.bn_board-meta > i : hover {
			color: green;
		}
	</style>
</head>
<body>

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
                <div class="row justify-content-end mb-3">
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

        <div class="row">
            <div class="col-lg-10 bn_card-top"><!--영양제복용법질문======================================-->
                <div class="row">
                    <div class="col-lg-1 bn_txt_big"><h2>Q</h2></div>
                    <div class="col-lg-10">
                        <div class="row bn_txt_big">
                            <h3>${qresp.board.boardTitle}</h3>
                        </div>
                        <div class="row">
                        <div class="bn_content">${qresp.board.boardContent}</div></div>
						<c:if test="${ qresp.qattach.attachNum ne 0}">
                        <div class="row" style="padding:3rem;">
							<img src="${contextPath}/resources/uploadFiles/${qresp.qattach.attachRename}" alt="" class="img-fluid">
							<br>
						</div>
						</c:if>
                        
                       	
                        <div class="row">
                            <div class="col-2"><span>${qresp.writerInfo}</span></div>
                            <div class="col"><span>${qresp.board.boardCreateDate}</span></div>
                            <div class="col d-flex align-items-center justify-content-end bn_board-meta text-end">
                                <i class="view fa-solid fa-eye m-2"></i><span class=" m-2">${qresp.board.boardView}</span>
                                <i class="bi bi-clipboard-plus-fill"></i><span class=" m-2"><c:if test="${ empty qresp.answerList }">0</c:if><c:if test="${ !empty qresp.answerList }">${qresp.answerList.size()}</c:if></span>
                                <i class="bi bi-chat-dots m-2"></i><span class=" m-2">${qresp.replyList.size()}</span>
<%--                                 <i class="save fa-regular fa-bookmark m-2" onclick="deleteScrap();"></i><span class=" m-2">${qresp.scrapList.size()}</span> --%>
<%--                                 <i class="save fa-regular fa-bookmark m-2" onclick="setScrap();"></i><span class=" m-2">${qresp.scrapList.size()}</span> --%>
                            </div>
                        </div>
                    </div>

                    <div class="dropdown col-lg-1 align-items-center justify-content-center">
                    	<c:if test="${loginUser!=null }">
                        <button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi lg bi-three-dots" style="font-size: 1.5rem; color:darkgray;"></i>
                        </button>
                        <ul class="dropdown-menu">
                        
	                        <c:if test="${loginUser.userNum==qresp.board.userNum}">
	                        	<c:if test="${ qresp.answerList.size() eq 0 }">
		                            <li><a class="dropdown-item" onclick="updateQuestion();">수정하기</a></li>
		                            <li><a class="dropdown-item" onclick="location.href='${contextPath}/deletequestion.qa?boardNum=${qresp.board.boardNum}'">삭제하기</a></li>
	                            </c:if>
	                        	<c:if test="${ qresp.answerList.size() ne 0 }">
	                        		<c:if test="${qresp.question.isSolved eq 'N'}">
		                            <li><a class="dropdown-item" onclick="location.href='${contextPath}/updateIsSolved.qa?boardNum=${qresp.board.boardNum}'">✅해결되었어요</a></li>
	                        		</c:if>
		                            <li><a class="dropdown-item" onclick="disabledAlert();">수정하기</a></li>
		                            <li><a class="dropdown-item" onclick="disabledAlert();">삭제하기</a></li>
	                            </c:if>
	                         </c:if>
	                         
	                        <c:if test="${loginUser.userNum!=qresp.board.userNum}">
	                            <li><a class="dropdown-item" onclick="openPopUp();" >신고하기</a></li>
	                        </c:if>
                        </ul>
                        </c:if>
                    </div>
                </div>

                <hr>

                <div class="row">
                    <div class="col-lg d-flex align-items-center" >
                      <h4 class="bn_txt_strong">댓글을 남기세요&nbsp;&nbsp;<i class="bi bi-chat-dots"></i></h4>
                    </div>
                </div>
                <br>

                <div class="row"> <!--================ Q댓글작성파트 ================-->
                    <c:if test="${ loginUser != null }">
                    <div class="col-lg">
                        <input name="comment" class="col" style="height:4rem;" placeholder="Your Comment*" class="replyContent">
                    </div>
                    <div class="col-lg-2"> 
                        <button class="btn bn_btn_search2 replySubmits" type="button">
                        	Post Comment
                        	<span style="display:none">${qresp.board.boardNum}</span>                        
                        	<h6 style="display:none">${qresp.board.boardType}</h6>                        
                        </button>
                    </div>
                    </c:if>
                    <c:if test="${ loginUser == null }">
                    <div class="col-lg">
                    	<input name="comment" class="col" style="height:4rem;" placeholder="로그인한 회원만 작성할 수 있습니다">
                    </div>
                    <div class="col-lg-2"> 
                        <button class="btn bn_btn_search2" type="button" disabled>Post Comment</button>
                    </div>
                    </c:if>
                </div><!--================ Q댓글작성파트 ================-->
                
                <br>
				<div class="row reply_list"><!-- ===========Q댓글리스트============== -->
	                <c:forEach items="${qresp.replyList }" var="r">
	                <div class="col-lg-12 mt-3"> <!-- secondDiv -->
	                    <div class="row reply_item" >
		                    <span style="display:none;">${r.reply.replyNum }</span>
		                    <span class="col-lg-2 text-start reply_item_replyUserNum">${r.writerInfo }</span>
		                    <span class="col-lg-8 reply_item_replyContent">${r.reply.replyContent }</span>
		                    <span class="col-lg-2 reply_item_replyContent">${r.reply.replyDate }</span>
	                    </div>
	                    <hr>
                    </div>
	                </c:forEach>   
                </div><!-- =============================Q댓글리스트================================ -->
                <br>
            </div>

            <div class="col-lg-2"><!--관련영양제-->
				<div>
					<c:if test="${ empty qresp.sresp }"> </c:if>
					<c:if test="${ !empty qresp.sresp }">
						<h4 style="font-family:'IBM Plex Sans KR', sans-serif; font-weight:800;">관련 영양제</h4>
						<a href="${contextPath}/supplementDetail.sh?proNum=${qresp.sresp.proNum }">
							<img src="${qresp.sresp.proImage}" alt="${qresp.sresp.proName}">
							<span hidden="hidden">${qresp.sresp.proNum}</span>
							<h6>${qresp.sresp.proName}</h6>
						</a>
					</c:if>
				</div>
               	<c:if test="${loginUser !=null && loginUser.userCNumber eq 2}">
                	<c:if test="${qresp.question.isSolved eq 'N'}">
	                <div class="mt-3">
	                	<h5 style="font-family:'IBM Plex Sans KR', sans-serif;font-weight:600;">전문가세요? 관련 답변을 작성해보세요</h5>
	                	<button class="text-left" style="border:0px; font-size:1rem;" onclick="location.href='${contextPath}/writeanswer.qa?boardNum='+'${qresp.board.boardNum}'">답변 등록</button>
	                </div>
	                </c:if>
	            </c:if>
	                
                <c:if test="${qresp.question.isSolved ne 'N'}">
                <div class="mt-3">
                	<h5 style="font-family:'IBM Plex Sans KR', sans-serif;font-weight:600;">사용자가 만족하여 이미 해결된 질문이에요🤗<h5>
                </div>
                </c:if>
	                
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
		       <div class="col-lg-10 bn_card-bottom"><!--A영양제복용법답변 ===============-->
		           <div class="row">
		               <div class="col-lg-1 d-flex bn_txt_big"><h2>A</h2><h3>${Astatus.index+1}</h3></div>
		               <div class="col-lg-10">
		                   <div class="row bn_pro-box m-1"> <!--전문가칸-->
		                       <div class="col-lg-7  align-self-center">
		                           <h5 class="bn_pro-name">${ans.eresp.member.userName}&nbsp;&nbsp;
		                           <span class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">
				                           <c:if test="${ans.eresp.expert.expertSort.trim() eq 'N' }">선택안함</c:if>
				                           <c:if test="${ans.eresp.expert.expertSort.trim() eq 'D' }">의사</c:if>
				                           <c:if test="${ans.eresp.expert.expertSort.trim() eq 'C' }">약사</c:if>
		                           </span></h5>
		                           <span class="bn_pro-info">답변수 ${ans.eresp.answerListSize} 개</span><br>
		                           <span class="bn_pro-info">전문과목 ${ans.eresp.expert.expertMedi}</span><br>
		                           <span class="bn_pro-info">
					                    <span>소속 : 
					                    <c:if test="${ans.eresp.expert.expertDept.trim() eq 'N' }">선택안함</c:if>
					                    <c:if test="${ans.eresp.expert.expertDept.trim() ne 'N' }">${ans.eresp.expert.expertDept}&nbsp;&nbsp;</c:if>
					                    </span>
			                           <span class="badge rounded-pill" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">
				                           <a style="text-decoration:none; color:white;" href="${contextPath}/experthospital.qa?expertNum=${ans.eresp.member.userNum}">
				                           <c:if test="${ans.eresp.expert.expertSort.trim() eq 'N' }">선택안함</c:if>
				                           <c:if test="${ans.eresp.expert.expertSort.trim() eq 'D' }">병원</c:if>
				                           <c:if test="${ans.eresp.expert.expertSort.trim() eq 'C' }">약국</c:if>
			                           정보 보기</a>
			                           </span>
		                           </span><br>
		                       </div>

								<div class="col-3 align-self-center">
								
								
									<c:if test="${ans.eresp.eattach != null }">
									<div class="bn_pro-profile" style="width:7rem; height:7rem; border-radius: 25rem; ">
										<img style="border-radius:25rem;" src="${contextPath}/resources/uploadFiles/${ans.eresp.eattach.attachRename}"alt="전문가프로필">
									</div>
									</c:if>
									<c:if test="${ans.eresp.eattach == null }">
									<div style="vertical-align:middle; width:7rem; height:7rem; border-radius: 25rem; background-color:#DBE2EA; text-align:center; vertical-align:middle;">
										<img style="margin-top:2.5rem;"src="resources/img/logo_white.svg" style="width:6rem;"alt="흰로고">
									</div>
									</c:if>
		                       </div>
		                       <div class="col-2 align-self-center">
		                           <div class="bn_pro-icon" id="goToExpert" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Disabled popover"><a style="text-decoration:none; color:white;" href="${contextPath}/expertprofile.qa?expertNum=${ans.eresp.member.userNum}"><i class="bi bi-list-ul"></i></a></div>
		                           <c:if test="${loginUser != null }">
		                           <div class="bn_pro-icon" id="goToChat" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Disabled popover"><a style="text-decoration:none; color:white;" href="${contextPath}/open.ch?expertNum=${ans.eresp.member.userNum}"><i class="bi bi-send"></i></a></div>
		                           </c:if>
		                       </div>
		                   </div>
						
		                   <div class="row">
		                   <div class="bn_content">${ans.board.boardContent}</div></div>
		                   
		                   <c:if test="${ ans.aattach.attachNum ne 0 }">
		                   <div class="row" style="padding:3rem;">
								<img src="${contextPath }/resources/uploadFiles/${ans.aattach.attachRename}" alt="" class="img-fluid"><br>
							</div>
		                   </c:if>
		
		                   <div class="row justify-content-end bn_board-meta">
		                       <i class="bi bi-chat-dots m-2"></i><span class=" m-2">${ans.replyList.size()}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                   </div>
		
		                   <hr>
		
		                   <div class="row">
		                       <div class="col-lg d-flex align-items-center" >
		                         <h4 class="bn_txt_strong">댓글을 남기세요&nbsp;&nbsp;<i class="bi bi-chat-dots"></i></h4>
		                       </div>
		                     </div>
		                   <br>
		                   <div class="row"><!--================ A댓글작성파트 ================-->
			                    <c:if test="${ loginUser != null }">
			                    <div class="col-lg">
			                        <input name="comment" class="col" style="height:4rem;" placeholder="Your Comment*" class="replyContent">
			                    </div>
			                    <div class="col-lg-2"> 
			                        <button class="btn bn_btn_search2 replySubmits" type="button">
			                        Post Comment
			                        <span style="display:none">${ans.board.boardNum}</span>    
			                        <h6 style="display:none">${ans.board.boardType}</h6>                        
			                        </button>
			                    </div>
			                    </c:if>
			                    <c:if test="${ loginUser == null }">
			                    <div class="col-lg">
			                    	<input name="comment" class="col" style="height:4rem;" placeholder="로그인한 회원만 작성할 수 있습니다">
			                    </div>
			                    <div class="col-lg-2">
			                        <button class="btn bn_btn_search2" type="button" disabled>Post Comment</button>
			                    </div>
			                    </c:if>
		                   </div><!--================ A댓글작성파트 ================-->
		                   
		                   <br>
		                   <div class="row reply_list"><!-- ===========A댓글리스트============== -->
				                <c:forEach items="${ans.replyList }" var="r">
				                <div class="col-lg-12 mt-3"> <!-- secondDiv -->
				                    <div class="row reply_item" >
					                    <span style="display:none;">${r.reply.replyNum }</span>
					                    <span class="col-lg-2 text-start reply_item_replyUserNum">${r.writerInfo }</span>
					                    <span class="col-lg-8 reply_item_replyContent">${r.reply.replyContent }</span>
					                    <span class="col-lg-2 reply_item_replyContent">${r.reply.replyDate }</span>
				                    </div>
				                    <hr>
			                    </div>
				                </c:forEach>   
			                </div><!-- =============================A댓글리스트================================ -->
			             	<br>
		                   
		               </div>
		
		                <div class="dropdown col-lg-1 align-items-center justify-content-center">
							<button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			                	<i class="bi lg bi-three-dots" style="font-size: 1.5rem; color:darkgray;"></i>
		                	</button>
		                	<ul class="dropdown-menu">
		                	<c:if test="${loginUser.userNum eq ans.board.userNum}">
		                		<li><a class="dropdown-item" href="#">수정하기</a></li>
		                		<li><a class="dropdown-item" onclick="deleteBoard();">삭제하기</a></li>
		                	</c:if>
		                	<c:if test="${loginUser.userNum ne ans.board.userNum}">
		                		<li><a class="dropdown-item" onclick="openPopUp();" >신고하기</a></li>
		                	</c:if>
		                	</ul>
		               </div>
		           </div>
		       </div>
		
	            <div class="col-lg-2"><!--관련영양제-->
					<div>
						<c:if test="${ empty ans.sresp }"> </c:if>
						<c:if test="${ !empty ans.sresp }">
							<h4 style="font-family:'IBM Plex Sans KR', sans-serif;">이런 영양제는 어떠세요?</h4>
							<a href="${contextPath}/supplementDetail.sh?proNum=${ans.sresp.proNum }">
								<img src="${ans.sresp.proImage}" alt="${ans.sresp.proName}">
								<span hidden="hidden">${ans.sresp.proNum}</span>
								<h6>${ans.sresp.proName}</h6>
							</a>
						</c:if>
					</div>
	            </div>
			</div>
		</c:forEach>

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
		console.log(document.getElementsByClassName('replySubmits')[0]);
		
		const replyBtns = document.getElementsByClassName('replySubmits');
		var loginUserNum = 0;
		if(${loginUser != null}){
			loginUserNum = ${loginUser.userNum}+"";
		} else {
			loginUserNum = 0;
		}
		
		console.log(loginUserNum);
		
		for(const btn of replyBtns){//댓글달기===================================================================================
			btn.addEventListener('click', function(){
				
				const replyContent = btn.parentNode.parentNode.querySelector('input').value;
				var boardNum = this.querySelector('span').innerText;
				const boardType = this.querySelector('h6').innerText;
				if(loginUserNum != 0){
					var userNum = loginUserNum;
				}else{
					var userNum = 0;
				}
				
				console.log(btn.parentNode.parentNode.querySelector('input').value);
				console.log(boardNum, boardType, userNum);
				
				$.ajax({
					url: '${contextPath}/insertreply.qa',
					type: 'POST',
					data: {
						replyContent : replyContent,
						boardNum : boardNum,
						boardType : boardType,
						userNum : userNum
					},
					success: (data)=>{
						btn.parentNode.parentNode.querySelector('input').value = '';
						
						const replyListDiv = btn.parentNode.parentNode.parentNode.querySelector('.reply_list');
						replyListDiv.innerHTML = "";
						replyListDiv.classList.add("row", "reply_list");
						
						console.log(data[0].reply.replyNum); //
						console.log(data[0].writerInfo);
						console.log(data[0].reply.replyContent);
						console.log(data[0].reply.replyDate);
						
						for ( var i=0; i<data.length; i++ ){
							const secondDiv = document.createElement('div'); secondDiv.classList.add("col-lg-12", "mt-3");
							const replyItemDiv = document.createElement('div'); replyItemDiv.classList.add("row", "reply_item");
							
							const replyNumSpan = document.createElement('span');
							replyNumSpan.style.display = "none";
							replyNumSpan.innerText = data[i].reply.replyNum;
							
							const writerInfoSpan = document.createElement('span');
							writerInfoSpan.classList.add("col-lg-2", "text-start", "reply_item_replyUserNum");
							writerInfoSpan.innerText = data[i].writerInfo;
							
							const replyContentSpan = document.createElement('span');
							replyContentSpan.classList.add("col-lg-8", "reply_item_replyContent");
							replyContentSpan.innerText = data[i].reply.replyContent;
							
							const replyDateSpan = document.createElement('span');
							replyDateSpan.classList.add("col-lg-2", "reply_item_replyContent");
							replyDateSpan.innerText = data[i].reply.replyDate;
							
							const hr = document.createElement('hr');
	
							replyItemDiv.append(replyNumSpan);
							replyItemDiv.append(writerInfoSpan);
							replyItemDiv.append(replyContentSpan);
							replyItemDiv.append(replyDateSpan);
							secondDiv.append(replyItemDiv);
							secondDiv.append(hr);
							replyListDiv.append(secondDiv);
						}
					},
					error: (data)=>{
						alert("실패!");
					}
				});//ajax끝
			});
		}//댓글달기 끝===================================================================================

			
		//====게시글 수정
		function updateQuestion(){
			console.log("수정");
			
		}
		
		//====수정/삭제 불가
		function disabledAlert(){
			alert('이미 답글이 달린 게시글은 수정/삭제가 불가능합니다‼‼');
		}
		
		//====스크랩불러오기
		var boardNum = "${qresp.board.boardNum}";
		var userNum = "${loginUser.userNum}";

		function deleteScrap(){
	   			$.ajax({
	   				url:'${contextPath}/deleteScrap.qa',
	   				data :{ boardNum : boardNum , userNum : userNum },
	   				success : (data)=>{
	   					console.log("스크랩취소");
// 						document.getElementById('isScrap').innerHTML = '<h2><i class="save fa-regular fa-bookmark"></i></h2>';
	// 					this.innerHTML = '<h2><i class="save fa-regular fa-bookmark"></i></h2>';
// 						document.getElementById('scrapCount').innerHTML = '<i class="save fa-regular fa-bookmark"></i>' + data;
// 	    				isScrap = 0;
	   				}
	   			}); // ajax 스크랩 취소
			} 
		function setScrap(){
				$.ajax({
	  				url:'${contextPath}/setScrap.qa',
	   				data :{ boardNum : boardNum , userNum : userNum },
	   				success : (data)=>{
	   					console.log("스크랩함");
// 	   					document.getElementById('isScrap').innerHTML = '<h2><i class="fa-solid fa-bookmark"></i></h2>';
// 						document.getElementById('scrapCount').innerHTML = '<i class="fa-solid fa-bookmark"></i>' + data;
// 	    				isScrap = 1;
	  				}
	  			}); // ajax 스크랩 추가
			}
		
// 		function changeScrap(){
//			if(isScrap==1){
//	   			$.ajax({
//	   				url:'${contextPath}/deleteScrap.qa',
//	   				data :{ boardNum : boardNum , userNum : userNum },
//	   				success : (data)=>{
//	   					console.log("스크랩취소");
//// 						document.getElementById('isScrap').innerHTML = '<h2><i class="save fa-regular fa-bookmark"></i></h2>';
//	// 					this.innerHTML = '<h2><i class="save fa-regular fa-bookmark"></i></h2>';
//// 						document.getElementById('scrapCount').innerHTML = '<i class="save fa-regular fa-bookmark"></i>' + data;
//// 	    				isScrap = 0;
//	   				}
//	   			}); // ajax 스크랩 취소
//			} else {
//				$.ajax({
//	  				url:'${contextPath}/setScrap.qa',
//	   				data :{boardId:boardId,userId:userId},
//	   				success : (data)=>{
//	   					console.log("스크랩함");
//// 	   					document.getElementById('isScrap').innerHTML = '<h2><i class="fa-solid fa-bookmark"></i></h2>';
//// 						document.getElementById('scrapCount').innerHTML = '<i class="fa-solid fa-bookmark"></i>' + data;
//// 	    				isScrap = 1;
//	  				}
//	  			}); // ajax 스크랩 추가
//			}
//		}
	</script>
</body>
</html>