<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 전문가 상세 프로필</title>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
	
</head>
<body>
     <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> / </li>
                <li><a href="#">전문가찾기</a></li>
                <li> <b>/</b> </li>
                <li><a href="#">상세 프로필 조회</a></li>
            </ul>
        </div>

        <div class="mt-5" style="padding: 30px 0 10px 0;">
            <h2 class="bn_txt_strong pb-3" style="font-size: 2rem;">${eresp.member.userName} 님의 프로필</h2>
            <hr style="border:2px solid #24E082; background-color: #24E082;">
        </div>

        <div class="row">
            
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-6 bn_pro-infobox-top"  id="infobox1" style="border-color: #24E082;">
                        <button class="btn" onclick="showCareer();">경력</button>
                    </div>
                    <div class="col-lg-6 bn_pro-infobox-top" id="infobox2" style="border-color: #8496AE;">
                        <button class="btn" onclick="showEstimate();">견적서</button>
                    </div>
                </div>

                <div class="row bn_pro-infobox-bottom" id="infoboxBottom1">
                    <c:if test="${eresp.expert.expertCareer ne 'N'}">${eresp.expert.expertCareer}</c:if>
                    <c:if test="${eresp.expert.expertCareer eq 'N'}">
                    	작성한 경력 내용이 없습니다
                    </c:if>
                </div>
                <div class=" row bn_pro-infobox-bottom" id="infoboxBottom2" style="z-index:50; height:200px">
                    <div class="row d-flex align-items-center ">
                        <div class="col-1">
                            <div class="d-flex align-items-center justify-content-center"style="background-color: black; color:#ffffff; width: 1.5rem; height: 1.5rem; border-radius: 3rem;"><i class="fa-solid fa-won-sign"></i></div>
                        </div>
                        <div class="col-5">
                            <h4 class="bn_txt_strong" style="font-size:18px;">견적서</h4>
                        </div>

                        <div class="col-3">
                        	<c:if test="${eresp.member.userNum eq loginUser.userNum}">
                           		<button class="btn bn_btn_search2" style="font-size:small; padding: 0.5rem; background-color: #cacfd4;">수정하기</button>
                            	<button class="btn bn_btn_search2" style="font-size:small; padding: 0.5rem; background-color: #cacfd4;">스케줄보기</button>
                        	</c:if>
                        </div>
                    </div>
                    <hr>
                    <div class="row mb-1 align-items-center">
                        <h5 class="col-3">서비스명</h5>
                        <span class="col bn_txt_strong" style="font-size:18px;">복용상담</span>
                    </div> 
                    <div class="row mb-3 align-items-center">
                        <h5 class="col-3">예상금액</h5>
                        <span class="col bn_txt_strong" style="font-size:18px;">
                        ${eresp.expert.expertEstimate}
                        </span>
                    </div>
                    <div class="row">
                        <button class="col btn bn_txt_strong p-3 " style="display: inline-block;font-size:18px; background-color: black; color:white;">상담 가능 시간 보기</button>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="bn_pro-box" style="padding:1.5rem; background: linear-gradient(to bottom, white 80%, #24E082 20%);">
                    <div class="row">
                        <div class="col-lg-8 align-self-center">
                            <h5 class="bn_pro-name">${eresp.member.userName}&nbsp;&nbsp;
                            <span class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">
                            <c:if test="${eresp.expert.expertSort.trim() eq 'N' }">선택안함</c:if>
                            <c:if test="${eresp.expert.expertSort.trim() eq 'D' }">의사</c:if>
		                    <c:if test="${eresp.expert.expertSort.trim() eq 'C' }">약사</c:if>
                            </span></h5>
                            <span style="display: inline-block; width: 3.5rem;">답변수 </span><span>: ${ eresp.answerListSize }개</span><br>
                            <span style="display: inline-block; width: 3.5rem;">전문과목 </span><span>: ${ eresp.expert.expertMedi}</span><br>
                            <span style="display: inline-block; width: 3.5rem;">소속</span><span>
		                     <c:if test="${eresp.expert.expertDept.trim() eq 'N' }">선택안함</c:if>
		                     <c:if test="${eresp.expert.expertDept.trim() ne 'N' }">${eresp.expert.expertDept}&nbsp;&nbsp;</c:if>
                            </span>
	                         	<span class="badge rounded-pill bn_badge" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;" id="goToExpertHospital">
		                           <c:if test="${eresp.expert.expertSort.trim() eq 'N' }"></c:if>
		                           <c:if test="${eresp.expert.expertSort.trim() eq 'D' }">병원정보 보기</c:if>
		                           <c:if test="${eresp.expert.expertSort.trim() eq 'C' }">약국정보 보기</c:if>
	                           	</span>
                        </div>

                        <div class="col-4 align-self-center">
                        	<c:if test="${eresp.eattach != null }">
							<div class="bn_pro-profile">
								<img style="border-radius:25rem;" src="${contextPath}/resources/uploadFiles/${eresp.eattach.attachRename}"alt="전문가프로필">
							</div>
							</c:if>
							<c:if test="${eresp.eattach == null }">
							<div style="vertical-align:middle; width:7rem; height:7rem; border-radius: 25rem; background-color:#DBE2EA; text-align:center; vertical-align:middle;">
								<img style="margin-top:2.5rem;"src="resources/img/logo_white.svg" style="width:6rem;"alt="흰로고">
							</div>
							</c:if>
                        </div>
                    </div>

                    <div class="row" style="padding: 1.5rem;">
                    	<span>
                    	
                    	<c:if test="${ eresp.expert.expertProfile.trim() eq 'N' }">
                    	친절과 정성으로 대답하는 ${ eresp.member.userName } 입니다.
                    	</c:if>
                    	<c:if test="${ eresp.expert.expertProfile.trim() ne 'N' }">
                    	${eresp.expert.expertProfile }
                    	</c:if>

                    	</span>
                   	</div>
                    
                    <div class="row justify-content-center">
                    	<c:if test="${loginUser == null }">
                        <button class="btn" style="color:white;" onclick="location.href='${contextPath}/login.me'">
                        	<h3 class="bn_txt_strong">채팅권한이 없네요! 로그인해보세요</h3>
                        </button>
                    	</c:if>
                        <c:if test="${loginUser != null && loginUser.userNum != eresp.member.userNum }">
                        <button class="btn" style="color:white;" onclick="location.href='${contextPath}/open.ch?expertNum=${eresp.member.userNum}'">
                        	<h3 class="bn_txt_strong">채팅하러가기</h3>
                        </button>
                       	</c:if>
                        <c:if test="${loginUser != null && loginUser.userNum == eresp.member.userNum }">
                        <button class="btn" style="color:white;">
                        	<h3 class="bn_txt_strong">본인과 채팅할 수 없습니다</h3>
                        </button>
                       	</c:if>
                    </div>
                </div>
            </div>
        </div>

        <br>
        <br>

        <!-- 전문가가 작성한 글 목록 ================================= -->
        <div class="bn_boardlist mt-2">
            <table class="table">
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
                	<c:if test="${eresp.answerListSize eq 0}">
                		<tr>
                		<td class="text-center">
                		아직 작성한 답변이 없습니다
                		</td>
                		</tr>
                	</c:if>
                	<c:if test="${eresp.answerListSize ne 0}">
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
                    </c:if>
                </tbody>
            </table>
        </div>
            <div class="product__pagination blog__pagination d-flex justify-content-center mt-3 ">
              <a href="#">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#"><i class="fa fa-long-arrow-right"></i></a>
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
<br>
<br>
<br>
<br>
<br>
<br>



