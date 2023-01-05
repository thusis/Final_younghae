<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>내가 쓴글 보기</title>
    <jsp:include page="/WEB-INF/views/common/topmenubar.jsp"></jsp:include>
    <style>
        .bn_index ul li {
            list-style: none;
            position: relative;
            display: inline-block;
        }

        .bn_index a {
            color: black;
        }

        .bn_index li:last-child a {
            font-weight: 800;
            color: #FD9F28;
        }

        .product__details__tab .nav-tabs:before {
            position: absolute;
            left: 0;
            top: 0px;
            height: 0px;
            width: 370px;
            background: #ebebeb;
            content: "";
        }

        .product__details__tab .nav-tabs:after {
            position: absolute;
            left: 0;
            top: 0px;
            height: 0px;
            width: 370px;
            background: #ebebeb;
            content: "";
        }
    </style>
</head>

<body>
    <div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
        <ul>
            <li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
            <li>/</li>
            <li><a href="#">내 게시물 관리</a></li>
        </ul>
    </div>
    <div class="container">
        <div class="section-title" style="padding: 30px 0 10px 0; margin-bottom: 0px;">
            <h4>내 게시물 관리</h4>
            <div style="display: block;">
                <hr style="width: 50vw; background-color: #24E082;">
            </div>
        </div>
        <div class="col-lg-12">
            <div class="product__details__tab" style="padding-top: 0px;">
                <div class="tab-content">
                    <div class="tab-pane active" id="tabs" role="tabpanel">
                        <div class="product__details__tab__desc" style="padding-top: 0px;">
                            내가 작성한 게시물
                            <div class="bn_boardlist mt-2">
                                <button style="float: right; border: 0; margin-bottom: 5px;" onclick="location.href='${contextPath}/myWriteBoardDetail.my'">+</button>
                                <table class="table">
                                    <thead>
                                        <tr class="text-teal-100">
                                            <th scope="col" class="col-lg-1">글번호</th>
                                            <th scope="col" class="col-lg-2">게시판</th>
                                            <th scope="col" class="col-lg-4">제목</th>
                                            <th scope="col" class="col-lg-2">작성일자</th>
                                            <th scope="col" class="col-lg-2">수정일자</th>
                                            <th scope="col" class="col-lg-1">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">
                                        <c:if test="${ !empty BoardList }">
                                            <c:forEach begin="0" end="4" var="i">
                                                <c:if test="${ !empty BoardList[i] }">
                                                    <tr>
                                                        <td>${ BoardList[i].boardNum }</td>
                                                        <c:if test="${ BoardList[i].boardType eq 1 }">
                                                            <td>자유게시판</td>
                                                        </c:if>
                                                        <c:if test="${ BoardList[i].boardType eq 3 }">
                                                            <td>건강해지는 이야기</td>
                                                        </c:if>
                                                        <c:if test="${ BoardList[i].boardType eq 5 }">
                                                            <td>질문게시판</td>
                                                        </c:if>
                                                        <c:if test="${ BoardList[i].boardType eq 8 }">
                                                            <td>답변</td>
                                                        </c:if>
                                                        <td>${ BoardList[i].boardTitle }</td>
                                                        <td>${ BoardList[i].boardCreateDate }</td>
                                                        <td>${ BoardList[i].boardModifyDate }</td>
                                                        <td>${ BoardList[i].boardView }</td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                    <tbody>
                                        <c:if test="${ !empty BoardList }">
                                            <c:if test="${ BoardList.size()<4 }">
                                                <c:forEach begin="0" end="${ 4-BoardList.size() }">
                                                    <tr>
                                                        <td style="height: 50px;"></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </c:if>
                                    </tbody>
                                    <tbody>
                                        <c:if test="${ empty BoardList }">
                                            <tr style="height: 300px;">
                                                <td colspan="6" style="text-align:center; vertical-align: middle;">작성한 게시물이 없습니다.</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="product__details__tab" style="padding-top: 0px;">
                            <div>
                                <ul class="nav nav-tabs col-lg-12" role="tablist" style="margin-top: 50px; justify-content: left;">
                                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">리뷰</a></li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="false">댓글</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="product__details__tab__desc" style="padding-top: 0px;">
                                        <div class="bn_boardlist mt-2">
                                            <button style="float: right; border: 0; margin-bottom: 5px;" onclick="location.href='${contextPath}/myWriteReviewDetail.my'">+</button>
                                            <table class="table">
                                                <thead>
                                                    <tr class="text-teal-100">
                                                        <th scope="col" class="col-lg-1">리뷰번호</th>
                                                        <th scope="col" class="col-lg-6">리뷰내용</th>
                                                        <th scope="col" class="col-lg-2">작성일자</th>
                                                        <th scope="col" class="col-lg-2">수정일자</th>
                                                        <th scope="col" class="col-lg-1">별점</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbody">
                                                    <c:if test="${ !empty ReviewList }">
                                                        <c:forEach begin="0" end="4" var="i">
                                                            <c:if test="${ !empty ReviewList[i] }">
                                                                <tr>
                                                                    <td>${ ReviewList[i].rvNum }</td>
                                                                    <td>${ ReviewList[i].rvContent }</td>
                                                                    <td>${ ReviewList[i].rvCreateDate }</td>
                                                                    <td>${ ReviewList[i].rvMOdifyDate }</td>
                                                                    <td>${ ReviewList[i].rvStar }</td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                                <tbody>
                                                    <c:if test="${ !empty ReviewList }">
                                                        <c:if test="${ ReviewList.size()<4 }">
                                                            <c:forEach begin="0" end="${ 4-ReviewList.size() }">
                                                                <tr>
                                                                    <td style="height: 50px;"></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:if>
                                                </tbody>
                                                <tbody>
                                                    <c:if test="${ empty ReviewList }">
                                                        <tr style="height: 300px;">
                                                            <td colspan="5" style="text-align:center; vertical-align: middle;">작성한 리뷰가 없습니다.</td>
                                                        </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                    <div class="product__details__tab__desc" style="padding-top: 0px;">
                                        <div class="bn_boardlist mt-2">
                                            <button style="float: right; border: 0; margin-bottom: 5px;" onclick="location.href='${contextPath}/myWriteReplyDetail.my'">+</button>
                                            <table class="table">
                                                <thead>
                                                    <tr class="text-teal-100">
                                                        <th scope="col" class="col-lg-1">댓글번호</th>
                                                        <th scope="col" class="col-lg-2">게시판</th>
                                                        <th scope="col" class="col-lg-2">게시글번호</th>
                                                        <th scope="col" class="col-lg-5">댓글내용</th>
                                                        <th scope="col" class="col-lg-2">작성일자</th>

                                                    </tr>
                                                </thead>
                                                <tbody id="tbody">
                                                    <c:if test="${ !empty ReplyList }">
                                                        <c:forEach begin="0" end="4" var="i">
                                                            <c:if test="${ !empty ReplyList[i] }">
                                                                <tr>
                                                                    <td>${ ReplyList[i].replyNum }</td>
                                                                    <c:if test="${ ReplyList[i].boardType eq 1 }">
                                                                        <td>자유게시판</td>
                                                                    </c:if>
                                                                    <c:if test="${ ReplyList[i].boardType eq 3 }">
                                                                        <td>건강해지는 이야기</td>
                                                                    </c:if>
                                                                    <c:if test="${ ReplyList[i].boardType eq 5 }">
                                                                        <td>질문게시판</td>
                                                                    </c:if>
                                                                    <c:if test="${ ReplyList[i].boardType eq 8 }">
                                                                        <td>답변</td>
                                                                    </c:if>
                                                                    <td>${ ReplyList[i].boardNum }</td>
                                                                    <td>${ ReplyList[i].replyContent }</td>
                                                                    <td>${ ReplyList[i].replyDate }</td>

                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                                <tbody>
                                                    <c:if test="${ !empty ReplyList }">
                                                        <c:if test="${ ReplyList.size()<4 }">
                                                            <c:forEach begin="0" end="${ 4-ReplyList.size() }">
                                                                <tr>
                                                                    <td style="height: 50px;"></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:if>
                                                </tbody>
                                                <tbody>
                                                    <c:if test="${ empty ReplyList }">
                                                        <tr style="height: 300px;">
                                                            <td colspan="5" style="text-align:center; vertical-align: middle;">작성한 댓글이 없습니다.</td>
                                                        </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script>
    <!-- 상세보기 -->
    window.onload=()=>{
    	//qna
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