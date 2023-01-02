x<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 질문하기</title>

	<!--jQuery-->
	<script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
	
	<!-- Google Font : (1)오가니 (2)봉은추가 font-family: 'IBM Plex Sans KR', sans-serif; 추천 -->
	<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100;200;300;400;500;600;700&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/style.css" type="text/css">
	
	<!-- 부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	
	<!--fontawesome 아이콘-->
	<script src="https://kit.fontawesome.com/25fd41a4c0.js" crossorigin="anonymous"></script>
	
    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

    <style>
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

	<main class="d-flex flex-nowrap chatpopup">

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
			</ul>
		</div>

		<!-- 두번째 컬럼 전문가목록============================================================= -->
		<div id="chatProList" class="flex-column align-items-stretch flex-shrink-0 bg-light" style="overflow: auto; width: 300px; height: 750px; border-top: 0.2rem solid #24E082; z-index: 8;">
		
			<c:if test="${ loginUser.userCNumber eq 1 }"><!-- =======일반회원의경우======= -->
			<div href="/" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
				<span class="fs-5 fw-semibold">전문가 목록</span>
			</div>
			
			<div class="list-group list-group-flush border-bottom scrollarea">
			
				<c:if test="${roomList.size()==0 }">
				<div class="list-group-item list-group-item-action active py-3 lh-sm" aria-current="true">
					<div class="d-flex w-100 align-items-center justify-content-between">
					<strong class="mb-1 bn_pro-name position-relative">아직 시작한 채팅이 없습니다.</strong>
					</div>
				</div>
				</c:if>
				
				<c:if test="${roomList.size()!=0 }">
					<c:forEach items="${roomList}" var="cr">
					<a href="#" 
					class="list-group-item list-group-item-action active py-3 lh-sm chatting-item" 
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
			
			<div class="list-group list-group-flush border-bottom scrollarea">
			
				<c:if test="${roomList.size()==0 }">
					<div class="list-group-item list-group-item-action active py-3 lh-sm" aria-current="true">
						<div class="d-flex w-100 align-items-center justify-content-between">
						<strong class="mb-1 bn_pro-name position-relative">아직 시작한 채팅이 없습니다.</strong>
						</div>
					</div>
				</c:if>
				<c:if test="${roomList.size()!=0 }">
					<c:forEach items="${roomList}" var="cr">
					<a href="#" 
					class="list-group-item list-group-item-action active py-3 lh-sm chatting-item" 
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
			<div id="chatMessageRoomTop" style="overflow: auto;">
				<!--전문가-->
				<c:if test="${ loginUser.userCNumber eq 1 }">
				<div class="row bn_pro-box m-1" style="position: fixed; z-index: 10; width: 465px;">
					<span id="chatroomId" hidden>${nowChatroom.chatroom.chatroomId}</span>
					<div class="col-lg-7  align-self-center">
						<span id="expertNum" hidden>${nowChatroom.expert.member.userNum }</span>
	                    <h5 class="bn_pro-name">${nowChatroom.expert.member.userName}&nbsp;&nbsp;
	                    <span class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">
	                     <c:if test="${nowChatroom.expert.expert.expertSort.trim() eq 'D' }">의사</c:if>
	                     <c:if test="${nowChatroom.expert.expert.expertSort.trim() eq 'C' }">약사</c:if>
	                    </span></h5>
	                    <span class="bn_pro-info">답변수 ${nowChatroom.expert.answerListSize} 개</span><br>
	                    <span class="bn_pro-info">전문과목 ${nowChatroom.expert.expert.expertMedi}</span><br>
	                    <span class="bn_pro-info">소속 : ${nowChatroom.expert.expert.expertDept}&nbsp;&nbsp;
	                     <span class="badge rounded-pill" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">
	                      <c:if test="${nowChatroom.expert.expert.expertSort.trim() eq 'D' }">병원</c:if>
	                      <c:if test="${nowChatroom.expert.expert.expertSort.trim() eq 'C' }">약국</c:if>
	                     정보 보기
	                     </span>
	                    </span><br>
					</div>
					<div class="col-3 align-self-center">
						<img src="resources/img/pro_profile1.png" class="bn_pro-profile" alt="..." style="width: 5rem; height: 5rem;">
					</div>
					<div class="col-2 align-self-center">
						<div class="bn_pro-icon" style="width: 2.5rem; height: 2.5rem;">
							<i class="bi bi-list-ul" style="font-size: 1.5rem;"></i>
						</div>
						<div class="bn_pro-icon" style="width: 2.5rem; height: 2.5rem;">
							<i class="bi bi-send" style="font-size: 1.5rem;"></i>
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
	                    <h5 class="bn_pro-name">${nowChatroom.general.userName} 님&nbsp;&nbsp;</h5>
					</div>
				</div>
				</c:if>

				<div class="chat_wrap bg-light" style="margin-top: 170px;">
					<!--채팅메세지-->
					<div class="chat ch1"><!-- ==========기본메세지============ -->
						<div class="icon">
							<i class="fa-solid fa-user"></i>
						</div>
						<div class="textbox">
							안녕하세요. 반갑습니다.
							<span class="sendtime">오전 9:28</span>
							<!-- 기본메세지는 chatMsg데이터 받아서 처리X expert에서 출력  -->
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
								<button class="col-10 btn bn_txt_strong p-3"
									style="display: inline-block; background-color: black; color: white;">결제
									후 채팅 시작하기</button>
							</div>
							<span class="sendtime">오전 9:28</span>
						</div><!-- ==========견적서============ -->
					</div>

					<div class="chat ch1mng">
						<div class="icon">
							<img src="resources/img/logo_pill_white.svg" alt="흰로고">
						</div>
						<div class="textbox">
							위 메세지는 자동수신 메세지입니다. 결제를 진행하신 후 전문가와 상담 시작 시간을 협의해주세요. 상호 동의하에 상담이
							시작됩니다.<span class="sendtime">오전 9:28</span>
						</div>
					</div>
					
					<c:forEach items="${messageList}" var="chMsg">
						<div class="chat 
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
					
					<div>위에까지 테스트</div>
					
					<div id="resultBox"></div>
					
				</div>
				<!--채팅메세지 끝==================-->
			</div>

			<div class="chatInput">
				<div class="input-group align-items-center row bg-white">
					<button class="btn col-2" style="color: orange; font-size: 2.2rem;">
						<i class="fa-solid fa-image"></i>
					</button>
					<input type="text" class="form-control" id="bn_chat-input" placeholder="메세지를 입력하세요">
					<button class="btn bn_chat-inputbtn" id="send">
						<i class="fa-solid fa-paper-plane"></i>
					</button>
				</div>
			</div>
		</div>

	</main>

	<!-- Js Plugins -->
	<script src="resources/js/jquery-ui.min.js"></script>	
	<script src="resources/js/jquery.slicknav.js"></script>	
	
	<script src="resources/js/bootstrap.min.js"></script>	

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	
	<script src="resources/js/mixitup.min.js"></script>	
	<script src="resources/js/owl.carousel.min.js"></script>	

	<script src="resources/js/main.js"></script>
	
	<script>
	
		function minimize() {
			document.getElementById('chatProList').style.display = 'none';
		}

		document.getElementById('showProlistBtn').addEventListener('click',function() {
			document.getElementById('chatProList').style.display = 'block';
		})
		
	</script>

	<!-- https://github.com/sockjs/sockjs-client -->
	<script>
		// 로그인한 회원 번호
		const sendBtn = document.getElementById("send");

		const loginUserNum = "${loginUser.userNum}";
		
		var nowChatroomInfo = document.getElementsByClassName('chatMessageRoom')[0].id;
		console.log(nowChatroomInfo);
		
		var chatroomId = nowChatroomInfo.split('_')[0];
		var expertNum = nowChatroomInfo.split('_')[1];
		var generalUserNum = nowChatroomInfo.split('_')[2];
		
		var chatInput = document.getElementById("bn_chat-input");
		
		//==================https://bbo-blog.tistory.com/39===========================
			
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
		
		const roomItems = document.getElementsByClassName('chatting-item');
		for(const chattingItem of roomItems){
			chattingItem.addEventListener('click', function(){
				var selectChatroomInfo = chattingItem.id;
				console.log(selectChatroomInfo);
				console.log(selectChatroomInfo.split('-')[0]);
				
				location.href='${contextPath}/selectMessage.ch?chatroomId='+selectChatroomInfo.split('-')[0];
				
				$.ajax({
					url: '${contextPath}/selectMessage.ch',
					type: 'GET',
					data: {
						chatroomId : selectChatroomInfo.split('-')[0]
					},
					success: (data)=>{
						console.log(data)
					},
					error: (data)=>{
						alert("실패!");
					}
				})
			})
		}
			
		function sendMessage(){
// 			console.log(chatInput.value);
			
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
			
		    if(chatroomId == msgChatroomId){
		    	const chat_wrap = document.getElementsByClassName('chat_wrap')[0];
		    	const resultBox = document.getElementById("resultBox");
		    	
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
		    }
		}
		
		
	 	function onClose(){
	 		
	 	}
		
	 	function onOpen(){
	 		
	 	}
		//=============================================

	
	</script>
</body>
</html>