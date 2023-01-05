<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

    <style>
    	h1,h2,h3,h4,h5,h6,p,span{
    		font-family: 'IBM Plex Sans KR', sans-serif;
    	}

        .bd-placeholder-img {
          font-size: 1.125rem;
          text-anchor: middle;
          -webkit-user-select: none;
          -moz-user-select: none;
          user-select: none;
        }
  
        @media (min-width: 768px) {
          .bd-placeholder-img-lg {
            font-size: 3.5rem;
          }
        }
  
        .b-example-divider {
          height: 3rem;
          background-color: rgba(0, 0, 0, .1);
          border: solid rgba(0, 0, 0, .15);
          border-width: 1px 0;
          box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }
  
        .b-example-vr {
          flex-shrink: 0;
          width: 1.5rem;
          height: 100vh;
        }
  
        .bi {
          vertical-align: -.125em;
          fill: currentColor;
        }
  
        .nav-scroller {
          position: relative;
          z-index: 2;
          height: 2.75rem;
          overflow-y: hidden;
        }
  
        .nav-scroller .nav {
          display: flex;
          flex-wrap: nowrap;
          padding-bottom: 1rem;
          margin-top: -1px;
          overflow-x: auto;
          text-align: center;
          white-space: nowrap;
          -webkit-overflow-scrolling: touch;
        }
        .bn_pro-badge{
	        background-color: #24E082; 
	        color: #ffffff; 
	        padding-left: 0.35rem; 
	        padding-right: 0.35rem;
        }
        .bn_hospital-badge{
        	background-color: #8496AE; color: #ffffff; padding-left: 0.5rem; padding-right: 0.5rem;
        }
      </style>
</head>
<body>

	<main id="chatIncludFile" class="d-flex flex-nowrap chatpopup" style="position:fixed; right:0; bottom:0;">

		<!-- 첫번째 컬럼====================================================== -->
		<div class="d-flex flex-column flex-shrink-0 bg-light" style="width: 4.5rem; height: 750px; border-top: 0.2rem solid #24E082; border-left: 0.2rem solid #24E082; border-radius: 2rem 0 0 0; z-index: 8;">
			<a href="/" class="d-block p-3 link-dark text-decoration-none" title="Icon-only"> <img src="resources/img/logo.svg" alt="영해로고">
			</a>
			<ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
				<li class="nav-item nav-link py-3 border-bottom rounded-0">
					<button id="minimizeBtn" class="btn" onclick="minimize();">
						<i class="bi bi-chevron-double-right"></i>
					</button>
				</li>
				<li class="nav-item py-3 border-bottom rounded-0">
					<button id="showProlistBtn" class="btn">
						<i class="bi bi-person-circle"></i>
					</button>
				</li>
				<li class="nav-item py-3 border-bottom rounded-0">
					<button id="chatMinimizeBtn" class="btn">
						<i class="bi bi-box-arrow-down-right"></i>
					</button>
				</li>
			</ul>
		</div>

		<!-- 두번째 컬럼 전문가목록============================================================= -->
		<div class="flex-column align-items-stretch flex-shrink-0 bg-light" style="overflow: auto; width: 300px; height: 750px; border-top: 0.2rem solid #24E082; z-index: 8;">
			<c:if test="${ !empty chatErrorMsg }">
			    <div class="section-title contact" style="margin-top:3rem; padding: 1.5rem; vertical-align: middle; text-align: center;">
				<h5 style="color:red;">${ chatErrorMsg }</h5>
