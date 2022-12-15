<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 질문 상세보기</title>

    <!--내가만든 css-->
    <link rel="stylesheet" href="css/bn_style.css" type="text/css">
	
</head>
<body>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

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

        <div class="row">
            <div class="col-lg-10 bn_card-top"><!--영양제복용법질문======================================-->
                <div class="row">
                    <div class="col-lg-1 bn_txt_big"><h2>Q</h2></div>
                    <div class="col-lg-10">
                        <div class="row bn_txt_big">
                            <h3>영양제 복용법 질문!</h3>
                        </div>
                        <div class="row bn_content">아침에 일어나서 아르기닌 2알(1000mg) 아침 저녁 식후 먹고 뉴트리언트 2day 1알, 칼슘-마그네슘 1알 4시쯤 운동 전 공복에 아르기닌 2알 복용 중이고 운동은 주 6일 하고 있습니다. 복용법 올바를까요?ㅎㅎㅎㅎㅎㅎㅎ</div>
                        <div class="row">
                            <div class="col-2"><span>20대 / 남</span></div>
                            <div class="col-1">2022/21/07</div>
                            <div class="col d-flex align-items-center justify-content-end bn_board-meta text-end">
                                <i class="view fa-solid fa-eye m-2"></i><span class=" m-2">24</span>
                                <i class="bi bi-chat-dots m-2"></i><span class=" m-2">8</span>
                                <i class="save fa-regular fa-bookmark m-2"></i><span class=" m-2">6</span>
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
                <div class="sidebar__item">
                    <div class="latest-product__text">
                        <h4 style="font-family:'IBM Plex Sans KR', sans-serif;">관련 영양제</h4>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="img/latest-product/lp-1.jpg" alt="">
                                </div>
                                <div>
                                    <h6>Crab Pool Security</h6>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-10 m-2" style="background-color: rgba(57, 255, 156, 0.276);">
            * 말풍선 아이콘 누르면 댓글창 열리고 질문 자체에 댓글 달 수 있음(기본은 닫혀있음)<br>
            * 스크랩 아이콘 누르면 스크랩되고 스크랩 수 올라감<br>
            * 왜 드롭다운 안 되지?

            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Dropdown button
                </button>
                <ul class="dropdown-menu dropdown-menu-dark">
                  <li><a class="dropdown-item active" href="#">Action</a></li>
                  <li><a class="dropdown-item" href="#">Another action</a></li>
                  <li><a class="dropdown-item" href="#">Something else here</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Separated link</a></li>
                </ul>
              </div>

        </div>

        <div class="row">
            <div class="col-lg-10 bn_card-bottom"><!--영양제복용법답변 ===============-->
                <div class="row">
                    <div class="col-lg-1 d-flex bn_txt_big"><h2>A</h2><h3>1</h3></div>
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
                            아르기닌은 흡수율이 낮아서 단일 제품으로 먹는 거보단<br>
                            아르기닌과 시트룰린이 같이 들어있는 제품으로 먹는 게 좋습니다. <br>
                            <br>
                            문의하신 유산균의 경우<br>
                            이렇게 저렇게 드십시오<br>
                        </div>

                        <div class="row justify-content-end bn_board-meta">
                            <i class="bi bi-chat-dots m-2"></i><span class=" m-2">8</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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

            <div class="col-lg-2">
                <!--공란-->
            </div>
        </div>

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
        $("#file").on('change',function(){
            var fileName = $("#file").val();
            $(".upload-name").val(fileName);
        });
    }
    
    $("#selectPillBtn").click(function(){
        $('#modalPillChoice').modal();
    });
    
</script>
</body>
</html>