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
<title>나의 쿠폰</title>
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
<!-- dataTables GRID CDN -->
    <!-- css files for DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css"/>
   

    <!-- javascript files for DataTables & Plugins -->
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
</head>

<body>
	<div class="bn_index mt-5 col-lg-3 d-flex justify-content-end">
		<ul>
			<li><a href="#" onclick="location.href='${contextPath}/myPage.my'">마이페이지</a></li>
			<li>/</li>
			<li><a href="#">내 쿠폰 관리</a></li>
		</ul>
	</div>
	<div class="container">
		<div class="section-title"
			style="padding: 30px 0 10px 0; margin-bottom: 0px;">
			<h4>내 쿠폰 관리</h4>
			<div style="margin-left: 900px; display: block;">
				<input type="text" id="couponNumber">
				<button type="button" style="border: 0;" id="regist">등록</button>
			</div>
			<div style="display: block;">
				<hr style="width: 50vw; background-color: #24E082;">
			</div>
		</div>
		<div class="col-lg-12">
			<div class="product__details__tab" style="padding-top: 0px;">
				<div>
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">사용가능한쿠폰</a>
						</li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false">사용된 쿠폰</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="product__details__tab__desc">
							<div class="bn_boardlist mt-2">
								<button style="float: right; border: 0; margin-bottom: 5px;"
									onclick="location.href='${contextPath}/event.ev'">이벤트</button>
								<table class="table" id="applyCoupon">
									<thead>
										<tr class="text-teal-100">
											<th >쿠폰번호</th>
											<th >쿠폰명</th>
											<th >쿠폰혜택</th>
											<th >사용기간</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="s" items="${couponList}">
                                            <c:if test="${s.couUsed eq 'N' }">
                                            <tr>
                                                <td>${s.couRegister}</td>
                                                <td>${s.couIntro}</td>
                                                <td>${s.couDiscount}%</td>
                                                <td>${s.couEndDate}</td>
                                            </tr>
                                            </c:if>
                                        </c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tabs-2" role="tabpanel">
						<div class="product__details__tab__desc">
							<div class="bn_boardlist mt-2">
								<button style="float: right; border: 0; margin-bottom: 5px;"
									onclick="location.href='${contextPath}/event.ev'">이벤트</button>
								<table class="table" id="usedCoupon">
									<thead>
										<tr class="text-teal-100">
											<th >쿠폰번호</th>
											<th >쿠폰명</th>
											<th >쿠폰혜택</th>
											<th >사용기간</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="s" items="${couponList}">
										   <c:if test="${s.couUsed eq 'Y' }">
                                            <tr>
                                                <td>${s.couRegister}</td>
                                                <td>${s.couIntro}</td>
                                                <td>${s.couDiscount}%</td>
                                                <td>${s.couEndDate}</td>
                                            </tr>
                                            </c:if>
                                        </c:forEach>
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
	<script>
	var lang_kor = {
            decimal : "",
            emptyTable : "데이터가 없습니다.",
            info : "_START_ - _END_ (총 _TOTAL_ 명)",
            infoEmpty : "0명",
            infoFiltered : "(전체 _MAX_ 명 중 검색결과)",
            infoPostFix : "",
            thousands : ",",
            lengthMenu : "_MENU_ 개씩 보기",
            loadingRecords : "로딩중...",
            processing : "처리중...",
            search : "검색 : ",
            zeroRecords : "검색된 데이터가 없습니다.",
            paginate : {
                first : "첫 페이지",
                last : "마지막 페이지",
                next : "다음",
                previous : "이전"
            },
            aria : {
                sortAscending : " :  오름차순 정렬",
                sortDescending : " :  내림차순 정렬"
            }
        };
    
    
    $(document).ready(function() {
        $('#applyCoupon').DataTable({
        	searching: false,
        	ordering: true,
        	pageLength: 10,
        	paging: true, //페이징처리
            language : lang_kor, //or lang_eng
            info :false,
            autoWidth: false
    });
        $('#usedCoupon').DataTable({
        	searching: false,
        	ordering: true,
        	pageLength: 10,
        	paging: true, //페이징처리
            language : lang_kor, //or lang_eng
            info :false,
            autoWidth: false
    	});
    });
    document.getElementById('regist').addEventListener('click', function() {
    	var couponNumber = document.getElementById('couponNumber').value;
        $.ajax({
            type: 'get',
            url: '${contextPath}/registCoupon.my',
            data: {
                couponRegist: couponNumber
            },
            success: (data) => {
            	if(data=='NOA'){
            		alert("잘못 입력된 쿠폰입니다.");
            	}else if(data=='NOB'){
            		alert("쿠폰의 유효기간이 경과하였습니다.");
            	}else if(data=='NOC'){
            		alert("쿠폰이 중복되여 등록에 실패했습니다.");
            	}else{
            		alert("쿠폰 등록에 성공하였습니다.")
            	}
            	(location || window.location || document.location).reload();
            },
            error: (data) => {
            	alert(data);
            	(location || window.location || document.location).reload();
            }

        })
        
    });
    
    
    
	</script>
</body>

</html>
