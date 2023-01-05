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
    <title>나의포인트</title>
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
        .product__details__tab .nav-tabs:after {
   position: absolute;
   right: 0;
   top: 12px;
   height: 0px;
   width: 370px;
   background: #ebebeb;
   content: "";
}
.product__details__tab .nav-tabs:before {
   position: absolute;
   left: 0;
   top: 12px;
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
            <li><a href="#">내 포인트 관리</a></li>
        </ul>
    </div>
    <div class="container">
        <div class="section-title" style="padding: 30px 0 10px 0; margin-bottom: 0px;">
            <h4>내 포인트 관리</h4>
            <div style="display: block;">
                <hr style="width: 50vw; background-color: #24E082;">
            </div>
        </div>
        <div class="col-lg-12">
            <table class="table">
                <tr class="col-lg-12">
                    <td class="col-lg-1" style="text-align: center;"><svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16">
                            <path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                        </svg></td>
                    <td class="col-lg-4"><br> ${ loginUser.userNickname }, 님은 red등급 이시며<br>
                        결제한 금액의 5%만큼 포인트에 적립됩니다.<br> 다음 purple등급까지 남은 금액은 20만원 입니다.
                    </td>
                    <td class="col-lg-7" style="float: right;">보유한 포인트 <br> <input id="pointTotal" name="pointTotal" value="${Member.userPoint}" type="text" style="margin-bottom: 10px;" readonly> <br>
                        <input id="pay" type='number' value="10000" min='10000' max='100000' step='5000' style="width:185px"><button type="button" style="border: 0;" onclick="iamport()">충전하기</button>
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
                                <button style="float: right; border: 0; margin-bottom: 5px;" onclick="location.href='${contextPath}/myPointDetail.my'">+</button>
                                <table id="table_id" class="table" style="text-align: center;">
                                    <thead>
                                        <tr class="text-teal-100">
                                            <th scope="col" class="col-lg-2">적립날짜</th>
                                            <th scope="col" class="col-lg-4">적립내용</th>
                                            <th scope="col" class="col-lg-2">관련주문번호</th>
                                            <th scope="col" class="col-lg-2">적립액</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody2">
                                        <c:if test="${ !empty PointList }">
                                            <c:forEach begin="0" end="4" var="i">
                                                <c:if test="${ !empty PointList[i] }">
                                                    <tr>
                                                        <td>${ PointList[i].pointDate }</td>
                                                        <td>${ PointList[i].pointContent }</td>
                                                        <td>${ PointList[i].pointContent }</td>
                                                        <td>${ PointList[i].pointAmount }</td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                    <tbody>
                                        <c:if test="${ !empty PointList }">
                                            <c:if test="${ PointList.size()<4 }">
                                                <c:forEach begin="0" end="${ 4-PointList.size() }">
                                                    <tr>
                                                        <td style="height: 50px;"></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </c:if>
                                    </tbody>
                                    <tbody>
                                        <c:if test="${ empty PointList }">
                                            <tr style="height: 300px;" style="text-align; center">
                                                <td colspan="4" style="text-align; center">적립된 포인트가 없습니다.</td>
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
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <script>
        function iamport() {
            var pay = document.getElementById('pay').value;
            var pointTotal = document.getElementById('pointTotal').value;
            //가맹점 식별코드
            var code = "imp11861157";
            IMP.init(code);
            IMP.request_pay({
                pg: 'kakaopay',
                pay_method: "card",
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: "포인트충전",
                amount: pay,
                buyer_name: "${loginUser.userName}",
                buyer_tel: "${loginUser.userPhone}",

            }, function(rsp) {
                console.log(rsp);
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    $.ajax({
                        type: 'get',
                        url: '${contextPath}/pointInsert.my',
                        data: {
                            updatePoint: rsp.paid_amount,
                            updateName: rsp.name,
                            updateOrder: rsp.imp_uid,
                            pointTotal: pointTotal
                        },
                        success: (data) => {
                            (location || window.location || document.location).reload();

                        },
                        error: (data) => {

                        }

                    });
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
        }
    </script>
</body>

</html>