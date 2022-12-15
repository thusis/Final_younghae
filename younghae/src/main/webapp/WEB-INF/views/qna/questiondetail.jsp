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

        <div class="col-lg-10">

            <div class="bn_txt_big" style="padding: 30px 0 10px 0;">
                <h3>답변하기</h3>
                <hr style="border:2px solid #24E082; background-color: #24E082;">
            </div>
            
            <form action="${contextPath}/writeQuestion.qa" method="post" enctype="multipart/form-data" >
                
                <div class="mb-3">
                    <div class="row m-3">
                        <button type="button" class="btn bn_btn_search2" id="selectPillBtn"><i class="bi bi-capsule"></i></button>
                        <input type="text" class="inline" id="selectPill" placeholder="영양제 선택" style="border:0px; background-color: transparent;" disabled>
                    </div>
                     
                    <div class="filebox row m-3">
                        <button type="button" class="btn bn_btn_search2" id="addFile"><i class="bi bi-paperclip"></i></button>
                        <input class="upload-name col-lg-6" value="첨부파일" placeholder="첨부파일" readonly>
                        <label for="file">파일찾기</label> 
                        <input type="file" id="file">
                    </div>
                
                    <textarea class="form-control" id="content" rows="10">답변 작성 시 서비스 운영정책을 지켜주세요.
                        광고주로부터 소정의 경제적 대가를 받고 특정 상품에 대한 추천 또는 후기글을 올리는 경우, 
                        이러한 광고주와의 경제적 이해관계를 소비자들이 쉽게 알 수 있도록 
                        글 제목 또는 답변의 첫 부분 또는 끝 부분 등 적적란 위치에 공개하여야 합니다.</textarea>
                </div>
            </form>
        
            <div class="row justify-content-end bn_board-meta mb-5">
                <button class="btn bn_btn_search2" style="background-color: white; color:black; border: 1px solid #24E082;" >취소</button>
                <button class="btn bn_btn_search2">답변등록</button>
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