<!-- 				<h5>참여 중인 채팅방이 없습니다</h5> -->
		        <a href="${contextPath}/expertfind.qa">
	            영해의 다양한 전문가를 통해<br> 
	            나에게 맞춤화된 상담을 받아보세요<br>
	            <img src="resources/img/logo_pill_white.svg" alt="흰로고">
	            </a>
			</div>
			</c:if>
			<c:if test="${ empty chatErrorMsg }">
			<c:if test="${ loginUser.userCNumber eq 1 }"><!-- =======일반회원의경우======= -->
			<div href="/" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
				<span class="fs-5 fw-semibold">전문가 목록</span>
			</div>
			<div id="chatProList" class="list-group list-group-flush border-bottom scrollarea" >
				
					<c:if test="${roomList.size()==0 }">
					<div class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
						<div class="d-flex w-100 align-items-center justify-content-between">
						<strong class="mb-1 bn_pro-name position-relative">아직 시작한 채팅이 없습니다.</strong>
						</div>
					</div>
					</c:if>
					
					<c:if test="${roomList.size()!=0 }">
						<c:forEach items="${roomList}" var="cr">
						<a href="#" 
						class="list-group-item list-group-item-action py-3 lh-sm chatting-item" 
						id="${cr.chatroom.chatroomId}-${cr.chatroom.expertNum}-${cr.chatroom.userNum}" 
						aria-current="true">
							<div class="d-flex w-100 align-items-center justify-content-between">
								<strong class="mb-1 bn_pro-name position-relative">${cr.expert.member.userName }</strong>
	<%-- 							<small>${ cr.latestSendTime }</small> --%>
							</div>
							<div class="col-10 mb-1 small chat_lastmsg">
	<%-- 							${cr.lastMessage.chatContent} --%>
							</div>
							<div class="col-10">
	<%-- 							<c:if test="${ room.notReadCount>0 }"> --%>
	<%-- 								<span class="badge">${cr.notReadCount}</span> --%>
	<%-- 							</c:if> --%>
								<span class="badge">자리비움</span>
								<span class="badge rounded-pill bg-success text-white">상담가능</span>
							</div>
						</a>
						</c:forEach>
					</c:if>
			</div>
			</c:if><!-- =======일반회원의경우 끝======= -->
			
			<c:if test="${ loginUser.userCNumber ne 1 }"><!-- =======전문가회원의경우======= -->
			<div href="/" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
				<span class="fs-5 fw-semibold">상담 회원 목록</span>
			</div>
			
			<div id="chatProList" class="list-group list-group-flush border-bottom scrollarea">
				
					<c:if test="${roomList.size()==0 }">
						<div class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
							<div class="d-flex w-100 align-items-center justify-content-between">
							<strong class="mb-1 bn_pro-name position-relative">아직 시작한 채팅이 없습니다.</strong>
							</div>
						</div>
					</c:if>
					<c:if test="${roomList.size()!=0 }">
						<c:forEach items="${roomList}" var="cr">
						<a href="#" 
						class="list-group-item list-group-item-action py-3 lh-sm chatting-item" 
						id="${cr.chatroom.chatroomId}-${cr.chatroom.expertNum}-${cr.chatroom.userNum}" 
						aria-current="true">
							<div class="d-flex w-100 align-items-center justify-content-between">
								<strong class="mb-1 bn_pro-name position-relative">${cr.general.userName }</strong>
	<%-- 							<small>${ cr.latestSendTime }</small> --%>
							</div>
							<div class="col-10 mb-1 small chat_lastmsg">
	<%-- 							${cr.lastMessage.chatContent} --%>
							</div>
							<div class="col-10">
	<%-- 							<c:if test="${ room.notReadCount>0 }"> --%>
	<%-- 								<span class="badge">${cr.notReadCount}</span> --%>
	<%-- 							</c:if> --%>
	<%-- 							<span class="badge">${cr.isPaid}</span> --%>
							</div>
						</a>
						</c:forEach>
					</c:if>
			</div>
			</c:if><!-- =======전문가회원의 경우 끝======= -->
		</div><!--두번째열끝========================================================  -->


		<!-- 세 번째 열 =======================================================================================  -->
		<div id="${nowChatroom.chatroom.chatroomId}_${nowChatroom.chatroom.expertNum}_${nowChatroom.chatroom.userNum}" 
			class="chatMessageRoom d-flex flex-column align-items-stretch flex-shrink-0 bg-white"
			style="width: 500px; height: 750px; border-left: 0.1rem solid rgba(20, 49, 82, 0.247); border-top: 0.2rem solid #24E082;">
			<div id="chatMessageRoomTop" style="display:flex; overflow: auto; flex-direction:column_reverse;">
