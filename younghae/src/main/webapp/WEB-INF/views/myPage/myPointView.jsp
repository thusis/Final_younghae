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
            <li><a href="#">내 포인트 관리</a></li>
        </ul>
    </div>
    <div class="container">
        <div class="section-title" style="padding: 30px 0 10px 0; margin-bottom: 0px;">
            <h4>내 포인트 관리</h4>
            <div style="display: block;">
                <hr style="width:50vw; background-color: #24E082;">
            </div>
        </div>
        <div class="col-lg-12">
            <table class="table">
            <tr class="col-lg-12" >
                <td class="col-lg-1" style="text-align: center;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor"
                        class="bi bi-currency-dollar" viewBox="0 0 16 16">
                        <path
                            d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                    </svg>
                </td>
                <td class="col-lg-4">
                    <br>
                    "user.id", 님은 "grade"등급 이시며<br>
                    결제한 금액의 2%만큼 포인트에 적립됩니다.<br>
                    다음 "grade"등급까지 남은 금액은 20만원 입니다.
                </td>
                <td class="col-lg-7" style="float: right;">
                    보유한 포인트
                    <br>
                    <input type="text" style="margin-bottom: 10px;"readonly>
                    <br>
                    <input type="text">
                    <button type="button" style="border: 0;">충전하기</button>
                </td>
            </tr>
            </table>
        </div>
        <div class="col-lg-12">
            <div class="product__details__tab" style="padding-top: 0px;">
                <div class="tab-content">
                    <div class="tab-pane active" id="tabs" role="tabpanel">
                        <div class="product__details__tab__desc" style="padding-top: 0px;">
                            최신 포인트 사용조회
                            <div class="bn_boardlist mt-2">
                                <button style="float: right; border: 0; margin-bottom: 5px;"
                                    onclick="location.href='/Users/Song/Desktop/final/ogani-master/myPointDetail.html'">+</button>
                                <table class="table" style="text-align: center;">
                                    <thead>
                                        <tr class="text-teal-100" >
                                            <th scope="col" class="col-lg-2">적립날짜</th>
                                            <th scope="col" class="col-lg-4">적립내용</th>
                                            <th scope="col" class="col-lg-2">관련주문번호</th>
                                            <th scope="col" class="col-lg-2">적립액</th>
                                            <th scope="col" class="col-lg-2">보유금액</th>
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
                </div>
            </div>
        </div>
    </div>

</body>

</html>