<script>
        document.getElementById('infoboxBottom2').style.display = 'none';
    
        function showCareer(){
            const career = document.getElementById('infoboxBottom1');
            const estimate = document.getElementById('infoboxBottom2');
            career.style.display = 'block';
            document.getElementById('infobox1').style.border = '3px solid #24E082';
            estimate.style.display = 'none';
            document.getElementById('infobox2').style.border = '3px solid #8496AE';
            
        }
        
        function showEstimate(){
            const career = document.getElementById('infoboxBottom1');
            const estimate = document.getElementById('infoboxBottom2');
            career.style.display = 'none';
            document.getElementById('infobox1').style.border = '3px solid #8496AE';
            estimate.style.display = 'block';
            document.getElementById('infobox2').style.border = '3px solid #24E082';
        }
        
window.onload=()=>{
	document.getElementById('goToExpertHospital').addEventListener('click', function(){
		console.log(this);
		location.href = '${contextPath}/experthospital.qa?expertNum='+${eresp.member.userNum};
	})
	
  	const questionTr = document.getElementsByClassName('questionTr');
  	for(const question of questionTr){
  		question.addEventListener('click', function(){
  			const boardNum = this.querySelector('td').innerText;
  			location.href='${contextPath}/question.qa?boardNum='+boardNum;
  		})
  	}
}

</script>
</body>
</html>