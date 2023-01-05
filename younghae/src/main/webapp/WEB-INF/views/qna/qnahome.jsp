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
	
</head>
<body style="background-color: #f8f8fa;">

<%-- ${ qlist} --%>
    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> <b>/</b> </li>
                <li><a href="${contextPath}/home.qa">둘러보기</a></li>
            </ul>
        </div>
		
<!-- 		<input type="text" id="tempUserNum"/> -->
<!-- 		<button id="loginBtn">로그인</button> -->
<!-- 		<button id="logoutBtn">로그아웃</button><br> -->
		
		<c:if test="${ loginUser != null }">
        <div style="padding: 30px 0 10px 0;">
            <h3 class="text-start" style="font-weight: 700;">내가 남긴 질문</h3>
            <h6 class="mt-3"><b>전문가와 함께 건강관리를 시작하세요</b></h6>
            <h6>Q&A는 의사와 약사, 전문 의료인에게 영양제 정보 등 건강과 관련된 질문을 할 수 있는 게시판입니다</h6>
            <hr style="border:1px solid #24E082; background-color: #24E082;">
        </div>

        <div class="row">
            <div class="col-lg-6">
            
                <div class="bn_homebox_2 bn_homebox_2_main row justify-content-between">
                    <div>
                        <span style="display: inline-block; line-height:2.5rem;">내가 남긴 질문 보기</span>&nbsp;&nbsp;
                        <div class="bn_round">
                        	<button class="btn" id="checkMyQa">${myQuest.size()}</button>
                        	<c:if test="${ isread eq true }"></c:if>
                        	<c:if test="${ isread eq false }"><div class="bn_round_badge" id="checkMyQaBadge"></div></c:if>
                        </div>
                    </div>
                    <button class="btn" onclick="location.href='${contextPath}/myquest.qa'">더보기</button>
                </div>
                
                <c:if test="${myQuest.size()==0 }">
                <div class="bn_homebox_3 row">
                	<div class="col-lg-10">
                	작성한 글이 없습니다. 
                	</div>
                </div>
                </c:if>

                <c:if test="${myQuest.size()!=0 }">
                <c:forEach items="${myQuest}" var="mq" end="2">
				<div class="bn_homebox_3 row">
                    <div class="col-lg-10" onclick="location.href='${contextPath}/question.qa?boardNum=${mq.board.boardNum}'">
                        <h5>${mq.board.boardTitle}</h5>
                        <h6>
                            <i class="fa-solid fa-arrow-right-long" style="color: rgb(212, 212, 212);"></i>
                            <span>${mq.answerList.size()}</span>개의 답변
                        </h6>
                    </div>
                    <div class="col-lg-2">
                        <button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi lg bi-three-dots" style="font-size: 1.5rem; color:darkgray;"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">수정하기</a></li>
                            <li><a class="dropdown-item" onclick="deleteBoard();">삭제하기</a></li>
                        </ul>
                    </div>
                </div>
                </c:forEach>

                </c:if>
             </div>

	            <div class="col-lg-6">
	                <div class="bn_homebox" style="padding-left: 2rem;" onclick="location.href='${contextPath}/writequestion.qa'"><h4><b>질문하러 가기</b></h4></div>
	                <div class="bn_homebox row" onclick="location.href='${contextPath}/open.ch'">
	                    <div class="col-lg-9">
	                        <h4><b>안전한 복용을 위해</b></h4>
	                        <h6><b>전문 의료인과</b></h6>
	                        <h6><b>1:1채팅 서비스를 시작해보세요</b></h6>
	                        <br>
	                        <h6>영해는 전문 의료인과 1:1 채팅 서비스를 제공합니다</h6>
	                    </div>
	                    <div class="col-lg-3">
	                        <img src="resources/img/qna/chat.png" alt="채팅" width="">
	                    </div>
	                    
	                </div>
	            </div>
	        </div>
         </c:if> 
        <div style="padding: 30px 0 10px 0;" >
			<div class="row justify-content-between">
            <h3 class="text-start" style="display:inline-block; font-weight: 700; cursor:pointer;" onclick="location.href='${contextPath}/boardList.qa'">Q&A 최신글</h3>
            <h6 class="text-end bn_more" style="display:inline-block;cursor:pointer;" onclick="location.href='${contextPath}/boardList.qa'">더보기</h6>
            </div>
            <hr style="border:1px solid #24E082; background-color: #24E082;">
        </div>

        <div class="bn_boardlist mt-2" style="background-color: #ffffff;">
            <table class="table" >
                <thead>
                  <tr class="text-teal-100">
                    <th scope="col">해결되었어요</th>
                    <th scope="col">글번호</th>
                    <th scope="col" class="col-lg-4">제목</th>
                    <th scope="col">글쓴이</th>
   	                <th scope="col">답변수</th>
                    <th scope="col">조회수</th>
                    <th scope="col" class="col-lg-2">날짜</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${qlist}" var="q" >
	                    <tr class="questionTr">
	                    	<c:if test="${q.question.isSolved  eq 'Y'}">
	                        	<th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-square-fill"></i></th>
	                        </c:if>
	                    	<c:if test="${q.question.isSolved eq 'N'}">
	                        	<th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-square"></i></th>
	                        </c:if>
	                        <td>${q.board.boardNum}</td>
	                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${q.board.boardTitle}</td>
	                        <td>${q.writerInfo}</td>
	                        <td>${q.answerList.size()}</td>
	                        <td>${q.board.boardView }</td>
	                        <td>${q.board.boardCreateDate }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

         <div class="row d-flex justify-content-center">
             <div class="input-group mt-3 col-lg-6">
                 <select class="form-select form-select-sm bn_detail-search">
                     <option selected>카테고리 선택</option>
                     <option value="제목내용">제목+내용</option>
                     <option value="제목">제목</option>
                     <option value="내용">내용</option>
                     <option value="글쓴이">글쓴이</option>
                 </select>
                 <input type="text" class="form-control" id="bn_detail-search-point" placeholder="내용을 입력하세요">
                 <button class="btn bn_btn_search2" >검색</button>
             </div>
         </div>


         <div style="padding: 30px 0 10px 0;">
             <h3 class="text-start" style="font-weight: 700;">많이 보는 질문글</h3>
             <hr style="border:1px solid #24E082; background-color: #24E082;">
             <h6>지난 24시간 동안 조회수가 가장 높은 질문글입니다</h6>
         </div>

		<div class="row" style="padding: 1.25rem;">
			<c:forEach items="${topTwo}" var="t">
			<div class="col bn_homebox_4 toptwo">
				<div class="row" id="titel1" style="font-size: 1.25rem; font-weight: 600; color:#24E082;">${t.board.boardTitle}</div>
                <div class="row" id="titel1">
                   	<span style="display:none" class="topTwoBoardNum">${t.board.boardNum} </span>
                       <span style="font-size: 0.5rem; font-weight: 600;" >${t.writerInfo}</span>&nbsp;&nbsp;
                       <span style="font-size: 0.5rem;" >${t.board.boardCreateDate}</span>
                </div>
				<div style="overflow: hidden; line-height:1.2rem; height:3.6rem; text-overflow: ellipsis; margin-right: 1.5rem;">
					${t.board.boardContent}
				</div>
				<hr style="border: 1px solid darkgrey; width: 5rem; text-align:left; margin-left: 0;">
				
				<c:if test="${t.answerList.size() eq 0}">
					<div class="row">
						<span style="line-height:1.5rem; font-size: 1rem; font-weight: 600; color:#24E082;">
							아직 작성된 답변이 없습니다
						</span>
					</div>
				</c:if>
				
				<c:if test="${t.answerList.size() ne 0}">
                <div style="overflow: hidden; line-height:1.2rem; height:3.6rem; text-overflow: ellipsis; margin-right: 1.5rem;">
                	${t.answerList[0].board.boardContent }</div>
                </c:if>
                <div class="row  justify-content-end" style="margin-right: 1.5rem;">
                    <i class="view fa-solid fa-eye m-2"></i><span class="m-1">${t.board.boardView}</span>
                    <i class="save fa-regular fa-bookmark m-2"></i><span class="m-1">${t.scrapListSize }</span>
                </div>
               </div>
             </c:forEach>

            </div>
            
    </div>

<br>
<br>
<br>
<br>

<script>
window.onload=()=>{
	
	
// 	const loginBtn= document.getElementById("loginBtn");
// 	const logoutBtn= document.getElementById("logoutBtn");

// 	loginBtn.addEventListener('click', function(){
// 		const loginNum = document.getElementById("tempUserNum").value;
// 		console.log(document.getElementById("tempUserNum").value);
// 		location.href='${contextPath}/login.qa?userNum='+loginNum;
// 	})

// 	logoutBtn.addEventListener('click', function() {
// 	   location.href='${contextPath}/logout.qa';
// 	})
	
	const questionTr = document.getElementsByClassName('questionTr');
	for(const question of questionTr){
		question.addEventListener('click', function(){
			const boardNum = this.querySelector('td').innerText;
			location.href='${contextPath}/question.qa?boardNum='+boardNum;
		})
	}
	
	const toptwo = document.getElementsByClassName('toptwo');
	for(const top of toptwo){
		top.addEventListener('click', function(){
			const boardNum = this.querySelector('.topTwoBoardNum').innerText;
			console.log(boardNum);
			location.href='${contextPath}/question.qa?boardNum='+boardNum;
		})
	}
	
	
}
</script>
</body>
</html>