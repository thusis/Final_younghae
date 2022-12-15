<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    
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
            <li> / </li>
            <li><a href="#">상세보기</a></li>
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
            <div class="product__details__tab" style="padding-top: 0px;">
                <div class="tab-content">
                    <div class="tab-pane active" id="tabs" role="tabpanel">
                        <div class="product__details__tab__desc" style="padding-top: 0px;">
                            <div class="bn_boardlist mt-2">
                                <table class="table" style="text-align: center;">
                                    <thead>
                                        <tr class="text-teal-100">
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
                                        <tr>
                                            <td>6</td>
                                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry
                                                the Bird</td>
                                            <td>@twitter</td>
                                            <td>1</td>
                                            <td>1</td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry
                                                the Bird</td>
                                            <td>@twitter</td>
                                            <td>1</td>
                                            <td>1</td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry
                                                the Bird</td>
                                            <td>@twitter</td>
                                            <td>1</td>
                                            <td>1</td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry
                                                the Bird</td>
                                            <td>@twitter</td>
                                            <td>1</td>
                                            <td>1</td>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">Larry
                                                the Bird</td>
                                            <td>@twitter</td>
                                            <td>1</td>
                                            <td>1</td>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>