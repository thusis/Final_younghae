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
	
</head>
<body>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>
	
	<!-- =================================전문가 섹션=========================================== -->
        <section class="bn_pro">
            <div class="container">
                <div class="row"> <!--===두 개 ===-->
                    <div class="col-lg-6">
                        <div class="row bn_pro-box m-1">
                            <div class="col-lg-7  align-self-center">
                                <h5 class="bn_pro-name">김가람&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">약사</span></h5>
                                <span style="display: inline-block; width: 3.5rem;">답변수 </span><span>: 493개</span><br>
                                <span style="display: inline-block; width: 3.5rem;">전문과목 </span><span>: 약학</span><br>
                                <span style="display: inline-block; width: 3.5rem;">소속 </span><span>: 서울 중구 종로약국&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">병원 정보 보기</span></span><br>
                            </div>

                            <div class="col-3 align-self-center">
                                <img src="img/pro_profile1.png" class="bn_pro-profile" alt="...">
                            </div>
                            <div class="col-2 align-self-center">
                                <div class="bn_pro-icon"><i class="bi bi-list-ul"></i></div>
                                <div class="bn_pro-icon"><i class="bi bi-send"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row bn_pro-box m-1">
                            <div class="col-lg-7  align-self-center">
                                <h5 class="bn_pro-name">남나눔&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">의사</span></h5>
                                <span style="display: inline-block; width: 3.5rem;">답변수 </span><span>: 493개</span><br>
                                <span style="display: inline-block; width: 3.5rem;">전문과목 </span><span>: 약학</span><br>
                                <span style="display: inline-block; width: 3.5rem;">소속 </span><span>: 서울 중구 종로약국&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">병원 정보 보기</span></span><br>
                            </div>

                            <div class="col-3 align-self-center">
                                <img src="img/pro_profile2.png" class="bn_pro-profile" alt="...">
                            </div>
                            <div class="col-2 align-self-center">
                                <div class="bn_pro-icon"><i class="bi bi-list-ul"></i></div>
                                <div class="bn_pro-icon"><i class="bi bi-send"></i></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-2"> <!--===두 개 ===-->
                    <div class="col-lg-6">
                        <div class="bn_pro-box">
                            <div class="row">
                                <div class="col-lg-8  align-self-center">
                                    <h5 class="bn_pro-name">김가람&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">약사</span></h5>
                                    <span style="display: inline-block; width: 3.5rem;">답변수 </span><span>: 493개</span><br>
                                    <span style="display: inline-block; width: 3.5rem;">전문과목 </span><span>: 약학</span><br>
                                    <span style="display: inline-block; width: 3.5rem;">소속 </span><span>: 서울 중구 종로약국&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">병원 정보 보기</span></span><br>
                                </div>

                                <div class="col-4 align-self-center">
                                    <img src="img/pro_profile1.png" class="bn_pro-profile" alt="...">
                                </div>
                            </div>
                            <br>

                            <div class="row" style="padding: 1.5rem;"><span>친절과 사랑으로 전하는 복용상식! 10:00-19:00 상담가능합니다. 어쩌구 저쩌구 룰루리랄라라 친절과 사랑으로 전하는 복용상식! 10:00-19:00 상담가능합니다. 어쩌구 저쩌구 룰루리랄라라 친절과 사랑으로 전하는 복용상식! 10:00-19:00 상담가능합니다. 어쩌구 저쩌구 룰루리랄라라</span></div>
                            <div class="row align-items-center">
                                <div class="col"></div>
                                <button class="btn bn_pro-btn col-3 align-self-center text-center" style="display: inline-block;"> 작성글 보기 </button>
                                <div class="col"></div>
                                <button class="btn bn_pro-btn col-6 align-self-center text-center" style="display: inline-block;"> <i class="bi bi-send"></i> 채팅 상담 요청하기 </button>
                                <div class="col"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="bn_pro-box ms-2">
                            <div class="row">
                                <div class="col-lg-8  align-self-center">
                                    <h5 class="bn_pro-name">남나눔&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">약사</span></h5>
                                    <span style="display: inline-block; width: 3.5rem;">답변수 </span><span>: 493개</span><br>
                                    <span style="display: inline-block; width: 3.5rem;">전문과목 </span><span>: 약학</span><br>
                                    <span style="display: inline-block; width: 3.5rem;">소속 </span><span>: 서울 중구 종로약국&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">병원 정보 보기</span></span><br>
                                </div>

                                <div class="col-4 align-self-center">
                                    <img src="img/pro_profile2.png" class="bn_pro-profile" alt="...">
                                </div>
                            </div>
                            <br>

                            <div class="row" style="padding: 1.5rem;"><span>친절과 사랑으로 전하는 복용상식! 10:00-19:00 상담가능합니다. 어쩌구 저쩌구 룰루리랄라라 친절과 사랑으로 전하는 복용상식! 10:00-19:00 상담가능합니다. 어쩌구 저쩌구 룰루리랄라라 친절과 사랑으로 전하는 복용상식! 10:00-19:00 상담가능합니다. 어쩌구 저쩌구 룰루리랄라라</span></div>
                            <div class="row align-items-center">
                                <div class="col"></div>
                                <button class="btn bn_pro-btn col-3 align-self-center text-center" style="display: inline-block;"> 작성글 보기 </button>
                                <div class="col"></div>
                                <button class="btn bn_pro-btn col-6 align-self-center text-center" style="display: inline-block;"> <i class="bi bi-send"></i> 채팅 상담 요청하기 </button>
                                <div class="col"></div>
                            </div>
                        </div>
                    </div>
                   
                </div>
 

            </div>
    </section>
    <br>

    <div class="container">
        
               <div class="product__pagination blog__pagination d-flex justify-content-center mt-3 ">
                   <a href="#">1</a>
                   <a href="#">2</a>
                   <a href="#">3</a>
                   <a href="#">4</a>
                   <a href="#">5</a>
                   <a href="#">6</a>
                   <a href="#"><i class="fa fa-long-arrow-right"></i></a>
               </div>
       
               <div class="row d-flex justify-content-center">
                   <div class="input-group mt-3 col-lg-6 col-md-3">
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
</body>
</html>