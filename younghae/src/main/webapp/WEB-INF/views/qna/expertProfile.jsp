<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 전문가 상세 프로필 </title>

    <!--내가만든 css-->
    <link rel="stylesheet" href="css/bn_style.css" type="text/css">
	
</head>
<body>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

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
            <h2 class="bn_txt_strong pb-3" style="font-size: 2rem;">남나눔 님의 프로필</h2>
            <hr style="border:2px solid #24E082; background-color: #24E082;">
        </div>

        <div class="row">
            
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-6 bn_pro-infobox-top" id="infobox1" style="border-color: #24E082;">
                        <button class="btn" onclick="showCareer();">경력</button>
                    </div>
                    <div class="col-lg-6 bn_pro-infobox-top" id="infobox2" style="border-color: #8496AE;">
                        <button class="btn" onclick="showEstimate();">견적서</button>
                    </div>
                </div>

                <div class="row bn_pro-infobox-bottom" id="infoboxBottom1">
                    <ul>
                        <li>(현) 세계로마취통증의학과의원, 마취통증의학과 전문의</li>
                        <li>1984 제천서울병원 공동설립</li>
                        <li>2001-2006 서울정신자병원 통증클리닉</li>
                        <li>1974 서울의대졸업</li>
                        <li>1979 서울대학병원마취통증의학과 전문의 수료 및 전문의취득</li>
                        <li>1982년 서울의대.박사학위 취득</li>
                    </ul>
                </div>
                <div class=" row bn_pro-infobox-bottom" id="infoboxBottom2">
                    <div class="row d-flex align-items-center ">
                        <div class="col-1">
                            <div class="d-flex align-items-center justify-content-center"style="background-color: black; color:#ffffff; width: 1.5rem; height: 1.5rem; border-radius: 3rem;"><i class="fa-solid fa-won-sign"></i></div>
                        </div>
                        <div class="col-5">
                            <h4 class="bn_txt_strong">견적서</h4>
                        </div>

                        <div class="col-3">
                            <button class="btn bn_btn_search2" style="font-size:small; padding: 0.5rem; background-color: #cacfd4;">수정하기</button>
                        </div>
                        <div class="col-3">
                            <button class="btn bn_btn_search2" style="font-size:small; padding: 0.5rem; background-color: #cacfd4;">스케줄보기</button>
                        </div>
                    </div>
                    <hr>
                    <div class="row mb-3 align-items-center">
                        <h5 class="col-3">서비스명</h5>
                        <span class="col bn_txt_strong">복용상담</span>
                    </div> 
                    <div class="row mb-4 align-items-center">
                        <h5 class="col-3">예상금액</h5>
                        <span class="col bn_txt_strong">10,000원 (10분당)</span>
                    </div>
                    <div class="row">
                        <button class="col btn bn_txt_strong p-3 " style="display: inline-block; background-color: black; color:white;">상담 가능 시간 보기</button>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="bn_pro-box" style="padding:1.5rem; background: linear-gradient(to bottom, white 80%, #24E082 20%);">
                    <div class="row">
                        <div class="col-lg-8 align-self-center">
                            <h5 class="bn_pro-name">김가람&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #24E082; color:#ffffff; padding-left: 0.35rem; padding-right:0.35rem;">약사</span></h5>
                            <span style="display: inline-block; width: 3.5rem;">답변수 </span><span>: 493개</span><br>
                            <span style="display: inline-block; width: 3.5rem;">전문과목 </span><span>: 약학</span><br>
                            <span style="display: inline-block; width: 3.5rem;">소속 </span><span>: 서울 중구 종로약국&nbsp;&nbsp;<span class="badge rounded-pill" style="background-color: #8496AE; color:#ffffff; padding-left: 0.5rem; padding-right:0.5rem;">병원 정보 보기</span></span><br>
                        </div>

                        <div class="col-4 align-self-center">
                            <img src="img/pro_profile1.png" class="bn_pro-profile" alt="...">
                        </div>
                    </div>

                    <div class="row" style="padding: 1.5rem;"><span>친절과 사랑으로 전하는 복용상식! 10:00-19:00 상담가능합니다. 어쩌구 저쩌구 룰루리랄라라 친절과 사랑으로 전하는 복용상식! 10:00-19:00 상담가능합니다. 어쩌구 저쩌</span></div>
                    
                    <div class="row justify-content-center">
                        <button class="btn" style="color:white;" onclick="openChat();"><h3 class="bn_txt_strong">채팅하러가기</h3></button>
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
                    <div class="col-lg-3">
                        <th scope="col">해결되었어요</th>
                        <th scope="col">글번호</th>
                    </div>
                    <th scope="col" class="col-lg-4">제목</th>
                    <th scope="col" class="col-lg-1">글쓴이</th>
                    <th scope="col" class="col-lg-1">답변수</th>
                    <th scope="col" class="col-lg-1">조회수</th>
                    <th scope="col" class="col-lg-2">날짜</th>
                  </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-check-square-fill"></i></th>
                        <td>1</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Otto</td>
                        <td>@mdo</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-square"></i></th>
                        <td>2</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Thornton</td>
                        <td>@fat</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-check-square-fill"></i></th>
                        <td>3</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry the Bird</td>
                        <td>@twitter</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-check-square-fill"></i></th>
                        <td>4</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry the Bird</td>
                        <td>@twitter</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-check-square-fill"></i></th>
                        <td>5</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry the Bird</td>
                        <td>@twitter</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
                    <tr>
                        <th scope="row" class="d-flex justify-content-center bn_board_check"><i class="bi bi-check-square-fill"></i></th>
                        <td>6</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"">왜 border-bottom 생겨서 날 괴롭게 해?</td>
                        <td>@twitter</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2022-12-06</td>
                    </tr>
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



</script>
</body>
</html>