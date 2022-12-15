<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 질문하기</title>

    <!--내가만든 css-->
    <link rel="stylesheet" href="css/bn_style.css" type="text/css">
	
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
      </style>
</head>
<body>

    <main class="d-flex flex-nowrap chatpopup">

        <!-- 첫번째 컬럼====================================================== -->
        <div class="d-flex flex-column flex-shrink-0 bg-light" 
        style="width: 4.5rem; height:750px; border-top: 0.2rem solid #24E082; border-left: 0.2rem solid #24E082; border-radius: 2rem 0 0 0; z-index: 8; ">
            <a href="/" class="d-block p-3 link-dark text-decoration-none" title="Icon-only" >
            <img src="img/logo.svg" alt="영해로고">
            </a>
            <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
                <li class="nav-item nav-link py-3 border-bottom rounded-0">
                    <button id="minimizeBtn" class="btn" onclick="minimize();" >
                        <i class="bi bi-chevron-double-right"></i>
                    </button>
                </li>
                <li class="nav-item py-3 border-bottom rounded-0" >
                    <button id="showProlistBtn" class="btn">
                        <i class="bi bi-person-circle"></i>
                    </button>
                </li>
            </ul>
        </div>

        <!-- 전문가목록============================================================= -->
        <div id="chatProList" class="flex-column align-items-stretch flex-shrink-0 bg-light" style="overflow:auto;width: 300px;  height:750px; border-top: 0.2rem solid #24E082; z-index: 8; ">
            <div href="/" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
            <span class="fs-5 fw-semibold">전문가 목록</span>
            </div>
            <div class="list-group list-group-flush border-bottom scrollarea">
                <a href="#" class="list-group-item list-group-item-action active py-3 lh-sm" aria-current="true">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1 bn_pro-name position-relative">김가람</strong>
                        <small>12분 전</small>
                    </div>
                    <div class="col-10 mb-1 small chat_lastmsg">마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임.</div>
                    <div class="col-10">
                        <span class="badge">자리비움</span>
                        <span class="badge rounded-pill bg-success text-white">상담가능</span>
                    </div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1 bn_pro-name position-relative">남나눔<span class="text-white position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">1</span></strong>
                        <small>58분 전</small>
                    </div>
                    <div class="col-10 mb-1 small chat_lastmsg">마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임.</div>
                    <div class="col-10">
                        <span class="badge">자리비움</span>
                        <span class="badge rounded-pill bg-success text-white">상담가능</span>
                    </div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1 bn_pro-name">도대담<span class="text-white position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">99+</span></strong>
                        <small>1시간 전 </small>
                    </div>
                    <div class="col-10 mb-1 small chat_lastmsg">마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임.</div>
                    <div class="col-10">
                        <span class="badge rounded-pill bg-secondary text-white">자리비움</span>
                        <span class="badge">상담가능</span>
                    </div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1 bn_pro-name">문미미</strong>
                        <small>1일 전</small>
                    </div>
                    <div class="col-10 mb-1 small chat_lastmsg">마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임. 마지막메세지를 보여줄 것임.</div>
                    <div class="col-10">
                        <span class="badge rounded-pill bg-secondary text-white">자리비움</span>
                        <span class="badge">상담가능</span>
                    </div>
                </a>
            </div>
        </div>

        <!-- 세 번째 열 =======================================================================================  -->
        <!-- 세 번째 열 =======================================================================================  -->
        <div id="chatMessageRoom" class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 500px; height:750px; border-left: 0.1rem solid rgba(20, 49, 82, 0.247);border-top: 0.2rem solid #24E082; ">

            <div id="chatMessageRoomTop" style="overflow:auto;">
                <div class="row bn_pro-box m-1" style="position:fixed; z-index: 10; width:465px;"> <!--전문가-->
                    <div class="col-lg-7  align-self-center">
                        <h5 class="bn_pro-name">김가람&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">약사</span></h5>
                        <span style="display: inline-block; width: 3.5rem;">답변수 </span><span>: 493개</span><br>
                        <span style="display: inline-block; width: 3.5rem;">전문과목 </span><span>: 약학</span><br>
                        <span style="display: inline-block; width: 3.5rem;">소속 </span><span>: 서울 중구 종로약국&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">병원 정보 보기</span></span><br>
                    </div>

                    <div class="col-3 align-self-center">
                        <img src="img/pro_profile1.png" class="bn_pro-profile" alt="..." style="width: 5rem; height: 5rem;">
                    </div>
                    <div class="col-2 align-self-center">
                        <div class="bn_pro-icon" style="width: 2.5rem; height: 2.5rem;"><i class="bi bi-list-ul" style="font-size: 1.5rem;"></i></div>
                        <div class="bn_pro-icon" style="width: 2.5rem; height: 2.5rem;"><i class="bi bi-send" style="font-size: 1.5rem;"></i></div>
                    </div>
                </div><!--전문가 끝=================-->

                <div class="chat_wrap bg-light" style="margin-top: 170px;"> <!--채팅메세지-->
                    <div class="chat ch1">
                        <div class="icon"><i class="fa-solid fa-user"></i></div>
                        <div class="textbox">안녕하세요. 반갑습니다.<span class="sendtime">오전 9:28</span></div>
                    </div>

                    <div class="chat ch1">
                        <div class="icon"><i class="fa-solid fa-user"></i></div>
                        <div class="textbox">
                            <div class="row d-flex align-items-center ">
                                <div class="col-1">
                                    <div class="d-flex align-items-center justify-content-center"
                                    style="background-color: black; color:#ffffff; width: 1.5rem; height: 1.5rem; border-radius: 3rem;">
                                    <i class="fa-solid fa-won-sign"></i></div>
                                </div>
                                <div class="col-5">
                                    <h4 class="bn_txt_strong">견적서</h4>
                                </div>
                            </div>
                            <br>
                            <span>홍길동 고객님 안녕하세요. 상담예상 금액입니다.</span>
                            <hr>
                            <div class="row mb-3 align-items-center">
                                <span class="col-4">서비스명</span>
                                <span class="col bn_txt_strong">복용상담</span>
                            </div> 
                            <div class="row mb-4 align-items-center">
                                <span class="col-4">예상금액</span>
                                <span class="col bn_txt_strong">10,000원(10분당)</span>
                            </div>
                            <hr>
                            <span>견적금액에 대해 궁금한 점을 채팅으로 물어보세요</span>
                            <div class="row mt-2 justify-content-center">
                                <button class="col-10 btn bn_txt_strong p-3" 
                                style="display: inline-block; background-color: black; color:white;">결제 후 채팅 시작하기</button>
                            </div>
                            <span class="sendtime">오전 9:28</span>
                        </div>
                    </div>

                    <div class="chat ch1mng">
                        <div class="icon"><img src="img/logo_pill_white.svg" alt="흰로고"></div>
                        <div class="textbox">위 메세지는 자동수신 메세지입니다. 결제를 진행하신 후 전문가와 상담 시작 시간을 협의해주세요. 상호 동의하에 상담이 시작됩니다.<span class="sendtime">오전 9:28</span></div>
                    </div>

                    <div class="chat ch2">
                        <!-- <div class="icon"><i class="fa-solid fa-user"></i></div> -->
                        <div class="textbox">안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?<span class="sendtime">오전 9:28</span></div>
                    </div>
                    <div class="chat ch1">
                        <div class="icon"><i class="fa-solid fa-user"></i></div>
                        <div class="textbox">아유~ 너무요너무요! 요즘 어떻게 지내세요?<span class="sendtime">오전 9:28</span></div>
                    </div>
                    <div class="chat ch2">
                        <!-- <div class="icon"><i class="fa-solid fa-user"></i></div> -->
                        <div class="textbox">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요. 코로나가 다시 극성이어서 모이지도 못하구 있군요 ㅠㅠ 얼른 좀 잠잠해졌으면 좋겠습니다요!<span class="sendtime">오전 9:28</span></div>
                    </div>
                    <div class="chat ch1">
                        <div class="icon"><i class="fa-solid fa-user"></i></div>
                        <div class="textbox">안녕하세요. 반갑습니다.<span class="sendtime">오전 9:28</span></div>
                    </div>
                    <div class="chat ch2">
                        <!-- <div class="icon"><i class="fa-solid fa-user"></i></div> -->
                        <div class="textbox">안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?<span class="sendtime">오전 9:28</span></div>
                    </div>
                    <div class="chat ch1">
                        <div class="icon"><i class="fa-solid fa-user"></i></div>
                        <div class="textbox">아유~ 너무요너무요! 요즘 어떻게 지내세요?<span class="sendtime">오전 9:28</span></div>
                    </div>
                    <div class="chat ch2">
                        <!-- <div class="icon"><i class="fa-solid fa-user"></i></div> -->
                        <div class="textbox">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요. 코로나가 다시 극성이어서 모이지도 못하구 있군요 ㅠㅠ 얼른 좀 잠잠해졌으면 좋겠습니다요!<span class="sendtime">오전 9:28</span></div>
                    </div>
                </div> <!--채팅메세지 끝==================-->
            </div>

            <div class="chatInput">
                <div class="input-group align-items-center row bg-white">
                    <button class="btn col-2" style="color:orange; font-size: 2.2rem;"><i class="fa-solid fa-image"></i></button>
                    <input type="text" class="form-control" id="bn_chat-input" placeholder="메세지를 입력하세요">
                    <button class="btn bn_chat-inputbtn"><i class="fa-solid fa-paper-plane"></i></button>
                </div>
            </div>
        </div>

    </main>



    <script>
        function minimize(){
            document.getElementById('chatProList').style.display = 'none';
        }
        

        // document.getElementById('minimizeBtn').addEventListener('click',function(){
        //     document.getElementById('chatProList').style.display = 'none';
        // })

        document.getElementById('showProlistBtn').addEventListener('click',function(){
            document.getElementById('chatProList').style.display = 'block';
        })

        
    </script>

</body>
</html>