<!-- 			<div id="chatMessageRoomTop" style="overflow: auto; "> -->
				<!--전문가-->
				<c:if test="${ loginUser.userCNumber eq 1 }">
				<div class="row bn_pro-box m-1" style="position: fixed; z-index: 10; width: 465px;">
					<span id="chatTopChatroomId" hidden="hidden">${nowChatroom.chatroom.chatroomId}</span>
					<div class="col-lg-7  align-self-center">
						<span id="chatTopExpertNum" hidden="hidden">${nowChatroom.expert.expert.userNum }</span>
	                    <h5 class="bn_pro-name">
		                    <span id="chatTopExpertName">${nowChatroom.expert.member.userName}&nbsp;&nbsp;</span>
		                    <span id="chatTopExpertSort" class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">
		                    <c:if test="${nowChatroom.expert.expert.expertSort.trim() eq 'N' }">선택안함</c:if>
		                    <c:if test="${nowChatroom.expert.expert.expertSort.trim() eq 'D' }">의사</c:if>
		                    <c:if test="${nowChatroom.expert.expert.expertSort.trim() eq 'C' }">약사</c:if>
		                    </span>
	                    </h5>
	                    <span class="bn_pro-info">답변수 ${nowChatroom.expert.answerListSize} 개</span><br>
	                    <span class="bn_pro-info">전문과목 ${nowChatroom.expert.expert.expertMedi}</span><br>
	                    <span class="bn_pro-info">
		                    <span id="chatTopExpertDept">
		                    소속 : 
		                    <c:if test="${nowChatroom.expert.expert.expertDept.trim() eq 'N' }">선택안함</c:if>
					        <c:if test="${nowChatroom.expert.expert.expertDept.trim() ne 'N' }">${nowChatroom.expert.expert.expertDept}&nbsp;&nbsp;</c:if>
		                    </span>
		                    <span class="badge rounded-pill" id="chatTopExpertSortPlace" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">
		                    <a style="text-decoration:none; color:white;" href="${contextPath}/experthospital.qa?expertNum=${nowChatroom.expert.expert.userNum}">
		                      <c:if test="${nowChatroom.expert.expert.expertSort.trim() eq 'N' }">선택안함</c:if>
		                      <c:if test="${nowChatroom.expert.expert.expertSort.trim() eq 'D' }">병원</c:if>
		                      <c:if test="${nowChatroom.expert.expert.expertSort.trim() eq 'C' }">약국</c:if>
		                     정보 보기</a>
		                    </span>
	                    </span><br>
					</div>
					<div class="col-3 align-self-center">
						<img src="resources/img/pro_profile1.png" class="bn_pro-profile" alt="..." style="width: 5rem; height: 5rem;">
					</div>
					<div class="col-2 align-self-center">
						<div class="bn_pro-icon" style="width: 2.5rem; height: 2.5rem;">
							<span style="font-size: 0.8rem;" id="chatTopgoToProfile" onclick="location.href='${contextPath}/expertprofile.qa?expertNum='+${nowChatroom.expert.expert.userNum}">프로필 방문</span>
						</div>
					</div>
				</div>
				<!--전문가 끝==================================-->
				</c:if>
					
				<!-- 일반회원 -->
				<c:if test="${ loginUser.userCNumber ne 1 }">
				<div class="row bn_pro-box m-1" style="position: fixed; z-index: 10; width: 465px;">
					<span id="chatroomId" hidden>${nowChatroom.chatroom.chatroomId}</span>
					<div class="col-lg-7  align-self-center">
						<span id="generalUserNum" hidden>${nowChatroom.general.userNum }</span>
	                    <h5 class="bn_pro-name"> ${nowChatroom.general.userName} 님&nbsp;과 채팅 중입니다 😉 &nbsp;</h5>
					</div>
				</div>
				</c:if>
				<!--일반회원 끝==================================-->

				<div class="chat_wrap bg-light" style="margin-top: 170px;">
					<!--채팅메세지-->
					<div class="chat ch1"><!-- ==========기본메세지============ -->
						<div class="icon">
							<i class="fa-solid fa-user"></i>
						</div>
						<div class="textbox" id="chatDefaultMsg1">
							<c:if test="${nowChatroom.expert.expert.expertProfile eq 'N' }">
							안녕하세요. 반갑습니다😉
							</c:if>
							<c:if test="${nowChatroom.expert.expert.expertProfile ne 'N'}">
							${nowChatroom.expert.expert.expertProfile}
							</c:if>
						</div>
					</div><!-- ==========기본메세지============ -->

					<div class="chat ch1">
						<div class="icon">
							<i class="fa-solid fa-user"></i>
						</div>
						<div class="textbox"><!-- ==========견적서============ -->
							<div class="row d-flex align-items-center ">
								<div class="col-1">
									<div class="d-flex align-items-center justify-content-center"
										style="background-color: black; color: #ffffff; width: 1.5rem; height: 1.5rem; border-radius: 3rem;">
										<i class="fa-solid fa-won-sign"></i>
									</div>
								</div>
								<div class="col-5">
									<h4 class="bn_txt_strong">견적서</h4>
								</div>
							</div>
							<br> <span>홍길동 고객님 안녕하세요. 상담예상 금액입니다.</span>
							<hr>
							<div class="row mb-3 align-items-center">
								<span class="col-4">서비스명</span> <span class="col bn_txt_strong">복용상담</span>
							</div>
							<div class="row mb-4 align-items-center">
								<span class="col-4">예상금액</span> <span class="col bn_txt_strong">10,000원(10분당)</span>
							</div>
							<hr>
							<span>견적금액에 대해 궁금한 점을 채팅으로 물어보세요</span>
							<div class="row mt-2 justify-content-center">
								<button class="col-10 btn bn_txt_strong p-3" style="display: inline-block; background-color: black; color: white;" onclick="goToChatPayment()">
								결제 후 채팅 시작하기
								</button>
							</div>
							<span class="sendtime">오전 9:28</span>
						</div><!-- ==========견적서============ -->
					</div>

					<div class="chat ch1mng chatDefaultBoxFromYH">
						<div class="icon">
							<img src="resources/img/logo_pill_white.svg" alt="흰로고">
						</div>
						<div class="textbox">
							위 메세지는 자동수신 메세지입니다. 결제를 진행하신 후 전문가와 상담 시작 시간을 협의해주세요. 상호 동의하에 상담이
							시작됩니다.<span class="sendtime">오전 9:28</span>
						</div>
					</div>
					
					<div id="chatMsgListDiv">
					<c:if test="${ messageList eq null }">
						<div id="chatMsgDiv">
							채팅을 시작해보세요
						</div>
					</c:if>
					
					<c:if test="${ messageList ne null }">
					<c:forEach items="${messageList}" var="chMsg">
						<div id="chatMsgDiv" class="chat
							<c:if test="${loginUser.userNum != chMsg.senderNum  }">ch1</c:if>
							<c:if test="${loginUser.userNum == chMsg.senderNum  }">ch2</c:if>
						">
							<c:if test="${loginUser.userNum != chMsg.senderNum  }">						
								<div class="icon">
									<i class="fa-solid fa-user"></i>
								</div>
							</c:if>
							
							<div class="textbox">
								${ chMsg.chatContent }
								<span class="sendtime">${ chMsg.sendTime }</span>
							</div>
						</div>
					</c:forEach>
					</c:if>
					</div>
					
					<div id="resultBox"></div>
					
				</div>
				<!--채팅메세지 끝==================-->
			</div>

			<div class="chatInput">
				<div class="input-group align-items-center row bg-white">
					<button class="btn col-2" style="color: orange; font-size: 2.2rem;">
						<i class="fa-solid fa-image"></i>
					</button>
					<input type="text" class="form-control" id="bn_chat-input" placeholder="메세지를 입력하세요" onkeyup="if(window.event.keyCode==13){sendMessage()}">
					<button class="btn bn_chat-inputbtn" id="send" onclick="sendMessage()">
						<i class="fa-solid fa-paper-plane"></i>
					</button>
				</div>
			</div>
		</div>
		</c:if>

	</main>

	<script>
	
		function minimize() {
			document.getElementById('chatProList').style.display = 'none';
// 			document.getElementById('chatProList').style.display = 'hidden';
		}

		document.getElementById('showProlistBtn').addEventListener('click',function() {
			document.getElementById('chatProList').style.display = 'block';
		})
		
		// 로그인한 회원 번호
		const loginUserNum = "${loginUser.userNum}";

		//세번째 열 상단의 nowChatroomInfo의 아이디에서 chatroomId,expertNum, generalUserNum을 가져옴
		//	두 번째 열의 방 선택하면 chatroomId, expertNum, generalUserNum이 바뀜	
		var nowChatroomInfo = document.getElementsByClassName('chatMessageRoom')[0].id;
		console.log(nowChatroomInfo);
		
		var chatroomId = nowChatroomInfo.split('_')[0];
		var expertNum = nowChatroomInfo.split('_')[1];
		var generalUserNum = nowChatroomInfo.split('_')[2];
		
		//채팅 보내는 란
		const sendBtn = document.getElementById("send");
		var chatInput = document.getElementById("bn_chat-input");
		
		//참고==================https://bbo-blog.tistory.com/39===========================
		var chattingSock;
		connectSockJs();

		chattingSock.onmessage = onMessage;
		chattingSock.onclose = onClose;
		chattingSock.onopen = onOpen;
		
		function connectSockJs(){
			
			chattingSock = new SockJS("/young/chattingSock");
			
			console.log("채팅쏙", chattingSock); 
			console.log("채팅쏙 url", chattingSock.url); 
			console.log("채팅 readyState", chattingSock.readyState);
			
		}
		
		sendBtn.addEventListener('click', function(){
			sendMessage();
		})
		
		//목록에서 채팅방 선택 
		// -> 해당 채팅방의 ArrayList<ChatMessage>를 isRead로 update 해야한다
		// -> nowChatroom&messageList반환
		// -> 상대프로필&메세지변경
		const roomItems = document.getElementsByClassName('chatting-item');
		for(const chattingItem of roomItems){
			chattingItem.addEventListener('click', function(){
				
				//두번째 열의 <목록> 에 있는 아이디로 채팅방정보 얻기
				var selectChatroomInfo = chattingItem.id;
				console.log(selectChatroomInfo);
				
				chatroomId = selectChatroomInfo.split('-')[0];
				expertNum = selectChatroomInfo.split('-')[1];
				generalUserNum =selectChatroomInfo.split('-')[2];
				
				var roomHTMLId = chatroomId + "-" + expertNum + "-" + generalUserNum;
				
				$.ajax({
					url: '${contextPath}/updateRead.ch',
					type: 'GET',
					data: {
						chatroomId : chatroomId,
						userNum : loginUserNum
					},
					success: (data)=>{
						console.log(chatroomId+"방의 isRead를 업데이트 완료");
					}
				})
				
				$.ajax({ //==메세지리스트 선택==
					url: '${contextPath}/selectMessage.ch',
					type: 'POST',
					data: {
						chatroomId : chatroomId,
						expertNum :expertNum,
						generalUserNum :generalUserNum
					},
					success: (data)=>{
						var jsonData = JSON.parse(data);
						console.log(jsonData.messageList);
						console.log(jsonData.nowChatroom);
						
						// 1. 두번째 열 선택처리==========================================================================
						for(const others of roomItems){
							others.classList.remove("active");
						}
						document.getElementById(roomHTMLId).classList.add("active");
						
						//==일반유저의 경우============================================================================
						if(loginUserNum==generalUserNum){

						// 2-1(일반) 세번째 열의 의사프로필 변경
							document.getElementById('chatTopChatroomId').innerText = chatroomId;
							document.getElementById('chatTopExpertNum').innerText = expertNum;
							document.getElementById('chatTopExpertName').innerText = jsonData.nowChatroom.expert.member.userName;
							
							var chatTopGoToExpertHospital = '<a style="text-decoration:none; color:white;" href="${contextPath}/experthospital.qa?expertNum='+expertNum+'">';
							console.log(chatTopGoToExpertHospital);
							
							if(jsonData.nowChatroom.expert.expert.expertSort.trim() == 'D'){
								console.log("의사");
								document.getElementById('chatTopExpertSort').innerText = "의사";
								document.getElementById('chatTopExpertSortPlace').innerHTML = chatTopGoToExpertHospital+'병원정보 보기</a>';
								
							}else if(jsonData.nowChatroom.expert.expert.expertSort.trim() == 'C'){
								console.log("약사");
								document.getElementById('chatTopExpertSort').innerText = "약사";
								document.getElementById('chatTopExpertSortPlace').innerHTML = chatTopGoToExpertHospital+'약국정보 보기</a>';
								
							}else if(jsonData.nowChatroom.expert.expert.expertSort.trim() == 'N'){
								document.getElementById('chatTopExpertSort').innerText = "선택안함";
								document.getElementById('chatTopExpertSortPlace').innerHTML = chatTopGoToExpertHospital+'선택안함 정보 보기</a>';
							}
							
							
							document.getElementsByClassName('bn_pro-info')[0].innertText = "답변수" + jsonData.nowChatroom.expert.answerListSize ;
							document.getElementsByClassName('bn_pro-info')[1].innertText = "전문과목" + jsonData.nowChatroom.expert.expert.expertMedi ;
							
							if(jsonData.nowChatroom.expert.expert.expertDept.trim() == 'N'){
								document.getElementById('chatTopExpertDept').innerText = "소속 : 선택안함 ";
							}else{
								document.getElementById('chatTopExpertDept').innerText = "소속 : " + jsonData.nowChatroom.expert.expert.expertDept ;
							}
							
							
							document.getElementById('chatTopgoToProfile').onclick = () =>{
								location.href='${contextPath}/expertprofile.qa?expertNum='+jsonData.nowChatroom.expert.expert.userNum;
							}
							
							if( jsonData.nowChatroom.expert.expert.expertProfile != 'N' ){
								document.getElementById('chatDefaultMsg1').innerText = jsonData.nowChatroom.expert.expert.expertProfile;
							}else{
								document.getElementById('chatDefaultMsg1').innerText = "안녕하세요. 반갑습니다 😉";
							}
							
						} else {
						//==전문가유저의 경우============================================================================
							
						}
						
						//세번째 열 상단의 nowChatroomInfo의 아이디에서 chatroomId,expertNum, generalUserNum을 가져오므로 id 변경해야 한다.
						nowChatroomInfo = jsonData.nowChatroom.chatroom.chatroomId + "_" + jsonData.nowChatroom.chatroom.expertNum + "_" + jsonData.nowChatroom.chatroom.userNum;
						console.log("현재 선택된 방의 정보(세번쨰열):" + nowChatroomInfo);
						chatroomId = nowChatroomInfo.split('_')[0];
						expertNum = nowChatroomInfo.split('_')[1];
						generalUserNum = nowChatroomInfo.split('_')[2];
						
						//메세지리스트 변경 ==========================================================================
						// 3-(1) 만약 이미 chatMsgListDiv 있으면 삭제
						if(	document.getElementById('chatMsgListDiv') != null ){
							document.getElementById('chatMsgListDiv').innerHTML = "";
							document.getElementById('chatMsgListDiv').remove();
							document.getElementById('resultBox').innerHTML="";
							document.getElementById('resultBox').remove();
						}
						// 3-(2) 메세지요소 하나하나 추가
						if(jsonData.messageList.length==0){
							const chatMsgListDiv = document.createElement('div');
							const resultBox = document.createElement('div');
							resultBox.id = "resultBox";
					    	chatMsgListDiv.innerHTML == '첫 메세지를 작성해보세요';
					    	chatMsgListDiv.id = "chatMsgListDiv";
						}else{
							var msgList = jsonData.messageList;

							const chatMsgListDiv = document.createElement('div');
							const resultBox = document.createElement('div');
							resultBox.innerHTML == '';
							resultBox.id = "resultBox";
					    	chatMsgListDiv.innerHTML == '';
							chatMsgListDiv.id = "chatMsgListDiv";
					    	
							for(const msg of msgList){

								var msgUserNum = msg['senderNum']; //데이터를 보낸 사람
								var msgChatContent = msg['chatContent'];
								var msgSendTime = msg['sendTime'];
								
								const chatMsgDiv = document.createElement('div');
								var str = '';
								
						    	chatMsgDiv.innerHTML = '';
						    	
						    	if(msgUserNum ==loginUserNum){ // 내가 보낸 메세지면
						    		str = '<div class="chat ch2"><div class="textbox">'
							    		+ msgChatContent
							    		+'<span class="sendtime">'
							    		+ msgSendTime
							    		+'</span></div></div>';
						    	}else{
						    		str = '<div class="chat ch1"><div class="icon"><i class="fa-solid fa-user"></i></div><div class="textbox">'
						    				+ msgChatContent
						    				+'<span class="sendtime">'
						    				+ msgSendTime
						    				+'</span></div></div>';
						    	}
						    	chatMsgDiv.innerHTML += str;
						    	chatMsgListDiv.append(chatMsgDiv);
							}
							document.getElementsByClassName('chat_wrap')[0].append(chatMsgListDiv);
							document.getElementsByClassName('chat_wrap')[0].append(resultBox);
						}
						
					},
					error: (data)=>{
						alert("실패!");
					}
				})//==메세지리스트 선택 끝==
			})
		}
			
		function sendMessage(){
// 			var chatWrapHeight = document.getElementsByClassName('chatMessageRoom')[0].height;
			var chatWrapHeight = document.getElementById('chatMessageRoomTop').scrollHeight;
			console.log(chatWrapHeight);

			document.getElementById('chatMessageRoomTop').scrollTo(0,chatWrapHeight);
// 			document.getElementById('chatMessageRoomTop').scrollTo(0,770);
			
			if (chatInput.value.trim().length == 0) {
				alert("채팅을 입력해주세요.");
				chatInput.value = "";
			} else {
				
				if(loginUserNum == expertNum ){
					receiverNum = generalUserNum ;
				} else {
					receiverNum = expertNum ; 
				}
				console.log(receiverNum);
				var obj = {
					"senderNum": loginUserNum,
					"receiverNum" : receiverNum,
					"chatroomId": chatroomId,
					"chatContent": chatInput.value
				};
				console.log(obj);

				// JSON.stringify() : 자바스크립트 객체를 JSON 문자열로 변환
				chattingSock.send(JSON.stringify(obj));
				chatInput.value = "";
			}
		}
		
		function onMessage(msg){
			console.log(msg.data);
			var jsonData = JSON.parse(msg.data); // String 타입을 json 타입으로 반환
			
			var msgUserNum = jsonData['senderNum']; //데이터를 보낸 사람
			var msgChatContent = jsonData['chatContent'];
			var msgChatroomId = jsonData['chatroomId'];
			var msgSendTime = jsonData['sendTime'];
			
			console.log(msgUserNum+" 이 보낸 메세지 : "+ msgChatContent);
			console.log(jsonData);
			
// 			document.getElementById("resultBox").innerHTML = "";
			
		    if(chatroomId == msgChatroomId){
		    	const chat_wrap = document.getElementsByClassName('chat_wrap')[0];
		    	var resultBox = document.getElementById("resultBox");
		    	
		    	if(msgUserNum ==loginUserNum){ // 내가 보낸 메세지면
		    		str = '<div class="chat ch2"><div class="textbox">'
			    		+ msgChatContent
			    		+'<span class="sendtime">'
			    		+ msgSendTime
			    		+'</span></div></div>'
		    	}else{
		    		str = '<div class="chat ch1"><div class="icon"><i class="fa-solid fa-user"></i></div><div class="textbox">'
		    				+ msgChatContent
		    				+'<span class="sendtime">'
		    				+ msgSendTime
		    				+'</span></div></div>'
		    	}
		    	resultBox.innerHTML += str;
		    } else {
		    	
		    }
		}
		
		
	 	function onClose(){
	 		
	 	}
		
	 	function onOpen(){
	 		
	 	}
	 	
	 	function goToChatPayment(){
	 		console.log(loginUserNum, chatroomId, expertNum, generalUserNum);
	 		if(loginUserNum == expertNum){
	 			alert("일반회원만 접근 가능합니다!");
	 		}else{
	 			window.location.href="${contextPath}/goToChatPayment.qa?info="+nowChatroomInfo;
	 		}
	 	}
	 	
		//=============================================

	
	</script>
</body>
</html>