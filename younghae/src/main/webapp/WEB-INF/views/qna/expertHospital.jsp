<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 - 병원정보보기</title>

	<jsp:include page="../common/topmenubar.jsp" flush="true"/>

    <!--내가만든 css-->
    <link rel="stylesheet" href="resources/css/bn_style.css" type="text/css">

</head>
<body>
    
    <div class="container">
        <div class="bn_index mt-5">
            <ul>
                <li>Q&A</li>
                <li> / </li>
                <li><a href="#">전문가찾기</a></li>
                <li> / </li>
                <li><a href="#">상세프로필조회</a></li>
                <li> <b>/</b> </li>
                <li><a href="#">병원정보보기</a></li>
            </ul>
        </div>
        <!-- Contact Section Begin -->
        <section class="contact spad">
            <div class="section-title" style="padding: 30px 0 10px 0;">
                <h2>${expert.expertDept} </h2>
                <hr style="width:50vw; border:2px solid #24E082; background-color: #24E082;">
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>Phone</h4>
                        <p>+01-3-8888-6868</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>주소</h4>
                        <p>(${expert.expertPostAdd}) ${expert.expertAddress} ${expert.expertAddDetail}</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>Open time</h4>
                        <p>10:00 am to 23:00 pm</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>홈페이지</h4>
                        <a href="${expert.expertHomepage}">${expert.expertHomepage} </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact Section End -->
         <section class="container align-center">
	        <div id="map" style="width:45vw;height:20vw;"></div>
         </section>
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
	${expert}

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b90a6a9e244fbb09fb6577c048f86d0&libraries=services"></script>
	<script>
		window.onload=()=>{
			var addressKey = "${expert.expertAddress}";
			var addressInfo = "${expert.expertDept}";
			var lat = "${expert.expertLatitude}";
			var lng = "${expert.expertLatitude}";
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
			    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			    level: 3 // 지도의 확대 레벨
			};  
		
			//지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			//주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
		    
			//주소로 좌표를 검색합니다
			geocoder.addressSearch(addressKey, function(result, status) {
		
			// 정상적으로 검색이 완료됐으면 
			 if (status === kakao.maps.services.Status.OK) {
		
			    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
			    // 결과값으로 받은 위치를 마커로 표시합니다
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: coords
			    });
		
			    // 인포윈도우로 장소에 대한 설명을 표시합니다
			    var infowindow = new kakao.maps.InfoWindow({
			        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+addressInfo+'</div>'
			    });
			    infowindow.open(map, marker);
		
			    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			    map.setCenter(coords);
			} 

			});    	
		}
	</script>

</body>
</html>
