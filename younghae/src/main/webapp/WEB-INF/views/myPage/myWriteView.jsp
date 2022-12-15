<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
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

    </style>
        <script src="${contextPath }/js/jquery-3.3.1.min.js"></script>
</head>

<body>
	<nav>
		<jsp:include page="../common/topmenubar.jsp" flush="true" />
	</nav>
    <div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
        <ul>
            <li><a href="#">마이페이지</a></li>
            <li> / </li>
            <li><a href="#">내 게시물 관리</a></li>
        </ul>
    </div>
    <div class="container">
        <div class="section-title" style="padding: 30px 0 10px 0; margin-bottom: 0px;">
            <h4>내 게시물 관리</h4>
            <div style="display: block;">
                <hr style="width:50vw; background-color: #24E082;">
            </div>
        </div>
        <div class="col-lg-12">
            <div class="product__details__tab" style="padding-top: 0px;">
                <div class="tab-content">
                    <div class="tab-pane active" id="tabs" role="tabpanel">
                        <div class="product__details__tab__desc" style="padding-top: 0px;">
                            내가 작성한 게시물
                            <div class="bn_boardlist mt-2">
                                <button style="float: right; border: 0; margin-bottom: 5px;"
                                    onclick="location.href='/Users/Song/Desktop/final/ogani-master/myWriteBoardDetail.html'">+</button>
                                <table class="table">
                                    <thead>
                                        <tr class="text-teal-100">
                                            <th scope="col" class="col-lg-1">글번호</th>
                                            <th scope="col" class="col-lg-6">제목</th>
                                            <th scope="col" class="col-lg-2">작성일자</th>
                                            <th scope="col" class="col-lg-2">수정일자</th>
                                            <th scope="col" class="col-lg-1">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Ot1to
                                            </td>
                                            <td>@mdo</td>
                                            <td>1</td>
                                            <td>1</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                Thornton</td>
                                            <td>@fat</td>
                                            <td>1</td>
                                            <td>1</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry
                                                the Bird</td>
                                            <td>@twitter</td>
                                            <td>1</td>
                                            <td>1</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry
                                                the Bird</td>
                                            <td>@twitter</td>
                                            <td>1</td>
                                            <td>1</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry
                                                the Bird</td>
                                            <td>@twitter</td>
                                            <td>1</td>
                                            <td>1</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="product__details__tab" style="padding-top: 0px;">
                            <div>
                                <ul class="nav nav-tabs col-lg-12" role="tablist" style="margin-top: 50px; justify-content: left;">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#tabs-1"
                                            role="tab" aria-selected="true">리뷰</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                            aria-selected="false">댓글</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="product__details__tab__desc" style="padding-top: 0px;">
                                        <div class="bn_boardlist mt-2">
                                            <button style="float: right; border: 0; margin-bottom: 5px;"
                                                onclick="location.href='/Users/Song/Desktop/final/ogani-master/myWriteReviewDetail.html'">+</button>
                                            <table class="table">
                                                <thead>
                                                    <tr class="text-teal-100">
                                                        <th scope="col" class="col-lg-1">글번호</th>
                                                        <th scope="col" class="col-lg-6">제목</th>
                                                        <th scope="col" class="col-lg-2">작성일자</th>
                                                        <th scope="col" class="col-lg-2">수정일자</th>
                                                        <th scope="col" class="col-lg-1">조회수</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td
                                                            style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                            Ot1to
                                                        </td>
                                                        <td>@mdo</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                    </tr>
                                                    <tr>
                                                        <td>2</td>
                                                        <td
                                                            style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                            Thornton</td>
                                                        <td>@fat</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                    </tr>
                                                    <tr>
                                                        <td>3</td>
                                                        <td
                                                            style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                            Larry
                                                            the Bird</td>
                                                        <td>@twitter</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                    </tr>
                                                    <tr>
                                                        <td>4</td>
                                                        <td
                                                            style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                            Larry
                                                            the Bird</td>
                                                        <td>@twitter</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                    </tr>
                                                    <tr>
                                                        <td>5</td>
                                                        <td
                                                            style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                            Larry
                                                            the Bird</td>
                                                        <td>@twitter</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                    <div class="product__details__tab__desc" style="padding-top: 0px;">
                                        <div class="bn_boardlist mt-2">
                                            <button style="float: right; border: 0; margin-bottom: 5px;"
                                                onclick="location.href='/Users/Song/Desktop/final/ogani-master/myWriteReplyDetail.html'">+</button>
                                            <table class="table">
                                                <thead>
                                                    <tr class="text-teal-100">
                                                        <th scope="col" class="col-lg-1">글번호</th>
                                                        <th scope="col" class="col-lg-6">제목</th>
                                                        <th scope="col" class="col-lg-2">작성일자</th>
                                                        <th scope="col" class="col-lg-2">수정일자</th>
                                                        <th scope="col" class="col-lg-1">조회수</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td
                                                            style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                            Ot2to
                                                        </td>
                                                        <td>@mdo</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                    </tr>
                                                    <tr>
                                                        <td>2</td>
                                                        <td
                                                            style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                            Thornton</td>
                                                        <td>@fat</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                    </tr>
                                                    <tr>
                                                        <td>3</td>
                                                        <td
                                                            style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                            Larry
                                                            the Bird</td>
                                                        <td>@twitter</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                    </tr>
                                                    <tr>
                                                        <td>4</td>
                                                        <td
                                                            style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                            Larry
                                                            the Bird</td>
                                                        <td>@twitter</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                    </tr>
                                                    <tr>
                                                        <td>5</td>
                                                        <td
                                                            style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                            Larry
                                                            the Bird</td>
                                                        <td>@twitter</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</body>

</html>